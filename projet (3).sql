--création table projet
CREATE TABLE projet (
  ID_projet NUMBER CONSTRAINT pk_projet PRIMARY KEY NOT NULL,
  libelle VARCHAR2(15) NOT NULL,
  description VARCHAR2(200) NOT NULL,
  ID_etudiant NUMBER CONSTRAINT fk_etudiant_projet REFERENCES etudiant(ID_etudiant)
);
--modification de type du champ description
alter table projet modify(description VARCHAR2(700));
--insertion du table projet
select * from projet;
insert into projet values(1918,'tradisia','vente des différents articles artisanaux tunisiens . 
disponibilité des produits artisanals avec des prix abordables et de meilleur qualité 
dans le but de mettre lartisanat Tunisien en valeur
Avec Tradisia :
vous allez pouvoir effectuer vos achats au meilleur prix en toute sécurité et sans sortir de chez vous!',11171524);
insert into projet values(303,'the designers','web design,logo,graphisme illustration,photoshop nous occupons de tout!
Avec THE DESIGNERS:
vous disposerez dempreinte distinctif !des prix raisonables!..',11163454);
--delete ligne de ID_projet=303;
delete from projet where ID_projet=303;
--ajout d'un ligne
INSERT INTO projet (ID_projet, libelle, description, ID_etudiant) 
VALUES (&ID_projet, '&libelle', '&description', &ID_etudiant);
--modifier un ligne
UPDATE projet
SET description = 'vide'
WHERE ID_projet = 10;
--création table maj
CREATE TABLE maj (
  action varchar2(20),
  date_maj date,
  old_libelle VARCHAR2(15),
  new_libelle VARCHAR2(15),
  old_description VARCHAR2(200),
  new_description VARCHAR2(200)
);

--Trigger
CREATE OR REPLACE TRIGGER maj_projet
AFTER INSERT OR DELETE OR UPDATE ON projet
FOR EACH ROW
BEGIN
IF INSERTING THEN
INSERT INTO maj VALUES('insert', sysdate, null, :NEW.libelle, null, :NEW.description);
ELSIF UPDATING THEN
INSERT INTO maj VALUES('update', sysdate, :OLD.libelle, :NEW.libelle, :OLD.description, :NEW.description);
ELSE
INSERT INTO maj VALUES('delete', sysdate, :OLD.libelle, null, :OLD.description, null);
END IF;
END;
/
select * from maj;