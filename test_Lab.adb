with Ada.Numerics.Discrete_Random ; -- unite de generation d'entiers

with Ada.Unchecked_Deallocation; -- unite de desallocation de memoire

with Ada.Integer_Text_Io; -- unite d'entree sortie pour les entiers
use Ada.Integer_Text_Io;

with Ada.Text_Io;         -- unite d'entree sortie pour le texte
use Ada.Text_Io;

procedure Labyrinthe is 

   Nbre : constant Integer := 15;  

   subtype T_Indice is Integer range 1..Nbre ;

   type T_Marque is array (T_Indice) of Boolean; 

   subtype T_Binaire is Integer range 0..1 ;

   type T_Laby is array (T_Indice, T_Indice) of T_Binaire; 

   type T_Cellule; 

   type T_pile is access T_Cellule; 

   type T_Cellule is 
      record 
         V : Integer;  
         S : T_pile;  
      end record; 



   procedure Remplir (
         Tab :    out T_Laby ) is 

      package Hasard_Valeur is new Ada.Numerics.Discrete_Random (T_Binaire);
      use Hasard_Valeur ;
      G : Generator;  
   begin
      Reset (G) ;
      for I in Tab'range loop
         for J in Tab'range loop
               Tab(I,J) :=Random(G);
         end loop ;
      end loop ;
   end Remplir ;

   procedure Afficher (
         Tab : in     T_Laby ) is 
   begin
      put("colonne:   ");
      for I in Tab'range loop
         Put(I,3); end loop;
      New_Line;
      New_Line;
      for I in Tab'range loop
         Put("ligne ");Put(I,3);Put(": ");
         for J in Tab'range loop
               Put(Tab(I,J),3);
         end loop ;
         New_Line;
         New_Line;
      end loop ;
   end Afficher;


   procedure Init_pile (
         Pile: in out T_pile ) is 
   begin
      Pile:= null;
   end Init_pile ;
   
   procedure Empiler (
         Pile: in out T_pile; 
         X : in     Integer  ) is 
   begin
      Pile:= new T_Cellule'(X,Pile) ;
   end Empiler ;

   procedure Depiler (
         Pile: in out T_pile ) is 
      procedure Dispose is 
      new Ada.Unchecked_Deallocation(T_Cellule,T_pile) ;
      P : T_pile := Pile;  
   begin
      Pile:= Pile.S ;
      Dispose(P) ;
   end Depiler  ;
   
   function Top( Pile: T_pile) return Integer is
   begin return (Pile.V); end Top;
   
   function Est_Vide( Pile: T_Pile) return Boolean is
   begin return (Pile=null); end Est_Vide;   

   procedure Affiche_pile (
         Pile: in     T_pile ) is 
      P : T_pile := Pile;  
   begin
      loop
         exit when P = null;
         Put (P.V,3) ;
         P := P.S ;
      end loop ;
   end Affiche_pile ;
   
   procedure Init_Marque (M: out T_Marque) is
   begin
      for I in M'range loop
         M(I):=False;
      end loop;
   end Init_Marque;
   


   L: T_Laby;  M :T_Marque; Pile :  T_pile;
   I,J:Integer;
   toto:character;
   

begin

   Remplir(L);
   Afficher(L);
   New_Line;
   New_Line;
   Init_Marque(M);
   Init_pile(Pile);
   -- on cherche un chemin de 1 à n
   Empiler(Pile,M'First); M(M'First):=True;
   
   loop
      I := Top(Pile);
      exit when I=M'Last;
      J:=M'First;
      loop
         if L(I,J)=1 and not M(J) then
            Empiler(Pile,J); M(J):=True;exit ;
         else J:=J+1;
              if j>m'last then depiler(pile); exit; end if;
         end if;
      end loop;
      exit when Est_Vide(Pile);
   end loop;
   if Est_Vide(Pile) then Put("il n'a pas de chemin");
   else Affiche_Pile (Pile); end if;
   
   -- on peut améliorer en utilisant renverser pour la pile
   -- et avoir le chemin direct   
      
   Get(Toto);
   
end Labyrinthe;


