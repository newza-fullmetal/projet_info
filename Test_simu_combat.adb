with  Ada.Text_Io, Personnage;
use Ada.Text_Io, Personnage;

procedure Test_Simu_Combat is 
   H,P : Un_Perso; 
begin 
   Creer_Personnage(H);
   Creer_Personnage(P); 
   
   Attaquer(H,P);
   
   while Vie(P) >= 0 loop
      Attaquer(P,H);
      Attaquer(H,P);
   end loop;
   
   while True loop
      null;
   end loop;
end Test_Simu_Combat;

   
