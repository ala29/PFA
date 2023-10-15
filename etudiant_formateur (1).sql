--création table etudiant_formateur
CREATE TABLE etudiant_formateur
(
  ID_etudiant number CONSTRAINT pk_etudiant_formateur PRIMARY KEY NOT NULL,
  diplome VARCHAR(40) NOT NULL,
  specialite VARCHAR(40) NOT NULL,
  CONSTRAINT fk_etudiant_formateur FOREIGN KEY (ID_etudiant) REFERENCES etudiant(ID_etudiant)
);

--affichage table etudinat_formateur
select * from etudiant_formateur;

--insertion du table etudiant_formateur
insert into etudiant_formateur values (11171524,'microsoft certification', 'développement web' );
insert into etudiant_formateur values (11163454,'microsoft certification', 'ui/ux designer' );

--ajouter column
ALTER  table etudiant_formateur
ADD hobby varchar(50);

--remplir la nouvelle colonne
UPDATE etudiant_formateur
SET hobby='photography';

--supprimer column
alter table etudiant_formateur
DROP column hobby;










