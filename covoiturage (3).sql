drop table covoiturage cascade constraint;
drop table etudiant cascade constraint;
drop table client cascade constraint;
drop table rejoint cascade constraint;
drop table meet cascade constraint;
drop table commande cascade constraint;
drop table produits cascade constraint;
drop table projet cascade constraint;
drop table repas cascade constraint;
drop table etudiant_formateur cascade constraint;
drop table etudiant_entrepreneure cascade constraint;
drop table etudiant_transporteur cascade constraint;

--création table covoiturage
CREATE TABLE covoiturage
(
    ID_covoiturage NUMBER CONSTRAINT pk_covoiturage PRIMARY KEY NOT NULL, 
    lieu_de_depart VARCHAR2(25), 
    lieu_d_arrivee VARCHAR2(25), 
    date_covoiturage DATE DEFAULT sysdate, 
    nombre_de_places NUMBER NOT NULL, 
    prix NUMBER NOT NULL, 
    ID_etudiant NUMBER CONSTRAINT FK_etudiant_covoiturage REFERENCES etudiant (ID_etudiant) 
);
--insertion du table covoiturage
insert into covoiturage values (1,'manouba','marsa',to_date('20/05/2023','DD/MM/YYYY'),4,5,11163454);
insert into covoiturage values (5,'bardo','centre ville	',to_date('21/05/2023','DD/MM/YYYY'),3,3,11171524);
insert into covoiturage values (3,'danden	','charguia	',to_date('22/05/2023','DD/MM/YYYY'),4,4,11171525);
insert into covoiturage values (4,'esen	','ariana	',to_date('23/05/2023','DD/MM/YYYY'),2,2,11163696);

--affichage table covoiturage
select * from covoiturage;
select * from etudiant;


--modification d'un valeur
update covoiturage 
set prix=6 
where ID_covoiturage=1;

--supprimer un covoiturage
delete from covoiturage where id_covoiturage=1;


--supprimer deuxieme methode
SET SERVEROUTPUT on 
ACCEPT v_id_cov PROMPT 'saisir un id';
begin
delete from covoiturage where ID_covoiturage=&v_id_cov ;
DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
end;

--ajout d'un ligne
INSERT INTO covoiturage (ID_covoiturage, lieu_de_depart, lieu_d_arrivee, date_covoiturage, nombre_de_places, prix, ID_etudiant) 
VALUES (&id_covoiturage, '&lieu_de_depart', '&lieu_d_arrivee', '&date_covoiturage', &nombre_de_places, &prix, &id_etudiant);



--modification du champ prix to prix_place
alter table covoiturage
rename column prix_place to prix;

--jointure entre les tables covoiturage etudiant et etudiant_transporteur
select prenom , nom , marque_voiture , date_covoiturage 
from etudiant,covoiturage,etudiant_transporteur 
where covoiturage.id_etudiant=etudiant.id_etudiant 
and etudiant_transporteur.id_etudiant=etudiant.id_etudiant;


--affichage du covoiturage selon l id entrer par l'utilisateur 
select * from covoiturage where id_covoiturage=&id_covoiturage;


--ajout d'une colonne
alter table covoiturage
add frequence varchar2(25);


--modifier la valeur d'un champs quand l id =1 
UPDATE covoiturage
SET frequence = 'de lundi a samedi'
WHERE id_covoiturage = 1;

select * from covoiturage;

--supprimer une colonne
alter table covoiturage
drop column frequence ;



--bloc pl/sql utilisant le curseur explicite sans declaration
SET SERVEROUTPUT ON
DECLARE
v_lieudep VARCHAR(100);
v_jour VARCHAR(100);
BEGIN
  FOR cov_record IN (SELECT * FROM covoiturage WHERE id_etudiant=11171524 ) LOOP
        v_lieudep:=UPPER(cov_record.lieu_de_depart);
        v_jour:=to_char(cov_record.date_covoiturage,'DAY');
     DBMS_OUTPUT.PUT_LINE ('l''etudiant transporteur ' ||cov_record.id_etudiant || ' commence son trajet de : ' || v_lieudep ||' ce : '||  v_jour );
  END LOOP;
END;
/

  









