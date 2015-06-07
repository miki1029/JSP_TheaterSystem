
CREATE TABLE CUSTOMERS
(
	CustomerID           INT NOT NULL ,
	PhoneNumber          CHAR(13) NOT NULL ,
	GradeID              INT NOT NULL 
);

CREATE UNIQUE INDEX XPKCUSTOMERS ON CUSTOMERS
(CustomerID   ASC);

ALTER TABLE CUSTOMERS
	ADD CONSTRAINT  XPKCUSTOMERS PRIMARY KEY (CustomerID);

CREATE UNIQUE INDEX XAK1CUSTOMERS ON CUSTOMERS
(PhoneNumber   ASC);

ALTER TABLE CUSTOMERS
ADD CONSTRAINT  XAK1CUSTOMERS UNIQUE (PhoneNumber);

CREATE TABLE EMPLOYEES
(
	EmployeeID           INT NOT NULL ,
	Role                 VARCHAR2(30) NULL ,
	Name                 CHAR(10) NOT NULL ,
	Sex                  CHAR(1) NOT NULL  CONSTRAINT  SEX_VAL_1771143327 CHECK (Sex IN ('m', 'f')),
	HireDate             DATE NOT NULL ,
	Position             CHAR(10) NOT NULL ,
	PhoneNumber          CHAR(13) NULL 
);

CREATE UNIQUE INDEX XPKEMPLOYEES ON EMPLOYEES
(EmployeeID   ASC);

ALTER TABLE EMPLOYEES
	ADD CONSTRAINT  XPKEMPLOYEES PRIMARY KEY (EmployeeID);

CREATE UNIQUE INDEX XAK1EMPLOYEES ON EMPLOYEES
(PhoneNumber   ASC);

ALTER TABLE EMPLOYEES
ADD CONSTRAINT  XAK1EMPLOYEES UNIQUE (PhoneNumber);

CREATE TABLE CLEANER
(
	EmployeeID           INT NOT NULL ,
	District             VARCHAR2(30) NULL 
);

CREATE UNIQUE INDEX XPKCLEANER ON CLEANER
(EmployeeID   ASC);

ALTER TABLE CLEANER
	ADD CONSTRAINT  XPKCLEANER PRIMARY KEY (EmployeeID);

CREATE TABLE GENRE
(
	GenreID              INT NOT NULL ,
	GenreName            CHAR(10) NOT NULL 
);

CREATE UNIQUE INDEX XPKGENRE ON GENRE
(GenreID   ASC);

ALTER TABLE GENRE
	ADD CONSTRAINT  XPKGENRE PRIMARY KEY (GenreID);

CREATE TABLE MOVIES
(
	MovieID              INT NOT NULL ,
	MovieName            VARCHAR2(30) NOT NULL ,
	Director             CHAR(20) NOT NULL ,
	MainActor            CHAR(20) NOT NULL ,
	Synopsis             VARCHAR2(1000) NULL ,
	ReleasedDate         DATE NOT NULL ,
	RunningTime          INT NOT NULL ,
	MovieGrade           INT NOT NULL ,
	ExpiredDate          DATE NULL 
);

CREATE UNIQUE INDEX XPKMOVIES ON MOVIES
(MovieID   ASC);

ALTER TABLE MOVIES
	ADD CONSTRAINT  XPKMOVIES PRIMARY KEY (MovieID);

CREATE TABLE MOVIES_GENRE
(
	MovieID              INT NOT NULL ,
	GenreID              INT NOT NULL 
);

CREATE UNIQUE INDEX XPKMOVIE_GENRE ON MOVIES_GENRE
(MovieID   ASC,GenreID   ASC);

ALTER TABLE MOVIES_GENRE
	ADD CONSTRAINT  XPKMOVIE_GENRE PRIMARY KEY (MovieID,GenreID);

CREATE TABLE SALARY_HISTORY
(
	EmployeeID           INT NOT NULL ,
	SalaryDate           DATE NOT NULL ,
	MonthlySalary        INT NOT NULL 
);

CREATE UNIQUE INDEX XPKSALARY_HISTORY ON SALARY_HISTORY
(EmployeeID   ASC,SalaryDate   ASC);

ALTER TABLE SALARY_HISTORY
	ADD CONSTRAINT  XPKSALARY_HISTORY PRIMARY KEY (EmployeeID,SalaryDate);

CREATE TABLE ADMIN
(
	ID                   CHAR(10) NOT NULL ,
	Password             CHAR(10) NOT NULL ,
	EmployeeID           INT NOT NULL 
);

CREATE UNIQUE INDEX XPKADMIN ON ADMIN
(EmployeeID   ASC);

ALTER TABLE ADMIN
	ADD CONSTRAINT  XPKADMIN PRIMARY KEY (EmployeeID);

CREATE UNIQUE INDEX XAK1ADMIN ON ADMIN
(ID   ASC);

ALTER TABLE ADMIN
ADD CONSTRAINT  XAK1ADMIN UNIQUE (ID);

CREATE TABLE MEMBERS
(
	Name                 CHAR(10) NOT NULL ,
	Sex                  CHAR(1) NOT NULL ,
	Birthdate            DATE NULL ,
	Email                CHAR(30) NULL ,
	RegisterDate         DATE NOT NULL ,
	Point                INT DEFAULT  0  NOT NULL ,
	CustomerID           INT NOT NULL ,
	Password             CHAR(10) NOT NULL ,
	ID                   CHAR(10) NOT NULL 
);

CREATE UNIQUE INDEX XPKMEMBERS ON MEMBERS
(CustomerID   ASC);

ALTER TABLE MEMBERS
	ADD CONSTRAINT  XPKMEMBERS PRIMARY KEY (CustomerID);

CREATE UNIQUE INDEX XAK1MEMBERS ON MEMBERS
(ID   ASC);

ALTER TABLE MEMBERS
ADD CONSTRAINT  XAK1MEMBERS UNIQUE (ID);

CREATE UNIQUE INDEX XAK2MEMBERS ON MEMBERS
(Email   ASC);

ALTER TABLE MEMBERS
ADD CONSTRAINT  XAK2MEMBERS UNIQUE (Email);

CREATE TABLE MEMBER_GRADE
(
	MinimalPoint         INT NULL ,
	GradeName            CHAR(10) NOT NULL ,
	DiscountRate         INT NOT NULL ,
	GradeID              INT NOT NULL 
);

CREATE UNIQUE INDEX XPKMEMBER_GRADE ON MEMBER_GRADE
(GradeID   ASC);

ALTER TABLE MEMBER_GRADE
	ADD CONSTRAINT  XPKMEMBER_GRADE PRIMARY KEY (GradeID);

CREATE UNIQUE INDEX XAK1MEMBER_GRADE ON MEMBER_GRADE
(GradeName   ASC);

