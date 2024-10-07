--------------------------------------------------------------------------------
-- ȸ�� ���̺�
CREATE TABLE company
(
    company_id VARCHAR2(10) PRIMARY KEY,
    company_name VARCHAR2(50) NOT NULL
);

-- ���� ���̺�
CREATE TABLE userInfo
(
    userId VARCHAR2(10) PRIMARY KEY,
    userPw VARCHAR2(20) NOT NULL,
    userName VARCHAR2(10) NOT NULL,
    company_id VARCHAR2(10) REFERENCES company(company_id)
);

-- �Խñ� ���̺�
CREATE TABLE post
(
    post_id VARCHAR2(10) PRIMARY KEY,
    userId VARCHAR2(10) REFERENCES userInfo(userId),
    post_userCompany VARCHAR2(20) REFERENCES company(company_id),
    post_title VARCHAR2(100),
    post_date DATE DEFAULT CURRENT_DATE,
    post_contents varchar2(2000)
);

-- ��� ���̺�
CREATE TABLE comments
(
    comments_id VARCHAR2(15) PRIMARY KEY,
    post_id VARCHAR2(10) REFERENCES post(post_id),
    userId VARCHAR2(10) REFERENCES userInfo(userId),  
    comments_userCompany VARCHAR2(20) REFERENCES company(company_id),
    comments_contents VARCHAR2(1000),
    comments_date DATE DEFAULT CURRENT_DATE
);
commit;

--------------------------------------------------------------------------------
--����Ȯ��
select * from company;
select * from userInfo;
select * from post;
select * from comments;

drop table company;
drop table userInfo;
drop table post;
drop table comments;

--------------------------------------------------------------------------------
--insert
--sample_company
desc company;
insert into company (company_id, company_name) 
values('C001','��ȸ��');
insert into company 
values('C002','GSĮ�ؽ�');
insert into company 
values('C003','sk���̴н�');
insert into company  
values('C004','�ؽ�');
insert into company  
values('C005','������');
insert into company  
values('C006','������');
insert into company  
values('C007','����û');
insert into company  
values('C008','�Ｚ����');
insert into company  
values('C009','COUPANG');
insert into company  
values('C010','���ǻ�');
commit;

--sample_user
desc userInfo; 
insert into userInfo (USERID, USERPW, USERNAME , COMPANY_ID ) 
values ('U001' , '1234' , '������' , 'C001');
insert into userInfo 
values ('U002' , '2345' , '���ٶ�' , 'C002');
insert into userInfo
values ('U003' , '3456' , '�ٶ�' , 'C003');
insert into userInfo 
values ('U004' , '4567' , '�󸶹�' , 'C004');
insert into userInfo 
values ('U005' , '5678' , '���ٻ�' , 'C005');
insert into userInfo 
values ('U006' , '6789' , '�ٻ��' , 'C006');
insert into userInfo 
values ('U007' , '78910' , '�����' , 'C007');
insert into userInfo 
values ('U008' , '891011' , '������' , 'C008');
insert into userInfo 
values ('U009' , '9101112' , '����ī' , 'C009');
insert into userInfo 
values ('U010' , '10111213' , '��īŸ' , 'C010');
commit;

--post
desc post; 
INSERT INTO post (POST_ID, USERID, POST_USERCOMPANY, POST_TITLE, POST_DATE, POST_CONTENTS)
VALUES (
    '240911U001',
    'U001',
    'C001',
    'ȸ�翡�� �ð� ��� ����?',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'),
    'istj�ε� ȸ�翡�� �������� ���� ������ ' || CHR(10) ||
    '����, �ָ� �Ĵ�ǥ ¥�� '  || CHR(10) || 
    '��������� '  || CHR(10) || 
    '���� �� �ڱ��� ��ǥ ��ȹ ¥�� '  || CHR(10) ||
    '�̷��� �ϴµ� �ð��� ��� ���� '  || CHR(10) || 
    '���� ���������� �����鼭 �ð� ������ �� �ִ� �� �ϴµ� �ٸ� �������� ���ϸ鼭 ������?'
);

