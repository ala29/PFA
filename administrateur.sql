--création d'un utilisateur "administrateur"
create user administrateur identified by ala_emna
default tablespace users;
--attribution de tous les privéléges a l'administrateur
GRANT ALL PRIVILEGES TO administrateur;
GRANT CONNECT ,RESOURCE TO administrateur;
--maintenant nous nous connectons avec l'utilisateur administrateur pour y créer les bases 