ALTER TABLE MEMBER_GRADE
ADD CONSTRAINT  XAK1MEMBER_GRADE UNIQUE (GradeName);

CREATE TABLE SALARY_INFO
(
	Position             CHAR(10) NOT NULL ,
	Salary               INT NOT NULL 
);

CREATE UNIQUE INDEX XPKSALARY_INFO ON SALARY_INFO
(Position   ASC);

ALTER TABLE SALARY_INFO
	ADD CONSTRAINT  XPKSALARY_INFO PRIMARY KEY (Position);

CREATE TABLE SCREEN_ROOM
(
	RoomNumber           INT NOT NULL ,
	Price                INT NULL ,
	ExitInfo             CHAR(18) NULL ,
	ScreenSize           CHAR(18) NULL ,
	TheaterType          CHAR(10) NULL 
);

CREATE UNIQUE INDEX XPKSCREEN_ROOM ON SCREEN_ROOM
(RoomNumber   ASC);

ALTER TABLE SCREEN_ROOM
	ADD CONSTRAINT  XPKSCREEN_ROOM PRIMARY KEY (RoomNumber);

CREATE TABLE SCREEN_ROOM_MANAGER
(
	EmployeeID           INT NOT NULL ,
	RoomNumber           INT NULL 
);

CREATE UNIQUE INDEX XPKSCREEN_ROOM_MANAGER ON SCREEN_ROOM_MANAGER
(EmployeeID   ASC);

ALTER TABLE SCREEN_ROOM_MANAGER
	ADD CONSTRAINT  XPKSCREEN_ROOM_MANAGER PRIMARY KEY (EmployeeID);

CREATE TABLE SEATS
(
	SeatRow              INT NOT NULL ,
	SeatColumn           INT NOT NULL ,
	SeatType             CHAR(15) NULL ,
	RoomNumber           INT NOT NULL 
);

CREATE UNIQUE INDEX XPKSEATS ON SEATS
(RoomNumber   ASC,SeatRow   ASC,SeatColumn   ASC);

ALTER TABLE SEATS
	ADD CONSTRAINT  XPKSEATS PRIMARY KEY (RoomNumber,SeatRow,SeatColumn);

CREATE TABLE SHOWING_INFO
(
	ShowingID            INT NOT NULL ,
	StartTime            DATE NOT NULL ,
	EndTime              DATE NOT NULL ,
	RoomNumber           INT NOT NULL ,
	MovieID              INT NOT NULL ,
	isHoliday            INT NULL 
);

CREATE UNIQUE INDEX XPKSHOWING_INFO ON SHOWING_INFO
(ShowingID   ASC);

ALTER TABLE SHOWING_INFO
	ADD CONSTRAINT  XPKSHOWING_INFO PRIMARY KEY (ShowingID);

CREATE TABLE TICKET
(
	TicketID             INT NOT NULL ,
	CustomerID           INT NOT NULL ,
	RoomNumber           INT NOT NULL ,
	SeatColumn           INT NOT NULL ,
	SeatRow              INT NOT NULL ,
	ShowingID            INT NOT NULL 
);

CREATE UNIQUE INDEX XPKTICKET ON TICKET
(TicketID   ASC);

ALTER TABLE TICKET
	ADD CONSTRAINT  XPKTICKET PRIMARY KEY (TicketID);

CREATE TABLE TICKETBOX
(
	TicketboxID          INT NOT NULL ,
	Type                 CHAR(15) NOT NULL 
);

CREATE UNIQUE INDEX XPKTICKETBOX ON TICKETBOX
(TicketboxID   ASC);

ALTER TABLE TICKETBOX
	ADD CONSTRAINT  XPKTICKETBOX PRIMARY KEY (TicketboxID);

CREATE TABLE TICKET_SELLER
(
	EmployeeID           INT NOT NULL ,
	TicketboxID          INT NOT NULL 
);

CREATE UNIQUE INDEX XPKTICKET_SELLER ON TICKET_SELLER
(EmployeeID   ASC);

ALTER TABLE TICKET_SELLER
	ADD CONSTRAINT  XPKTICKET_SELLER PRIMARY KEY (EmployeeID);

ALTER TABLE CUSTOMERS
	ADD (CONSTRAINT R_70 FOREIGN KEY (GradeID) REFERENCES MEMBER_GRADE (GradeID));

ALTER TABLE EMPLOYEES
	ADD (CONSTRAINT R_65 FOREIGN KEY (Position) REFERENCES SALARY_INFO (Position));

ALTER TABLE CLEANER
	ADD (CONSTRAINT R_27 FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES (EmployeeID) ON DELETE CASCADE);

ALTER TABLE MOVIES_GENRE
	ADD (CONSTRAINT R_4 FOREIGN KEY (MovieID) REFERENCES MOVIES (MovieID));

ALTER TABLE MOVIES_GENRE
	ADD (CONSTRAINT R_5 FOREIGN KEY (GenreID) REFERENCES GENRE (GenreID));

ALTER TABLE SALARY_HISTORY
	ADD (CONSTRAINT R_67 FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES (EmployeeID));

ALTER TABLE ADMIN
	ADD (CONSTRAINT R_73 FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES (EmployeeID) ON DELETE CASCADE);

ALTER TABLE MEMBERS
	ADD (CONSTRAINT R_71 FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS (CustomerID) ON DELETE CASCADE);

ALTER TABLE SCREEN_ROOM_MANAGER
	ADD (CONSTRAINT R_26 FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES (EmployeeID) ON DELETE CASCADE);

ALTER TABLE SCREEN_ROOM_MANAGER
	ADD (CONSTRAINT R_34 FOREIGN KEY (RoomNumber) REFERENCES SCREEN_ROOM (RoomNumber) ON DELETE SET NULL);

ALTER TABLE SEATS
	ADD (CONSTRAINT R_12 FOREIGN KEY (RoomNumber) REFERENCES SCREEN_ROOM (RoomNumber));

ALTER TABLE SHOWING_INFO
	ADD (CONSTRAINT R_16 FOREIGN KEY (RoomNumber) REFERENCES SCREEN_ROOM (RoomNumber));

ALTER TABLE SHOWING_INFO
	ADD (CONSTRAINT R_22 FOREIGN KEY (MovieID) REFERENCES MOVIES (MovieID));

ALTER TABLE TICKET
	ADD (CONSTRAINT R_14 FOREIGN KEY (RoomNumber, SeatRow, SeatColumn) REFERENCES SEATS (RoomNumber, SeatRow, SeatColumn));

ALTER TABLE TICKET
	ADD (CONSTRAINT R_21 FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS (CustomerID));

ALTER TABLE TICKET
	ADD (CONSTRAINT R_72 FOREIGN KEY (ShowingID) REFERENCES SHOWING_INFO (ShowingID));

ALTER TABLE TICKET_SELLER
	ADD (CONSTRAINT R_25 FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES (EmployeeID) ON DELETE CASCADE);

ALTER TABLE TICKET_SELLER
	ADD (CONSTRAINT R_36 FOREIGN KEY (TicketboxID) REFERENCES TICKETBOX (TicketboxID));

CREATE  TRIGGER  tD_CUSTOMERS AFTER DELETE ON CUSTOMERS for each row
-- ERwin Builtin Trigger
-- DELETE trigger on CUSTOMERS 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* CUSTOMERS  MEMBERS on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="000185a2", PARENT_OWNER="", PARENT_TABLE="CUSTOMERS"
    CHILD_OWNER="", CHILD_TABLE="MEMBERS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_71", FK_COLUMNS="CustomerID" */
    DELETE FROM MEMBERS
      WHERE
        /*  %JoinFKPK(MEMBERS,:%Old," = "," AND") */
        MEMBERS.CustomerID = :old.CustomerID;

    /* ERwin Builtin Trigger */
    /* CUSTOMERS  TICKET on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMERS"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustomerID" */
    SELECT count(*) INTO NUMROWS
      FROM TICKET
      WHERE
        /*  %JoinFKPK(TICKET,:%Old," = "," AND") */
        TICKET.CustomerID = :old.CustomerID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete CUSTOMERS because TICKET exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_CUSTOMERS BEFORE INSERT ON CUSTOMERS for each row
-- ERwin Builtin Trigger
-- INSERT trigger on CUSTOMERS 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* MEMBER_GRADE  CUSTOMERS on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f8c9", PARENT_OWNER="", PARENT_TABLE="MEMBER_GRADE"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMERS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_70", FK_COLUMNS="GradeID" */
    SELECT count(*) INTO NUMROWS
      FROM MEMBER_GRADE
      WHERE
        /* %JoinFKPK(:%New,MEMBER_GRADE," = "," AND") */
        :new.GradeID = MEMBER_GRADE.GradeID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert CUSTOMERS because MEMBER_GRADE does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_CUSTOMERS AFTER UPDATE ON CUSTOMERS for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on CUSTOMERS 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* CUSTOMERS  MEMBERS on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="000310a0", PARENT_OWNER="", PARENT_TABLE="CUSTOMERS"
    CHILD_OWNER="", CHILD_TABLE="MEMBERS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_71", FK_COLUMNS="CustomerID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.CustomerID <> :new.CustomerID
  THEN
    UPDATE MEMBERS
      SET
        /*  %JoinFKPK(MEMBERS,:%New," = ",",") */
        MEMBERS.CustomerID = :new.CustomerID
      WHERE
        /*  %JoinFKPK(MEMBERS,:%Old," = "," AND") */
        MEMBERS.CustomerID = :old.CustomerID;
  END IF;

  /* ERwin Builtin Trigger */
  /* CUSTOMERS  TICKET on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMERS"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustomerID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.CustomerID <> :new.CustomerID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM TICKET
      WHERE
        /*  %JoinFKPK(TICKET,:%Old," = "," AND") */
        TICKET.CustomerID = :old.CustomerID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update CUSTOMERS because TICKET exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* MEMBER_GRADE  CUSTOMERS on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MEMBER_GRADE"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMERS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_70", FK_COLUMNS="GradeID" */
  SELECT count(*) INTO NUMROWS
    FROM MEMBER_GRADE
    WHERE
      /* %JoinFKPK(:%New,MEMBER_GRADE," = "," AND") */
      :new.GradeID = MEMBER_GRADE.GradeID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update CUSTOMERS because MEMBER_GRADE does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_EMPLOYEES AFTER DELETE ON EMPLOYEES for each row
-- ERwin Builtin Trigger
-- DELETE trigger on EMPLOYEES 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* EMPLOYEES  ADMIN on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0003e562", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="ADMIN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_73", FK_COLUMNS="EmployeeID" */
    DELETE FROM ADMIN
      WHERE
        /*  %JoinFKPK(ADMIN,:%Old," = "," AND") */
        ADMIN.EmployeeID = :old.EmployeeID;

    /* ERwin Builtin Trigger */
    /* EMPLOYEES  SALARY_HISTORY on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="SALARY_HISTORY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_67", FK_COLUMNS="EmployeeID" */
    SELECT count(*) INTO NUMROWS
      FROM SALARY_HISTORY
      WHERE
        /*  %JoinFKPK(SALARY_HISTORY,:%Old," = "," AND") */
        SALARY_HISTORY.EmployeeID = :old.EmployeeID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete EMPLOYEES because SALARY_HISTORY exists.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* EMPLOYEES  CLEANER on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="CLEANER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="EmployeeID" */
    DELETE FROM CLEANER
      WHERE
        /*  %JoinFKPK(CLEANER,:%Old," = "," AND") */
        CLEANER.EmployeeID = :old.EmployeeID;

    /* ERwin Builtin Trigger */
    /* EMPLOYEES  SCREEN_ROOM_MANAGER on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="SCREEN_ROOM_MANAGER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="EmployeeID" */
    DELETE FROM SCREEN_ROOM_MANAGER
      WHERE
        /*  %JoinFKPK(SCREEN_ROOM_MANAGER,:%Old," = "," AND") */
        SCREEN_ROOM_MANAGER.EmployeeID = :old.EmployeeID;

    /* ERwin Builtin Trigger */
    /* EMPLOYEES  TICKET_SELLER on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="TICKET_SELLER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="EmployeeID" */
    DELETE FROM TICKET_SELLER
      WHERE
        /*  %JoinFKPK(TICKET_SELLER,:%Old," = "," AND") */
        TICKET_SELLER.EmployeeID = :old.EmployeeID;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_EMPLOYEES BEFORE INSERT ON EMPLOYEES for each row
