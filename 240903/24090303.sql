--함수 (a,b,c): a중 b를 c 함수 

select * from professor;

--문자함수 

--lower() : 소문자 , upper() : 대문자
select upper(name), lower(name) from professor;


--substr() : 문자열 일부 추출 , 첫번째가 1부터 시작
select substr(name, 1, 3)  
from professor;


--instr() : 특정글자의 위치번째 반환 
select instr(name,'A')
from professor;

select instr('A-B-C-D', '-')
from dual; --dual: 임시테이블, 테스트용

select name, instr(tel,')') 
from student;


--LPAD(): 왼쪽부터 특정문자 채우기
select lpad(id, 10, '*')
from student;

--RPAD(): 오른쪽부터 특정문자 채우기
select rpad(id, 10, '*')
from student;


--replace() : 특정문자로 대체
select replace(tel, '-', '/') 
from student;

select replace(name,'Ja','**')
from student;

select replace(name, substr(name,1,2) , '**')
from student;


--숫자함수

--round() : 반올림
select round(827282.2838, 2)
from dual;

--trunc() : 버림
select trunc(23893.12383, 2)
from dual;


--현재 날짜 가져오기
select sysdate from dual;


--두 날자 사이의 개월 수 구하기
select months_between('04/12/31', '04/09/03')
from dual;


--기타함수 NVL() NVL2()
--nvl(a,b): a중에 b(null)을 대입

select ename, comm+100 
from emp;

select ename, nvl(comm,0)+100
from emp;

--nvl2(a,b,c) : a 중에서 b(not null)를 대입하고, c(null)을 대입
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

select m_name, case when m_point>=3000 then '상'
when m_point >=2000 then '중'
else '하'
end as result
from member_tbl_11;