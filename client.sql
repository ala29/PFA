--création table client
CREATE TABLE client
(
ID_client number CONSTRAINT pk_client NOT NULL PRIMARY KEY, 
nom varchar(25), 
prenom varchar(25), 
email varchar(30) , 
mot_de_passe varchar(25) not null, 
numero_telephone NUMBER CONSTRAINT ch_n_t_c CHECK (LENGTH(TO_CHAR(numero_telephone)) = 8)
);
--insertion du table client
select * from client;
insert into client values (11163454,'guidara','ala eddine','alaeddine.guidara@esen.tn','92224415',92224415);
insert into client values (11171524,'kaaniche','emna','emna.kaaniche@esen.tn','em1234',51875101);
insert into client values (11171525,'kaaniche','ismail','ismail.kaaniche@esen.tn','is1234',27001220);

-- --bloc pl/sql utilisant le curseur parametré ET variable de substitution
SET SERVEROUTPUT ON
ACCEPT p_prenom prompt 'saisir prenom client chercher'
ACCEPT  p_numero_telephone prompt 'saisir numero tel client chercher'
DECLARE
  CURSOR client_cursor(p_prenom VARCHAR2, p_numero_telephone NUMBER) 
  IS  SELECT prenom,numero_telephone FROM client WHERE prenom=p_prenom AND numero_telephone=p_numero_telephone;
  client_record client_cursor%ROWTYPE;
   v_prenom varchar(25);
  v_numero_telephone NUMBER;
BEGIN
  v_prenom:='&p_prenom';
  v_numero_telephone:=&p_numero_telephone;
  OPEN client_cursor(v_prenom,v_numero_telephone);
  LOOP
    FETCH client_cursor INTO client_record;
    EXIT WHEN client_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(client_record.prenom||' '||client_record.numero_telephone);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Nombre client '||client_cursor%ROWCOUNT);
  CLOSE client_cursor;
END;
/