insert into post 
values (
    '240911U002',
    'U002' ,
    'C002' ,
    '�����ڵ��� ���հ� ����' ,
    TO_DATE('2024-09-11', 'YYYY-MM-DD'),
    '���� �������� ���ٰ� �������µ� �μ��˻� ������ ���� �� �� �ִ� ����� ����..? '  || CHR(10) ||
    '�μ� �������� ���� �������� ,, �˾ƾ� ������ �ٵ��Ф�');
    
insert into post 
values (
    '240911U003',
    'U003' ,
    'C003' ,
    '���� ��' ,
    TO_DATE('2024-09-11', 'YYYY-MM-DD'),
    '����� ������� 1������ �Ǿ���. '  || CHR(10) ||
    '-�뷫 30�� '  || CHR(10) ||
    '-ȸ����� 4�� '  || CHR(10) ||
    '-Ű175 '  || CHR(10) ||
    '-������70 '  || CHR(10) ||
    '-�� ���̾�(���б� �Ѵ�ȸ ���1ȸ) '  || CHR(10) ||
    '-��� ���200�� ���� '  || CHR(10) ||
    '-��ġ ���̾� '  || CHR(10) ||
    '-�߱� , �౸, �����̴� �� ������ ���� '  || CHR(10) || 
    '-���� 895 '  || CHR(10) ||
    '-�佺 150(IH) '  || CHR(10) || 
    '-��Ȱ 1�� '  || CHR(10) || 
    '-�ѱ��� 2�� '  || CHR(10) || 
    '�����ɷ� ���� '  || CHR(10) || 
    '-��û�ɷ� ���� '  || CHR(10) || 
    '-����ɷ� ���� '  || CHR(10) || 
    '-���� ���� '  || CHR(10) || 
    '-�� ������ ���� '  || CHR(10) ||
    '-���� �ձ۵ձ��� '  || CHR(10) || 
    '-ȭ�� �� �ȳ� '  || CHR(10) || 
    '�˹� ���赵 ����(ī�丸 �� 4~5��) '  || CHR(10) ||
    '-���� ������ '  || CHR(10) || 
    '-�ܸ� ������ �ʰ� ���� '  || CHR(10) ||
    '-����ģ�� ���� '  || CHR(10) || 
    '-�ֽ����� 3�⵿�� 4õ���� �����µ� ���� -3000 ��. '  || CHR(10) ||
    '-���� '  || CHR(10) || 
    '-�� ������(�ַ� �ݺ�) ');
    
insert into post 
values (
    '240911U004',
    'U004' ,
    'C004' ,
    '�����Ҷ� ������ �򰡿� ���� �Ҹ��� �������ᵵ ��������?' ,
    TO_DATE('2024-09-11', 'YYYY-MM-DD'),
    '��...');

insert into post 
values (
    '240912U005',
    'U005' ,
    'C005' ,
    '���� ���� ���� ���ϳ���??' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    '�ٵ� ��� �����µ� '  || CHR(10) || 
    '���⺸�� �� ������.. '  || CHR(10) || 
    '����� ���� ���Դϴ�');
    
insert into post 
values (
    '240912U006',
    'U006' ,
    'C006' ,
    '�Ｚ���� �ٴϴ� ģ���� ��Ͱ�ʹ�...' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    '���������� �� �ʹ����� �����༭'  || CHR(10) || 
    'Ssf ���° ���̾Ƹ���ε�'  || CHR(10) ||
    '�Ｚ���� �ٴϸ� 50% �ȴٸ�...? �ФФФ�');

insert into post 
values (
    '240912U007',
    'U007' ,
    'C007' ,
    '�ڱ�Ұ��� ���� ������ �ֳ���?' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    'ä��� �ܱ������ �̷¼��� ���ٴµ� ��������� �ڼҼ��� ���� ������ �ñ��ؼ���');

insert into post 
values (
    '240912U008',
    'U008' ,
    'C008' ,
    '���� 2���� ���ÿ� ������ �� ����' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    '���� 2���̵ƴµ� 2���� ������ �� �ִ� ����̾�'  || CHR(10) ||
    '�츮ȸ�� ���ñٹ��� ��� ������ ����ϴ´� ��� ����ұ�?'  || CHR(10) ||
    '�Ѵ� �������� ���缭 ��� ����?');

