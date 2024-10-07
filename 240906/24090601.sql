--p.189

select deptno,
    sum(decode(job, 'CLERK',sal,0)) "CLERK",
    sum(decode(job, 'MANAGER',sal,0)) "MANAGER",
    sum(decode(job, 'PRESIDENT',sal,0)) "PRESIDENT"
from emp
group by deptno;

--pivot
select deptno, job, sal 
from emp;

select *
from (select deptno, job, sal from emp)
pivot(
    sum(sal) for job in (
        'CLERK' "CLERK", 
        'MANAGER' "MANAGER", 
        'PRESIDENT' "PRESIDENT"
    )
);

create table pivotTBL as
select *
from (select deptno, job, empno from emp)
pivot(
    count(empno) for job in (
        'CLERK' "CLERK",
        'MANAGER' "MANAGER", 
        'PRESIDENT' "PRESIDENT"
    )
);

select *
from pivotTBL;

--unpivot
select *
from pivotTBL
unpivot(
    empno for job in (
        CLERK, MANAGER, PRESIDENT
    )
);


--rank() ~ over: 1, 1, 3 ...
--dense_rank() ~ over: 1, 1, 2 ...

select * 
from emp;

select ename, sal , rank() over(order by sal desc) rank
from emp;

select ename, sal, dense_rank() over(order by sal desc) rank
from emp;

select deptno, ename, sal, rank() over(partition by deptno order by sal desc) rank
from emp;


--row_number() ~ over: 동일 값일 경우 rowid 값을 사용하여 정렬(같은 순위 없음)
select deptno, ename, sal ,row_number() over(order by sal desc) 
from emp;



--p.198
--1
select empno, ename, sal, 
    rank() over(order by sal) rank_asc, 
    rank() over(order by sal desc) rank_desc
from emp;

--2
select empno, ename, sal, 
    rank() over(partition by deptno order by sal desc) rank 
from emp
where deptno=10;

--3
select empno, ename, sal, deptno, 
    rank() over(partition by deptno order by sal desc) rank
from emp;

--4
select empno, ename, sal, deptno,
    rank() over(partition by deptno, job order by sal desc) rank
from emp;
