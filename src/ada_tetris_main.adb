with Ada.Text_IO;
with Ada_Tetris.Board;

procedure Ada_Tetris_Main is
begin
   Ada_Tetris.Board.Place (19, 5);
   Ada_Tetris.Board.Place (20, 5);

   Ada_Tetris.Board.Move (19, 5, 20, 5);

   Ada_Tetris.Board.Draw;
end Ada_Tetris_Main;