with Ada.Text_IO, AdA.Unchecked_Deallocation ;
use Ada.Text_IO ;

package Personnage is
   type Un_Perso is limited private ;

   procedure Creer_Personnage( H : out Un_Perso ); 
--   procedure Initialiser (P : out Une_Pile_Entier) ;
   function Mana (H : in Un_Perso ) return Integer ;
   function Vie (H : in Un_Perso) return Integer ;
   function Force (H: in Un_Perso) return Integer;
   function Resistance(H: in Un_Perso) return Integer;
   function Chance(H: in Un_Perso) return Integer; 
   procedure Attaquer (E : in Un_Perso; P : in out Un_Perso) ; --E attaque P, donc on a besoin des stats des 2 pour modifier la vie de P
   --procedure Defendre (E : in out Un_Perso; P : in Un_Perso ) ; -- comme pour l'attaque
   procedure Afficher_Stats (H : in Un_Perso);
   --procedure Supprimer_Personnage ( H : in out Un_Perso ); 
   
   Perso_Mort : exception;

private
   
   
   type Stats_Hero is record
      PV : Integer ;
      PM : Integer ;
      FORCE : Integer;
      RES : Integer;
      CHANCE : Integer;   ---Pour les coups critiques
   end record ;
   
   type Un_Perso is record 
      Nom : String(1..5) ; 
      Stats : Stats_Hero;
   end record;
   
end Personnage ;
