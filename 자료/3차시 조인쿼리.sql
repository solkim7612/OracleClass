
select * from tbl_test_order;
select * from tbl_test_customer;


--  inner  ����( �⺻����)
--  �� ���� ���̺��� �����ϸ� �ֹ����� ���� �������� ��ȸ���� ���� 
--  on���� ������ ���� ��� �����ؾ߸� ����� ��ȸ��
select * 
from tbl_test_order   o
join  tbl_test_customer c
on o.id = c.id ;


-- �ֹ����� ���� �������� ��ȸ�ǰ� �Ϸ���   outer ������ �ؾ� ��
select * 
from tbl_test_order   o
right outer join  tbl_test_customer c
on o.id = c.id ;

--���ν�  customer�� �����ʿ� ��ġ�ϹǷ�   right outer  ������ �ؾ� �� 


--���� �ֹ���Ȳ
select c.name,  o.sale_cnt 
from tbl_test_order   o
join  tbl_test_customer c
on o.id = c.id ;


--���� �ֹ���Ȳ (�ֹ����� ���� ������)
select c.name,  o.sale_cnt 
from tbl_test_order   o
right outer join  tbl_test_customer c
on o.id = c.id ;