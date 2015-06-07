create or replace procedure getSecondPrice(show_ID in int,
					vCustomerID in int,
					vPrice out int,
					roomPrice out int,
					memberDiscount out int,
					timeDiscount out int,
					holidayExtra out int)
is

vShowInfo SHOWING_INFO%rowtype;
vRoomNumber int;
vDate date;
vTime_ch varchar2(200);
vTime_num number;
vDiscountRate float;
vGradeID int;

begin
vPrice := 0;
roomPrice := 0;
memberDiscount := 0;
timeDiscount := 0;
holidayExtra := 0;

-- RoomNumber
select *
into vShowInfo
from	SHOWING_INFO
where	ShowingID = show_ID;

vRoomNumber := vShowInfo.RoomNumber;
 

-- ScreenRoom Price(roomPrice)
select Price
into roomPrice
from SCREEN_ROOM
where RoomNumber = vShowInfo.RoomNumber;

-- StartTime (timeDiscount, holidayExtra)
vTime_ch := TO_CHAR(vShowInfo.StartTime, 'HH24MI'); 
dbms_output.put_line('가격: ' || vTime_ch);
vTime_num := TO_NUMBER(vTime_ch); 

if ((vTime_num <= 900) or (vTime_num >= 2300)) then
	timeDiscount := 4000;
end if;
if( vShowInfo.isHoliday = 1) then
	holidayExtra := 2000;
end if;

-- Grade discount rate(memberDiscount)
select GradeID
into vGradeID
from CUSTOMERS
where CustomerID = vCustomerID;

select DiscountRate 
into vDiscountRate
from MEMBER_GRADE
where GradeID = vGradeID;
vDiscountRate := vDiscountRate/100;
memberDiscount := roomPrice * vDiscountRate;

vPrice := roomPrice + holidayExtra -timeDiscount - memberDiscount;

dbms_output.put_line('가격: ' || vPrice);
 
 
end;
/