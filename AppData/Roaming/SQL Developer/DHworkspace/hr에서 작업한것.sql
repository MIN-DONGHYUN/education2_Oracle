show user;
--USER이(가) "HR"입니다.

select * from dba_users;
-- 오라클 서버에 생성되어진 계정의 정보를 조회해주는 것 

/*
dba_users 은 관리자만 조회할 수 있는 것이지 일반 사용자인 HR은 관리자가 아니므로 조회가 불가하다는 말이다.

ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
4행, 15열에서 오류 발생
*/



-- *** ORACLE 은 관계형 데이터베이스 관리 시스템(Relation DataBase Management System) 이다. ***
--     RDBMS(Relation DataBase Management System)
--     관계형 데이터베이스는 데이터를 열(Column, Field) 과 행(Row, Record, tuple) 으로 이루어진 테이블(Table, entity, 개체) 형태로 저장한다. 




--** 현재 오라클 서버에 접속되어진 사용자 (지금은 "HR")가 만든 (HR의 소유의) 테이블(table) 목록을 조회하겠다. **--
select * from tab;
