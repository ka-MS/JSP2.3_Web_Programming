CREATE TABLE MEMBER(
    MEMBERID VARCHAR2(10) NOT NULL PRIMARY KEY,
    PASSWORD VARCHAR2(10) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    EMAIL VARCHAR2(80)
);

DROP TABLE TABLENAME;
INSERT INTO MEMBER (MEMBERID, PASSWORD, NAME) VALUES('USER01' , '1234','�μ�');

INSERT INTO MEMBER values ('user02','1234','����','uesr01@mail.com');

update MEMBER set NAME = 'a' where MEMBERID = 'USER01';
commit;
select * from MEMBER order by memberid;

create table MEMBER_HISTORY (
    MEMBERID VARCHAR2(10) NOT NULL PRIMARY KEY,
    HISTORY LONG
    );

INSERT INTO MEMBER_HISTORY VALUES('user01',
    '2023 ������4 ���α׷��� �Թ�<br>' ||
    '2013 Spring4.0 ���α׷���<br>' ||
    '2016 �ڹ��ǽ�<br>' ||
    '2022 JSP2.3�����α׷���\n'
    );

select * from MEMBER_HISTORY;
rollback;

create table ITEM(
    ITEM_ID int not null primary key,
    NAME varchar2(100)
);


create table ITEM_DETAIL(
    ITEM_ID int not null primary key,
    DETAIL varchar2(200)
);

