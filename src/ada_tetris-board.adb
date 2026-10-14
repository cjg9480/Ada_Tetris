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

   function Block_Contains
      (B   : Block;
       Row : Row_Index;
       Col : Col_Index) return Boolean is
   begin
      return
         (B.P1.Row = Row and B.P1.Col = Col)
         or else
         (B.P2.Row = Row and B.P2.Col = Col)
         or else
         (B.P3.Row = Row and B.P3.Col = Col)
         or else
         (B.P4.Row = Row and B.P4.Col = Col);
   end Block_Contains;

   function Can_Move_Point
      (B         : Block;
       P         : Position;
       Delta_Row : Integer;
       Delta_Col : Integer) return Boolean
   is
      New_Row : constant Integer :=
         Integer (P.Row) + Delta_Row;
      New_Col : constant Integer :=
         Integer (P.Col) + Delta_Col;
   begin
      -- 1. 게임판 경계 검사
      if New_Row not in 1 .. Height
         or else New_Col not in 1 .. Width
      then
         return False;
      end if;

      -- 2. 목적지가 비어 있으면 이동 가능
      if Board (Row_Index (New_Row),
                Col_Index (New_Col)) = Empty
      then
         return True;
      end if;

      -- 3. 현재 블록 자신의 칸이면 이동 가능
      return Block_Contains
         (B, Row_Index (New_Row), Col_Index (New_Col));
   end Can_Move_Point;

   function Can_Move
      (B         : Block;
       Delta_Row : Integer;
       Delta_Col : Integer) return Boolean is
   begin
      return
         Can_Move_Point (B, B.P1, Delta_Row, Delta_Col)
         and then
         Can_Move_Point (B, B.P2, Delta_Row, Delta_Col)
         and then
         Can_Move_Point (B, B.P3, Delta_Row, Delta_Col)
         and then
         Can_Move_Point (B, B.P4, Delta_Row, Delta_Col);
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

   procedure Move
      (B         : in out Block;
       Delta_Row : Integer;
       Delta_Col : Integer) is
   begin
      if Can_Move (B, Delta_Row, Delta_Col) then
         Board (B.P1.Row, B.P1.Col) := Empty;
         Board (B.P2.Row, B.P2.Col) := Empty;
         Board (B.P3.Row, B.P3.Col) := Empty;
         Board (B.P4.Row, B.P4.Col) := Empty;

         B.P1.Row := Row_Index (Integer (B.P1.Row) + Delta_Row);
         B.P1.Col := Col_Index (Integer (B.P1.Col) + Delta_Col);

         B.P2.Row := Row_Index (Integer (B.P2.Row) + Delta_Row);
         B.P2.Col := Col_Index (Integer (B.P2.Col) + Delta_Col);

         B.P3.Row := Row_Index (Integer (B.P3.Row) + Delta_Row);
         B.P3.Col := Col_Index (Integer (B.P3.Col) + Delta_Col);

         B.P4.Row := Row_Index (Integer (B.P4.Row) + Delta_Row);
         B.P4.Col := Col_Index (Integer (B.P4.Col) + Delta_Col);

         Place (B);
      end if;
   end Move;

   procedure Rotate (B : in out Block) is
      New_B : Block;

      P1_Row : constant Integer :=
         Integer (B.P2.Row) +
         Integer (B.P1.Col) - Integer (B.P2.Col);
      P1_Col : constant Integer :=
         Integer (B.P2.Col) -
         (Integer (B.P1.Row) - Integer (B.P2.Row));

      P3_Row : constant Integer :=
         Integer (B.P2.Row) +
         Integer (B.P3.Col) - Integer (B.P2.Col);
      P3_Col : constant Integer :=
         Integer (B.P2.Col) -
         (Integer (B.P3.Row) - Integer (B.P2.Row));

      P4_Row : constant Integer :=
         Integer (B.P2.Row) +
         Integer (B.P4.Col) - Integer (B.P2.Col);
      P4_Col : constant Integer :=
         Integer (B.P2.Col) -
         (Integer (B.P4.Row) - Integer (B.P2.Row));

      function Is_Available
         (Row : Integer;
          Col : Integer) return Boolean
      is
      begin
         if Row not in 1 .. Height
            or else Col not in 1 .. Width
         then
            return False;
         end if;

         return
            Board (Row_Index (Row), Col_Index (Col)) = Empty
            or else Block_Contains
               (B, Row_Index (Row), Col_Index (Col));
      end Is_Available;

   begin
      if not Is_Available (P1_Row, P1_Col)
         or else not Is_Available (Integer (B.P2.Row),
                                   Integer (B.P2.Col))
         or else not Is_Available (P3_Row, P3_Col)
         or else not Is_Available (P4_Row, P4_Col)
      then
         return;
      end if;

      New_B.Shape := B.Shape;

      New_B.P1 :=
         (Row => Row_Index (P1_Row),
          Col => Col_Index (P1_Col));

      New_B.P2 := B.P2;

      New_B.P3 :=
         (Row => Row_Index (P3_Row),
          Col => Col_Index (P3_Col));

      New_B.P4 :=
         (Row => Row_Index (P4_Row),
          Col => Col_Index (P4_Col));

      Board (B.P1.Row, B.P1.Col) := Empty;
      Board (B.P2.Row, B.P2.Col) := Empty;
      Board (B.P3.Row, B.P3.Col) := Empty;
      Board (B.P4.Row, B.P4.Col) := Empty;

      B := New_B;
      Place (B);
   end Rotate;

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