insert into post 
values (
    '240912U009',
    'U009' ,
    'C009' ,
    '�ؿ� ����û�� �� �ۺ��� �����' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    '�� ���� 10�� 4õ �̴�'  || CHR(10) || 
    '���ο� ���� 1�� 2õ�ִ�'  || CHR(10) || 
    '������ ����ߴ�'  || CHR(10) || 
    '�׷��� ��� ������ �־ ��Ű����'  || CHR(10) || 
    '��� �������� ����ؼ� �� �� �����´�'  || CHR(10) ||
    '�̷����� ������ ���ιۿ� ���̾���'  || CHR(10) || 
    '�������� �� �� �������� �ǰ��´�'  || CHR(10) || 
    '�� �Ҽ��ִ� �س����̴�'  || CHR(10) || 
    '�����ϰ� ���� ����'  || CHR(10) || 
    '�⽺���� �� �Ⱦ��� ���ú��� ������ �����ش�'  || CHR(10) ||
    '�ٽ� �Ͼ��'  || CHR(10) || 
    '���̵�������'  || CHR(10) || 
    '��޵��� ���� ��������� ���� �����Ѽ����ٰ� ���ιۿ�����');

insert into post 
values (
    '240912U010',
    'U010' ,
    'C010' ,
    '�����հ� �� �������� ��� ����' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    '�ʹ� ����ؼ� 4400�� ���� ������� �ۿ÷���.'  || CHR(10) ||
    '�̷� ��� ������ �ߴµ� ��¥ �ֳ׿�'  || CHR(10) || 
    '������ �ð� ���� ��� �� ���� ���°���.. ����'  || CHR(10) ||
    '����1��2�� ���� �� ���� ���� �����հ� �뺸 �ް� ���� ���� ���ڰ� �ؼ� ��� �������� ���� �� ����ϴ�. �� ���� �󿡼� ���� �� ���� �ι� ����߽��ϴ�.'  || CHR(10) || 
    '2�� �Ŀ� �����ͼ� ������� ������ ��δ� ������� �ĺ��� ���� � ���ǵ� ���� ����뺸�޾Ҿ�䡦. ��������'  || CHR(10) || 
    '�������� �ؼ� ��� �������� ���� �� �����߽��ϴ�. �λ��� ������ �˰ڴٰ� �߾��µ�, ���� �������ڿ��� �ȵȴٰ� �ߴٴ� �丸 �޾ҽ��ϴ�.'  || CHR(10) ||
    '�̰� ���� �ǳ���? �ᱹ ������ �� �Һ��� �ƴѰ�?'  || CHR(10) || 
    '���迡 ���� �Ǹ��� ȯ����� �������ϴ�.'  || CHR(10) ||
    '����翡 ���迡���� ������ ȸ���ε� �̷��� ó�츦 �ϳ׿�..');
commit;

