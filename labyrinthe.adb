with Random_Generic, Ada.Unchecked_Deallocation, Ada.Integer_Text_Io, Ada.Text_Io, Random_Cardinal; 
use Ada.Integer_Text_Io, Ada.Text_Io, Random_Cardinal;

package body Labyrinthe is 
   
   procedure Creer_Lab( Lab : Out T_Lab ) is 
      Cell_Generatrice : Cell; 
   begin
      Cell_Generatrice.Visitee := False; 
      Cell_Generatrice.O := False; 
      Cell_Generatrice.S := False; 
      Cell_Generatrice.N := False; 
      Cell_Generatrice.E := False; 
      for X in Lab'Range(1) loop 
	 for Y in Lab'Range(2) loop 
	    Cell_Generatrice.X := X;
	    Cell_Generatrice.Y := Y;
	    Lab(X,Y) := Cell_Generatrice; 
	 end loop;
      end loop;
            
   end Creer_Lab;  
   
   function State(C : in Cell) return Boolean is 
   begin 
      return C.Visitee; 
   end State; 
   
  
   function Cell_Arround(X,Y : in Integer; Tab : in T_Lab) return Integer is 
      N : Integer; 
   begin 
      N := 0; 
      if Y<Dim_Tab then
	 if not State(Tab(X,Y+1)) then 
	    N := N+1;
	    end if;
      end if; 
      if Y> 1 then
	 if not State(Tab(X,Y-1)) then 
	    N := N+1;
	 end if;
      end if; 
      if X<Dim_Tab then
	 if not State(Tab(X+1,Y)) then 
	    N := N+1;
	    end if;
      end if; 
      if X>1 then 
	 if not State(Tab(X-1,Y)) then 
	    N := N+1;
	    end if;
      end if; 
     return  N;
   end Cell_Arround;
   
   procedure Parcourir_Lab (Lab : in out T_Lab; X,Y : integer) is 
      G: Integer;
      
      begin 
	 Lab(X,Y).Visitee := TRUE ;
	 while Cell_Arround(X,Y,Lab) >0 loop
	    G := Random_Cardinal.Random_Value;
	    if (G = 1 and Y>1) and then not State(Lab(X,Y-1)) then 
	       Lab(X,Y).O := True;
	       Lab(X,Y-1).E := True;
	       Parcourir_Lab(Lab, X,Y-1);
	    elsif (G = 2 and X>1) and then not State(Lab(X-1,Y)) then
	       Lab(X,Y).N := True;
	       Lab(X-1,Y).S := True;
	       Parcourir_Lab(Lab,X-1,Y);
	    elsif (G = 3 and Y<Dim_Tab) and then not State(Lab(X,Y+1)) then	
	       Lab(X,Y).E := True;
	       Lab(X,Y+1).O := True;
	       Parcourir_Lab(Lab, X,Y+1);
	    elsif (G = 4 and X<Dim_Tab) and then not State(Lab(X+1,Y)) then
	       Lab(X,Y).S := True;
	       Lab(X+1,Y).N := True;
	       Parcourir_Lab(Lab,X+1,Y);
	    end if; 
	 end loop;
      end Parcourir_Lab; 
      
      procedure Supprimer_Lab (Lab : out T_Lab) is 
      begin 
	 null;
      end Supprimer_Lab;
      
      procedure Afficher_Lab (Lab : in T_Lab) is 
	 Tab_Aff : T_Lab_Aff  := (Others=>(Others=>'*')); 
      begin 
	for L in Lab'range(1) loop
	    for C in Lab'Range(2) loop
	       if Lab(L,C).N and Tab_Aff(2*L-1,2*C)='*' then 
		  Tab_Aff(2*L-1,2*C):=' ';
	       elsif Lab(L,C).O and Tab_Aff(2*L,2*C-1)='*' then
		  Tab_Aff(2*L,2*C-1):=' ';
	       elsif Lab(L,C).E and Tab_Aff(2*L,2*C+1)='*' then
		  Tab_Aff(2*L,2*C+1):=' ';
	       elsif Lab(L,C).S and Tab_Aff(2*L+1,2*C)='*' then
		  Tab_Aff(2*L+1,2*C):=' ';
	       end if;
	       Tab_Aff(2*L,2*C) := ' ';
	    end loop;
	 end loop;
	 
	 for L1 in Tab_Aff'range(1) loop
	    for C1 in Tab_Aff'Range(2) loop
	       Put(Tab_Aff(L1,C1));
	    end loop;
	    New_Line;
	 end loop;
      end Afficher_Lab;
      
      Function  Cell_X( C: in Cell) return Integer is 
      begin 
	 return C.X;
      end Cell_X;
      
      function Cell_Y (C : in Cell) return Integer is 
      begin 
	 return C.Y;
      end Cell_Y;
   

end Labyrinthe;
