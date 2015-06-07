create or replace procedure isReserved(show_ID in int, nRow in int, nCol in int, checkResult out int)
is
nCnt int;

begin

nCnt := 0;
checkResult := 0;

select count(*)
into nCnt
from TICKET
where ShowingID = show_ID and 
SeatRow = nRow and 
SeatColumn = nCol;

if(nCnt = 0) then
checkResult := 0;
else
checkResult := 1;
end if;

end;
/


