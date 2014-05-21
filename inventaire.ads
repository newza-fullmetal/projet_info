with Ada.Text_IO, AdA.Unchecked_Deallocation  ;
use Ada.Text_IO  ;

package Inventaire is
   type Inventaire_Hero is  private ;
   type Objet is private ;
   type Tab_Inventaire is private ;
  procedure Creer_Objet ( O :  out Objet ; Nom : in String ; Deg,Arm,PV : Integer) ;
   function Armure (O : in Objet) return  Integer ;
   function Degat (O : in Objet) return Integer ;
   function PV (O : in Objet) return Integer ;
   function Nom_Objet (O : in Objet) return String ;
   procedure Afficher_Carac (O : in Objet) ;
 procedure Objet_Dans_Inventaire (Inv : in out Tab_Inventaire ; O : in Objet) ;
   procedure Initialiser_Inv (Inv : in out Tab_Inventaire);
   procedure Afficher_Inventaire (Inv : in Tab_Inventaire);
   

private
   
   
   type Tab_Inventaire is array(1..6) of Objet ;
   
   
   type Objet  is record
      Nom : String(1..10);
      DEG : Integer ; --Armure
      ARM : Integer ; -- Dégâts 
      PV : Integer ; -- Potentiel de Soin 
   end record ;
   
   
   type Inventaire_Hero is record 
      Armure : Tab_Inventaire ;
      Arme : Tab_Inventaire ;
      Potion : Tab_Inventaire ;
   end record ;
   
   
end Inventaire ;