-- ERwin Builtin Trigger
-- INSERT trigger on EMPLOYEES 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* SALARY_INFO  EMPLOYEES on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f0b0", PARENT_OWNER="", PARENT_TABLE="SALARY_INFO"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEES"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_65", FK_COLUMNS="Position" */
    SELECT count(*) INTO NUMROWS
      FROM SALARY_INFO
      WHERE
        /* %JoinFKPK(:%New,SALARY_INFO," = "," AND") */
        :new.Position = SALARY_INFO.Position;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert EMPLOYEES because SALARY_INFO does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_EMPLOYEES AFTER UPDATE ON EMPLOYEES for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on EMPLOYEES 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* EMPLOYEES  ADMIN on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00064a33", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="ADMIN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_73", FK_COLUMNS="EmployeeID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.EmployeeID <> :new.EmployeeID
  THEN
    UPDATE ADMIN
      SET
        /*  %JoinFKPK(ADMIN,:%New," = ",",") */
        ADMIN.EmployeeID = :new.EmployeeID
      WHERE
        /*  %JoinFKPK(ADMIN,:%Old," = "," AND") */
        ADMIN.EmployeeID = :old.EmployeeID;
  END IF;

  /* ERwin Builtin Trigger */
  /* EMPLOYEES  SALARY_HISTORY on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="SALARY_HISTORY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_67", FK_COLUMNS="EmployeeID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.EmployeeID <> :new.EmployeeID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM SALARY_HISTORY
      WHERE
        /*  %JoinFKPK(SALARY_HISTORY,:%Old," = "," AND") */
        SALARY_HISTORY.EmployeeID = :old.EmployeeID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update EMPLOYEES because SALARY_HISTORY exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* EMPLOYEES  CLEANER on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="CLEANER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="EmployeeID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.EmployeeID <> :new.EmployeeID
  THEN
    UPDATE CLEANER
      SET
        /*  %JoinFKPK(CLEANER,:%New," = ",",") */
        CLEANER.EmployeeID = :new.EmployeeID
      WHERE
        /*  %JoinFKPK(CLEANER,:%Old," = "," AND") */
        CLEANER.EmployeeID = :old.EmployeeID;
  END IF;

  /* ERwin Builtin Trigger */
  /* EMPLOYEES  SCREEN_ROOM_MANAGER on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="SCREEN_ROOM_MANAGER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="EmployeeID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.EmployeeID <> :new.EmployeeID
  THEN
    UPDATE SCREEN_ROOM_MANAGER
      SET
        /*  %JoinFKPK(SCREEN_ROOM_MANAGER,:%New," = ",",") */
        SCREEN_ROOM_MANAGER.EmployeeID = :new.EmployeeID
      WHERE
        /*  %JoinFKPK(SCREEN_ROOM_MANAGER,:%Old," = "," AND") */
        SCREEN_ROOM_MANAGER.EmployeeID = :old.EmployeeID;
  END IF;

  /* ERwin Builtin Trigger */
  /* EMPLOYEES  TICKET_SELLER on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="TICKET_SELLER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="EmployeeID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.EmployeeID <> :new.EmployeeID
  THEN
    UPDATE TICKET_SELLER
      SET
        /*  %JoinFKPK(TICKET_SELLER,:%New," = ",",") */
        TICKET_SELLER.EmployeeID = :new.EmployeeID
      WHERE
        /*  %JoinFKPK(TICKET_SELLER,:%Old," = "," AND") */
        TICKET_SELLER.EmployeeID = :old.EmployeeID;
  END IF;

  /* ERwin Builtin Trigger */
  /* SALARY_INFO  EMPLOYEES on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SALARY_INFO"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEES"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_65", FK_COLUMNS="Position" */
  SELECT count(*) INTO NUMROWS
    FROM SALARY_INFO
    WHERE
      /* %JoinFKPK(:%New,SALARY_INFO," = "," AND") */
      :new.Position = SALARY_INFO.Position;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update EMPLOYEES because SALARY_INFO does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_CLEANER BEFORE INSERT ON CLEANER for each row
-- ERwin Builtin Trigger
-- INSERT trigger on CLEANER 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* EMPLOYEES  CLEANER on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000ed9c", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="CLEANER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="EmployeeID" */
    SELECT count(*) INTO NUMROWS
      FROM EMPLOYEES
      WHERE
        /* %JoinFKPK(:%New,EMPLOYEES," = "," AND") */
        :new.EmployeeID = EMPLOYEES.EmployeeID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert CLEANER because EMPLOYEES does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_CLEANER AFTER UPDATE ON CLEANER for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on CLEANER 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* EMPLOYEES  CLEANER on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000f3ee", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="CLEANER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="EmployeeID" */
  SELECT count(*) INTO NUMROWS
    FROM EMPLOYEES
    WHERE
      /* %JoinFKPK(:%New,EMPLOYEES," = "," AND") */
      :new.EmployeeID = EMPLOYEES.EmployeeID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update CLEANER because EMPLOYEES does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_GENRE AFTER DELETE ON GENRE for each row
-- ERwin Builtin Trigger
-- DELETE trigger on GENRE 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* GENRE  MOVIES_GENRE on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000d90f", PARENT_OWNER="", PARENT_TABLE="GENRE"
    CHILD_OWNER="", CHILD_TABLE="MOVIES_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="GenreID" */
    SELECT count(*) INTO NUMROWS
      FROM MOVIES_GENRE
      WHERE
        /*  %JoinFKPK(MOVIES_GENRE,:%Old," = "," AND") */
        MOVIES_GENRE.GenreID = :old.GenreID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete GENRE because MOVIES_GENRE exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_GENRE AFTER UPDATE ON GENRE for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on GENRE 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* GENRE  MOVIES_GENRE on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000102e4", PARENT_OWNER="", PARENT_TABLE="GENRE"
    CHILD_OWNER="", CHILD_TABLE="MOVIES_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="GenreID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.GenreID <> :new.GenreID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM MOVIES_GENRE
      WHERE
        /*  %JoinFKPK(MOVIES_GENRE,:%Old," = "," AND") */
        MOVIES_GENRE.GenreID = :old.GenreID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update GENRE because MOVIES_GENRE exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_MOVIES AFTER DELETE ON MOVIES for each row
-- ERwin Builtin Trigger
-- DELETE trigger on MOVIES 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* MOVIES  SHOWING_INFO on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001d11a", PARENT_OWNER="", PARENT_TABLE="MOVIES"
    CHILD_OWNER="", CHILD_TABLE="SHOWING_INFO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="MovieID" */
    SELECT count(*) INTO NUMROWS
      FROM SHOWING_INFO
      WHERE
        /*  %JoinFKPK(SHOWING_INFO,:%Old," = "," AND") */
        SHOWING_INFO.MovieID = :old.MovieID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete MOVIES because SHOWING_INFO exists.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* MOVIES  MOVIES_GENRE on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIES"
    CHILD_OWNER="", CHILD_TABLE="MOVIES_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="MovieID" */
    SELECT count(*) INTO NUMROWS
      FROM MOVIES_GENRE
      WHERE
        /*  %JoinFKPK(MOVIES_GENRE,:%Old," = "," AND") */
        MOVIES_GENRE.MovieID = :old.MovieID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete MOVIES because MOVIES_GENRE exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_MOVIES AFTER UPDATE ON MOVIES for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on MOVIES 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* MOVIES  SHOWING_INFO on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00020c85", PARENT_OWNER="", PARENT_TABLE="MOVIES"
    CHILD_OWNER="", CHILD_TABLE="SHOWING_INFO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="MovieID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.MovieID <> :new.MovieID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM SHOWING_INFO
      WHERE
        /*  %JoinFKPK(SHOWING_INFO,:%Old," = "," AND") */
        SHOWING_INFO.MovieID = :old.MovieID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update MOVIES because SHOWING_INFO exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* MOVIES  MOVIES_GENRE on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIES"
    CHILD_OWNER="", CHILD_TABLE="MOVIES_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="MovieID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.MovieID <> :new.MovieID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM MOVIES_GENRE
      WHERE
        /*  %JoinFKPK(MOVIES_GENRE,:%Old," = "," AND") */
        MOVIES_GENRE.MovieID = :old.MovieID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update MOVIES because MOVIES_GENRE exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_MOVIES_GENRE BEFORE INSERT ON MOVIES_GENRE for each row
