with Ada.Text_IO;

with Ada_Tetris.Board;

procedure Ada_Tetris_Main is

   P : Ada_Tetris.Board.Position :=
      (Row => 19, Col => 5);

   B : Ada_Tetris.Board.Block :=
      (P1 => (Row => 19, Col => 4),
       P2 => (Row => 19, Col => 5),
       P3 => (Row => 19, Col => 6),
       P4 => (Row => 19, Col => 7));

begin

   Ada.Text_IO.Put_Line
      ("Position Col = " & Ada_Tetris.Board.Col_Index'Image (P.Col));

   Ada_Tetris.Board.Place (19, 5);
   Ada_Tetris.Board.Place (B.P1.Row, B.P1.Col);
   Ada_Tetris.Board.Place (B.P2.Row, B.P2.Col);
   Ada_Tetris.Board.Place (B.P3.Row, B.P3.Col);
   Ada_Tetris.Board.Place (B.P4.Row, B.P4.Col);

   Ada.Text_IO.Put_Line
      ("Can_Move = " &
       Boolean'Image
         (Ada_Tetris.Board.Can_Move
            (P,
             (Row => 20, Col => 5))));

   Ada.Text_IO.Put_Line
      ("Down = " &
       Boolean'Image
         (Ada_Tetris.Board.Can_Move (P, 1, 0)));

   Ada.Text_IO.Put_Line
      ("Down at bottom = " &
       Boolean'Image
         (Ada_Tetris.Board.Can_Move
            ((Row => 20, Col => 5), 1, 0)));

   Ada.Text_IO.Put_Line
      ("Up at top = " &
       Boolean'Image
         (Ada_Tetris.Board.Can_Move
            ((Row => 1, Col => 5), -1, 0)));

   Ada.Text_IO.Put_Line
      ("Right = " &
       Boolean'Image
         (Ada_Tetris.Board.Can_Move
            ((Row => 10, Col => 5), 0, 1)));

   Ada.Text_IO.Put_Line
      ("Block P1 Row = " &
       Ada_Tetris.Board.Row_Index'Image (B.P1.Row));

   Ada.Text_IO.Put_Line
      ("Block P1 Col = " &
       Ada_Tetris.Board.Col_Index'Image (B.P1.Col));

   Ada.Text_IO.Put_Line
      ("Block P2 Row = " &
       Ada_Tetris.Board.Row_Index'Image (B.P2.Row));

   Ada.Text_IO.Put_Line
      ("Block P2 Col = " &
       Ada_Tetris.Board.Col_Index'Image (B.P2.Col));

   Ada.Text_IO.Put_Line
      ("Block P3 Row = " &
       Ada_Tetris.Board.Row_Index'Image (B.P3.Row));

   Ada.Text_IO.Put_Line
      ("Block P3 Col = " &
       Ada_Tetris.Board.Col_Index'Image (B.P3.Col));

   Ada.Text_IO.Put_Line
      ("Block P4 Row = " &
       Ada_Tetris.Board.Row_Index'Image (B.P4.Row));

   Ada.Text_IO.Put_Line
      ("Block P4 Col = " &
       Ada_Tetris.Board.Col_Index'Image (B.P4.Col));

   Ada_Tetris.Board.Move (19, 5, 20, 5);

   Ada_Tetris.Board.Draw;

end Ada_Tetris_Main;