with Ada.Text_IO;

package body Ada_Tetris.Board is

   Board : Board_State := (others => (others => Empty));

   procedure Place (Row : Row_Index; Col : Col_Index) is
   begin
      Board (Row, Col) := Filled;
   end Place;

   procedure Place (B : Block) is
   begin
      Place (B.P1.Row, B.P1.Col);
      Place (B.P2.Row, B.P2.Col);
      Place (B.P3.Row, B.P3.Col);
      Place (B.P4.Row, B.P4.Col);
   end Place;

      function Can_Move
         (From_Row : Row_Index;
            From_Col : Col_Index;
            To_Row   : Row_Index;
            To_Col   : Col_Index) return Boolean is
   begin
      return Board (From_Row, From_Col) = Filled
         and Board (To_Row, To_Col) = Empty;
   end Can_Move;

      function Can_Move
         (From : Position;
         To   : Position) return Boolean is
   begin
      return Can_Move
         (From.Row, From.Col,
          To.Row, To.Col);
   end Can_Move;

   function Can_Move
      (P         : Position;
         Delta_Row : Integer;
         Delta_Col : Integer) return Boolean is
         New_Row : Integer := Integer (P.Row) + Delta_Row;
         New_Col : Integer := Integer (P.Col) + Delta_Col;
   begin
      return New_Row in 1 .. Height
         and New_Col in 1 .. Width;
   end Can_Move;

   procedure Move
      (From_Row : Row_Index;
      From_Col : Col_Index;
      To_Row   : Row_Index;
      To_Col   : Col_Index) is
   begin
      if Can_Move (From_Row, From_Col, To_Row, To_Col) then
         Board (To_Row, To_Col) := Board (From_Row, From_Col);
         Board (From_Row, From_Col) := Empty;
      end if;
   end Move;

   procedure Clear is
   begin
      Board := (others => (others => Empty));
   end Clear;

   procedure Draw is
   begin
    

      Ada.Text_IO.Put_Line ("+--------------------+");

      for Row in Row_Index loop
         Ada.Text_IO.Put ("|");

         for Col in Col_Index loop
            if Board (Row, Col) = Empty then
               Ada.Text_IO.Put (" ");
            else
               Ada.Text_IO.Put ("#");
            end if;
         end loop;

         Ada.Text_IO.Put_Line ("|");
      end loop;

      Ada.Text_IO.Put_Line ("+--------------------+");
   end Draw;

end Ada_Tetris.Board;
