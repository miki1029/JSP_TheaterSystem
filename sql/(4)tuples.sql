

insert into SALARY_INFO (Position,Salary) values ('staff',2000);
insert into SALARY_INFO (Position,Salary) values ('manager',3000);
insert into SALARY_INFO (Position,Salary) values ('director',6000);
insert into SALARY_INFO (Position,Salary) values ('president',7000);
insert into SALARY_INFO (Position,Salary) values ('chairman',10000);



insert into EMPLOYEES (EmployeeID,Role,Name,Sex,HireDate,Position,PhoneNumber) values ('11','screen_room_manager','David','m','20130324','staff','01012345678');
insert into EMPLOYEES (EmployeeID,Role,Name,Sex,HireDate,Position,PhoneNumber) values ('12','screen_room_manager','Diana','f','20110123','manager','01022223333');
insert into EMPLOYEES (EmployeeID,Role,Name,Sex,HireDate,Position,PhoneNumber) values ('13','ticket_seller','Elena','f','20100101','director','01011115555');
insert into EMPLOYEES (EmployeeID,Role,Name,Sex,HireDate,Position,PhoneNumber) values ('14','cleaner','Prim','f','20050303','president','01033332222');
insert into EMPLOYEES (EmployeeID,Role,Name,Sex,HireDate,Position,PhoneNumber) values ('15','cleaner','Klaus','m','20080212','chairman','01044447777');



insert into SALARY_HISTORY (EmployeeID,SalaryDate,MonthlySalary) values ('11','20130424','300');
insert into SALARY_HISTORY (EmployeeID,SalaryDate,MonthlySalary) values ('12','20120513','400');
insert into SALARY_HISTORY (EmployeeID,SalaryDate,MonthlySalary) values ('13','20111112','700');
insert into SALARY_HISTORY (EmployeeID,SalaryDate,MonthlySalary) values ('14','20151212','800');
insert into SALARY_HISTORY (EmployeeID,SalaryDate,MonthlySalary) values ('15','20121001','1000');


INSERT INTO SCREEN_ROOM(RoomNumber, Price, ExitInfo, ScreenSize, TheaterType) VALUES
(1,14000,'����','21.3x13.5','IMAX');
INSERT INTO SCREEN_ROOM(RoomNumber, Price, ExitInfo, ScreenSize, TheaterType) VALUES
(2,14000,'����','17.4x7.4','4dx');
INSERT INTO SCREEN_ROOM(RoomNumber, Price, ExitInfo, ScreenSize, TheaterType) VALUES
(3,12000,'����','15x8.1','2d');
INSERT INTO SCREEN_ROOM(RoomNumber, Price, ExitInfo, ScreenSize, TheaterType) VALUES
(4,11000,'����','13.1x7','2d');
INSERT INTO SCREEN_ROOM(RoomNumber, Price, ExitInfo, ScreenSize, TheaterType) VALUES
(5,11000,'����','13.1x7','2d');

-----------��ѹ��ٲ�-------------------


insert into seats (RoomNumber,SeatRow,SeatColumn,SeatType) values('1','1','1','couple');
insert into seats (RoomNumber,SeatRow,SeatColumn,SeatType) values('2','1','3','single');
insert into seats (RoomNumber,SeatRow,SeatColumn,SeatType) values('3','1','1','couple');
insert into seats (RoomNumber,SeatRow,SeatColumn,SeatType) values('4','1','3','single');
insert into seats (RoomNumber,SeatRow,SeatColumn,SeatType) values('5','1','4','single');



---------------���񽺾��̵�� 300000���̴�------------------