--comments
desc comments;
INSERT INTO comments (COMMENTS_ID, POST_ID, USERID, COMMENTS_USERCOMPANY, COMMENTS_CONTENTS, COMMENTS_DATE)
VALUES (
    '240911U001U010', 
    '240911U001', 
    'U010', 
    'C010', 
    '�����ϳ� �����, �ָ��� ������� Ž������ ��ȹ�����. �̷��ϱ� �� �о� ������ �Ǵ���. ���ǿ�û�� ���� ����. ISTJ�� �׷��������� ����.',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U001U009', 
    '240911U001', 
    'U009', 
    'C009', 
    '�ۼ��ڰ� ������ ����Դϴ�.',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U002U008', 
    '240911U002', 
    'U008', 
    'C008', 
    '���۷��� üũ �������žƴϾ�?',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U002U007', 
    '240911U002', 
    'U007', 
    'C007', 
    '���? ����?',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments
VALUES (
    '240911U002U001', 
    '240911U002', 
    'U001', 
    'C001', 
    '���� �����ҳ����ϴ�. ȭ����!',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240911U002U002', 
    '240911U002', 
    'U002', 
    'C002', 
    'HD�� �������� �ٸ���������',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240911U002U003', 
    '240911U002', 
    'U003', 
    'C003', 
    '�μ��� 1�ܰ� �������ݾƿ�',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U003U006', 
    '240911U003', 
    'U006', 
    'C006', 
    'ģ���� �� ���� ��մ� ����',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U003U005', 
    '240911U003', 
    'U005', 
    'C005', 
    '����������ģ���� ���� �α⸹����',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U003U004', 
    '240911U003', 
    'U004', 
    'C004', 
    '���� ���ϰ� ���� �����̱�����������',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U004U003', 
    '240911U004', 
    'U003', 
    'C003', 
    '��',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U004U002', 
    '240911U004', 
    'U002', 
    'C002', 
    '�Ҹ����� �������� �������� �������...',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U004U001', 
    '240911U004', 
    'U001', 
    'C001', 
    '�ƴ� �װ� ���� ������ �ƴ�',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240912U005U002', 
    '240912U005', 
    'U002', 
    'C002', 
    '������ ��',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U005U003', 
    '240912U005', 
    'U003', 
    'C003', 
    '���������� ��񽺿��� �Դ� ����� �� ���� ��ȸ���̴�',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U005U004', 
    '240912U005', 
    'U004', 
    'C004', 
    '�� ��εǳ�' || CHR(10) ||
    '���� ��ȸ�� ��°� �����̱��ѵ�.. ���ϱ�� �ϰ�',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U006U005', 
    '240912U006', 
    'U005', 
    'C005', 
    '������ �ﹰ�̶� ssf���ι����� ��¥ ���� ��������',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240912U006U006', 
    '240912U006', 
    'U006', 
    'C006', 
    '��� ���̾Ƹ�� ȣ��...�ƴ� ����',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U007U007', 
    '240912U007', 
    'U007', 
    'C007', 
    '�����뽺Ʈ���̶�.',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U007U008', 
    '240912U007', 
    'U008', 
    'C008', 
    '�̷¼��� ���� ���� �ֱ� ��'  || CHR(10) || 
    '�ڼҼ�..��� �� �ǹ̾���..',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U007U009', 
    '240912U007', 
    'U009', 
    'C009', 
    '�׷��Կ� ���� ���ذ� �ȵǱ��ؿ�..',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U007U010', 
    '240912U007', 
    'U010', 
    'C010', 
    '���� ��ä���ִϱ� �����ڰ� �ʹ� ���Ƽ� �׷�������'  || CHR(10) ||
    '��������̳� ������� �ǵ� �ڼҼ� �� �� ���ݾ�',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments
VALUES (
    '240912U008U001', 
    '240912U008', 
    'U001', 
    'C001', 
    '���� ������ ���缭 ��� ������ �� �� �ְ���?',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U008U002', 
    '240912U008', 
    'U002', 
    'C002', 
    '�� ���� �翬�Ѱ���',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U009U003', 
    '240912U009', 
    'U003', 
    'C003', 
    '...���� ���� ���� �ֳ���...����',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));
    
INSERT INTO comments
VALUES (
    '240912U009U004', 
    '240912U009', 
    'U004', 
    'C004', 
    '���� ��¥���� 8���� ���Ⱦ�?',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U009U005', 
    '240912U009', 
    'U005', 
    'C005', 
    '�� �װ� �����ϴ� �����̾�.'  || CHR(10) ||
    '�����ε� �˰�����?',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));
    
INSERT INTO comments
VALUES (
    '240912U009U006', 
    '240912U009', 
    'U006', 
    'C006', 
    '�����̶� ���������� ��Ʈ���λ��',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U009U004', 
    '240912U009', 
    'U004', 
    'C004', 
    '�����ѵ��� ������������ �����ϰ� �����θ� �ϼ���',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U009U005', 
    '240912U009', 
    'U005', 
    'C005', 
    '�� �ñ��ϱ��ϴ� ������ �ٽ� �Ͼ�� ����',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));

