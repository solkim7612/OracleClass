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
INSERT INTO t_emp VALUES ('e001' , '�ŵ���' , 280,10,100) ;
INSERT INTO t_emp VALUES ('e002' , '���缮' , 250,20,50) ;
INSERT INTO t_emp VALUES ('e003' , '������' , 190,30,0) ;
INSERT INTO t_emp VALUES ('e004' , '�缼��' , 300,20,0) ;
INSERT INTO t_emp VALUES ('e005' , '�缼��' , 290,40,100) ;
CREATE TABLE t_dept
(
deptno NUMBER(5) NOT NULL PRIMARY KEY ,
dname VARCHAR2(20) 
);
COMMIT;
INSERT INTO t_dept VALUES (10 , '������') ;
INSERT INTO t_dept VALUES (20 , '��ȹ��') ;
INSERT INTO t_dept VALUES (30 , '������') ;
INSERT INTO t_dept VALUES (40 , '��������') ;
INSERT INTO t_dept VALUES (50 , '�繫��') ;

commit;


--where���� ��������1
select * 
from t_emp;

select salary 
from t_emp
where ename='�ŵ���';

select *
from t_emp
where salary > 280;

select *
from t_emp 
where salary> 
    (select salary 
    from t_emp
    where ename='�ŵ���');

--where���� ��������2
select * 
from t_emp;

select *
from t_emp
where deptno in ('10', '20');

select deptno
from t_dept
where dname='��ȹ��' or dname='��������';

select *
from t_emp
where deptno in (
    select deptno
    from t_dept
    where dname='��ȹ��' or dname='��������'
);

--from���� �������� (�ζ��κ� ��������)
select deptno, salary 
from t_emp;

select *
from (
    select deptno, salary 
    from t_emp
) te
join t_dept td
on te.deptno=td.deptno;


--�����ܸ� ���� �Ǹűݾ� ���ϱ�
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

--exists: �������������� �������� �ʴ� ���, ���������� ������� ����
select ename, sal
from emp
where exists ( --�������� �ʴ� ����
    select empno
    from emp
    where deptno='60'
);

--�� �����: �������̺�κ��� �� ����
create view v_emp
as 
    select ename, deptno 
    from t_emp; --���� �����
    
--scott ������ view ���� �ֱ�(cmd)
--1. sqlplus /as sysdba;
--2. grant create view to scott;

--view ��ȸ�ϱ�
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

select p.profno ������ȣ, p.name �����̸�, d.dname �Ҽ�_�а��̸�
from professor p
join department d
on p.deptno=d.deptno;

create view v_prof_dept2
as
    select p.profno ������ȣ, p.name �����̸�, d.dname �Ҽ�_�а��̸�
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
------���̺� ����
CREATE TABLE MEMBER( id varchar2(7) , name varchar2(10) );
-------
select *
from member;

--����, ���� �� �Ϸ� + commit 

--insert ���� (c: creat); ������� �Է�

insert into member (id, name) values('test01', 'test');
insert into member values ('test02', 'test');
insert into member (id) values ('test03');
commit;

--update ����
update member
set name='ȫ�浿'
where id='test01';
commit;

--delete ����
delete 
from member
where id='test03';
commit;

--alter ����
desc member;
alter table member add(addr varchar2(50)); --�ѱ�: 3byte, varchar(byte)
alter table member modify id varchar2(50) ;
alter table member rename column id to userid;
alter table member drop column addr;

--���̺� ����(���� ����)
drop table member;

--���̺� ����(desc�� ����)
truncate table member;

--�������̺��� ����Ͽ� ���̺� �����(���̺���)
create table professor3
as select * 
from professor
where 1=2;  --false: ���̺��� ������ ����, 2=3, 3=4 ... 
commit;

select *
from professor3;

insert into professor3
select*from professor;


--���̺� ����
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

--���̺� ����
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