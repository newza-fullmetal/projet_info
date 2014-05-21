with Ada.Text_IO, AdA.Unchecked_Deallocation, Ada.Integer_Text_Io ;
use Ada.Text_IO, Ada.Integer_Text_Io ;

package body Personnage is
  
  
   procedure Creer_Personnage( H : out Un_Perso ) is 
      Base_Stats : Stats_Hero:=(40, 40, 10, 5, 0); 
   begin 
      Put_Line("Quel sera le nom de votre héro ( 5 charactères)");
      Get(H.Nom);
      H.Stats := Base_Stats; 
      
   end Creer_Personnage;
   
   function Mana (H : in Un_Perso ) return Integer is 
   begin 
      return H.Stats.PM;
   end Mana;
   
   function Vie (H : in Un_Perso) return Integer is 
   begin 
      return H.Stats.PV; 
   end Vie;
   
   function Force (H: in Un_Perso) return Integer is 
   begin 
      return H.Stats.FORCE; 
   end Force;
   
   function Resistance(H: in Un_Perso) return Integer is 
   begin 
      return H.Stats.RES;
   end Resistance;
   
   function Chance (H: in Un_Perso) return Integer is 
   begin 
      return H.Stats.CHANCE; 
   end Chance;
   
   procedure Attaquer (E : in Un_Perso; P : in out Un_Perso) is
   begin 
      Put_Line(E.Nom & " attaque " & P.Nom );
      if Force(E) > Resistance(P) then 
	P.Stats.PV := Vie(P) - Force(E)+ Resistance(P);
	if Vie(P)<= 0 then 
	   Put_Line("Il lui enleve " & Integer'Image(Force(E)-Resistance(P)) & " PV, il reste " & Integer'Image(0)& " PV à " & P.Nom);	   
	   raise Perso_Mort; 
	end if; 
	Put_Line("Il lui enleve " & Integer'Image(Force(E)-Resistance(P)) & " PV, il reste " & Integer'Image(Vie(P))& " PV à " & P.Nom);
      else 
	 Put_Line("Il ne lui fait rien");
	 	
      end if;
      
   exception 
      when Perso_Mort =>
	 Put_Line(P.Nom & " est mort... " & E.Nom & " gagne le combat!! ");
      
   end Attaquer; 
   
      
      
   --  procedure Defendre (E : in out Un_Perso; P : in Un_Perso ) ; 
   procedure Afficher_Stats (H : in Un_Perso) is
   begin 
      Put_Line("Voici les stats de votre perso : ");
      Put("Points de Vie  : " ); Put(Vie(H)); New_Line;
      Put("Points de Mana : " ); Put(Mana(H)); New_Line;
      Put("Force          : " ); Put(Force(H));New_Line;
      Put("Resistance     : " ); Put(Resistance(H));New_Line;
      Put("Chance         : " ); Put(Chance(H));  New_Line;    
	      
   end Afficher_Stats;
    
   --  procedure Supprimer_Personnage ( H : in out Un_Perso ); 
end Personnage;