-- ERwin Builtin Trigger
-- INSERT trigger on MOVIES_GENRE 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* GENRE  MOVIES_GENRE on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001f015", PARENT_OWNER="", PARENT_TABLE="GENRE"
    CHILD_OWNER="", CHILD_TABLE="MOVIES_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="GenreID" */
    SELECT count(*) INTO NUMROWS
      FROM GENRE
      WHERE
        /* %JoinFKPK(:%New,GENRE," = "," AND") */
        :new.GenreID = GENRE.GenreID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert MOVIES_GENRE because GENRE does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* MOVIES  MOVIES_GENRE on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIES"
    CHILD_OWNER="", CHILD_TABLE="MOVIES_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="MovieID" */
    SELECT count(*) INTO NUMROWS
      FROM MOVIES
      WHERE
        /* %JoinFKPK(:%New,MOVIES," = "," AND") */
        :new.MovieID = MOVIES.MovieID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert MOVIES_GENRE because MOVIES does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_MOVIES_GENRE AFTER UPDATE ON MOVIES_GENRE for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on MOVIES_GENRE 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* GENRE  MOVIES_GENRE on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001e094", PARENT_OWNER="", PARENT_TABLE="GENRE"
    CHILD_OWNER="", CHILD_TABLE="MOVIES_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="GenreID" */
  SELECT count(*) INTO NUMROWS
    FROM GENRE
    WHERE
      /* %JoinFKPK(:%New,GENRE," = "," AND") */
      :new.GenreID = GENRE.GenreID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update MOVIES_GENRE because GENRE does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* MOVIES  MOVIES_GENRE on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIES"
    CHILD_OWNER="", CHILD_TABLE="MOVIES_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="MovieID" */
  SELECT count(*) INTO NUMROWS
    FROM MOVIES
    WHERE
      /* %JoinFKPK(:%New,MOVIES," = "," AND") */
      :new.MovieID = MOVIES.MovieID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update MOVIES_GENRE because MOVIES does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_SALARY_HISTORY BEFORE INSERT ON SALARY_HISTORY for each row
-- ERwin Builtin Trigger
-- INSERT trigger on SALARY_HISTORY 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* EMPLOYEES  SALARY_HISTORY on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000fd27", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="SALARY_HISTORY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_67", FK_COLUMNS="EmployeeID" */
    SELECT count(*) INTO NUMROWS
      FROM EMPLOYEES
      WHERE
        /* %JoinFKPK(:%New,EMPLOYEES," = "," AND") */
        :new.EmployeeID = EMPLOYEES.EmployeeID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert SALARY_HISTORY because EMPLOYEES does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_SALARY_HISTORY AFTER UPDATE ON SALARY_HISTORY for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on SALARY_HISTORY 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* EMPLOYEES  SALARY_HISTORY on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001027c", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="SALARY_HISTORY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_67", FK_COLUMNS="EmployeeID" */
  SELECT count(*) INTO NUMROWS
    FROM EMPLOYEES
    WHERE
      /* %JoinFKPK(:%New,EMPLOYEES," = "," AND") */
      :new.EmployeeID = EMPLOYEES.EmployeeID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update SALARY_HISTORY because EMPLOYEES does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_ADMIN BEFORE INSERT ON ADMIN for each row
-- ERwin Builtin Trigger
-- INSERT trigger on ADMIN 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* EMPLOYEES  ADMIN on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000ec3e", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="ADMIN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_73", FK_COLUMNS="EmployeeID" */
    SELECT count(*) INTO NUMROWS
      FROM EMPLOYEES
      WHERE
        /* %JoinFKPK(:%New,EMPLOYEES," = "," AND") */
        :new.EmployeeID = EMPLOYEES.EmployeeID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert ADMIN because EMPLOYEES does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_ADMIN AFTER UPDATE ON ADMIN for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on ADMIN 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* EMPLOYEES  ADMIN on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000ee8a", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="ADMIN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_73", FK_COLUMNS="EmployeeID" */
  SELECT count(*) INTO NUMROWS
    FROM EMPLOYEES
    WHERE
      /* %JoinFKPK(:%New,EMPLOYEES," = "," AND") */
      :new.EmployeeID = EMPLOYEES.EmployeeID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update ADMIN because EMPLOYEES does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_MEMBERS BEFORE INSERT ON MEMBERS for each row
-- ERwin Builtin Trigger
-- INSERT trigger on MEMBERS 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* CUSTOMERS  MEMBERS on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000ec41", PARENT_OWNER="", PARENT_TABLE="CUSTOMERS"
    CHILD_OWNER="", CHILD_TABLE="MEMBERS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_71", FK_COLUMNS="CustomerID" */
    SELECT count(*) INTO NUMROWS
      FROM CUSTOMERS
      WHERE
        /* %JoinFKPK(:%New,CUSTOMERS," = "," AND") */
        :new.CustomerID = CUSTOMERS.CustomerID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert MEMBERS because CUSTOMERS does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_MEMBERS AFTER UPDATE ON MEMBERS for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on MEMBERS 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* CUSTOMERS  MEMBERS on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000f525", PARENT_OWNER="", PARENT_TABLE="CUSTOMERS"
    CHILD_OWNER="", CHILD_TABLE="MEMBERS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_71", FK_COLUMNS="CustomerID" */
  SELECT count(*) INTO NUMROWS
    FROM CUSTOMERS
    WHERE
      /* %JoinFKPK(:%New,CUSTOMERS," = "," AND") */
      :new.CustomerID = CUSTOMERS.CustomerID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update MEMBERS because CUSTOMERS does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_MEMBER_GRADE AFTER DELETE ON MEMBER_GRADE for each row
