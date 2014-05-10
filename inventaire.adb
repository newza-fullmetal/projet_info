
 package body Inventaire is
  
  
  
  function Armure (O : in Objet) return Integer is
  begin
     return O.ARM ;
  end Armure ;
  
  function Degat (O : in Objet) return Integer is
  begin
     return O.DEG ;
  end Degat ;
  
  function PV (O : in Objet) return Integer is
  begin
     return O.PV ;
  end PV ;
  
  function Nom_Objet (O : in Objet) return String is
  begin
     return O.Nom ;
  end Nom_Objet ;
  
  procedure Afficher_Carac (O : in Objet) is
  begin
     Put(Nom_Objet(O) &  "  DEGAT : + " & Integer'Image(Degat(O)) & " ARMURE :+ "& Integer'Image(Armure(O)) & "  VIE :+  " & Integer'Image(PV(O)));
     New_Line ;
  end Afficher_Carac ;

procedure Initialiser_Inv(Inv : in out Tab_Inventaire)is 
begin 
   Inv := (("Objet_Vide",0,0,0),("Objet_Vide",0,0,0), ("Objet_Vide",0,0,0),("Objet_Vide",0,0,0), ("Objet_Vide",0,0,0), ("Objet_Vide",0,0,0) );
end Initialiser_Inv ;


procedure Afficher_Inventaire (Inv : in Tab_Inventaire) is
begin
   for N in Inv'Range loop
      Put_Line(Integer'Image(N));
      
      Afficher_Carac(Inv(N));
   end loop ;
   
end Afficher_Inventaire ;

procedure Creer_Objet(O :  out Objet ; Nom : in String ; Deg,Arm,PV : in Integer) is
begin
   O :=(Nom,Deg,Arm,PV);
end Creer_Objet ;

    procedure Objet_Dans_Inventaire (Inv : in out Tab_Inventaire ; O : in Objet) is
    Aux : Integer ;   
    Place : Boolean ;
    begin
       Place := False ;
       Aux := 1 ;
       while Aux <= Inv'Length and Place = False loop
	  if Inv(Aux) = ("Objet_Vide",0,0,0) then
   	   Inv(Aux) := O ;
    	   Place := True ;
    	else 
    	   Aux := Aux + 1 ;
   	end if ;
   	if Aux > Inv'Length then
   	   Put("Plus de place dans l'inventaire") ;
    	     Place := True ;
    	end if ;
       end loop ;
      end Objet_Dans_Inventaire ;
	
 
  end Inventaire ;
