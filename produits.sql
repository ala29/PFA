--création table produits
CREATE TABLE produits
(
ID_produit NUMBER CONSTRAINT pk_produits NOT NULL PRIMARY KEY,
libelle VARCHAR2(25),
description VARCHAR2(200),
prix NUMBER(8,3) NOT NULL , 
stock NUMBER(10),
ID_projet NUMBER CONSTRAINT FK_produits_projet REFERENCES projet (ID_projet),
categorie varchar2(25)
);
--insertion du table produits
select * from produits;
insert into produits values(1,'chechia','chechia rouge touts taille disponible et 100% tunisienne',30,200,1918,'produit');
insert into produits values(10,'9achabia','9achabia 100%  tunisienne , des couleur impeccable',80,100,1918,'produit');
insert into produits values(11,'margoum','margoum taille standard couleur class : noir , marron , beige' ,150,50,1918,'produit');
insert into produits values(100,'logo','voir la créativité dans votre logo ' ,15,0,0303,'service');
insert into produits values(101,'affiche','post sur réseaux sociaux , sur papier..  ' ,20,0,0303,'service');
insert into produits values(110,'cv','cv détaille de votre choix et a votre disposition   ' ,25,0,0303,'service');

--les exceptions
SET SERVEROUTPUT ON
DECLARE
v_stock number;
BEGIN 
  select stock INTO v_stock from produits where libelle='&nom';
  DBMS_OUTPUT.PUT_LINE('Le stock disponible '||v_stock);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Le produit inexistant');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Il existe plusieurs produits');

END;
/
--Les exceptions définies
SET SERVEROUTPUT ON
DECLARE
  v_stock NUMBER;
  e_indisponible EXCEPTION;
  e_passer_commande EXCEPTION;
  e_disponible EXCEPTION;

BEGIN 
  select stock INTO v_stock from produits where libelle='&nom';
  IF v_stock > 100 THEN
    RAISE e_disponible;
  ELSIF v_stock < 20 and v_stock >0 THEN
    RAISE e_passer_commande;
  ELSE 
    RAISE e_indisponible;
  END IF;

EXCEPTION
  WHEN e_indisponible THEN
    DBMS_OUTPUT.PUT_LINE('Le produit est indisponible, il faut passer une commande.');
  WHEN e_passer_commande THEN
    DBMS_OUTPUT.PUT_LINE('Le stock de ce produit est inférieur à 20, il faut passer une commande.');
  WHEN e_disponible THEN
    DBMS_OUTPUT.PUT_LINE('Le stock est suffisant.');
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Le produit inexistant');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Il existe plusieurs produits');
END;
/

--fonction
CREATE OR REPLACE FUNCTION nb_produits(v_ID_projet IN NUMBER) RETURN NUMBER
IS
v_nb NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_nb FROM produits
  WHERE ID_projet=v_ID_projet;
RETURN v_nb;
END nb_produits;

--test de la fonction sous l'environnement SQL*PLUS
VARIABLE g_ID_projet NUMBER;
VARIABLE g_nb NUMBER;
BEGIN
  :g_ID_projet:=&id_projet;
END;
/
EXECUTE :g_nb:=nb_produits(:g_ID_projet);
PRINT g_nb;
--test de la fonction dans un programme PL/SQL
SET SERVEROUTPUT ON
DECLARE
  v_ID_projet NUMBER;
  v_nb NUMBER;
BEGIN
  v_ID_projet:=&id_projet;
  v_nb:=nb_produits(v_ID_projet);
  DBMS_OUTPUT.PUT_LINE('Le nombre des produits de projet : '||v_ID_projet||' est : '||v_nb);
END;
/
