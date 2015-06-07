drop sequence seq_Ticket;
drop sequence seq_Employees;
drop sequence seq_Customers;
drop sequence seq_SHOWING_INFO;
drop sequence seq_MOVIES;

create sequence seq_Ticket START WITH 51001 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;
create sequence seq_Employees START WITH 21 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;
create sequence seq_Customers START WITH 11001 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;
create sequence seq_SHOWING_INFO START WITH 21001 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;
create sequence seq_MOVIES START WITH 31001 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;

--SEQ_Ticket.NEXTVAL