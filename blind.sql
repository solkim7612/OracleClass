--뷰: 토픽베스트, 인기채용 -> 좋아요, 댓글 순
--post: 게시판, 게시글제목, 내정보(회사,아이디),날짜, 게시글내용 ,좋아요, 댓글
--comment: 회사명, id 첫글자 외 ** (총 8자), 댓글내용, 날짜, 좋아요, 대댓글

--마이페이지
CREATE TABLE myPage (
    userId VARCHAR2(20) NOT NULL PRIMARY KEY,  -- 사용자 아이디
    userPw VARCHAR2(20) NOT NULL,              -- 사용자 비밀번호
    userCompany VARCHAR2(20) DEFAULT '새회사'  -- 사용자 회사
);

--게시글
CREATE TABLE post (
    post_no VARCHAR2(10) NOT NULL PRIMARY KEY,         -- 게시글 번호
    post_title VARCHAR2(100),                          -- 게시글 제목
    post_userCompany VARCHAR2(20) NOT NULL,            -- 작성자 회사명
    post_userId VARCHAR2(20) NOT NULL,                 -- 작성자 아이디
    post_date DATE NOT NULL,                           -- 작성일
    post_contents CLOB,                                -- 게시글 내용
    post_like NUMBER(1) CHECK(post_like IN (1, 0)) DEFAULT 0,  -- 좋아요 여부
    CONSTRAINT fk_post_userId FOREIGN KEY (post_userId) REFERENCES myPage(userId)  -- 사용자 외래 키
);

--댓글
CREATE TABLE comments (
    comments_no VARCHAR2(10) NOT NULL PRIMARY KEY,         -- 댓글 번호
    post_no VARCHAR2(10) NOT NULL,                         -- 게시글 번호 (외래 키)
    comments_userCompany VARCHAR2(20) NOT NULL,            -- 댓글 작성자 회사명
    comments_userId VARCHAR2(20) NOT NULL,                 -- 댓글 작성자 아이디
    comments_contents CLOB,                                -- 댓글 내용
    comments_date DATE NOT NULL,                           -- 댓글 작성일
    CONSTRAINT fk_comments_post_no FOREIGN KEY (post_no) REFERENCES post(post_no),   -- 게시글 외래 키
    CONSTRAINT fk_comments_userId FOREIGN KEY (comments_userId) REFERENCES myPage(userId) -- 사용자 외래 키
);



--뷰1: 토픽베스트 좋아요, 댓글 순

--뷰2: 인기채용 좋아요, 댓글 순
