--��: ���Ⱥ���Ʈ, �α�ä�� -> ���ƿ�, ��� ��
--post: �Խ���, �Խñ�����, ������(ȸ��,���̵�),��¥, �Խñ۳��� ,���ƿ�, ���
--comment: ȸ���, id ù���� �� ** (�� 8��), ��۳���, ��¥, ���ƿ�, ����

--����������
CREATE TABLE myPage (
    userId VARCHAR2(20) NOT NULL PRIMARY KEY,  -- ����� ���̵�
    userPw VARCHAR2(20) NOT NULL,              -- ����� ��й�ȣ
    userCompany VARCHAR2(20) DEFAULT '��ȸ��'  -- ����� ȸ��
);

--�Խñ�
CREATE TABLE post (
    post_no VARCHAR2(10) NOT NULL PRIMARY KEY,         -- �Խñ� ��ȣ
    post_title VARCHAR2(100),                          -- �Խñ� ����
    post_userCompany VARCHAR2(20) NOT NULL,            -- �ۼ��� ȸ���
    post_userId VARCHAR2(20) NOT NULL,                 -- �ۼ��� ���̵�
    post_date DATE NOT NULL,                           -- �ۼ���
    post_contents CLOB,                                -- �Խñ� ����
    post_like NUMBER(1) CHECK(post_like IN (1, 0)) DEFAULT 0,  -- ���ƿ� ����
    CONSTRAINT fk_post_userId FOREIGN KEY (post_userId) REFERENCES myPage(userId)  -- ����� �ܷ� Ű
);

--���
CREATE TABLE comments (
    comments_no VARCHAR2(10) NOT NULL PRIMARY KEY,         -- ��� ��ȣ
    post_no VARCHAR2(10) NOT NULL,                         -- �Խñ� ��ȣ (�ܷ� Ű)
    comments_userCompany VARCHAR2(20) NOT NULL,            -- ��� �ۼ��� ȸ���
    comments_userId VARCHAR2(20) NOT NULL,                 -- ��� �ۼ��� ���̵�
    comments_contents CLOB,                                -- ��� ����
    comments_date DATE NOT NULL,                           -- ��� �ۼ���
    CONSTRAINT fk_comments_post_no FOREIGN KEY (post_no) REFERENCES post(post_no),   -- �Խñ� �ܷ� Ű
    CONSTRAINT fk_comments_userId FOREIGN KEY (comments_userId) REFERENCES myPage(userId) -- ����� �ܷ� Ű
);



--��1: ���Ⱥ���Ʈ ���ƿ�, ��� ��

--��2: �α�ä�� ���ƿ�, ��� ��
