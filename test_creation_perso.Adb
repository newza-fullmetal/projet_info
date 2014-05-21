with  Ada.Text_Io, Personnage;
use Ada.Text_Io, Personnage;

procedure Test_Creation_Perso is 
   H: Un_Perso; 
     
begin 
   Creer_Personnage(H);
   Afficher_Stats(H);
   while True loop
      null;
   end loop;
   
end Test_Creation_Perso; 
