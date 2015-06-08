CREATE OR REPLACE PROCEDURE DeleteTicket(C_ID		IN	int,
					v_ticketID	IN	int,
					v_price		IN	int)
IS
v_Point int;
v_GradeId int;
s_GradeId int;
R_Number int;

BEGIN
-- Insert Ticket
DELETE FROM TICKET WHERE TicketID = v_ticketID;

-- Select Grade
SELECT GradeID
INTO v_GradeId
FROM CUSTOMERS
WHERE CustomerID = C_ID;

IF(v_GradeId != 0) THEN
-- Point Down
UPDATE MEMBERS
SET Point = Point - v_price * 0.1
WHERE CustomerID = C_ID;

-- Grade Down
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