INSERT INTO comments
VALUES (
    '240912U010U007', 
    '240912U010', 
    'U007', 
    'C007', 
    '������ ���۷��͹޾Ҿ�?',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U010U008', 
    '240912U010', 
    'U008', 
    'C008', 
    '�ű� ����� �˰Ű���',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U010U009', 
    '240912U010', 
    'U009', 
    'C009', 
    '�빫��� �����',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U010U010', 
    '240912U010', 
    'U010', 
    'C010', 
    '�� ������',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
COMMIT;
    
--------------------------------------------------------------------------------
--select
--��ü �Խñ۸��
SELECT 
    p.post_title "HOME",
    COUNT(c.comments_id) AS "��� ��"
FROM post p
JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_title;

--���Ⱥ���Ʈ 5: ��� ���� �Խñ�
SELECT *
FROM (
    SELECT 
        p.post_title AS "���Ⱥ���Ʈ 5",
        COUNT(c.comments_id) AS "��� ��"
    FROM post p
    JOIN comments c ON p.post_id = c.post_id 
    GROUP BY p.post_title
    ORDER BY COUNT(c.comments_id) DESC
) 
WHERE ROWNUM <= 5;

--�Խñ� ����ȸ
SELECT 
    p.post_title AS "�Խñ�����",
    c1.company_name AS "�ۼ���ȸ��",  
    RPAD(p.userId,8,'*') AS "�ۼ��ھ��̵�",
    p.post_contents AS "�ۼ�����",
    p.post_date AS "�ۼ���¥",
    LISTAGG(
        c2.company_name || 
        '(' || 
        RPAD(s.userId,8,'*') || '): ' || 
        s.comments_contents || 
        TO_CHAR(s.comments_date, ' YYYY-MM-DD') || 
        CHR(10) ,CHR(10) 
    ) WITHIN GROUP (ORDER BY s.comments_date) AS "�����"
FROM post p
JOIN comments s ON p.post_id = s.post_id
JOIN company c1 ON p.post_usercompany = c1.company_id  -- �Խñ� �ۼ����� ȸ��
JOIN company c2 ON s.comments_userCompany = c2.company_id  -- ��� �ۼ����� ȸ��
WHERE p.post_id ='240912U010'
--�Խñۼ���: '240911U001', '240911U002', '240911U003', '240911U004', '240912U005', '240912U006', '240912U007', '240912U008', '240912U009', '240912U010'
GROUP BY 
    p.post_title,
    p.post_date,
    c1.company_name,
    p.userId,
    p.post_contents
ORDER BY p.post_date;



--���̵� �� �ۼ��� ���
SELECT 
    c.userId AS "���̵�", 
    c.comments_contents || 
    ' ' || 
    TO_CHAR(c.comments_date, 'YYYY-MM-DD') || 
    ' (�Խñ�����: ' || 
    p.post_title || 
    ')' AS "���� �ۼ��� ��� (�Խñ� ����)"
FROM comments c
JOIN post p ON c.post_id = p.post_id
WHERE c.userId = 'U010';
--���̵���: 'U001', 'U002', 'U003', 'U004', 'U005', 'U006', 'U007', 'U008', 'U009', 'U010'

SELECT 
    p.post_title "HOME",
    COUNT(c.comments_id) AS "��� ��"
FROM post p
JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_title;
--------------------------------------------------------------------------------

SELECT * FROM (
SELECT p.post_id AS postId, p.userid AS userId, p.post_usercompany AS postUserCompany, 
p.post_title AS postTitle, p.post_date AS postDate, p.post_contents AS postContents, 
COUNT(c.comments_id) AS commentCount 
FROM post p 
LEFT JOIN comments c ON p.post_id = c.post_id 
GROUP BY p.post_id, p.userid, p.post_usercompany, p.post_title, p.post_date, p.post_contents
ORDER BY COUNT(c.comments_id) DESC 
) WHERE ROWNUM <= 10;

SELECT * FROM post WHERE post_Id='240911U001';

SELECT * FROM ( 
SELECT p.post_id AS postId, p.userId AS userId, p.post_usercompany AS postUserCompany, 
p.post_title AS postTitle, p.post_date AS postDate, p.post_contents AS postContents, 
COUNT(c.comments_id) AS commentCount 
FROM post p 
LEFT JOIN comments c ON p.post_id = c.post_id 
GROUP BY p.post_id, p.userId, p.post_usercompany, p.post_title, p.post_date, p.post_contents 
ORDER BY COUNT(c.comments_id) DESC 
) WHERE ROWNUM <= 10;




