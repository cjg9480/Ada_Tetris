with Ada.Text_IO;

package body Ada_Tetris.Board is

   procedure Draw is
   begin
      Ada.Text_IO.Put_Line ("+--------------------+");

      for Row in 1 .. Height loop
         Ada.Text_IO.Put_Line ("|                    |");
      end loop;

      Ada.Text_IO.Put_Line ("+--------------------+");
   end Draw;

end Ada_Tetris.Board;
