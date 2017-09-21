DROP TABLE home_member CASCADE CONSTRAINTS PURGE; 

CREATE TABLE home_member ( 
    id       	VARCHAR(10) 	NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼  
    passwd   	VARCHAR(20) 	NOT NULL, -- 패스워드, 영숫자 조합 
    mname    	VARCHAR(20) 	NOT NULL, -- 성명, 한글 10자 저장 가능 
    tel      	VARCHAR(14)     	NULL, -- 전화번호 
    email    	VARCHAR(50) 	NOT NULL UNIQUE, -- 전자우편 주소, 중복 안됨 
    zipcode  	VARCHAR(7)      	NULL, -- 우편번호, 101-101 
    address1 	VARCHAR(150)     	NULL, -- 주소 1 
    address2 	VARCHAR(50)     	NULL, -- 주소 2 
    job      	VARCHAR(20) 	NOT NULL, -- 직업 
    mdate    	DATE        	NOT NULL, -- 가입일     
    fname    	VARCHAR(50) 	DEFAULT 'member.jpg', -- 회원 사진
    grade    	CHAR(1)     	DEFAULT 'H', -- 일반회원: H, 정지: Y, 손님:Z 
    PRIMARY KEY (id)               -- 한번 등록된 id는 중복 안됨 
); 

select * from home_member;

update HOME_MEMBER set grade = 'H' where id = 'yoon';
update home_member set passwd = '123' where id = 'yoon';

insert into member (id,passwd,mname,tel,email,zipcode,
address1,address2,job,mdate,fname,grade)
values
('aaa','123','김준면','010-1112-1111','aaa@email.com',
'77777','서울시','아파트','as',sysdate,'aa.jpg','H');

