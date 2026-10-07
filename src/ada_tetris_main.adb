with Ada.Text_IO;

with Ada_Tetris.Board;

procedure Ada_Tetris_Main is

   P : Ada_Tetris.Board.Position :=
      (Row => 19, Col => 5);

begin

   Ada.Text_IO.Put_Line
      ("Position Col = " & Ada_Tetris.Board.Col_Index'Image (P.Col));

   Ada_Tetris.Board.Place (19, 5);

   Ada.Text_IO.Put_Line
      ("Can_Move = " &
       Boolean'Image
         (Ada_Tetris.Board.Can_Move
            (P,
             (Row => 20, Col => 5))));

   Ada_Tetris.Board.Move (19, 5, 20, 5);

   Ada_Tetris.Board.Draw;

end Ada_Tetris_Main;