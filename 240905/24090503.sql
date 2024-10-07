--�Ѿ�CU ����

select goods_cd ��ǰ�ڵ�, goods_nm ��ǰ��, goods_price �ܰ�, cost ����, in_date �԰�����
from goods_tbl_500;

select store_cd �����ڵ�, store_nm ������, store_fg ��������
from store_tbl_500; 

select sale_no �ǸŹ�ȣ, sale_ymd �Ǹ�����, sale_fg �Ǹű���, store_cd �����ڵ�, goods_cd ��ǰ�ڵ�, sale_cnt �Ǹż���, pay_type ���뱸��
from sale_tbl_500;

--��ǰ ���� ���
select goods_cd ��ǰ�ڵ�, goods_nm ��ǰ��, goods_price �ܰ�, cost ����, sysdate
from goods_tbl_500;

--������ ������Ȳ
select * from sale_tbl_500 sa
join goods_tbl_500 g on sa.goods_cd=g.goods_cd
join store_tbl_500 st on st.store_cd=sa.store_cd;

select st.store_nm ������,
    to_char(sum(decode(sa.pay_type, '01', g.goods_price * sa.sale_cnt, 0)), '999,999') ���ݸ���,
    to_char(sum(decode(sa.pay_type, '02', g.goods_price * sa.sale_cnt, 0)), '999,999') ī�����,
    to_char(sum(g.goods_price * sa.sale_cnt),'999,999') �Ѹ���
from sale_tbl_500 sa
join goods_tbl_500 g on sa.goods_cd=g.goods_cd
join store_tbl_500 st on sa.store_cd=st.store_cd
group by st.store_nm
order by st.store_nm;

--�Ǹ���Ȳ
select decode(sa.sale_fg, '1', '�Ǹ�', '���Ǹ�') �Ǹű���, sa.sale_no �ǸŹ�ȣ, to_char(sa.sale_ymd,'yyyy-mm-dd') �Ǹ�����, g.goods_nm ��ǰ��, sa.sale_cnt �Ǹż���, 
    sum(g.goods_price * sa.sale_cnt) �Ǹűݾ�,
    decode(sa.pay_type, '01', '����', '02', 'ī��') ���뱸��
from sale_tbl_500 sa
join goods_tbl_500 g
on sa.goods_cd=g.goods_cd
join store_tbl_500 st
on st.store_cd=sa.store_cd
group by sa.sale_fg, sa.sale_no, sa.sale_ymd, g.goods_nm, sa.sale_cnt,sa.pay_type ;



--HY ���� ��������α׷� ����

