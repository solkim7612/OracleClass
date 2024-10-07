--p.210. 1

select * 
from emp;

select nvl(comm, 0) 
from emp;

select sal+nvl(comm,0)
from emp;

select max(sal+nvl(comm,0)) "max", min(sal+nvl(comm,0)) "min", round(avg(sal+nvl(comm,0)),1) "avg"
from emp;


--

create table tbl_test_customer(
    id varchar2(20) not null primary key ,
    name varchar2(20) ,
    address varchar2(20),
    tel varchar2(20)
);

create table tbl_test_goods(
  pcode varchar2(20) not null primary key,
  pname varchar(20) ,
  price number(4)
);

create table tbl_test_order(
  ocode varchar2(20) not null primary key,
  odate date,
  id varchar2(20),
 pcode varchar2(20),
 sale_cnt number(6)
);



insert into tbl_test_customer values( 'H001' ,'김도현', '라스베가스', '010-3030-2222');
insert into tbl_test_customer values( 'H002' ,'김무궁', 'L.A', '010-2424-2222');
insert into tbl_test_customer values( 'H003' ,'정보란', '워싱턴D.C', '010-1010-2121');
insert into tbl_test_customer values( 'H004' ,'김세현', '뉴욕', '010-3333-2222');
insert into tbl_test_customer values( 'H005' ,'이효진', '텍사스', '010-9090-2222');
insert into tbl_test_customer values( 'H006' ,'최문길', '서울', '010-7878-1234');


 


insert into tbl_test_goods values('P001' ,'쫀드기', 1000);
insert into tbl_test_goods values('P002' ,'눈깔사탕', 100);
insert into tbl_test_goods values('P003' ,'아폴로', 200);
insert into tbl_test_goods values('P004' ,'뻥튀기', 2000);



insert into tbl_test_order values('J001' , '20210110' , 'H001', 'P001', 2);
insert into tbl_test_order values('J002' , '20210110' , 'H002', 'P002', 5);
insert into tbl_test_order values('J003' , '20210110' , 'H003', 'P003', 2);
insert into tbl_test_order values('J004' , '20210110' , 'H004', 'P004', 1);
insert into tbl_test_order values('J005' , '20210110' , 'H005', 'P002', 3);
insert into tbl_test_order values('J006' , '20210110' , 'H001', 'P002', 3);
insert into tbl_test_order values('J007' , '20210110' , 'H002', 'P001', 1);
insert into tbl_test_order values('J008' , '20210110' , 'H001', 'P002', 4);
 


--조인: inner (공통분모 정보만 출력가능)
SELECT * FROM tbl_test_order o
JOIN tbl_test_customer c ON o.id = c.id
JOIN tbl_test_goods g
ON o.pcode = g.pcode ;

select *
from tbl_test_order; 

select *
from tbl_test_goods; --pcode로 연결

select *
from tbl_test_order o
join tbl_test_goods g
on o.pcode=g.pcode; --inner join
  
select o.id, sum(o.sale_cnt) "qty"
from tbl_test_order o
join tbl_test_goods g
on o.pcode=g.pcode
group by o.id
order by o.id;


--outer 조인: (left,right,full) outer join
select *
from tbl_test_order o
join tbl_test_customer c --(inner) join: default
on o.id=c.id;

--left, right
select c.name, nvl(sum(o.sale_cnt),0)
from tbl_test_order o
right outer join tbl_test_customer c --공통분모가 아닌 right만의 정보 출력
on o.id=c.id
group by c.name;

--정보 추가 삽입
insert into tbl_test_order values('J009' , '20210110' , 'H007', 'P002', 4);
commit;
--
select *
from tbl_test_order;

select *
from tbl_test_customer;

select *
from tbl_test_order o
full outer join tbl_test_customer c
on o.id=c.id;

--형변환 함수
--to_char(): 숫자를 원하는 형식으로 변환
select sysdate 
from dual;

select to_char (sysdate, 'yyyy-mm-dd dy')
from dual;

select to_char(12345, '999,999') 
from dual;

select to_char(m_point,'0999,999') 
from member_tbl_11;

--to_number(): 숫자로 변환
select to_number('125') +3 
from dual;

--to_date(): 문자타입을 날짜형식으로 변환
select to_date('2024-09-05') 
from dual;

--시분 표시하기
select to_char (to_date('0900', 'hh24mi'), 'hh24:mi') 
from dual;

select substr('0900', 1,2)|| ':' || substr('0900', 3,2) 
from dual;


--p.210. 2
select *
from student;

select 
    count(decode(to_char(birthday, 'MM'), '01', '1월')) || '명' "JAN", 
    count(decode(to_char(birthday, 'MM'), '02', '2월')) || '명' "FEB", 
    count(decode(to_char(birthday, 'MM'), '03', '3월')) || '명' "MAR", 
    count(decode(to_char(birthday, 'MM'), '04', '4월')) || '명' "APR",
    count(decode(to_char(birthday, 'MM'), '05', '5월')) || '명' "MAY", 
    count(decode(to_char(birthday, 'MM'), '06', '6월')) || '명' "JUN" , 
    count(decode(to_char(birthday, 'MM'), '07', '7월')) || '명' "JUL", 
    count(decode(to_char(birthday, 'MM'), '08', '8월')) || '명' "AUG", 
    count(decode(to_char(birthday, 'MM'), '09', '9월')) || '명' "SEB", 
    count(decode(to_char(birthday, 'MM'), '10', '10월')) || '명' "OCT", 
    count(decode(to_char(birthday, 'MM'), '11', '11월')) || '명' "NOV", 
    count(decode(to_char(birthday, 'MM'), '12', '12월')) || '명' "DEC"
from student;


--p.210. 3
select *
from student;

select 
    count(tel) || '명' TOTAL ,
    count(decode(substr(tel, 1, instr(tel, ')')-1), '02', 'SEOUL')) || '명' "SEOUL", 
    count(decode(substr(tel, 1, instr(tel, ')')-1), '031', 'GYEONGGI')) || '명' "GYEONGGI", 
    count(decode(substr(tel, 1, instr(tel, ')')-1), '051', 'BUSAN')) || '명' "BUSAN", 
    count(decode(substr(tel, 1, instr(tel, ')')-1), '052', 'ULSAN')) || '명' "ULSAN", 
    count(decode(substr(tel, 1, instr(tel, ')')-1), '053', 'DAEGU')) || '명' "DAEGU", 
    count(decode(substr(tel, 1, instr(tel, ')')-1), '055', 'GYENGNAM')) || '명' "GYENGNAM"
from student;


--p.210. 4
select *
from emp;

select sum(decode(job, 'CLERK', sal))
from emp;

select sum(decode(job,'MANAGER', sal))
from emp;

select sum(decode(job, 'SALESMAN', sal))
from emp;

--직급별 급여합계
select sum(decode(job, 'CLERK', sal)) "CLERK",
        sum(decode(job,'MANAGER', sal)) "MANAGER",
        sum(decode(job,'PRESIDENT', sal)) "PRESIDENT",
        sum(decode(job, 'SALESMAN', sal)) "SALESMAN",
        sum(sal) "TOTAL"
from emp;

--부서별(DEPTNO) 직급별 급여합계
select 
    deptno,
    sum(decode(job, 'CLERK', sal,0)) CLERK,
    sum(decode(job, 'MANAGER', sal,0)) MANAGER,
    sum(decode(job,'PRESIDENT', sal,0)) PRESIDENT,
    sum(decode(job, 'SALESMAN', sal,0)) SALESMAN,
    sum(sal) TOTAL    
from emp
group by deptno
order by deptno;