INSERT INTO MOVIES
(MovieID, MovieName, Director, MainActor, Synopsis, RunningTime, MovieGrade, ReleasedDate, ExpiredDate) 
VALUES (30001,'�� �ȵ巹�ƽ�','�극�� ����ư','����� ����',
'�� �ȵ巹�ƽ� ������ ��ħ�� ������ �Ը� 9�� ������ �߻�����
������� ������ ����� ������ ���̰� �־��� �Ƴ��� �Բ�
�ܵ����� ���ϱ� ���� �־��� ��Ȳ ������ �پ���.
������ �������� ������ ����, 
����� ��𿡼� ������ �Բ� �� ���ΰ�!',114,12,
TO_DATE('2015-06-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-08-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO MOVIES 
(MovieID, MovieName, Director, MainActor, Synopsis, RunningTime, MovieGrade, ReleasedDate, ExpiredDate)
VALUES (30002,'������','�� ���̱�','�ֵ� ��',
'���� ������� �ӹ� ������ ���� CIA�� ���� ��� ���� ����(�Ḯ�� ��ī��).
�ܸ�, �ӹ� ���� �� �Ϻ��� �ְ��� ��� �귡�鸮 ����(�ֵ� ��)�� ��Ʈ�ʷ�
�ӹ��� ������ �ϴ� ��, �ٹ��� �аŷ��� �����ϴ� ���ǾƵ鿡�� CIA ����
������� �ź��� ��� ����Ǵ� ����� �߻��Ѵ�. ���ǾƵ��� �𸣴� ���� ���
������ CIA�� �ִ� ���⸦ �غ��ϰ� �ٹ����� �аŷ��� ���� ���� ���忡 ���Եȴ�.
�׷���, �׳ฦ �� �ϴ� ����Ī�� �ְ��� ��� �� ����(���̽� ��Ÿ��)�� �׳�� ������
�ӹ��� �����ϸ鼭 �׳��� �̼��� ���⿡ �����ϰ� �Ǵµ���',122,15,
TO_DATE('2015-05-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-07-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO MOVIES 
(MovieID, MovieName, Director, MainActor, Synopsis, RunningTime, MovieGrade, ReleasedDate, ExpiredDate)
VALUES (30003,'������ ��Ȥ','���籸','�Ӽ���',
'�Ͼ��� ģ������ ��� ���ϰ� ��ä���ڵ鿡�� �ѱ�� �Ϸ��Ϸ� ����� �Ҿ�� ��������(�Ӽ���). 
�׷� �׳� �տ� ���� ������ �� ��������(������)�� ��Ÿ�� �׳��� �λ��� �ٲ� �Ŵ��� ������ �Ѵ�. 
�� ������ �ٷ� õ�������� ����� ������ ��ī�� ī���� �׷��� ��ȸ�塯(�̰濵)�� ������ 
���� �� ����� ��ӹ޴� ��. ��, ���� �� �� ����� ������ �׿� ������ ���� �������� ���Ǵ�.
������ ��ŭ ������ ���������� �ŷ����� �������� ���� ������ ���� ������ ��ħ�� ȸ���� 
ȣȭ ��Ʈ�� ������. �� ��� ���̿� ������ �̹��� ����� �ǽ� �ӿ��� �����Ӱ� ���� �Ǵ� ��ȹ��, 
ȸ���� ���۽����� �������� ��߳��� �Ǵµ���',110,15,
TO_DATE('2015-06-04 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-08-04 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO MOVIES
(MovieID, MovieName, Director, MainActor, Synopsis, RunningTime, MovieGrade, ReleasedDate, ExpiredDate)
VALUES (30004,'������','���¿�','������',
'������ ��� ���ؼ� � �����̵� �� �� �� �ִ� ���� �����(�賲��).
�״� ����� ���̰� ������ ���ر�(�ڼ���)�� �Ѱ� �ִ�. �׸� ���� �� �ִ� ������ �Ǹ�����
���ر��� ������ ������(������). ����� ��ü�� ���� ä ������ ���ϰ� �ִ� �ܶ����� ��ī����
�����󹫷� ����. ������, ����� �ر��� ��� ���� ���� �翡 �ӹ��� ���� �������̰� ����
���̴� ���� ������ �ܸ� �ڿ� �ڸ��� ������ �ܷο�� ����, �������� ������. ���� ������ ��´ٴ�
��ǥ�� �ߵ��Ǿ� �־��� �״� �ڱ� ������ ��ü�� �� ä ������ ��鸰��. �׸��� ���� ������
�� ���� �𸣴� �ر��� ��ٸ��� ������, 
�ڱ� ���� �־��ִ� �׿��� ������ ���� �����Ѵ�.',118,19,
TO_DATE('2015-05-27 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-07-27 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO MOVIES
(MovieID, MovieName, Director, MainActor, Synopsis, RunningTime, MovieGrade, ReleasedDate, ExpiredDate)
VALUES (30005,'�ŵ�ƽ�','���� �з�','�� �ϵ�',
'��ΰ� ����ϴ� ���� ������ �ƴ�. 
���� ������ �̱� ������ ������ ������ ġ�޾� ���� �Ҵ��� �������� �̾����� 
������ �ִ� ��� �ٹ��Ⱑ ��� �������ȴ�. �׸��� ��ħ�� 21���� ��, �η��� ����ߴ�. 
��Ƴ��� �η��� ���� �⸧�� �����ϴ� ������ �Ӹ�ź ���� ���� �Ʒ� ô���� ���� �����Ѵ�. 
����, �Ƴ��� ���� �Ұ� ��Ƴ��� ���� �縷�� ������ �ƽ�(�� �ϵ�)�� �Ӹ�ź�� ���ϵ鿡�� ��ġ�Ǿ� 
�뿹�� ��������, ������ �ݹ��� ��ɰ� ǻ������(�������� �׷�)�� ����ü���� �ر���Ű�� ���� 
�η� ������ ���踦 �� �Ӹ�ź�� ���ε��� Ż���� �г��� ���η� �����Ѵ�. �̿� �Ӹ�ź�� ������ ���η� 
����(���ݶ� ȦƮ)�� �ƽ��� �̲��� ǻ�������� �ڸ� �Ѵµ�... 
�����ִ� ��, �����ִ� �׼��� �����Ѵ�!',120,15,
TO_DATE('2015-05-14 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-07-14 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));


INSERT INTO GENRE VALUES
(11,'���');
INSERT INTO GENRE VALUES
(22,'�׼�');
INSERT INTO GENRE VALUES
(33,'����');
INSERT INTO GENRE VALUES
(44,'�θǽ�');
INSERT INTO GENRE VALUES
(55,'�׼�');



INSERT INTO MOVIES_GENRE(MovieID,GenreID) VALUES
(30001,11);
INSERT INTO MOVIES_GENRE(MovieID,GenreID) VALUES
(30002,22);
INSERT INTO MOVIES_GENRE(MovieID,GenreID) VALUES
(30003,33);
INSERT INTO MOVIES_GENRE(MovieID,GenreID) VALUES
(30004,44);
INSERT INTO MOVIES_GENRE(MovieID,GenreID) VALUES
(30005,55);









insert into screen_room_manager (EmployeeID,RoomNumber) values('11','1');
insert into screen_room_manager (EmployeeID,RoomNumber) values('12','2');



insert into ticketbox (TicketboxID,Type) values ('101','site');
insert into ticketbox (TicketboxID,Type) values ('102','online');




insert into ticket_seller (EmployeeID,TicketboxID) values ('13','101');


insert into cleaner (EmployeeID,District) values('14','north');
insert into cleaner (EmployeeID,District) values('15','south');







INSERT INTO MEMBER_GRADE(GradeID, GradeName, MinimalPoint, DiscountRate)
VALUES (4, 'VIP', 1000, 10);
INSERT INTO MEMBER_GRADE(GradeID, GradeName, MinimalPoint, DiscountRate)
VALUES (3, 'GOLD', 500, 5);
INSERT INTO MEMBER_GRADE(GradeID, GradeName, MinimalPoint, DiscountRate)
VALUES (2, 'SILVER', 300, 2);
INSERT INTO MEMBER_GRADE(GradeID, GradeName, MinimalPoint, DiscountRate)
VALUES (1, 'BRONZE', 100, 1);
INSERT INTO MEMBER_GRADE(GradeID, GradeName, MinimalPoint, DiscountRate)
VALUES (0, 'NONE', 0, 0);


----------------------------------------------------------------------



INSERT INTO CUSTOMERS(CustomerID, PhoneNumber, GradeID) VALUES (10001,'010-1234-5678',4);
INSERT INTO CUSTOMERS(CustomerID, PhoneNumber, GradeID) VALUES (10002,'010-2345-6789',4);
INSERT INTO CUSTOMERS(CustomerID, PhoneNumber, GradeID) VALUES (10003,'010-3456-7890',3);
INSERT INTO CUSTOMERS(CustomerID, PhoneNumber, GradeID) VALUES (10004,'010-0987-6543',3);
INSERT INTO CUSTOMERS(CustomerID, PhoneNumber, GradeID) VALUES (10005,'010-9876-5432',2);
INSERT INTO CUSTOMERS(CustomerID, PhoneNumber, GradeID) VALUES (10006,'010-0000-0000',0);





INSERT INTO MEMBERS(CustomerID, ID, Password, Name, Sex, Birthdate, Email, RegisterDate, Point)
VALUES (10001,'park12','p1234','�ڰ���','f',to_date('13-9-1992','dd-mm-yyyy'),
'park12@gmail.com',to_date('13-5-2015','dd-mm-yyyy'),1100);
INSERT INTO MEMBERS(CustomerID, ID, Password, Name, Sex, Birthdate, Email, RegisterDate, Point)
VALUES (10002,'kim09','k1234','��ο�','m',to_date('29-10-1990','dd-mm-yyyy'),
'kim09@gmail.com',to_date('14-5-2015','dd-mm-yyyy'),700);
INSERT INTO MEMBERS(CustomerID, ID, Password, Name, Sex, Birthdate, Email, RegisterDate, Point)
VALUES (10003,'lee10','l1234','�̻��','m',to_date('30-12-1991','dd-mm-yyyy'),
'lee10@gmail.com',to_date('17-5-2015','dd-mm-yyyy'),700);
INSERT INTO MEMBERS(CustomerID, ID, Password, Name, Sex, Birthdate, Email, RegisterDate, Point)
VALUES (10004,'choi13','c1234','������','f',to_date('13-8-1994','dd-mm-yyyy'),
'choi13@gmail.com',to_date('20-5-2015','dd-mm-yyyy'),600);
INSERT INTO MEMBERS(CustomerID, ID, Password, Name, Sex, Birthdate, Email, RegisterDate, Point)
VALUES (10005,'nam13','n1234','������','m',to_date('22-2-1994','dd-mm-yyyy'),
'nam13@gmail.com',to_date('24-5-2015','dd-mm-yyyy'),400);





INSERT INTO SHOWING_INFO(ShowingID, StartTime, EndTime, RoomNumber, MovieID, isHoliday) VALUES
(20001,TO_DATE('2015-06-05 19:10:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-06-05 21:04:00', 'yyyy-mm-dd hh24:mi:ss'),
1,30001,0);

INSERT INTO SHOWING_INFO(ShowingID, StartTime, EndTime, RoomNumber, MovieID, isHoliday) VALUES
(20002,TO_DATE('2015-06-05 18:55:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-06-05 20:57:00', 'yyyy-mm-dd hh24:mi:ss'),
2,30002,0);

INSERT INTO SHOWING_INFO(ShowingID, StartTime, EndTime, RoomNumber, MovieID, isHoliday) VALUES
(20003,TO_DATE('2015-06-05 22:05:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-06-05 23:55:00', 'yyyy-mm-dd hh24:mi:ss'),
3,30003,0);

INSERT INTO SHOWING_INFO(ShowingID, StartTime, EndTime, RoomNumber, MovieID, isHoliday) VALUES
(20004,TO_DATE('2015-06-06 12:50:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-06-06 14:48:00', 'yyyy-mm-dd hh24:mi:ss'),
4,30004,1);

INSERT INTO SHOWING_INFO(ShowingID, StartTime, EndTime, RoomNumber, MovieID, isHoliday) VALUES
(20005,TO_DATE('2015-06-06 12:05:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-06-06 14:05:00', 'yyyy-mm-dd hh24:mi:ss'),
5,30005,1);

INSERT INTO SHOWING_INFO(ShowingID, StartTime, EndTime, RoomNumber, MovieID, isHoliday) VALUES
(20006,TO_DATE('2015-06-06 09:00:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-06-06 11:00:00', 'yyyy-mm-dd hh24:mi:ss'),
5,30005,1);

INSERT INTO SHOWING_INFO(ShowingID, StartTime, EndTime, RoomNumber, MovieID, isHoliday) VALUES
(20007,TO_DATE('2015-06-06 23:10:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-06-07 01:05:00', 'yyyy-mm-dd hh24:mi:ss'),
5,30005,1);






----------------------------------------------------------------------------------------------



insert into ticket (TicketID,CustomerID,RoomNumber,SeatColumn,SeatRow,ShowingID) values('50001','10001','1','1','1','20001');
insert into ticket (TicketID,CustomerID,RoomNumber,SeatColumn,SeatRow,ShowingID) values('50002','10002','2','3','1','20002');
insert into ticket (TicketID,CustomerID,RoomNumber,SeatColumn,SeatRow,ShowingID) values('50003','10003','3','1','1','20003');
insert into ticket (TicketID,CustomerID,RoomNumber,SeatColumn,SeatRow,ShowingID) values('50004','10004','4','3','1','20004');
insert into ticket (TicketID,CustomerID,RoomNumber,SeatColumn,SeatRow,ShowingID) values('50005','10005','5','4','1','20005');


