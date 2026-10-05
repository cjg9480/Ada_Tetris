with Ada.Text_IO;

package body Ada_Tetris.Board is

   Board : Board_State := (others => (others => Empty));
   procedure Place (Row : Row_Index; Col : Col_Index) is
   begin
      Board (Row, Col) := Filled;
   end Place;

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