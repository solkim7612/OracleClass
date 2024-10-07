drop table member_TBl_12;

select *
from student;

select *
from department;

--1
select name, s.deptno1, d.dname 
from student s
join department d
on s.deptno1=d.deptno;

--2
select *
from emp2;

select *
from p_grade;

select e.name, e.POSITION, e.pay, p.s_pay "Low Pay", p.e_pay "High Pay"
from emp2 e
join p_grade p
on e.POSITION=p.POSITION;

--3
select *
from emp2;

select *
from p_grade;

select *
from emp2 e
join p_grade p
on e.position=p.position;

--
CREATE TABLE t_emp
(
eid VARCHAR2(13) NOT NULL PRIMARY KEY ,
ename VARCHAR2(20) ,
salary NUMBER(5) ,
deptno NUMBER(5) ,
comm NUMBER(5) 
);
COMMIT;
INSERT INTO t_emp VALUES ('e001' , '신동엽' , 280,10,100) ;
INSERT INTO t_emp VALUES ('e002' , '유재석' , 250,20,50) ;
INSERT INTO t_emp VALUES ('e003' , '전현무' , 190,30,0) ;
INSERT INTO t_emp VALUES ('e004' , '양세영' , 300,20,0) ;
INSERT INTO t_emp VALUES ('e005' , '양세찬' , 290,40,100) ;
CREATE TABLE t_dept
(
deptno NUMBER(5) NOT NULL PRIMARY KEY ,
dname VARCHAR2(20) 
);
COMMIT;
INSERT INTO t_dept VALUES (10 , '영업팀') ;
INSERT INTO t_dept VALUES (20 , '기획팀') ;
INSERT INTO t_dept VALUES (30 , '관리팀') ;
INSERT INTO t_dept VALUES (40 , '마케팅팀') ;
INSERT INTO t_dept VALUES (50 , '재무팀') ;

commit;


--where절에 서브쿼리1
select * 
from t_emp;

select salary 
from t_emp
where ename='신동엽';

select *
from t_emp
where salary > 280;

select *
from t_emp 
where salary> 
    (select salary 
    from t_emp
    where ename='신동엽');

--where절에 서브쿼리2
select * 
from t_emp;

select *
from t_emp
where deptno in ('10', '20');

select deptno
from t_dept
where dname='기획팀' or dname='마케팅팀';

select *
from t_emp
where deptno in (
    select deptno
    from t_dept
    where dname='기획팀' or dname='마케팅팀'
);

--from절에 서브쿼리 (인라인뷰 서브쿼리)
select deptno, salary 
from t_emp;

select *
from (
    select deptno, salary 
    from t_emp
) te
join t_dept td
on te.deptno=td.deptno;


--에이콘몰 고객별 판매금액 구하기
select * 
from tbl_test_order;

select *
from tbl_test_goods;

select *
from tbl_test_customer;

select c.name, to_char(sum(o.sale_cnt*g.price),'999,999') "amount"
from tbl_test_order o
join tbl_test_goods g
on o.pcode=g.pcode
join tbl_test_customer c
on o.id=c.id
group by c.name
order by 2 desc;

-- any=or, all=and
select ename, sal
from emp
where sal>=any (
    select sal
    from emp
    where deptno =20
);

select ename, sal
from emp
where sal >=all (
    select sal
    from emp
    where deptno =20
);

--exists: 서브쿼리내용이 존재하지 않는 경우, 메인쿼리가 실행되지 않음
select ename, sal
from emp
where exists ( --존재하지 않는 내용
    select empno
    from emp
    where deptno='60'
);

--뷰 만들기: 기존테이블로부터 뷰 만듦
create view v_emp
as 
    select ename, deptno 
    from t_emp; --권한 불충분
    
--scott 서버에 view 권한 주기(cmd)
--1. sqlplus /as sysdba;
--2. grant create view to scott;

--view 조회하기
select *
from v_emp;

select o.id, sum (o.sale_cnt*g.price) as amt
from tbl_test_order o
join tbl_test_goods g
on o.pcode=g.pcode
group by o.id;

create view v_order
as 
    select o.id, sum (o.sale_cnt*g.price) as amt
    from tbl_test_order o
    join tbl_test_goods g
    on o.pcode=g.pcode
    group by o.id;
    
select *
from v_order;

select *
from v_order vo
join tbl_test_customer tc
on vo.id=tc.id;


--p420
--1
select *
from professor;

