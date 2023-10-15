--création table repas
CREATE TABLE  repas
(
ID_repas number CONSTRAINT pk_repas NOT NULL PRIMARY KEY, 
nom_repas varchar(25) NOT NULL , 
description VARCHAR(20) NOT NULL , 
nom_restaurant VARCHAR(20) NOT NULL , 
prix number not null
);
--modification de type du champ nom_repas
alter table repas modify(nom_repas VARCHAR2(100));
--modification de type du champ description
alter table repas modify(description VARCHAR2(100));
--modification de type du champ nom_restaurant
alter table repas modify(nom_restaurant VARCHAR2(100));
--insertion du table repas
select * from repas;
insert into repas values(01,'lasagne','lasagne bolonaise au sauce fromage','KFC Manar',5);
insert into repas values(10,'pizza','pizza Neptune une personne ','Baguette et Baguette Manouba',4);
insert into repas values(11,'spaghetti','plats spaghetti fruit de mer ','Plan b Bardo',4);
insert into repas values(100,'salade Cesare', 'tomate ,laitue , maies, fromage.. ','Popolare Bardo',4);
insert into repas values(101,'chiken and frite', ' plats poulet panée et frite au fromage ','Frita Bardo',5);


