--�Լ� (a,b,c): a�� b�� c �Լ� 

select * from professor;

--�����Լ� 

--lower() : �ҹ��� , upper() : �빮��
select upper(name), lower(name) from professor;


--substr() : ���ڿ� �Ϻ� ���� , ù��°�� 1���� ����
select substr(name, 1, 3)  
from professor;


--instr() : Ư�������� ��ġ��° ��ȯ 
select instr(name,'A')
from professor;

select instr('A-B-C-D', '-')
from dual; --dual: �ӽ����̺�, �׽�Ʈ��

select name, instr(tel,')') 
from student;


--LPAD(): ���ʺ��� Ư������ ä���
select lpad(id, 10, '*')
from student;

--RPAD(): �����ʺ��� Ư������ ä���
select rpad(id, 10, '*')
from student;


--replace() : Ư�����ڷ� ��ü
select replace(tel, '-', '/') 
from student;

select replace(name,'Ja','**')
from student;

select replace(name, substr(name,1,2) , '**')
from student;


--�����Լ�

--round() : �ݿø�
select round(827282.2838, 2)
from dual;

--trunc() : ����
select trunc(23893.12383, 2)
from dual;


--���� ��¥ ��������
select sysdate from dual;


--�� ���� ������ ���� �� ���ϱ�
select months_between('04/12/31', '04/09/03')
from dual;


--��Ÿ�Լ� NVL() NVL2()
--nvl(a,b): a�߿� b(null)�� ����

select ename, comm+100 
from emp;

select ename, nvl(comm,0)+100
from emp;

--nvl2(a,b,c) : a �߿��� b(not null)�� �����ϰ�, c(null)�� ����
select ename, nvl2(comm, comm+500, 0)
from emp;

select ename, comm
from emp;


--decode
--01 vvip, 02 vip, 03 bronze
select decode(m_grade, '01', 'vvip', '02', 'vip', '03', 'bronze', '') 
from member_tbl_11;


--case when ~then ~ else ~ end as result = if ~ else if ~ else 
select m_name, m_point
from member_tbl_11;

select m_name, case when m_point>=3000 then '��'
when m_point >=2000 then '��'
else '��'
end as result
from member_tbl_11;