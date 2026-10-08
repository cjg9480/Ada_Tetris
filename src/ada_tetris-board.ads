package Ada_Tetris.Board is

   Width  : constant := 10;
   Height : constant := 20;

   type Cell is (Empty, Filled);

   type Row_Index is range 1 .. Height;
   type Col_Index is range 1 .. Width;

   type Position is record
      Row : Row_Index;
      Col : Col_Index;
   end record;

   type Block is record
      P1 : Position;
      P2 : Position;
      P3 : Position;
      P4 : Position;
   end record;

   type Board_State is
      array (Row_Index, Col_Index) of Cell;

   procedure Place (Row : Row_Index; Col : Col_Index);
   procedure Place (B : Block);

   function Can_Move
      (From_Row : Row_Index;
       From_Col : Col_Index;
       To_Row   : Row_Index;
       To_Col   : Col_Index) return Boolean;

   function Can_Move
      (From : Position;
       To   : Position) return Boolean;
   function Can_Move
      (P         : Position;
       Delta_Row : Integer;
       Delta_Col : Integer) return Boolean;

   function Can_Move
      (B         : Block;
       Delta_Row : Integer;
       Delta_Col : Integer) return Boolean;

   procedure Move
      (From_Row : Row_Index;
       From_Col : Col_Index;
       To_Row   : Row_Index;
       To_Col   : Col_Index);

   procedure Move
      (B         : in out Block;
       Delta_Row : Integer;
       Delta_Col : Integer);

   procedure Clear;
   procedure Draw;

end Ada_Tetris.Board;
