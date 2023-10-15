--création table etudiant
CREATE TABLE etudiant
(
    ID_etudiant NUMBER CONSTRAINT pk_etudiant PRIMARY KEY NOT NULL,
    nom VARCHAR2(25),
    prenom VARCHAR2(25),
    email VARCHAR2(25),
    mot_de_passe VARCHAR2(25) NOT NULL,
    date_de_naissance DATE DEFAULT sysdate,
    niveau VARCHAR2(25),
    numero_telephone NUMBER,
    CONSTRAINT ch_numero_telephone_etudiant CHECK (LENGTH(TO_CHAR(numero_telephone)) = 8)
);

--supprimer table etudiant
drop table etudiant CASCADE CONSTRAINT;

-- affichage table etudiant
select * from etudiant;
   

--insertion du table etudiant
insert into etudiant (ID_etudiant,nom,prenom,email,mot_de_passe,date_de_naissance,niveau,numero_telephone)
values(11163454,'guidara','ala eddine','alaeddine.guidara@esen.tn','92224415',to_date('03/01/2002','DD/MM/YYYY'),'2eme annee BI','92224415');

insert into etudiant values (11171525,'kaaniche','ismail','kaaniche19@gmail.com','ismail1234',to_date('19/11/2002','DD/MM/YYYY'),'1 ere annee ',26895555);
insert into etudiant values (11171524,'kaaniche','emna','emna.kaaniche@esen.tn','em1234',to_date('19/11/2002','DD/MM/YYYY'),'2 eme annee BI',51875101);
insert into etudiant values (11163696,'aouichaoui','akram','akramaouichaoui@gmail.com','92155106',to_date('20/10/2001','DD/MM/YYYY'),'2 eme annee lsc',92155106);



--creation view etudiant_active
create view etudiant_active as 
select e.ID_etudiant,e.nom,e.prenom,e.email,e.numero_telephone, ee.nom_projet ,ef.diplome ,ef.specialite,et.marque_voiture 
from etudiant e ,etudiant_formateur ef ,etudiant_entrepreneure ee ,etudiant_transporteur et
where e.ID_etudiant=ef.ID_etudiant
and ef.ID_etudiant=ee.ID_etudiant 
and ee.ID_etudiant=et.ID_etudiant;


--affichage de view
select * from etudiant_active;

--affichage des colonne nom , prenom
SELECT nom, prenom from etudiant_active;

--modifier le nom de l'etudiant active
UPDATE etudiant_active 
SET prenom='EMMA'
WHERE prenom='emna';

















