--�Ѿ�CU DB
create table goods_tbl_500(
goods_cd varchar2(6) not null primary key, 
goods_nm varchar2(30), 
goods_price number(8), 
cost number(8), in_date date
); 


insert into goods_tbl_500 values('110001','�������߸�',1050,750,'20190302');
insert into goods_tbl_500 values('110002','���ϻ�',1300,800,'20190302'); 
insert into goods_tbl_500 values('110003','����',2000,1700,'20190302');
insert into goods_tbl_500 values('110004','ĥ�����̴�',900,750,'20190302'); 
insert into goods_tbl_500 values('110005','�ݶ�',750,300,'20190302'); 
insert into goods_tbl_500 values('110006','�Ƹ�����ݸ�',1500,1300,'20190302'); 
insert into goods_tbl_500 values('110007','���ڸ�',850,600,'20190302');


 create table store_tbl_500(
 store_cd varchar2(5) not null primary key,
 store_nm varchar2(20), 
 store_fg varchar2(1)
);

 insert into store_tbl_500 values('A001','�����','0');
 insert into store_tbl_500 values('A002','������','0'); 
insert into store_tbl_500 values('A003','������','0'); 
insert into store_tbl_500 values('B001','�ϰ���','1');
 insert into store_tbl_500 values('C001','�����','1'); 
insert into store_tbl_500 values('D001','�߰���','0');
 insert into store_tbl_500 values('D002','�¸��Ա���','1'); 
insert into store_tbl_500 values('E001','ȭ������','0');


 create table sale_tbl_500(
 sale_no varchar2(4) not null primary key, 
 sale_ymd date not null,
 sale_fg varchar2(1) not null, 
 store_cd varchar2(5)  ,         
 goods_cd varchar2(6) ,
 sale_cnt number(3),
 pay_type varchar2(2),
 constraint  fk1 foreign key (store_cd)  references store_tbl_500(store_cd),
 constraint  fk2  foreign key (goods_cd) references goods_tbl_500(goods_cd)
); 

insert into sale_tbl_500 values('0001','20190325','1','A001','110001',2,'02'); 
insert into sale_tbl_500 values('0002','20190325','1','B001','110003',2,'02');
 insert into sale_tbl_500 values('0003','20190325','1','D001','110003',1,'01'); 
insert into sale_tbl_500 values('0004','20190325','1','A001','110006',5,'02'); 
insert into sale_tbl_500 values('0005','20190325','1','C001','110003',2,'02'); 
insert into sale_tbl_500 values('0006','20190325','2','C001','110003',2,'02');
 insert into sale_tbl_500 values('0007','20190325','1','A002','110005',4,'02');
 insert into sale_tbl_500 values('0008','20190325','1','A003','110004',4,'02');
 insert into sale_tbl_500 values('0009','20190325','1','B001','110001',2,'01');
 insert into sale_tbl_500 values('0010','20190325','1','A002','110006',1,'02');
--

--HY���� DB
create table tbl_course_300 (
        s_id varchar2(5) not null primary key,
        s_name varchar2(20)  ,
        s_grade number(6),
        teacher_id varchar2(10) ,
        weekday char(2) ,
        start_h number(4),
        end_h  number(4)
);

insert into tbl_course_300 values('1001',  '�ѽĸ����' , 2, 1, 'M' , 0900, 1100 );
insert into tbl_course_300 values('1002',  '��ĸ����' , 2, 2, 'TU' , 0900, 1200 );
insert into tbl_course_300 values('1003',  '��������' , 3, 4, 'W' , 0900, 1200 );
insert into tbl_course_300 values('1004',  '�߽ĸ����' , 3, 4, 'TH' , 0900, 1200 );
insert into tbl_course_300 values('1005',  '���Ḹ���' , 2, 5, 'M' , 1300, 1600 );
insert into tbl_course_300 values('1006',  '�нĸ����' , 3, 5, 'TH' , 1500, 1800 );
insert into tbl_course_300 values('1007',  '�����ָ����' , 3, 5, 'W' , 1330, 1630 );
insert into tbl_course_300 values('1008',  '���������' , 2, 3, 'TH' , 1330, 1530 );
insert into tbl_course_300 values('1009',  '��ġ�����' , 3, 3, 'F' , 0900, 1200 );
insert into tbl_course_300 values('1010',  '�������' , 3, 2, 'F' , 1300, 1600 );