-- ERwin Builtin Trigger
-- DELETE trigger on MEMBER_GRADE 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* MEMBER_GRADE  CUSTOMERS on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000dfff", PARENT_OWNER="", PARENT_TABLE="MEMBER_GRADE"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMERS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_70", FK_COLUMNS="GradeID" */
    SELECT count(*) INTO NUMROWS
      FROM CUSTOMERS
      WHERE
        /*  %JoinFKPK(CUSTOMERS,:%Old," = "," AND") */
        CUSTOMERS.GradeID = :old.GradeID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete MEMBER_GRADE because CUSTOMERS exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_MEMBER_GRADE AFTER UPDATE ON MEMBER_GRADE for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on MEMBER_GRADE 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* MEMBER_GRADE  CUSTOMERS on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00010560", PARENT_OWNER="", PARENT_TABLE="MEMBER_GRADE"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMERS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_70", FK_COLUMNS="GradeID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.GradeID <> :new.GradeID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM CUSTOMERS
      WHERE
        /*  %JoinFKPK(CUSTOMERS,:%Old," = "," AND") */
        CUSTOMERS.GradeID = :old.GradeID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update MEMBER_GRADE because CUSTOMERS exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_SALARY_INFO AFTER DELETE ON SALARY_INFO for each row
-- ERwin Builtin Trigger
-- DELETE trigger on SALARY_INFO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* SALARY_INFO  EMPLOYEES on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000d530", PARENT_OWNER="", PARENT_TABLE="SALARY_INFO"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEES"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_65", FK_COLUMNS="Position" */
    SELECT count(*) INTO NUMROWS
      FROM EMPLOYEES
      WHERE
        /*  %JoinFKPK(EMPLOYEES,:%Old," = "," AND") */
        EMPLOYEES.Position = :old.Position;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete SALARY_INFO because EMPLOYEES exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_SALARY_INFO AFTER UPDATE ON SALARY_INFO for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on SALARY_INFO 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* SALARY_INFO  EMPLOYEES on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000fb08", PARENT_OWNER="", PARENT_TABLE="SALARY_INFO"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEES"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_65", FK_COLUMNS="Position" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.Position <> :new.Position
  THEN
    SELECT count(*) INTO NUMROWS
      FROM EMPLOYEES
      WHERE
        /*  %JoinFKPK(EMPLOYEES,:%Old," = "," AND") */
        EMPLOYEES.Position = :old.Position;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update SALARY_INFO because EMPLOYEES exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_SCREEN_ROOM AFTER DELETE ON SCREEN_ROOM for each row
-- ERwin Builtin Trigger
-- DELETE trigger on SCREEN_ROOM 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* SCREEN_ROOM  SCREEN_ROOM_MANAGER on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0002bed3", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SCREEN_ROOM_MANAGER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="RoomNumber" */
    UPDATE SCREEN_ROOM_MANAGER
      SET
        /* %SetFK(SCREEN_ROOM_MANAGER,NULL) */
        SCREEN_ROOM_MANAGER.RoomNumber = NULL
      WHERE
        /* %JoinFKPK(SCREEN_ROOM_MANAGER,:%Old," = "," AND") */
        SCREEN_ROOM_MANAGER.RoomNumber = :old.RoomNumber;

    /* ERwin Builtin Trigger */
    /* SCREEN_ROOM  SHOWING_INFO on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SHOWING_INFO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="RoomNumber" */
    SELECT count(*) INTO NUMROWS
      FROM SHOWING_INFO
      WHERE
        /*  %JoinFKPK(SHOWING_INFO,:%Old," = "," AND") */
        SHOWING_INFO.RoomNumber = :old.RoomNumber;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete SCREEN_ROOM because SHOWING_INFO exists.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* SCREEN_ROOM  SEATS on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SEATS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="RoomNumber" */
    SELECT count(*) INTO NUMROWS
      FROM SEATS
      WHERE
        /*  %JoinFKPK(SEATS,:%Old," = "," AND") */
        SEATS.RoomNumber = :old.RoomNumber;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete SCREEN_ROOM because SEATS exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_SCREEN_ROOM AFTER UPDATE ON SCREEN_ROOM for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on SCREEN_ROOM 
DECLARE NUMROWS INTEGER;
BEGIN
  /* SCREEN_ROOM  SCREEN_ROOM_MANAGER on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00033a38", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SCREEN_ROOM_MANAGER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="RoomNumber" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.RoomNumber <> :new.RoomNumber
  THEN
    UPDATE SCREEN_ROOM_MANAGER
      SET
        /* %SetFK(SCREEN_ROOM_MANAGER,NULL) */
        SCREEN_ROOM_MANAGER.RoomNumber = NULL
      WHERE
        /* %JoinFKPK(SCREEN_ROOM_MANAGER,:%Old," = ",",") */
        SCREEN_ROOM_MANAGER.RoomNumber = :old.RoomNumber;
  END IF;

  /* ERwin Builtin Trigger */
  /* SCREEN_ROOM  SHOWING_INFO on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SHOWING_INFO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="RoomNumber" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.RoomNumber <> :new.RoomNumber
  THEN
    SELECT count(*) INTO NUMROWS
      FROM SHOWING_INFO
      WHERE
        /*  %JoinFKPK(SHOWING_INFO,:%Old," = "," AND") */
        SHOWING_INFO.RoomNumber = :old.RoomNumber;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update SCREEN_ROOM because SHOWING_INFO exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* SCREEN_ROOM  SEATS on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SEATS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="RoomNumber" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.RoomNumber <> :new.RoomNumber
  THEN
    SELECT count(*) INTO NUMROWS
      FROM SEATS
      WHERE
        /*  %JoinFKPK(SEATS,:%Old," = "," AND") */
        SEATS.RoomNumber = :old.RoomNumber;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update SCREEN_ROOM because SEATS exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_SCREEN_ROOM_MANAGER BEFORE INSERT ON SCREEN_ROOM_MANAGER for each row
