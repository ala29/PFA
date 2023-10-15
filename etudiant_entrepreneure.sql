--création table etudiant_entrepreneure
CREATE TABLE etudiant_entrepreneure 
(
  ID_etudiant NUMBER CONSTRAINT pk_etudiant_entrepreneure PRIMARY KEY NOT NULL, 
  nom_projet VARCHAR2(20) NOT NULL,
  CONSTRAINT fk_etudiant_entrepreneure FOREIGN KEY (ID_etudiant) REFERENCES etudiant(ID_etudiant)
);
--insertion du table etudiant_entrepreneure
select * from etudiant_entrepreneure;
insert into etudiant_entrepreneure (ID_etudiant,nom_projet)
values(11163454,'the disigners');
insert into etudiant_entrepreneure (ID_etudiant,nom_projet)
values(11171524,'tradisia');