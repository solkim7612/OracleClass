 
create  table  foodtbl(
    name varchar2(30) , 
    price  varchar2(10)  
);



insert into foodtbl values( '���İ�Ƽ' , 12000) ;
insert into foodtbl values( '����ʹ�' , 20000) ;
insert into foodtbl values( '�����ܹ��ż�Ʈ' ,14000 ) ;
commit;

select * from acorntbl;

select*
from(
    select rownum, id, pw, name from acorntbl
)
where rownum between 1 and 10;


--sequence ����
create sequence newproduct start with 1001;

select newproduct.nextval from dual;

drop sequence newproduct;
drop table testtbl;

create table testtbl (newproduct varchar2(5), title varchar2(50) ) ;

insert into testtbl(newproduct,title ) values (newproduct.nextval, 'tkdvna1');
insert into testtbl values (newproduct.nextval, 'tkdvna2');

select * from testtbl;