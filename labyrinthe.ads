
with Random_Generic;

package Labyrinthe is 
   
   Dim_Tab : constant Integer := 30;
   subtype Dim  is Integer range 1..Dim_Tab;
   subtype Dim_Aff is Integer range 1..2*Dim_Tab+1;
   type Cell is limited private;
   type  T_Lab_Aff is array (Dim_Aff,Dim_Aff) of Character ; -- tableau qui servira à l'affichage du labyrinthe 
   type  T_Lab is array (Dim,Dim) of Cell;
  -- type T_Cell is access Cell;
   subtype Points_Card is Integer range 1..4 ; 
   --package Random_Cardinal is new Random_Generic(Points_Card);
  
  
   
   function Cell_Arround(X,Y : in Integer; Tab : in T_Lab) return Integer ;
   procedure Creer_Lab( Lab : Out T_Lab );
   procedure Supprimer_Lab (Lab : out T_Lab);
   procedure Afficher_Lab (Lab : in T_Lab);
   procedure Parcourir_Lab (Lab : in out T_Lab; X,Y : integer);
   Function  Cell_X(C : in Cell)  return Integer;
   function Cell_Y(C : in Cell) return Integer;
   function State(C : in Cell) return Boolean;
    
      
   
private 
   type Cell is record 
      N,S,E,O : Boolean;    -- pointeur vers les cellules adjacentes
      Visitee : Boolean;   -- indique si la case a été visitée 
      X : Integer;         -- coordonnée de la cellule dans le tableau
      Y : Integer;         -- idem
      end record;  
   
   
end Labyrinthe; 
