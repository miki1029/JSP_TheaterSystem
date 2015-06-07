INSERT INTO SCREEN_ROOM(RoomNumber, Price, ExitInfo, ScreenSize, TheaterType) VALUES
(1,14000,'전방','21.3x13.5','IMAX');
INSERT INTO SCREEN_ROOM(RoomNumber, Price, ExitInfo, ScreenSize, TheaterType) VALUES
(2,14000,'우측','17.4x7.4','4dx');
INSERT INTO SCREEN_ROOM(RoomNumber, Price, ExitInfo, ScreenSize, TheaterType) VALUES
(3,12000,'좌측','15x8.1','2d');
INSERT INTO SCREEN_ROOM(RoomNumber, Price, ExitInfo, ScreenSize, TheaterType) VALUES
(4,11000,'우측','13.1x7','2d');
INSERT INTO SCREEN_ROOM(RoomNumber, Price, ExitInfo, ScreenSize, TheaterType) VALUES
(5,11000,'좌측','13.1x7','2d');

-----------룸넘버바꿈-------------------
delete from seats;
declare
i number := 0;
j number := 0;
a number := 0;
b number := 0;

BEGIN

LOOP
	i := i+1;
	j := 0;
		LOOP
			j := j+1;
			insert into seats (RoomNumber,SeatRow,SeatColumn) values('1',i,j);
			insert into seats (RoomNumber,SeatRow,SeatColumn) values('2',i,j);

			EXIT WHEN j>=10;
		END LOOP;
	EXIT WHEN i>=5;
END LOOP;

LOOP
	a := a+1;
	b := 0;
		LOOP
			b := b+1;
			insert into seats (RoomNumber,SeatRow,SeatColumn) values('3',a,b);
			insert into seats (RoomNumber,SeatRow,SeatColumn) values('4',a,b);
			insert into seats (RoomNumber,SeatRow,SeatColumn) values('5',a,b);
			EXIT WHEN b>=20;
		END LOOP;
	EXIT WHEN a>=10;
END LOOP;

END;
/

select * from seats order by ROOMNUMBER asc, SEATROW asc, SEATCOLUMN asc;