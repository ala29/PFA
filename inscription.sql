--création table inscription
CREATE TABLE inscription  
(
ID_meet number NOT NULL,
ID_etudiant number NOT NULL,
CONSTRAINT pk_meet_etudiant PRIMARY KEY (ID_meet, ID_etudiant),
CONSTRAINT FK_meet_inscription FOREIGN KEY (ID_meet) REFERENCES meet (ID_meet),
CONSTRAINT FK_etudiant_inscription FOREIGN KEY (ID_etudiant) REFERENCES etudiant (ID_etudiant)
);
--insertion du table inscription
select * from inscription;
insert into inscription values (1234,11163696);                              
insert into inscription values (1234,11171525);                                