select *
from department;

select p.profno 교수번호, p.name 교수이름, d.dname 소속_학과이름
from professor p
join department d
on p.deptno=d.deptno;

create view v_prof_dept2
as
    select p.profno 교수번호, p.name 교수이름, d.dname 소속_학과이름
    from professor p
    join department d
    on p.deptno=d.deptno;

select *
from v_prof_dept2;

--2

select *
from student;

select *
from department;

select d.dname, max(s.height) max_height, max(s.weight) max_weight
from student s
join department d
on s.deptno1=d.deptno
group by d.dname;

select d.dname, a.maxheight, maxweight
from (
    select deptno1, max(height) maxheight, max(weight) maxweight
    from student
    group by deptno1 ) a
join department d
on a.deptno1=d.deptno;


--3
select *
from student;

select a.deptno1, a.maxheight, s.name
from (
    select deptno1, max(height) maxheight
    from student
    group by deptno1
)a
join student s
on a.deptno1 = s.deptno1 and a.maxheight =s.height
join department d
on d.deptno=s.deptno1;

--4
select *
from student;

select grade, height 
from student;

select grade, avg(height)
from student
group by grade;

select *
from (
    select grade, avg(height) avgHeight
    from student
    group by grade
) a
join student s
on a.grade=s.grade and s.height > a.avgHeight;
;

drop table member;
------테이블 생성
CREATE TABLE MEMBER( id varchar2(7) , name varchar2(10) );
-------
select *
from member;

--생성, 변경 후 완료 + commit 

--insert 생성 (c: creat); 순서대로 입력

insert into member (id, name) values('test01', 'test');
insert into member values ('test02', 'test');
insert into member (id) values ('test03');
commit;

--update 변경
update member
set name='홍길동'
where id='test01';
commit;

--delete 삭제
delete 
from member
where id='test03';
commit;

--alter 수정
desc member;
alter table member add(addr varchar2(50)); --한글: 3byte, varchar(byte)
alter table member modify id varchar2(50) ;
alter table member rename column id to userid;
alter table member drop column addr;

--테이블 삭제(완전 삭제)
drop table member;

--테이블 삭제(desc만 남김)
truncate table member;

--기존테이블을 사용하여 테이블 만들기(테이블복사)
create table professor3
as select * 
from professor
where 1=2;  --false: 테이블의 구조만 복사, 2=3, 3=4 ... 
commit;

select *
from professor3;

insert into professor3
select*from professor;


--테이블 생성
create table t3(
    no number(5) , 
    name varchar2(10) , 
    deptno varchar2(4) 
);

select *
from t3;

desc t3;

insert into t3 values( 1,AAA, 10); 
insert into t3 values( 2,BBB, 20); 
insert into t3 values( 3,CCC, 30); 
commit;

--테이블 복사
create table t33 
as select *from t3;

select *
from t33;

create tale t333
as select * from t3 
where 1=2;

create table cc(
    id varchar2(10),
    writeday date
);

insert into cc values ('t1', '2024-09-09');
insert into cc(id) values ('t2');
commit;

select *
from cc;

create table cc2(
    id varchar2(10),
    writeday date default sysdate
);

insert into cc2 values('t1', '2024-09-01');
insert into cc2(id) values('t2');
commit;

select *
from cc2;


--p.285
--1
create table new_emp(
    no number(5),
    name varchar2(20),
    hiredate date,
    bonus number(6,2)
);
commit;
select *
from new_emp;
--2
select no, name, hiredate
from new_emp;

create table new_emp2
as (select no, name, hiredate
from new_emp);

select *
from new_emp2;

--3
create table new_emp3
as select 
* from new_emp2
where 1=2;

select *
from new_emp3;

--4
desc new_emp2;

alter table new_emp2 add(birthday date default sysdate);

--5
alter table new_emp2 rename column birthday to birth;

--6
alter table new_emp2 modify no number(7);

--7
alter table new_emp2 drop column birth;

--8
truncate table new_emp2;

--9
drop table new_emp2;



---------------------------
create table my_table (text_column CLOB);
drop table my_table;

INSERT INTO my_table (text_column)
VALUES ('First line' || CHR(10) || 'Second line');

SELECT text_column
FROM my_table
WHERE text_column LIKE '%First line%';

SELECT REPLACE(text_column, CHR(10), '\n') AS formatted_text
FROM my_table
WHERE text_column LIKE '%First line%';