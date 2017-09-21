DROP TABLE guest_board CASCADE CONSTRAINTS PURGE; 

CREATE TABLE guest_board ( 
	gnum		NUMBER(6) 		NOT NULL,
    id       	VARCHAR(10) 	NOT NULL,
    gname   	VARCHAR(20) 	NOT NULL, 
    content    	VARCHAR(20) 	NOT NULL, 
    gdate      	VARCHAR(14)     	NULL,
    PRIMARY KEY (gnum)    
); 

select * from guest_board;

insert into guest_board 
select m.fname 
from home_member m,guest_board g
where m.id = g.id;