--création table commande
CREATE TABLE commande
(
ID_commande number CONSTRAINT pk_commande NOT NULL PRIMARY KEY, 
ID_repas number NOT NULL , 
ID_etudiant number NOT NULL,
date_commande DATE NOT NULL , 
nombre_repas number NOT NULL ,
CONSTRAINT FK_comm_etud FOREIGN KEY (ID_etudiant) REFERENCES etudiant (ID_etudiant),
CONSTRAINT FK_comm_rep FOREIGN KEY (ID_repas) REFERENCES repas (ID_repas)
); 
drop table commande cascade constraint;
--insertion du table commande
select * from commande;
insert into commande values (1,01,11171524,to_date('9/04/2023','DD/MM/YYYY'),3);
insert into commande values (2,10,11171525,to_date('9/04/2023','DD/MM/YYYY'),7);
--procédure
CREATE OR REPLACE PROCEDURE cmd_date (c_ID_commande IN NUMBER, 
c_ID_etudiant OUT NUMBER, c_ID_repas OUT NUMBER, c_nombre_repas OUT NUMBER)
IS
BEGIN
  SELECT ID_etudiant, ID_repas, nombre_repas INTO 
  c_ID_etudiant, c_ID_repas, c_nombre_repas FROM commande
  WHERE ID_commande = c_ID_commande;
END cmd_date;
/

--test de la procédure sous l'environnement SQL*PLUS
VARIABLE c_ID_commande NUMBER;
VARIABLE c_ID_etudiant NUMBER;
VARIABLE c_ID_repas NUMBER;
VARIABLE c_nombre_repas NUMBER;
BEGIN
  :c_ID_commande :=&id_commande;
END;
/
EXECUTE cmd_date(:c_ID_commande, :c_ID_etudiant, :c_ID_repas, :c_nombre_repas);
PRINT c_ID_etudiant ;
PRINT c_ID_repas;
PRINT c_nombre_repas;

--test de la procédure dans un programme PL/SQL
SET SERVEROUTPUT ON
DECLARE
  v_ID_commande NUMBER;
  v_ID_etudiant NUMBER;
  v_ID_repas NUMBER;
  v_nombre_repas NUMBER;

BEGIN
  v_ID_commande:=&id_commande;
  cmd_date(v_ID_commande,v_ID_etudiant,v_ID_repas,v_nombre_repas);
  DBMS_OUTPUT.PUT_LINE('id etudiant :'||v_ID_etudiant||' id repas '||
  v_ID_repas||' nombre de repas '||v_nombre_repas);
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Le commande inexistant');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Il existe plusieurs commande avec cette id');
END;
/

SHOW ERRORS PROCEDURE cmd_date;