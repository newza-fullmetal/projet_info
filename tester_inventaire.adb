with Inventaire, Ada.Text_IO ;
use Inventaire,Ada.Text_IO ;

procedure Tester_Inventaire is
   Inv : Tab_Inventaire ;
   Epee : Objet ;
   Armure : Objet ;
   Casque : Objet;
   Potion_Vie : Objet;
   Potion_For : Objet ;
begin
   Creer_Objet(Epee,"Epee_Acier",10,0,0) ;
   Creer_Objet(Armure,"Armure_Fer",0,15,0);
   Creer_Objet(Casque, "Casque_Fer",0,5,0);
   Creer_Objet(Potion_Vie,"Potion_Vie",0,0,20);   
   Creer_Objet(Potion_For,"Potion_For",5,0,0);
   
   Put("Creation d objet et affichage de leur stat");
   New_Line ;
   Afficher_Carac(Epee);
   New_Line ;
   Afficher_Carac(Armure);
   New_Line ;
   Afficher_Carac(Casque);
   New_Line ;
   Afficher_Carac(Potion_Vie);
   
   
  Initialiser_Inv(Inv);
  New_Line ;
  Afficher_Inventaire(Inv);
   Objet_Dans_Inventaire(Inv,Epee);
   Objet_Dans_Inventaire(Inv,Casque);
   Objet_Dans_Inventaire(Inv,Armure);
   Objet_Dans_Inventaire(Inv,Potion_Vie);
   Objet_Dans_Inventaire(Inv,Potion_For);
   Objet_Dans_Inventaire(Inv,Epee);
   Objet_Dans_Inventaire(Inv,Epee);
 --  New_Line ;
 --  Put_Line("Test du remplissage d inventaire");
   Afficher_Inventaire(Inv);
   --  Objet_Dans_Inventaire(Inv,Epee);
   
end Tester_Inventaire ;
