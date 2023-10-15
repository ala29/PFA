--création table achat_client
CREATE TABLE achat_client  
(
ID_client  number NOT NULL ,      
ID_produit  number NOT NULL , 
nombre_produits NUMBER NOT NULL ,              
PRIMARY KEY (ID_client, ID_produit),            
CONSTRAINT FK_client_achat FOREIGN KEY (ID_client) REFERENCES client (ID_client),            
CONSTRAINT FK_produit_client FOREIGN KEY (ID_produit) REFERENCES produits (ID_produit)  
);
--insertion du table achat_client
select * from achat_client;
insert into achat_client values(11171524,01,1);
insert into achat_client values(11171524,101,1);
insert into achat_client values(11163454,100,2);
insert into achat_client values(11163454,10,2);

