create table  acorntbl (
    id  varchar2(10) primary key,
    pw  varchar2(10) ,
    name varchar2(10)
);



insert into acorntbl values('kdhyun', '4482', '김도현');
insert into acorntbl values('kmg','1234', '김무궁');
insert into acorntbl  values('ksjoong' ,'0000' , '김세중');
insert into acorntbl  values('kimsh','6666','김세현');
insert into acorntbl values('ksol', '1127', '김솔');
insert into acorntbl values('kimjs', '0317', '김정석');
insert into acorntbl values('kimcw','9876','김채운');
insert into acorntbl values('backbw', '1111', '백바울'); 
insert into acorntbl values('sbhak', '4482', '소병학');
insert into acorntbl values('sbyoungH','0117','송병화'); 
insert into acorntbl values('ssb','1126','송수빈');
insert into acorntbl values('yjmin','0625','용지민');
insert into acorntbl values('Leesmin','6789','이상민');
insert into acorntbl  values('LeeHjin', '1234', '이효진');
insert into acorntbl values('Jangkho','1234','장경호');
insert into acorntbl values('Junws', '7777', '전우선');
insert into acorntbl values('Junjh', '9999', '전지형');
insert into acorntbl values('Jungbr', '2344', '정보란');
insert into acorntbl values('jooSg', '1009', '주상길');
insert into acorntbl values('jooHJ', '3456', '주형준');
insert into acorntbl values('Choimgil', '9898', '최문길');
insert into acorntbl values('ChoiHj', '5589', '최형진');
insert into acorntbl values('HYJin', '1234', '하예진');
insert into acorntbl values('Hjyoung', '9099', '황지영');
commit;

select * from acorntbl;

--1일차
--데이터를 변경하는 것이 아닌 원하는 대로 조회하는 방법들

--데이터조회하기 SELECT
select * from acorntbl; -- * : 모든 컬럼 조회
select id, name FROM acorntbl;
select id || name from acorntbl; -- || : 연결하기
select id || name as 이름 from acorntbl; -- as : 컬럼 별칭 주기
select id "user id" , name "user name" from acorntbl; -- (as) 생략가능


--중복된 값 제거하고 조회하기 distinct
select * from emp;
select job from emp; --12건(중복 포함)
select distinct job from emp; --5건(중복 제외)


--원하는 조건만 조회하기 where 
--where ~ like 절 사용
select * from acorntbl where name like '김%';

--조건절에 올 수 있는 연산자
select * from acorntbl where name = '김도현';

select * from acorntbl where name != '김도현';

select * from emp;
--테이블 명세 확인하기 (테이블스키마)
desc emp; --describe 테이블 구조 확인

select ename, job, sal, comm from emp where sal > 2500;


--between a and b : a 에서 b까지, a 이상 b 이하
select * from emp where sal between 2000 and 3000;


--and, or : 조건이 여러 개인 경우
select * from emp where job = 'SALESMAN' and sal >= 1500; -- '' 안에 있는 데이터는 대소문자 구분

select * from emp where job='SALESMAN' or sal >=1500;


--in (a, b, c)
select * from emp where job = 'CLERK' or job='MANAGER';

select * from emp where job in('CLERK' , 'MANAGER');


--not in (a, b, c)
select * from emp where job not in ('CLERK', 'MANAGER');


--not 조건
select * from emp where not sal > 2000;


--like (% 글자 수 제한 없음 , _ 한 글자)
select * from acorntbl where name like '김__'; 


--null 연산시 주의 (=연산자 사용불가)
--is null, is not null
select * from emp where comm is null;

select * from emp where comm is not null;

select ename, comm+100 from emp; --null +100 = null


--정렬하기
--내림차순: order by ~ desc
select * from emp order by sal desc; --descending

--오름차순(기본): order by ~ (asc)  -- ascending
select * from emp order by sal;

select * from emp order by job, sal desc;

select empno, ename, job from emp order by 2; --2번째(ename) 기준으로 정렬
