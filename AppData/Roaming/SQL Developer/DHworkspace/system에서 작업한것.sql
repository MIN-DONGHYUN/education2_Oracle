-- 1줄 주석문 

/*
여러줄 
주석문
*/
show user;
-- USER이(가) "SYSTEM"입니다.

select * from dba_users;

--** 현재 오라클 서버에 접속되어진 사용자 (지금은 "HR")가 만든 (HR의 소유의) 테이블(table) 목록을 조회하겠다. **--
select * from tab;