-- ERwin Builtin Trigger
-- INSERT trigger on SCREEN_ROOM_MANAGER 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* SCREEN_ROOM  SCREEN_ROOM_MANAGER on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00022de0", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SCREEN_ROOM_MANAGER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="RoomNumber" */
    UPDATE SCREEN_ROOM_MANAGER
      SET
        /* %SetFK(SCREEN_ROOM_MANAGER,NULL) */
        SCREEN_ROOM_MANAGER.RoomNumber = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM SCREEN_ROOM
            WHERE
              /* %JoinFKPK(:%New,SCREEN_ROOM," = "," AND") */
              :new.RoomNumber = SCREEN_ROOM.RoomNumber
        ) 
        /* %JoinPKPK(SCREEN_ROOM_MANAGER,:%New," = "," AND") */
         and SCREEN_ROOM_MANAGER.EmployeeID = :new.EmployeeID;

    /* ERwin Builtin Trigger */
    /* EMPLOYEES  SCREEN_ROOM_MANAGER on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="SCREEN_ROOM_MANAGER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="EmployeeID" */
    SELECT count(*) INTO NUMROWS
      FROM EMPLOYEES
      WHERE
        /* %JoinFKPK(:%New,EMPLOYEES," = "," AND") */
        :new.EmployeeID = EMPLOYEES.EmployeeID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert SCREEN_ROOM_MANAGER because EMPLOYEES does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_SCREEN_ROOM_MANAGER AFTER UPDATE ON SCREEN_ROOM_MANAGER for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on SCREEN_ROOM_MANAGER 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* SCREEN_ROOM  SCREEN_ROOM_MANAGER on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00021150", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SCREEN_ROOM_MANAGER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="RoomNumber" */
  SELECT count(*) INTO NUMROWS
    FROM SCREEN_ROOM
    WHERE
      /* %JoinFKPK(:%New,SCREEN_ROOM," = "," AND") */
      :new.RoomNumber = SCREEN_ROOM.RoomNumber;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.RoomNumber IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update SCREEN_ROOM_MANAGER because SCREEN_ROOM does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* EMPLOYEES  SCREEN_ROOM_MANAGER on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="SCREEN_ROOM_MANAGER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="EmployeeID" */
  SELECT count(*) INTO NUMROWS
    FROM EMPLOYEES
    WHERE
      /* %JoinFKPK(:%New,EMPLOYEES," = "," AND") */
      :new.EmployeeID = EMPLOYEES.EmployeeID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update SCREEN_ROOM_MANAGER because EMPLOYEES does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_SEATS AFTER DELETE ON SEATS for each row
-- ERwin Builtin Trigger
-- DELETE trigger on SEATS 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* SEATS  TICKET on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f83a", PARENT_OWNER="", PARENT_TABLE="SEATS"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="RoomNumber""SeatColumn""SeatRow" */
    SELECT count(*) INTO NUMROWS
      FROM TICKET
      WHERE
        /*  %JoinFKPK(TICKET,:%Old," = "," AND") */
        TICKET.SeatRow = :old.SeatRow AND
        TICKET.SeatColumn = :old.SeatColumn AND
        TICKET.RoomNumber = :old.RoomNumber;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete SEATS because TICKET exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_SEATS BEFORE INSERT ON SEATS for each row
-- ERwin Builtin Trigger
-- INSERT trigger on SEATS 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* SCREEN_ROOM  SEATS on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000faca", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SEATS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="RoomNumber" */
    SELECT count(*) INTO NUMROWS
      FROM SCREEN_ROOM
      WHERE
        /* %JoinFKPK(:%New,SCREEN_ROOM," = "," AND") */
        :new.RoomNumber = SCREEN_ROOM.RoomNumber;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert SEATS because SCREEN_ROOM does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_SEATS AFTER UPDATE ON SEATS for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on SEATS 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* SEATS  TICKET on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00023622", PARENT_OWNER="", PARENT_TABLE="SEATS"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="RoomNumber""SeatColumn""SeatRow" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.SeatRow <> :new.SeatRow OR 
    :old.SeatColumn <> :new.SeatColumn OR 
    :old.RoomNumber <> :new.RoomNumber
  THEN
    SELECT count(*) INTO NUMROWS
      FROM TICKET
      WHERE
        /*  %JoinFKPK(TICKET,:%Old," = "," AND") */
        TICKET.SeatRow = :old.SeatRow AND
        TICKET.SeatColumn = :old.SeatColumn AND
        TICKET.RoomNumber = :old.RoomNumber;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update SEATS because TICKET exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* SCREEN_ROOM  SEATS on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SEATS"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="RoomNumber" */
  SELECT count(*) INTO NUMROWS
    FROM SCREEN_ROOM
    WHERE
      /* %JoinFKPK(:%New,SCREEN_ROOM," = "," AND") */
      :new.RoomNumber = SCREEN_ROOM.RoomNumber;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update SEATS because SCREEN_ROOM does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_SHOWING_INFO AFTER DELETE ON SHOWING_INFO for each row
-- ERwin Builtin Trigger
-- DELETE trigger on SHOWING_INFO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* SHOWING_INFO  TICKET on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000d11c", PARENT_OWNER="", PARENT_TABLE="SHOWING_INFO"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_72", FK_COLUMNS="ShowingID" */
    SELECT count(*) INTO NUMROWS
      FROM TICKET
      WHERE
        /*  %JoinFKPK(TICKET,:%Old," = "," AND") */
        TICKET.ShowingID = :old.ShowingID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete SHOWING_INFO because TICKET exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_SHOWING_INFO BEFORE INSERT ON SHOWING_INFO for each row
-- ERwin Builtin Trigger
-- INSERT trigger on SHOWING_INFO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* MOVIES  SHOWING_INFO on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001f0b2", PARENT_OWNER="", PARENT_TABLE="MOVIES"
    CHILD_OWNER="", CHILD_TABLE="SHOWING_INFO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="MovieID" */
    SELECT count(*) INTO NUMROWS
      FROM MOVIES
      WHERE
        /* %JoinFKPK(:%New,MOVIES," = "," AND") */
        :new.MovieID = MOVIES.MovieID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert SHOWING_INFO because MOVIES does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* SCREEN_ROOM  SHOWING_INFO on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SHOWING_INFO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="RoomNumber" */
    SELECT count(*) INTO NUMROWS
      FROM SCREEN_ROOM
      WHERE
        /* %JoinFKPK(:%New,SCREEN_ROOM," = "," AND") */
        :new.RoomNumber = SCREEN_ROOM.RoomNumber;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert SHOWING_INFO because SCREEN_ROOM does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_SHOWING_INFO AFTER UPDATE ON SHOWING_INFO for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on SHOWING_INFO 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* SHOWING_INFO  TICKET on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000314d2", PARENT_OWNER="", PARENT_TABLE="SHOWING_INFO"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_72", FK_COLUMNS="ShowingID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.ShowingID <> :new.ShowingID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM TICKET
      WHERE
        /*  %JoinFKPK(TICKET,:%Old," = "," AND") */
        TICKET.ShowingID = :old.ShowingID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update SHOWING_INFO because TICKET exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* MOVIES  SHOWING_INFO on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIES"
    CHILD_OWNER="", CHILD_TABLE="SHOWING_INFO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="MovieID" */
  SELECT count(*) INTO NUMROWS
    FROM MOVIES
    WHERE
      /* %JoinFKPK(:%New,MOVIES," = "," AND") */
      :new.MovieID = MOVIES.MovieID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update SHOWING_INFO because MOVIES does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* SCREEN_ROOM  SHOWING_INFO on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SCREEN_ROOM"
    CHILD_OWNER="", CHILD_TABLE="SHOWING_INFO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="RoomNumber" */
  SELECT count(*) INTO NUMROWS
    FROM SCREEN_ROOM
    WHERE
      /* %JoinFKPK(:%New,SCREEN_ROOM," = "," AND") */
      :new.RoomNumber = SCREEN_ROOM.RoomNumber;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update SHOWING_INFO because SCREEN_ROOM does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_TICKET BEFORE INSERT ON TICKET for each row
