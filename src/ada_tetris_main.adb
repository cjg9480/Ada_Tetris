with Ada.Text_IO;

with Ada_Tetris.Board;

procedure Ada_Tetris_Main is

   P : Ada_Tetris.Board.Position :=
      (Row => 19, Col => 5);

   B : Ada_Tetris.Board.Block :=
      (Shape => Ada_Tetris.Board.I_Shape,
       P1    => (Row => 19, Col => 4),
       P2    => (Row => 19, Col => 5),
       P3    => (Row => 19, Col => 6),
       P4    => (Row => 19, Col => 7));

   B_Bottom : Ada_Tetris.Board.Block :=
      (Shape => Ada_Tetris.Board.I_Shape,
       P1    => (Row => 20, Col => 4),
       P2    => (Row => 20, Col => 5),
       P3    => (Row => 20, Col => 6),
       P4    => (Row => 20, Col => 7));

   B_Horizontal : Ada_Tetris.Board.Block :=
      (Shape => Ada_Tetris.Board.I_Shape,
       P1    => (Row => 10, Col => 4),
       P2    => (Row => 10, Col => 5),
       P3    => (Row => 10, Col => 6),
       P4    => (Row => 10, Col => 7));

   B_Collision : Ada_Tetris.Board.Block :=
      (Shape => Ada_Tetris.Board.I_Shape,
       P1    => (Row => 5, Col => 4),
       P2    => (Row => 5, Col => 5),
       P3    => (Row => 5, Col => 6),
       P4    => (Row => 5, Col => 7));

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
            (Ada_Tetris.Board.Position'(Row => 20, Col => 5), 1, 0)));

   Ada.Text_IO.Put_Line
      ("Up at top = " &
       Boolean'Image
         (Ada_Tetris.Board.Can_Move
             (Ada_Tetris.Board.Position'(Row => 1, Col => 5), -1, 0)));

   Ada.Text_IO.Put_Line
      ("Right = " &
       Boolean'Image
         (Ada_Tetris.Board.Can_Move
            (Ada_Tetris.Board.Position'(Row => 10, Col => 5), 0, 1)));

   Ada.Text_IO.Put_Line
      ("Block Down = " &
       Boolean'Image
         (Ada_Tetris.Board.Can_Move (B, 1, 0)));

   Ada.Text_IO.Put_Line
      ("Block Down at bottom = " &
       Boolean'Image
         (Ada_Tetris.Board.Can_Move (B_Bottom, 1, 0)));

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

   Ada.Text_IO.Put_Line ("--- Move Block Down ---");

   Ada_Tetris.Board.Move (B, 1, 0);

   Ada.Text_IO.Put_Line
      ("Block P1 Row = " &
       Ada_Tetris.Board.Row_Index'Image (B.P1.Row));

   Ada.Text_IO.Put_Line
      ("Block P2 Row = " &
       Ada_Tetris.Board.Row_Index'Image (B.P2.Row));

   Ada.Text_IO.Put_Line
      ("Block P3 Row = " &
       Ada_Tetris.Board.Row_Index'Image (B.P3.Row));

   Ada.Text_IO.Put_Line
      ("Block P4 Row = " &
       Ada_Tetris.Board.Row_Index'Image (B.P4.Row));

   -- Place an obstacle to the right of the block
   Ada_Tetris.Board.Place (20, 8);

   Ada.Text_IO.Put_Line
      ("Block Right into obstacle = " &
       Boolean'Image
         (Ada_Tetris.Board.Can_Move (B, 0, 1)));

   Ada_Tetris.Board.Move (B, 0, 1);

   Ada.Text_IO.Put_Line
      ("Block P4 Col after collision = " &
       Ada_Tetris.Board.Col_Index'Image (B.P4.Col));

   Ada.Text_IO.Put_Line
      ("--- Wall Collision Tests ---");

   Ada.Text_IO.Put_Line
      ("Block at left wall cannot move left = " &
      Boolean'Image
      (Ada_Tetris.Board.Can_Move
      (Ada_Tetris.Board.Block'(
         Shape => Ada_Tetris.Board.I_Shape,
      P1 => (Row => 10, Col => 1),
      P2 => (Row => 10, Col => 2),
      P3 => (Row => 10, Col => 3),
      P4 => (Row => 10, Col => 4)),
      0, -1)));

   Ada.Text_IO.Put_Line
      ("Block at right wall cannot move right = " &
      Boolean'Image
      (Ada_Tetris.Board.Can_Move
      (Ada_Tetris.Board.Block'(
         Shape => Ada_Tetris.Board.I_Shape,
      P1 => (Row => 10, Col => 7),
      P2 => (Row => 10, Col => 8),
      P3 => (Row => 10, Col => 9),
      P4 => (Row => 10, Col => 10)),
      0, 1)));

   Ada_Tetris.Board.Draw;

   Ada.Text_IO.Put_Line ("--- Move Block Right ---");
   Ada_Tetris.Board.Place (B_Horizontal);
   Ada_Tetris.Board.Move (B_Horizontal, 0, 1);

   Ada.Text_IO.Put_Line
      ("Block P1 Col after right = " &
       Ada_Tetris.Board.Col_Index'Image (B_Horizontal.P1.Col));

   Ada.Text_IO.Put_Line
      ("Block P4 Col after right = " &
       Ada_Tetris.Board.Col_Index'Image (B_Horizontal.P4.Col));

   Ada.Text_IO.Put_Line ("--- Move Block Left ---");
   Ada_Tetris.Board.Move (B_Horizontal, 0, -1);

   Ada.Text_IO.Put_Line
      ("Block P1 Col after left = " &
       Ada_Tetris.Board.Col_Index'Image (B_Horizontal.P1.Col));

   Ada.Text_IO.Put_Line
      ("Block P4 Col after left = " &
       Ada_Tetris.Board.Col_Index'Image (B_Horizontal.P4.Col));

   Ada.Text_IO.Put_Line ("--- Rotate Block ---");

   Ada_Tetris.Board.Rotate (B_Horizontal);

   Ada.Text_IO.Put_Line
      ("P1 = (" &
       Ada_Tetris.Board.Row_Index'Image (B_Horizontal.P1.Row) & "," &
       Ada_Tetris.Board.Col_Index'Image (B_Horizontal.P1.Col) & ")");

   Ada.Text_IO.Put_Line
      ("P2 = (" &
       Ada_Tetris.Board.Row_Index'Image (B_Horizontal.P2.Row) & "," &
       Ada_Tetris.Board.Col_Index'Image (B_Horizontal.P2.Col) & ")");

   Ada.Text_IO.Put_Line
      ("P3 = (" &
       Ada_Tetris.Board.Row_Index'Image (B_Horizontal.P3.Row) & "," &
       Ada_Tetris.Board.Col_Index'Image (B_Horizontal.P3.Col) & ")");

   Ada.Text_IO.Put_Line
      ("P4 = (" &
       Ada_Tetris.Board.Row_Index'Image (B_Horizontal.P4.Row) & "," &
       Ada_Tetris.Board.Col_Index'Image (B_Horizontal.P4.Col) & ")");

   Ada_Tetris.Board.Draw;

   Ada.Text_IO.Put_Line ("--- Rotate Block Collision Test ---");

   Ada_Tetris.Board.Clear;
   Ada_Tetris.Board.Place (B_Collision);
   Ada_Tetris.Board.Place (6, 5);

   Ada_Tetris.Board.Rotate (B_Collision);

   Ada.Text_IO.Put_Line
      ("P1 Row after collision = " &
       Ada_Tetris.Board.Row_Index'Image (B_Collision.P1.Row));

   Ada.Text_IO.Put_Line
      ("P3 Row after collision = " &
       Ada_Tetris.Board.Row_Index'Image (B_Collision.P3.Row));

   Ada.Text_IO.Put_Line
      ("P3 Col after collision = " &
       Ada_Tetris.Board.Col_Index'Image (B_Collision.P3.Col));

   Ada_Tetris.Board.Draw;

end Ada_Tetris_Main;