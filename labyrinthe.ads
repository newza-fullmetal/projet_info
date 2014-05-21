



package Labyrinthe is 
   
   Dim_Tab : constant Integer := 10;
   subtype Dim  is Integer range 1..Dim_Tab;   
   type Cell is limited private;
   type  T_Lab is array (Dim,Dim) of Cell;
   type T_Cell is access Cell;
   
   function Cell_Arround return Integer ;
   procedure Creer_Lab( Lab : Out T_Lab );
   procedure Supprimer_Lab (Lab : out T_Lab);
   procedure Afficher_Lab (Lab : in T_Lab);
   Function  Cell_X return Integer;
   function Cell_Y return Integer;
    
      
   
private 
   type Cell is record 
      N,S,E,O : T_Cell;    -- pointeur vers les cellules adjacentes
      Visitee : Boolean;   -- indique si la case a été visitée 
      X : Integer;         -- coordonnée de la cellule dans le tableau
      Y : Integer;         -- idem
      end record;  
   
   
end Labyrinthe; 
