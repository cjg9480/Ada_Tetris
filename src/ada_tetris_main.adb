with Ada_Tetris.Board;

procedure Ada_Tetris_Main is
begin
   Ada_Tetris.Board.Place (20, 5);
   Ada_Tetris.Board.Place (20, 6);
   Ada_Tetris.Board.Draw;
   Ada_Tetris.Board.Clear;
   Ada_Tetris.Board.Draw;
end Ada_Tetris_Main;
