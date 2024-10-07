select m_point 
from member_tbl_11;

--sum()
select sum(m_point) 
from member_tbl_11;


--avg()
select avg(m_point) 
from member_tbl_11;


--max()
select max(m_point) 
from member_tbl_11;


--min()
select min(m_point)
from member_tbl_11;


--count()
select count (m_point)
from member_tbl_11;

select count(*)  --null 상관없이 개수구함
from member_tbl_11;


--group by
select m_point 
from member_tbl_11;

select sum(m_point)
from member_tbl_11;

select m_grade, sum(m_point)  --grade 기준으로 sum
from member_tbl_11
group by m_grade;

--group by + having(=where)
select m_grade, sum(m_point) 
from member_tbl_11
group by m_grade
having sum(m_point)>=5000;  

select m_grade, sum(m_point) as amt  --별칭을 주고 나서, 그 다음 문장부터 사용가능
from member_tbl_11
group by m_grade 
having sum(m_point)>=5000
order by amt desc; --내림차순


--emp 테이블 사용해서 부서별 급여의 평균을 구하시오.
select *
from emp;

select job, sal, comm
from emp;

select job, nvl2s(sum(sal), sum(sal)+comm, 0) as salSum
from emp
group by job;

select count(job)
from emp;

select job, round(sum(sal)/count(job),0) as salAvg
from emp
group by job;


