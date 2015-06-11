

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


insert into seats (RoomNumber,SeatRow,SeatColumn,SeatType) values('1','1','1','couple');
insert into seats (RoomNumber,SeatRow,SeatColumn,SeatType) values('2','1','3','single');
insert into seats (RoomNumber,SeatRow,SeatColumn,SeatType) values('3','1','1','couple');
insert into seats (RoomNumber,SeatRow,SeatColumn,SeatType) values('4','1','3','single');
insert into seats (RoomNumber,SeatRow,SeatColumn,SeatType) values('5','1','4','single');



---------------무비스아이디는 300000대이다------------------



INSERT INTO MOVIES
(MovieID, MovieName, Director, MainActor, Synopsis, RunningTime, MovieGrade, ReleasedDate, ExpiredDate) 
VALUES (30001,'샌 안드레아스','브레드 페이튼','드웨인 존슨',
'샌 안드레아스 단층이 마침내 끊어져 규모 9의 강진이 발생하자
구조헬기 조종사 드웨인 존슨은 사이가 멀어진 아내와 함께
외동딸을 구하기 위해 최악의 상황 속으로 뛰어든다.
세상이 무너지는 마지막 순간, 
당신은 어디에서 누구와 함께 할 것인가!',114,12,
TO_DATE('2015-06-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-08-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO MOVIES 
(MovieID, MovieName, Director, MainActor, Synopsis, RunningTime, MovieGrade, ReleasedDate, ExpiredDate)
VALUES (30002,'스파이','폴 페이그','주드 로',
'현장 요원들의 임무 수행을 돕는 CIA의 내근 요원 수잔 쿠퍼(멜리사 맥카시).
외모, 임무 수행 등 완벽한 최고의 요원 브래들리 파인(주드 로)의 파트너로
임무를 수행을 하던 중, 핵무기 밀거래를 추진하는 마피아들에게 CIA 현장
요원들의 신분이 모두 노출되는 사건이 발생한다. 마피아들이 모르는 내근 요원
수잔은 CIA의 최대 위기를 극복하고 핵무기의 밀거래를 막기 위해 현장에 투입된다.
그러나, 그녀를 못 믿는 ‘자칭’ 최고의 요원 릭 포드(제이슨 스타뎀)가 그녀와 별개로
임무를 수행하면서 그녀의 미션은 위기에 직면하게 되는데…',122,15,
TO_DATE('2015-05-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-07-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO MOVIES 
(MovieID, MovieName, Director, MainActor, Synopsis, RunningTime, MovieGrade, ReleasedDate, ExpiredDate)
VALUES (30003,'은밀한 유혹','윤재구','임수정',
'믿었던 친구에게 배신 당하고 사채업자들에게 쫓기며 하루하루 희망을 잃어가던 ‘지연’(임수정). 
그런 그녀 앞에 젊고 유능한 비서 ‘성열’(유연석)이 나타나 그녀의 인생을 바꿀 거대한 제안을 한다. 
그 제안은 바로 천문학적인 재산을 소유한 마카오 카지노 그룹의 ‘회장’(이경영)을 사로잡아 
그의 전 재산을 상속받는 것. 단, 성공 시 그 재산의 절반을 그와 나누는 것을 조건으로 내건다.
달콤한 만큼 위험한 제안이지만 매력적인 성열에게 강한 끌림을 느낀 지연은 마침내 회장의 
호화 요트에 오른다. 세 사람 사이에 감도는 미묘한 긴장과 의심 속에서 순조롭게 진행 되던 계획은, 
회장의 갑작스러운 죽음으로 어긋나게 되는데…',110,15,
TO_DATE('2015-06-04 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-08-04 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO MOVIES
(MovieID, MovieName, Director, MainActor, Synopsis, RunningTime, MovieGrade, ReleasedDate, ExpiredDate)
VALUES (30004,'무뢰한','오승욱','전도연',
'범인을 잡기 위해선 어떤 수단이든 다 쓸 수 있는 형사 정재곤(김남길).
그는 사람을 죽이고 잠적한 박준길(박성웅)을 쫓고 있다. 그를 잡을 수 있는 유일한 실마리는
박준길의 애인인 김혜경(전도연). 재곤은 정체를 숨긴 채 혜경이 일하고 있는 단란주점 마카오의
영업상무로 들어간다. 하지만, 재곤은 준길을 잡기 위해 혜경 곁에 머무는 사이 퇴폐적이고 강해
보이는 술집 여자의 외면 뒤에 자리한 혜경의 외로움과 눈물, 순수함을 느낀다. 오직 범인을 잡는다는
목표에 중독되어 있었던 그는 자기 감정의 정체도 모른 채 마음이 흔들린다. 그리고 언제 연락이
올 지도 모르는 준길을 기다리던 혜경은, 
자기 옆에 있어주는 그에게 마음을 열기 시작한다.',118,19,
TO_DATE('2015-05-27 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-07-27 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO MOVIES
(MovieID, MovieName, Director, MainActor, Synopsis, RunningTime, MovieGrade, ReleasedDate, ExpiredDate)
VALUES (30005,'매드맥스','조지 밀러','톰 하디',
'모두가 우려하던 일이 현실이 됐다. 
세계 각국의 이권 다툼과 갈등이 극으로 치달아 통제 불능의 전쟁으로 이어졌고 
지구상에 있던 모든 핵무기가 모두 터져버렸다. 그리고 마침내 21세기 말, 인류는 멸망했다. 
살아남은 인류는 물과 기름을 지배하는 독재자 임모탄 조의 지배 아래 척박한 삶을 영위한다. 
한편, 아내와 딸을 잃고 살아남기 위해 사막을 떠돌던 맥스(톰 하디)는 임모탄의 부하들에게 납치되어 
노예로 끌려가고, 폭정에 반발한 사령관 퓨리오사(샤를리즈 테론)는 지배체제를 붕괴시키기 위해 
인류 생존의 열쇠를 쥔 임모탄의 여인들을 탈취해 분노의 도로로 폭주한다. 이에 임모탄의 전사인 신인류 
눅스(니콜라스 홀트)는 맥스를 이끌고 퓨리오사의 뒤를 쫓는데... 
끝내주는 날, 끝내주는 액션이 폭렬한다!',120,15,
TO_DATE('2015-05-14 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
TO_DATE('2015-07-14 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));


INSERT INTO GENRE VALUES
(11,'드라마');
INSERT INTO GENRE VALUES
(22,'액션');
INSERT INTO GENRE VALUES
(33,'범죄');
INSERT INTO GENRE VALUES
(44,'로맨스');
INSERT INTO GENRE VALUES
(55,'액션');



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
VALUES (10001,'park12','p1234','박경혜','f',to_date('13-9-1992','dd-mm-yyyy'),
'park12@gmail.com',to_date('13-5-2015','dd-mm-yyyy'),1100);
INSERT INTO MEMBERS(CustomerID, ID, Password, Name, Sex, Birthdate, Email, RegisterDate, Point)
VALUES (10002,'kim09','k1234','김민우','m',to_date('29-10-1990','dd-mm-yyyy'),
'kim09@gmail.com',to_date('14-5-2015','dd-mm-yyyy'),700);
INSERT INTO MEMBERS(CustomerID, ID, Password, Name, Sex, Birthdate, Email, RegisterDate, Point)
VALUES (10003,'lee10','l1234','이상우','m',to_date('30-12-1991','dd-mm-yyyy'),
'lee10@gmail.com',to_date('17-5-2015','dd-mm-yyyy'),700);
INSERT INTO MEMBERS(CustomerID, ID, Password, Name, Sex, Birthdate, Email, RegisterDate, Point)
VALUES (10004,'choi13','c1234','최지원','f',to_date('13-8-1994','dd-mm-yyyy'),
'choi13@gmail.com',to_date('20-5-2015','dd-mm-yyyy'),600);
INSERT INTO MEMBERS(CustomerID, ID, Password, Name, Sex, Birthdate, Email, RegisterDate, Point)
VALUES (10005,'nam13','n1234','남주혁','m',to_date('22-2-1994','dd-mm-yyyy'),
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


