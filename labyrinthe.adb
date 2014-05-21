with Random_Generic, Ada.Unchecked_Deallocation, Ada.Integer_Text_Io, Ada.Text_Io; 
use Ada.Integer_Text_Io, Ada.Text_Io;

package body Labyrinthe is 
   
   procedure Creer_Lab( Lab : Out T_Lab ) is 
      Cell_Generatrice : Cell; 
   begin
      Cell_Generatrice.Visitee := False; 
      for X in Lab'Range(1) loop 
	 for Y in Lab'Range(2) loop 
	    Cell_Generatrice.X := X;
	    Cell_Generatrice.Y := Y;
	    Lab(X,Y) := Cell_Generatrice; 
	 end loop;
      end loop;
            
   end Creer_Lab;  
   
   function Cell_Arround return Integer is 
   begin 
     return  0;
   end Cell_Arround;
   
 
      procedure Supprimer_Lab (Lab : out T_Lab) is 
      begin 
	 null;
      end Supprimer_Lab;
      
      procedure Afficher_Lab (Lab : in T_Lab) is 
      begin 
	 null;
      end Afficher_Lab;
      
      Function  Cell_X return Integer is 
      begin 
	 return 0;
      end Cell_X;
      
      function Cell_Y return Integer is 
      begin 
	 return 0;
      end Cell_Y;
      
    
   Test_Lab : T_Lab ; 

end Labyrinthe;
