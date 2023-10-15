


--création table meet
CREATE TABLE meet 
(
ID_meet number CONSTRAINT pk_meet PRIMARY KEY NOT NULL, 
titre_meet VARCHAR2(15) NOT NULL, 
description VARCHAR2(20) NOT NULL, 
date_meet DATE DEFAULT sysdate, 
prix NUMBER NOT NULL, 
nombre_participants NUMBER NOT NULL,
ID_etudiant NUMBER CONSTRAINT FK_etudiant_meet REFERENCES etudiant (ID_etudiant) 
);


--modification de type du champ titre_meet
alter table meet modify(titre_meet VARCHAR2(100));
--modification de type du champ description
alter table meet modify(description VARCHAR2(100));

--supprimer table meet
DROP TABLE meet CASCADE CONSTRAINT;

--affichage table meet
select * from meet;


--insertion du table etudiant_entrepreneure
insert into meet values(1234,'introduction au développement web', 'balises html5',to_date('18/9/2023','DD/MM/YYYY'),10,2,11171524);
insert into meet values(4567,'Adobe Illustrator', 'découvre les outils AI , exercices',to_date('19/8/2023','DD/MM/YYYY'),8,2,11163454);

--renomer nom d'un champs
ALTER TABLE meet
RENAME COLUMN prix TO prix_par_pers;

-- les indexes --
--creation d'un index
CREATE INDEX idx ON meet(ID_etudiant);
SELECT * FROM meet WHERE id_etudiant=11171524;

--supprimer index
DROP INDEX idx;


-- les séquences --
--creation d'une sequence
CREATE SEQUENCE meet_seq MINVALUE 100 MAXVALUE 1000 START WITH 500 INCREMENT BY 1 CYCLE;

--remplir a partir de sequence
insert into meet values(meet_seq.NEXTVAL,'graphe', 'graphes oriente/non oriente, exercices',to_date('19/7/2023','DD/MM/YYYY'),8,2,11163454);

--valeur courante de sequence
SELECT meet_seq.currval FROM dual;
 
--valeur prochaine de sequence
SELECT meet_seq.NEXTVAL FROM dual;

--supprimer sequence
DROP SEQUENCE meet_seq;


-- bloc pl/sql | (%TYPE) |cursor
SET SERVEROUTPUT ON
DECLARE
  CURSOR meet_cursor IS SELECT prix_par_pers, nombre_participants,id_meet FROM meet;
  meet_record meet_cursor%ROWTYPE;
  v_cout  meet_record.prix_par_pers%TYPE;
BEGIN
  OPEN meet_cursor;
  LOOP
     FETCH meet_cursor INTO meet_record;
     EXIT WHEN meet_cursor%NOTFOUND;
     v_cout :=(meet_record.prix_par_pers * meet_record.nombre_participants);
     DBMS_OUTPUT.PUT_LINE('ID Meet : '|| meet_record.id_meet||'| Cout Totale= '||v_cout);
  END LOOP;
  
  CLOSE meet_cursor;
END;
/

--type TABLE
SET SERVEROUTPUT ON
DECLARE
TYPE meet_tytab IS TABLE OF etudiant.prenom%TYPE
INDEX BY BINARY_INTEGER;
tab_meetetud meet_tytab;
BEGIN
SELECT et.prenom  BULK COLLECT INTO tab_meetetud from meet m ,etudiant et
where m.id_etudiant=et.id_etudiant ;
  DBMS_OUTPUT.PUT_LINE('Nombre des Meets : '|| tab_meetetud.count);
  FOR i IN 1..tab_meetetud.count LOOP
     DBMS_OUTPUT.PUT_LINE('Meet : '|| i ||'| de formateur: '||tab_meetetud(i));
  END LOOP;
END;
/

--type record
SET SERVEROUTPUT ON 
SET VERIFY OFF 
ACCEPT p_meet PROMPT ' Entrer un id de meet : ' 
DECLARE 
meet_record meet%ROWTYPE; 
BEGIN 
SELECT * INTO meet_record FROM meet
WHERE id_meet= &p_meet;

DBMS_OUTPUT.PUT_LINE ('le meet  '|| TO_CHAR(meet_record.id_meet) || ' va deroulé le ' || TO_CHAR(meet_record.date_meet) || ' pour un total de ' ||meet_record.nombre_participants ||' participants '); 
END;
/

--variable hotes
VARIABLE g_compteur NUMBER;
DECLARE
   v_compt NUMBER := 99;
BEGIN
   :g_compteur := v_compt+1;
END;
/
PRINT g_compteur;





