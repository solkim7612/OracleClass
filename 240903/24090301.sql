create table  acorntbl (
    id  varchar2(10) primary key,
    pw  varchar2(10) ,
    name varchar2(10)
);



insert into acorntbl values('kdhyun', '4482', '�赵��');
insert into acorntbl values('kmg','1234', '�蹫��');
insert into acorntbl  values('ksjoong' ,'0000' , '�輼��');
insert into acorntbl  values('kimsh','6666','�輼��');
insert into acorntbl values('ksol', '1127', '���');
insert into acorntbl values('kimjs', '0317', '������');
insert into acorntbl values('kimcw','9876','��ä��');
insert into acorntbl values('backbw', '1111', '��ٿ�'); 
insert into acorntbl values('sbhak', '4482', '�Һ���');
insert into acorntbl values('sbyoungH','0117','�ۺ�ȭ'); 
insert into acorntbl values('ssb','1126','�ۼ���');
insert into acorntbl values('yjmin','0625','������');
insert into acorntbl values('Leesmin','6789','�̻��');
insert into acorntbl  values('LeeHjin', '1234', '��ȿ��');
insert into acorntbl values('Jangkho','1234','���ȣ');
insert into acorntbl values('Junws', '7777', '���켱');
insert into acorntbl values('Junjh', '9999', '������');
insert into acorntbl values('Jungbr', '2344', '������');
insert into acorntbl values('jooSg', '1009', '�ֻ��');
insert into acorntbl values('jooHJ', '3456', '������');
insert into acorntbl values('Choimgil', '9898', '�ֹ���');
insert into acorntbl values('ChoiHj', '5589', '������');
insert into acorntbl values('HYJin', '1234', '�Ͽ���');
insert into acorntbl values('Hjyoung', '9099', 'Ȳ����');
commit;

select * from acorntbl;

--1����
--�����͸� �����ϴ� ���� �ƴ� ���ϴ� ��� ��ȸ�ϴ� �����

--��������ȸ�ϱ� SELECT
select * from acorntbl; -- * : ��� �÷� ��ȸ
select id, name FROM acorntbl;
select id || name from acorntbl; -- || : �����ϱ�
select id || name as �̸� from acorntbl; -- as : �÷� ��Ī �ֱ�
select id "user id" , name "user name" from acorntbl; -- (as) ��������


--�ߺ��� �� �����ϰ� ��ȸ�ϱ� distinct
select * from emp;
select job from emp; --12��(�ߺ� ����)
select distinct job from emp; --5��(�ߺ� ����)


--���ϴ� ���Ǹ� ��ȸ�ϱ� where 
--where ~ like �� ���
select * from acorntbl where name like '��%';

--�������� �� �� �ִ� ������
select * from acorntbl where name = '�赵��';

select * from acorntbl where name != '�赵��';

select * from emp;
--���̺� �� Ȯ���ϱ� (���̺�Ű��)
desc emp; --describe ���̺� ���� Ȯ��

select ename, job, sal, comm from emp where sal > 2500;


--between a and b : a ���� b����, a �̻� b ����
select * from emp where sal between 2000 and 3000;


--and, or : ������ ���� ���� ���
select * from emp where job = 'SALESMAN' and sal >= 1500; -- '' �ȿ� �ִ� �����ʹ� ��ҹ��� ����

select * from emp where job='SALESMAN' or sal >=1500;


--in (a, b, c)
select * from emp where job = 'CLERK' or job='MANAGER';

select * from emp where job in('CLERK' , 'MANAGER');


--not in (a, b, c)
select * from emp where job not in ('CLERK', 'MANAGER');


--not ����
select * from emp where not sal > 2000;


--like (% ���� �� ���� ���� , _ �� ����)
select * from acorntbl where name like '��__'; 


--null ����� ���� (=������ ���Ұ�)
--is null, is not null
select * from emp where comm is null;

select * from emp where comm is not null;

select ename, comm+100 from emp; --null +100 = null


--�����ϱ�
--��������: order by ~ desc
select * from emp order by sal desc; --descending

--��������(�⺻): order by ~ (asc)  -- ascending
select * from emp order by sal;

select * from emp order by job, sal desc;

select empno, ename, job from emp order by 2; --2��°(ename) �������� ����
