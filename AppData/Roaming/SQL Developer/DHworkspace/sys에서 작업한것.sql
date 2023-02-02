-- 1줄 주석문 

/*
여러줄 
주석문
*/
show user;
-- USER이(가) "SYSTEM"입니다.


select * from dba_users;
-- 오라클 서버에 생성되어진 계정의 정보를 조회해주는 것 


-- HR 계정의 암호를 gclass로 변경하기 

alter user hr identified by gclass;
-- User HR이(가) 변경되었습니다.
