DROP TABLE freeboard CASCADE CONSTRAINTS PURGE; 

CREATE TABLE freeboard ( 
       fnum                 NUMBER(6) NOT NULL,      
       fname                VARCHAR(10) NOT NULL,   
       ftitle              	VARCHAR(100) NOT NULL,  
       fcontent             VARCHAR(4000) NOT NULL, 
       ref                  NUMBER(5) NOT NULL,     
       indent               NUMBER(2) DEFAULT 0 NOT NULL, 
       ansnum               NUMBER(5) DEFAULT 0 NOT NULL, 
       regdate              DATE NOT NULL,          
       count                NUMBER(5) DEFAULT 0 NOT NULL,     
       id                   VARCHAR(50) NOT NULL, 
       filename             VARCHAR(50) NULL,        
       filesize             NUMBER(7) NULL,        
       refnum               NUMBER    DEFAULT 0,          
       PRIMARY KEY (num) 
); 
 --�ۻ����Ҷ��� session-id���� ���Ͽ� ���������ϰ���
 
 
--  Sequence Object 
 
    CREATE SEQUENCE board_seq 
    START WITH   1         --���۹�ȣ 
    INCREMENT BY 1         --������ 
    MAXVALUE     99999     --�ִ밪 
    CACHE 20               --������ ����� ���� update�Ǵ� ���� �����ϱ����� ĳ�ð� 
    NOCYCLE;     
 
 
     
select * from BOARD 
 
-- �ܼ��� ������ ��� 
-- rownum: ���� �÷�, SELECT�ÿ� �������� �Ϸù�ȣ�� �����մϴ�. 
SELECT num, name, subject, regdate, rownum FROM board; 
 
 
-- ���� ���� ���, rownum�÷��� ORDER BY �� ���� ���� �����˴ϴ�. 
SELECT num, name, subject, regdate, rownum FROM board 
ORDER BY name DESC; 
 
 
-- ���������� rownum�� ���, ���� ������ ���� ����,  
-- �ܺ� ������ rownum �Ϸù�ȣ ���� 
SELECT num, name, subject, regdate, rownum r 
FROM ( 
      SELECT num, name, subject, regdate FROM board 
      ORDER BY name DESC 
) 
 
 
 
-- r�÷��� �ν��� ���մϴ�. 
SELECT num, name, subject, regdate, rownum r 
FROM ( 
      SELECT num, name, subject, regdate FROM board 
      ORDER BY name DESC 
) 
WHERE r >= 1 and r <= 5; 
 
 
 
-- rownum�� �̿��� ����¡ ���, 1~5�� ���ڵ常 ��� 
SELECT num, name, subject, regdate, r 
FROM( 
    SELECT num, name, subject, regdate, rownum r 
    FROM ( 
        SELECT num, name, subject, regdate FROM board 
--        where subject like '%��%' 
--        or content like '%��%' 
        ORDER BY num DESC 
    ) 
) 
WHERE r >= 6 and r <=10; 
 
 
-- 6 ~ 10�� ���ڵ常 ��� 
SELECT num, name, subject, regdate, r 
FROM( 
    SELECT num, name, subject, regdate, rownum r 
    FROM ( 
        SELECT num, name, subject, regdate FROM board 
        ORDER BY num DESC 
    ) 
) 
WHERE r >= 6 and r <= 10; 
 
select num,ref,indent,ansnum,refnum,subject 
from board 
order by ref DESC, ansnum 
 
 
 
select * from board 