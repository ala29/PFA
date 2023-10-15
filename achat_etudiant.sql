--création table achat_etudiant 
CREATE TABLE achat_etudiant 
(
ID_etudiant  number CONSTRAINT pk_etud_achat NOT NULL,      
ID_produit  number CONSTRAINT pk_prod_achat NOT NULL, 
nombre_produits NUMBER NOT NULL,  
PRIMARY KEY (ID_etudiant, ID_produit), 
CONSTRAINT FK_etud_achat FOREIGN KEY (ID_etudiant) REFERENCES etudiant (ID_etudiant),        
CONSTRAINT FK_produit_achat FOREIGN KEY (ID_produit) REFERENCES produits (ID_produit)  
);
--insertion du table achat_etudiant
select * from achat_etudiant;
insert into achat_etudiant values (11163454,1,2);
insert into achat_etudiant values (11163454,100,1);
insert into achat_etudiant values (11171524,10,1);
insert into achat_etudiant values (11171524,110,1);