-- ERwin Builtin Trigger
-- INSERT trigger on TICKET 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* SHOWING_INFO  TICKET on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00030a0f", PARENT_OWNER="", PARENT_TABLE="SHOWING_INFO"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_72", FK_COLUMNS="ShowingID" */
    SELECT count(*) INTO NUMROWS
      FROM SHOWING_INFO
      WHERE
        /* %JoinFKPK(:%New,SHOWING_INFO," = "," AND") */
        :new.ShowingID = SHOWING_INFO.ShowingID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert TICKET because SHOWING_INFO does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* CUSTOMERS  TICKET on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMERS"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustomerID" */
    SELECT count(*) INTO NUMROWS
      FROM CUSTOMERS
      WHERE
        /* %JoinFKPK(:%New,CUSTOMERS," = "," AND") */
        :new.CustomerID = CUSTOMERS.CustomerID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert TICKET because CUSTOMERS does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* SEATS  TICKET on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SEATS"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="RoomNumber""SeatColumn""SeatRow" */
    SELECT count(*) INTO NUMROWS
      FROM SEATS
      WHERE
        /* %JoinFKPK(:%New,SEATS," = "," AND") */
        :new.SeatRow = SEATS.SeatRow AND
        :new.SeatColumn = SEATS.SeatColumn AND
        :new.RoomNumber = SEATS.RoomNumber;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert TICKET because SEATS does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_TICKET AFTER UPDATE ON TICKET for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on TICKET 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* SHOWING_INFO  TICKET on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00030aeb", PARENT_OWNER="", PARENT_TABLE="SHOWING_INFO"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_72", FK_COLUMNS="ShowingID" */
  SELECT count(*) INTO NUMROWS
    FROM SHOWING_INFO
    WHERE
      /* %JoinFKPK(:%New,SHOWING_INFO," = "," AND") */
      :new.ShowingID = SHOWING_INFO.ShowingID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update TICKET because SHOWING_INFO does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* CUSTOMERS  TICKET on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMERS"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustomerID" */
  SELECT count(*) INTO NUMROWS
    FROM CUSTOMERS
    WHERE
      /* %JoinFKPK(:%New,CUSTOMERS," = "," AND") */
      :new.CustomerID = CUSTOMERS.CustomerID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update TICKET because CUSTOMERS does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* SEATS  TICKET on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SEATS"
    CHILD_OWNER="", CHILD_TABLE="TICKET"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="RoomNumber""SeatColumn""SeatRow" */
  SELECT count(*) INTO NUMROWS
    FROM SEATS
    WHERE
      /* %JoinFKPK(:%New,SEATS," = "," AND") */
      :new.SeatRow = SEATS.SeatRow AND
      :new.SeatColumn = SEATS.SeatColumn AND
      :new.RoomNumber = SEATS.RoomNumber;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update TICKET because SEATS does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_TICKETBOX AFTER DELETE ON TICKETBOX for each row
-- ERwin Builtin Trigger
-- DELETE trigger on TICKETBOX 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* TICKETBOX  TICKET_SELLER on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e619", PARENT_OWNER="", PARENT_TABLE="TICKETBOX"
    CHILD_OWNER="", CHILD_TABLE="TICKET_SELLER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="TicketboxID" */
    SELECT count(*) INTO NUMROWS
      FROM TICKET_SELLER
      WHERE
        /*  %JoinFKPK(TICKET_SELLER,:%Old," = "," AND") */
        TICKET_SELLER.TicketboxID = :old.TicketboxID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete TICKETBOX because TICKET_SELLER exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_TICKETBOX AFTER UPDATE ON TICKETBOX for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on TICKETBOX 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* TICKETBOX  TICKET_SELLER on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00010b02", PARENT_OWNER="", PARENT_TABLE="TICKETBOX"
    CHILD_OWNER="", CHILD_TABLE="TICKET_SELLER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="TicketboxID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.TicketboxID <> :new.TicketboxID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM TICKET_SELLER
      WHERE
        /*  %JoinFKPK(TICKET_SELLER,:%Old," = "," AND") */
        TICKET_SELLER.TicketboxID = :old.TicketboxID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update TICKETBOX because TICKET_SELLER exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_TICKET_SELLER BEFORE INSERT ON TICKET_SELLER for each row
-- ERwin Builtin Trigger
-- INSERT trigger on TICKET_SELLER 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* TICKETBOX  TICKET_SELLER on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00020076", PARENT_OWNER="", PARENT_TABLE="TICKETBOX"
    CHILD_OWNER="", CHILD_TABLE="TICKET_SELLER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="TicketboxID" */
    SELECT count(*) INTO NUMROWS
      FROM TICKETBOX
      WHERE
        /* %JoinFKPK(:%New,TICKETBOX," = "," AND") */
        :new.TicketboxID = TICKETBOX.TicketboxID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert TICKET_SELLER because TICKETBOX does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* EMPLOYEES  TICKET_SELLER on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="TICKET_SELLER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="EmployeeID" */
    SELECT count(*) INTO NUMROWS
      FROM EMPLOYEES
      WHERE
        /* %JoinFKPK(:%New,EMPLOYEES," = "," AND") */
        :new.EmployeeID = EMPLOYEES.EmployeeID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert TICKET_SELLER because EMPLOYEES does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_TICKET_SELLER AFTER UPDATE ON TICKET_SELLER for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on TICKET_SELLER 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* TICKETBOX  TICKET_SELLER on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00020a0c", PARENT_OWNER="", PARENT_TABLE="TICKETBOX"
    CHILD_OWNER="", CHILD_TABLE="TICKET_SELLER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="TicketboxID" */
  SELECT count(*) INTO NUMROWS
    FROM TICKETBOX
    WHERE
      /* %JoinFKPK(:%New,TICKETBOX," = "," AND") */
      :new.TicketboxID = TICKETBOX.TicketboxID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update TICKET_SELLER because TICKETBOX does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* EMPLOYEES  TICKET_SELLER on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEES"
    CHILD_OWNER="", CHILD_TABLE="TICKET_SELLER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_25", FK_COLUMNS="EmployeeID" */
  SELECT count(*) INTO NUMROWS
    FROM EMPLOYEES
    WHERE
      /* %JoinFKPK(:%New,EMPLOYEES," = "," AND") */
      :new.EmployeeID = EMPLOYEES.EmployeeID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update TICKET_SELLER because EMPLOYEES does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/

