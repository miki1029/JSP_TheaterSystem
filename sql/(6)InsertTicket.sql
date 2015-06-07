CREATE OR REPLACE PROCEDURE InsertTicket(C_ID		IN	int,
					S_Column	IN	int,
					S_Row		IN	int,
					S_ID		IN	int,
					v_price		IN	int)
IS
v_Point int;
v_GradeId int;
s_GradeId int;
R_Number int;

BEGIN
-- RoomNumber
SELECT RoomNumber INTO R_Number
FROM SHOWING_INFO
WHERE ShowingID = S_ID;

-- Insert Ticket
INSERT INTO ticket( TicketID, CustomerID, RoomNumber, SeatColumn, SeatRow, ShowingID )
VALUES ( SEQ_Ticket.NEXTVAL , C_ID, R_Number, S_Column, S_Row, S_ID);

-- Select Grade
SELECT GradeID
INTO v_GradeId
FROM CUSTOMERS
WHERE CustomerID = C_ID;

IF(v_GradeId != 0) THEN
-- Point Up
UPDATE MEMBERS
SET Point = Point + v_price * 0.1
WHERE CustomerID = C_ID;

-- Grade Up
SELECT Point INTO v_Point 
FROM MEMBERS 
WHERE CustomerID=C_ID;
IF(v_Point>1000) THEN
s_GradeId:=4;
ELSIF(v_Point>500) THEN
s_GradeId:=3;
ELSIF(v_Point>300) THEN
s_GradeId:=2;
ELSIF(v_Point>100) THEN
s_GradeId:=1;
ELSE 
s_GradeId:=0;
END IF;
UPDATE  CUSTOMERS
SET GradeID = s_GradeID
WHERE CustomerID=C_ID;

END IF;
COMMIT;

END;
/