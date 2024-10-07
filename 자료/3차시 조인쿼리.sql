
select * from tbl_test_order;
select * from tbl_test_customer;


--  inner  조인( 기본조인)
--  두 개의 테이블을 조인하면 주문하지 않은 고객정보가 조회되지 않음 
--  on절의 정보가 양쪽 모두 존재해야만 결과로 조회됨
select * 
from tbl_test_order   o
join  tbl_test_customer c
on o.id = c.id ;


-- 주문하지 않은 고객정보를 조회되게 하려면   outer 조인을 해야 함
select * 
from tbl_test_order   o
right outer join  tbl_test_customer c
on o.id = c.id ;

--조인시  customer가 오른쪽에 위치하므로   right outer  조인을 해야 함 


--고객별 주문현황
select c.name,  o.sale_cnt 
from tbl_test_order   o
join  tbl_test_customer c
on o.id = c.id ;


--고객별 주문현황 (주문하지 않은 고객포함)
select c.name,  o.sale_cnt 
from tbl_test_order   o
right outer join  tbl_test_customer c
on o.id = c.id ;