
create table new_emp1 (
   no number(4) 
   constraint emp1_no_pk primary key,
   name varchar2(20) 
   constraint emp1_name_nn not null,
   jumin varchar2(13)
   constraint emp1_jumin_nn not null 
   constraint emp1_jumin_uk unique,
   loc_code number(1) 
   constraint emp1_area_ck check( loc_code  <5 ) ,
   deptno varchar2(6)
   constraint emp1_deptno_fk references dept2(dcode)
);

create table new_emp2(
    no number(4) primary key,
    name varchar2(20) not null ,
    jumin varchar2(13) not null unique,
    loc_code number(1) check( loc_code <5),
    deptno varchar2(6) references dept2(dcode )
);


create table test_2021( 
    id varchar2(7) not null , 
    email varchar2(50) null , 
    phone char(13) not null, 
    pwd varchar2(7) default '111' 
);

--

--도메인 제약조건: 
--not null: 필수입력 //값의 수가 충분하지 않습니다
--default: null 
--check: 체크제약조건=if //체크 제약조건(SCOTT.SYS_C007563)이 위배되었습니다

--insert
desc test_2021;

insert into test_2021(id, email, phone, pwd) 
values('test1', 'test@naver.ocm', '01012345678', '1234');
commit;

insert into test_2021 (id, email)
values('test2', 'test2@naver.com'); --error: phone not null

insert into test_2021 (id, email, phone)
values ('test2', 'test2@naver.com', '01012345678');
commit;

delete from test_2021 
where id='test2';

insert into test_2021
values ('test3'); --값의 수가 충분하지 않습니다

select *
from test_2021;


create table test_2021_2
(
 id varchar2(50) null ,
 phone varchar2(20) check ( phone like '010-%-____') not null ,
 email varchar2(50) null
);

insert into test_2021_2 (id, phone) 
values ('test1', '010-1234-1234');
commit;


select *
from test_2021_2;

create table test_2021_0
(
 id varchar2(50) not null,
 email varchar2(200) null ,
 phone char(13) not null, 
 pwd varchar2(200) default '111' , 
 grade CHAR(2) CHECK( grade IN ('01', '02', '03')) 
);

desc test_2021_0;
insert into test_2021_0 (id, email, phone, grade) 
values ('test1', 'test1@naver.com', '010-1234-1234', '01');
commit;

select *
from test_2021_0;

insert into test_2021_0 (id, email, phone, grade) 
values ('test1', 'test1@naver.com', '010-1234-1234', '05');
--체크 제약조건(SCOTT.SYS_C007563)이 위배되었습니다

--
=-create table test_2021_3
(
 id varchar2(7) not null primary key , --not null 생략가능
 email varchar2(50) , 
 phone char(13) unique , 
 pwd varchar2(10) 
);
----------------------------------------

--엔티티 제약조건: 무결성 제약 조건(SCOTT.SYS_C007565)에 위배됩니다
--primary key (not null + unique)
--unique: 중복허용 x

desc test_2021_3;

insert into test_2021_3 (id, email, phone, pwd)
values ('test1', 'test1@naver.com', '010-1234-1234', '1234');

insert into test_2021_3 
values ('test2', 'test2@naver.com', '010-2345-2345', '2345');

insert into test_2021_3
values ('test2', 'test2@naver.com','010-3456-3456', '3456');
--무결성 제약 조건(SCOTT.SYS_C007565)에 위배됩니다

select *
from test_2021_3;


--릴레이션 제약조건 
create table mem_tbl (
    id varchar2(5) not null primary key , 
    name varchar2(10) not null , 
    addr varchar2(10)
);

insert into mem_tbl values( 'a1' , '홍길동' , '서울') ;
insert into mem_tbl values( 'a2' , '홍길순', '부산');
commit;

create table ord_tbl (
    no varchar2(5) not null primary key , 
    qty number(4) , 
    cus_no varchar2(5) 
);

insert into ord_tbl values( 'j01' , 3, 'a1' );
insert into ord_tbl values( 'j02' , 1, 'a1' );
insert into ord_tbl values( 'j03' , 7, 'a2' );
commit;

insert into ord_tbl values( 'j04' , 7, 'a3' );
commit;

desc ord_tbl;

--고객정보 조회하기
select *
from mem_tbl;

--주문정보 조회하기
select *
from ord_tbl;
