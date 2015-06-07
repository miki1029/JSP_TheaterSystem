create or replace procedure getRoomSize(show_ID in int, RCount out int, CCount out int)
is
vRoomNumber int;
vRow int;
vCol int;
 

begin

select RoomNumber 
into vRoomNumber
from SHOWING_INFO
where ShowingID = show_ID;

select COUNT(*)
into CCount
from SEATS
where RoomNumber = vRoomNumber and SeatRow = 1
group by SeatRow;

select COUNT(*)
into RCount
from SEATS
where RoomNumber = vRoomNumber and SeatColumn = 1
group by SeatColumn;

dbms_output.put_line(RCount || CCount);

end;
/