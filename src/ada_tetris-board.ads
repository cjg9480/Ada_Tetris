package Ada_Tetris.Board is

   Width  : constant := 10;
   Height : constant := 20;

   type Cell is (Empty, Filled);

   type Row_Index is range 1 .. Height;
   type Col_Index is range 1 .. Width;

   type Board_State is
      array (Row_Index, Col_Index) of Cell;     

   procedure Place (Row : Row_Index; Col : Col_Index);
   procedure Draw;

end Ada_Tetris.Board;
