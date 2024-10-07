--한양CU 문제

select goods_cd 상품코드, goods_nm 상품명, goods_price 단가, cost 원가, in_date 입고일자
from goods_tbl_500;

select store_cd 점포코드, store_nm 점포명, store_fg 직영구분
from store_tbl_500; 

select sale_no 판매번호, sale_ymd 판매일자, sale_fg 판매구분, store_cd 점포코드, goods_cd 상품코드, sale_cnt 판매수량, pay_type 수취구분
from sale_tbl_500;

--상품 정보 등록
select goods_cd 상품코드, goods_nm 상품명, goods_price 단가, cost 원가, sysdate
from goods_tbl_500;

--점포별 매출현황
select * from sale_tbl_500 sa
join goods_tbl_500 g on sa.goods_cd=g.goods_cd
join store_tbl_500 st on st.store_cd=sa.store_cd;

select st.store_nm 점포명,
    to_char(sum(decode(sa.pay_type, '01', g.goods_price * sa.sale_cnt, 0)), '999,999') 현금매출,
    to_char(sum(decode(sa.pay_type, '02', g.goods_price * sa.sale_cnt, 0)), '999,999') 카드매출,
    to_char(sum(g.goods_price * sa.sale_cnt),'999,999') 총매출
from sale_tbl_500 sa
join goods_tbl_500 g on sa.goods_cd=g.goods_cd
join store_tbl_500 st on sa.store_cd=st.store_cd
group by st.store_nm
order by st.store_nm;

--판매현황
select decode(sa.sale_fg, '1', '판매', '미판매') 판매구분, sa.sale_no 판매번호, to_char(sa.sale_ymd,'yyyy-mm-dd') 판매일자, g.goods_nm 상품명, sa.sale_cnt 판매수량, 
    sum(g.goods_price * sa.sale_cnt) 판매금액,
    decode(sa.pay_type, '01', '현금', '02', '카드') 수취구분
from sale_tbl_500 sa
join goods_tbl_500 g
on sa.goods_cd=g.goods_cd
join store_tbl_500 st
on st.store_cd=sa.store_cd
group by sa.sale_fg, sa.sale_no, sa.sale_ymd, g.goods_nm, sa.sale_cnt,sa.pay_type ;



--HY 라운드 오디션프로그램 문제

