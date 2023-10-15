--création table rejoint
CREATE TABLE rejoint
(
ID_covoiturage number NOT NULL,
ID_etudiant number NOT NULL,
CONSTRAINT pk_rejoint PRIMARY KEY (ID_covoiturage, ID_etudiant),
CONSTRAINT FK_rejoint_cov FOREIGN KEY (ID_covoiturage) REFERENCES covoiturage (ID_covoiturage),
CONSTRAINT FK_rejoint_etud FOREIGN KEY (ID_etudiant) REFERENCES etudiant (ID_etudiant)
);
--insertion du table rejoint
insert into rejoint values (1,11163454);
insert into rejoint values (2,11171524);
insert into rejoint values (3,11171525);
insert into rejoint values (4,11163696);

--affichage table rejoint
select * from rejoint;


--supprimer contraint
ALTER TABLE rejoint
DROP CONSTRAINT FK_rejoint_cov;

--ajouter contraint
ALTER TABLE rejoint
ADD CONSTRAINT fk_rejoint_covoiturage
FOREIGN KEY (id_covoiturage)
REFERENCES covoiturage (id_covoiturage)
ON DELETE CASCADE;


 

