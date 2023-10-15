--création table etudiant_transporteur
CREATE TABLE etudiant_transporteur
(
ID_etudiant number constraint pk_etudiant_transporteur NOT NULL PRIMARY KEY , 
marque_voiture VARCHAR(20) NOT NULL , 
carte_grise VARCHAR(20)  NOT NULL,
CONSTRAINT fk_etudiant_transporteur FOREIGN KEY (ID_etudiant) REFERENCES etudiant(ID_etudiant)
);
--insertion du table etudiant_transporteur
select * from etudiant_transporteur;
insert into etudiant_transporteur values (11171524,'jeep','1918');
insert into etudiant_transporteur values (11163454,'ford mustang','0303');