create table tbl_lecturer_300(
    t_id number(6) not null primary key,
    t_name varchar2(20)  ,
    major varchar2(20),
    field varchar2(20)
);

 

insert into tbl_lecturer_300 values( 1, '��������','�ѽ�,�߽�' ,'�߽�');
insert into tbl_lecturer_300 values( 2, '�߱���','�ѽ�,�߽�' ,'�߽�');
insert into tbl_lecturer_300 values( 3, '���α���','�ѽ�,���' ,'���');
insert into tbl_lecturer_300 values( 4, '����ȩ����','�ѽ�,���' ,'�ѽ�');
insert into tbl_lecturer_300 values( 5, '��������','��������' ,'����');
insert into tbl_lecturer_300 values( 6, '������','�нĹ�����' ,'�н�');
insert into tbl_lecturer_300 values( 7, 'RM����','�нĹ�����' ,'�н�');
--

--����� DB
create table tbl_join_200(
  join_id varchar2(4)  not null primary key ,
  join_nm varchar2(20)  ,
  birth  char(8),
  gender char(1),
  specialty varchar2(1),
  charm varchar2(30)
);

insert into tbl_join_200 values( 'A001' , '������',  '20050102' , 'M', 'D', '�����');
insert into tbl_join_200 values( 'A002' , '��Ű',  '20090102' , 'M', 'D', '��������');
insert into tbl_join_200 values( 'A003' , '������',  '20070102' , 'M', 'D', 'â�۴�');
insert into tbl_join_200 values( 'A004' , '������',  '20030103' , 'M', 'R', '����');
insert into tbl_join_200 values( 'A005' , '����',  '20020205' , 'M', 'V', '���۰�');



�������̺� 

create table tbl_mentor_200(
    mentor_id varchar2(4) not null primary key ,
    mentor_nm varchar2(20)
);

insert into tbl_mentor_200 values( 'J001', '������');
insert into tbl_mentor_200 values( 'J002', '�����');
insert into tbl_mentor_200 values( 'J003', '����');



create table tbl_score_200(
  score_no  number(6) not null ,
  artistid varchar2(4) not null,
  mentorid varchar2(4) not null,
  score number(3),
  primary key( score_no, artistid, mentorid)
);

insert into tbl_score_200 values( 110001, 'A001', 'J001' , 80);
insert into tbl_score_200 values( 110002, 'A001', 'J002' , 90);
insert into tbl_score_200 values( 110003, 'A001', 'J003' , 70);
insert into tbl_score_200 values( 110004, 'A002', 'J001' , 60);
insert into tbl_score_200 values( 110005, 'A002', 'J002' , 50);
insert into tbl_score_200 values( 110006, 'A002', 'J003' , 70);
insert into tbl_score_200 values( 110007, 'A003', 'J001' , 80);
insert into tbl_score_200 values( 110008, 'A003', 'J002' , 60);
insert into tbl_score_200 values( 110009, 'A003', 'J003' , 70);
insert into tbl_score_200 values( 110010, 'A004', 'J001' , 80);
insert into tbl_score_200 values( 110011, 'A004', 'J002' , 78);
insert into tbl_score_200 values( 110012, 'A004', 'J003' , 89);
insert into tbl_score_200 values( 110013, 'A005', 'J001' , 62);
insert into tbl_score_200 values( 110014, 'A005', 'J002' , 91);
insert into tbl_score_200 values( 110015, 'A005', 'J003' , 67);
--

