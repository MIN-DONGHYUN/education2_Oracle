--                     ↑ 대,소문자 변경 

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
/*
TNAME(테이블이름)    TABTYNE

COUNTRIES(국가정보)	TABLE
DEPARTMENTS	        TABLE
EMPLOYEES	        TABLE
EMP_DETAILS_VIEW	VIEW  (VIEW 는 테이블은 아니지만 SELECT 되어진 결과물을 마치 테이블 처럼 보는 것)
JOBS	            TABLE
JOB_HISTORY	        TABLE
LOCATIONS	        TABLE
REGIONS(대륙)        TABLE
*/

select * 
from DEPARTMENTS;   -- 부서 테이블을 보여주는 것이다.
                             -- sql 명령어는 대, 소문자를 구분하지 않습니다.
                             
SELECT * 
FROM departments;   -- 부서 테이블을 보여주는 것이다.
                             -- sql 명령어는 대, 소문자를 구분하지 않습니다.                            

SeleCT * 
FRom DepaRtmEnts;   -- sql 명령어는 대, 소문자를 구분하지 않습니다. 

SELECT * 
FROM departments;   -- 컬럼명과 테이블명도 대,소문자를 구분하지 않습니다.

SeleCT *            -- * 은 이 테이블에 있는 모든 컬럼명을 나타냄 
FRom DepaRtmEnts;   -- 문제 없이 작동됨 

select DEPARTMENT_id, DEPARTMENT_name, Manager_id, location_id
from DEPARTMENTS;  

select DEPARTMENT_id, DEPARTMENT_name, Manager_id, location_id
from DEPARTMENTS; 


-- 저장되어진 데이터 값 만큼은 반드시 대, 소문자를 구분합니다 
select *
from departments
where department_name = 'IT';   --문자열은 '' 이다. 저장되어진 데이터 값 만큼은 반드시 대, 소문자를 구분합니다 

select *
from departments
where department_name = 'it';   --문자열은 '' 이다.  결과 안나옴  저장되어진 데이터 값 만큼은 반드시 대, 소문자를 구분합니다 

select *
from departments
where department_name = 'It';   --문자열은 '' 이다.  저장되어진 데이터 값 만큼은 반드시 대, 소문자를 구분합니다 

select *
from departments
where department_name = 'Sales';   --문자열은 '' 이다.  저장되어진 데이터 값 만큼은 반드시 대, 소문자를 구분합니다 

select *
from departments
where department_name = 'SAles';   --문자열은 '' 이다.  결과 안나옴  저장되어진 데이터 값 만큼은 반드시 대, 소문자를 구분합니다 

------------------------------------------------------------------------------------

select *
from departments; -- "부서" 테이블 

describe departments;   -- describe 테이블 명 
-- 또는
desc departments;   -- departments의 테이블의 컬럼(column) 의 정보를 알려주는 것이다.

/*
이름                                  널?                                                                                   유형           
---------------                   --------                                                                               ------------ 
DEPARTMENT_ID   (부서번호)           NOT NULL ==> (반드시 데이터를 입력해야 한다는 뜻이다.)                                       NUMBER(4) ==> 숫자만 들어온다. 숫자 타입(데이터 범위) -9999 ~ 9999 까지 받아올 수 있다.
DEPARTMENT_NAME (부서명)            NOT NULL                                                                               VARCHAR2(30) ==> Varchar는 문자열을 뜻한다.(숫자 들어오는중)  문자열타입(30byte), 최대 30byte 까지 입력가능함
MANAGER_ID      (부서장의 사원번호)             ==> 없는 것이나 null 은 같은것인데 데이터를 입력하든 입력하지 않든 모두 허용한다는 뜻이다. NUMBER(6) ==> 숫자만 들어온다. 숫자 타입 (데이터 범위) -999999 ~ 999999 까지 받아올 수 있다.
LOCATION_ID     (부서주소ID)                                                                                               NUMBER(4) ==> 숫자만 들어온다. 숫자 타입 (데이터 범위) -9999 ~ 9999 까지 받아올 수 있다. 

실수를 나타내고자 할때는 아래와 같이 합니다.
예 ) NUNMER 은 정수 숫자이다. 하지만 뒤에 , 찍고 숫자를 쓴다면
    NUNMER(5, 2) ==> -999.99 ~ 999.99 를 나타낸다, 즉 5는 5개 숫자, 2는 뒤에서 2번째까지 소수 자리를 뜻한다.
    NUMBER(3, 1) ==> -99.9 ~ 99.9
    NUNMER(1, 1) ==> -0.9 ~ 0.9

*/

select *
from EMPLOYEES; -- ==> "사원" 테이블

desc employees;
/*
이름                                                널?         유형           
--------------------------------------             --------   ------------ 
EMPLOYEE_ID    (사원번호)                           NOT NULL    NUMBER(6)    
FIRST_NAME     (이름)                                          VARCHAR2(20) 
LAST_NAME      (성)                                NOT NULL    VARCHAR2(25) 
EMAIL          (이메일)                             NOT NULL    VARCHAR2(25) 
PHONE_NUMBER   (연락처)                                         VARCHAR2(20) 
HIRE_DATE      (입사일자)                            NOT NULL   DATE ==> 날짜 타입        
JOB_ID         (직종ID)                             NOT NULL   VARCHAR2(10) 
SALARY         (기본급여)                                       NUMBER(8,2)  
COMMISSION_PCT (커미션(수당)퍼센티지)                             NUMBER(2,2)  
MANAGER_ID     (직속상관(사수)의 사원번호)                         NUMBER(6)    
DEPARTMENT_ID  (해당사원이 근무하는 부서번호)                       NUMBER(4)  
*/

-- 기본 급여 * 커미션(수당)을 추가로 받는다 

select *
from LOCATIONS;   --부서의 주소 정보를 알려주는 테이블

select *
from COUNTRIES;   -- 국가정보를 알려주는 테이블 

select *
from REGIONS;   -- 대륙정보를 알려주는 테이블 

------------------------- 지금까지 기본적인 인사 셈플 테이블 -----------------------------

/*
==아주아주아주아주아주아주아주아주아주아주아주아주주아주아주아주아주아주아주아주아주아주 중요부분======= 
!!!!!!!!!!!필수 암기부분 !!!!!!!!!!!

== 어떠한 테이블(또는 뷰)에서 데이터 정보를 꺼내와 보는 명령어인 select의 처리 순서 ==

select 컬럼명, 컬럼명,...--5 컬럼명 대신에 *(아스테리크) 을 쓰면 모든 컬럼을 뜻하는 것이다.
from 테이블명(또는 뷰명) --1
where 조건절           --2 !!!whrer 조건절이 뜻하는 것은 해당 테이블명(또는 뷰명)에서 조건에 만족하는 행(row)을 메모리(RAM)에 로딩(올리는것) 해주는 것이다.!!!!!
group by 절           --3
having 그룹함수조건절   --4
order by 절           --6 

*/

-------------------------------------------------------------------------------


---- *** Null 을 처리해주는 함수 *** ----
---- NULL은 존재하지 않는 것이므로 4칙연산(+,-,*,/)에 NULL 이 포함되어지면 그 결과는 무조건 NULL 이 된다.

-- 1. NVL

    select '안녕하세요'
    from dual;          
    -- dual은 select 다음에 나오는 값들을 화면에 보여주기 위한 용도로 쓰이는 가상 테이블

    select 1+2, 1+null, 2-1, 2-null, 3*0, 0*null, 5/2, 5/null
    from dual;
    
    -- 첫번째 값이 null이냐고 묻고 null이 아니면 자신이 나온다, null이면 2번째 값이 나온다.
    select NVL(7,3), NVL(null, 3),  
           NVL('이순신','거북선'), nvl(null,'거북선'),
           nvl('null','하하')
    from dual;
    
    
-- 2. NVL 
    -- 첫번째 값이 null이냐고 묻고 null이 아니면 두번째 자신이 나온다 null이면 3번째 자리 수가 나온다.
    select NVL2(7,3,2), NVL2(null,3,2), 
           NVL2('이순신','거북선','구국영웅'), NVL2(null,'거북선','구국영웅')
    from dual;

-- 보고싶은 컬럼명을 써주면 써준것만 나온다.
select EMPLOYEE_ID, first_name, last_name, Job_id, Salary, commission_pct, department_id
from EMPLOYEES
where department_id = 60;
-- department_id 60번만 나온다.

select *  -- * 이므로 모든 컬럼들을 추출(select)해라는 말이다.
from employees; -- where절이 없으므로 employees 테이블에 저장되어져 있던 모든 행들을 메모리(RAM)에 퍼올린다.(Loading)

select employee_id, first_name, last_name  -- employee_id, first_name, last_name 컬럼들을 추출(select)해라는 말이다.
from employees; -- where절이 없으므로 employees 테이블에 저장되어져 있던 모든 행들을 메모리(RAM)에 퍼올린다.(Loading)



-- 월급은 기본급여(Salary) + 수당(Salary * commission_pct)
-- commission_pct 컬럼의 값이 null 이라함은 수당이 없다는 말이고, 
-- commission_pct 컬럼의 값이 0.3이라 함은 자신의 기본급여(Salary) * 0.3 이 실제 수당금액이다.

select employee_id, first_name, last_name, Salary, commission_pct,
       salary + (salary * commission_pct),
       nvl(salary + (salary * commission_pct), salary), 
       nvl2(commission_pct, (salary + (salary * commission_pct)), salary)
from employees;



-- 컬럼명을 별칭으로 설정해보자 

select employee_id As "사원번호" ,   -- 별병(별칭) alias
       first_name as "이름", 
       last_name "성",              --별병(별칭) alias 에서 AS는 생략이 가능함 
       Salary "기본 급여",               --공백을 주고자 할때에는 ""이 무조건 필요하다.
       commission_pct 커미션퍼센티지,          --별병(별칭) alias에서 ""는 생략가능함, 
       salary + (salary * commission_pct) "잘못된 월급",
       nvl(salary + (salary * commission_pct), salary) 월급1, 
       nvl2(commission_pct, (salary + (salary * commission_pct)), salary) 월급2
from employees;


        --------- **** 비교 연산자 **** -------------------
        /*
        
        1. 같다                    =
        2. 같지않다                !=  <>  ^=
        3. 크다, 작다              >   <
        4. 같거나 크다, 같거나 작다  >=    <=
        5. null 은 존재하지 않는 것이므로 비교대상이 될 수가 없다
        그러므로 비교 연산( =  !=  ^=   >   <   >=   <=)을 할 수가 없다
        그러므로 비교연산을 하려면 NVL()함수, NVL2()함수를 사용하여 처리한다.
        */
        
        -- !!!!퀴즈!!!! --
    -- employees 테이블에서 부서번호 30번에 근무하는 사람들만
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세여

select employee_id As "사원번호",
       first_name as "이름", 
       last_name "성",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름" 
from employees
where department_id = 30;


-- 성과 이름을 하나로 합쳐보자

select '대한민국', '서울시', 1234, sysdate -- sysdate는 현재 날짜 및 시간 
from dual;

-- 오라클에서 컬럼들을 붙일때(연결할때)는 문자 타입이든 숫자 타입이든 날짜 타입이든 관계없이 || 를 쓰면 된다. 
-- || 는 두개의 컬럼명을 합치는 것이다.
select '대한민국' || '서울시' || 1234 || sysdate -- sysdate는 현재 날짜 및 시간 
from dual;


    -- employees 테이블에서 부서번호 30번에 근무하는 사람들만
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세여

select employee_id As "사원번호",
       first_name || ' ' || last_name "사원명",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름" 
from employees
where department_id = 30;


    -- employees 테이블에서 부서번호 null에 근무하는 사람들만
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세여

select employee_id As "사원번호",
       first_name || ' ' || last_name "사원명",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름" 
from employees
where department_id = null;
--> 데이터가 출력되지 않는다.
-- 왜냐하면 null은 존재하지 않는 것이므로 비교대상이 될 수가 없기 때문이다.

select employee_id As "사원번호",
       first_name || ' ' || last_name "사원명",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름" 
       , nvl(department_id, -9999)
from employees;


select employee_id As "사원번호",
       first_name || ' ' || last_name "사원명",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름"
from employees
where NVL(department_id, -9999) = -9999;
-- 사원번호 사원명             월급     부서번호
--  178	  Kimberely Grant	8050     null	

-- 또는 
-- null 은 is 연산자를 사용하여 나타낸다.

select employee_id As "사원번호",
       first_name || ' ' || last_name "사원명",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름"
from employees
where department_id is null;  -- is null 이면 department_id 컬럼의 값이 null 인 행들만 메모리(RAM)에 퍼 올리는 것이다.
-- 사원번호 사원명             월급     부서번호
--  178	  Kimberely Grant	8050     null


    -- employees 테이블에서 부서번호 30번이 아닌 사원들만(null 제외) 
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세여
select employee_id As "사원번호",
       first_name || ' ' || last_name "사원명",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름" 
from employees
where department_id != 30;

-- 또는 
-- where department_id <> 30;
-- where department_id ^= 30;


    -- employees 테이블에서 부서번호 30번이 아닌 사원들만 
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세여
select employee_id As "사원번호",
       first_name || ' ' || last_name "사원명",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름" 
from employees
where NVL(department_id, -9999) != 30; -- <>, ^=, !=
-- null을 위해서 NVL을 사용하여 null일 경우 -9999 을 사용해서 null값을 찍어준다.


-- 또는 
    -- employees 테이블에서 부서번호 30번이 아닌 사원들만 
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세여
select employee_id As "사원번호",
       first_name || ' ' || last_name "사원명",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름" 
from employees
where NOT NVL(department_id, -9999) = 30;
 -- Not은 자바에서 '!'와 같은 것이다.


    -- employees 테이블에서 부서번호 30번이 아닌 사원들만 (null 값 제외)
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세여
select employee_id As "사원번호",
       first_name || ' ' || last_name "사원명",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름" 
from employees
where NOT department_id = 30;
 -- Not은 자바에서 '!'와 같은 것이다.
 
 
    -- employees 테이블에서 부서번호 null이 아닌 사원들만 
    -- 사원번호, 사원명, 월급, 부서번호를 나타내세여
 select employee_id As "사원번호",
       first_name || ' ' || last_name "사원명",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름" 
from employees
where NOT NVL(department_id, -9999) = -9999;
 -- Not은 자바에서 '!'와 같은 것이다.
 
 --또는 

    -- Null은 is 연산자를 사용하여 나타낸다.
 select employee_id As "사원번호",
       first_name || ' ' || last_name "사원명",              
       nvl(salary + (salary * commission_pct), salary) 월급1,
       department_id "부서 이름" 
from employees
where department_id is null; 


----- *** select 되어져 나온 데이터를 정렬(오름차순 정렬, 내림차순 정렬)하여 보여주자 **** -----

-- salary 컬럼의 값을 오름차순 정렬하여 보이세요 --
select employee_id, first_name, last_name, salary, department_id
from employees
order by salary asc;        -- asc는 오름차순을 뜻한다.

-- salary 컬럼의 값을 오름차순 정렬하여 보이세요 --
select employee_id, first_name, last_name, salary, department_id
from employees
order by salary;        -- asc는 오름차순을 뜻한다. (asc는 생략도 가능하다.)


-- salary 컬럼의 값을 내름차순 정렬하여 보이세요 --
select employee_id, first_name, last_name, salary, department_id
from employees
order by salary desc;    -- desc는 내림차순을 뜻한다. (desc는 생략이 불가능하다, 이유는 오름차순때문에)


-- 월급에 오름차순으로 정렬해서 나타내세요
select employee_id, 
       first_name, 
       last_name,              
       nvl(salary + (salary * commission_pct), salary) As "월급", 
       department_id 
from employees
--order by nvl(salary + (salary * commission_pct), salary) asc;
-- 또는
-- order by 월급 asc;   -- select 뒤에 실행되기 때문에 별칭으로 불러올 수 있다.
--order by 4 asc;        -- select에 쓰여준 컬럼의 순서를 숫자로 나타낼 수 있다. 4는 월급을 뜻한다.
order by 4;


-- 월급에 내림차순으로 정렬해서 나타내세요
select employee_id, 
       first_name, 
       last_name,              
       nvl(salary + (salary * commission_pct), salary) As "월급", 
       department_id 
from employees
--order by nvl(salary + (salary * commission_pct), salary) desc;
-- 또는
-- order by 월급 desc;   -- select 뒤에 실행되기 때문에 별칭으로 불러올 수 있다.
order by 4 desc;        -- select에 쓰여준 컬럼의 순서를 숫자로 나타낼 수 있다. 4는 월급을 뜻한다.




-- 정렬, 오름차순 정렬, 내림차순정렬을 할 때 null 은 존재하지 않는 것이므로
-- 오라클에서는 null을 가장 큰  것으로 간주를 해주고 마이크로소프트 사의 ms-SQL Server에서는 가장 작은 것으로 간주한다.


---- department_id 칼럼의 값을 기준으로 오름차순 정렬하여 보이세요 ----
select employee_id, 
       first_name, 
       last_name,              
       salary + (salary * commission_pct),
       salary, 
       department_id 
from employees
order by department_id asc;

---- department_id 칼럼의 값을 기준으로 내림차순 정렬하여 보이세요 ----
select employee_id, 
       first_name, 
       last_name,              
       salary + (salary * commission_pct),
       salary, 
       department_id 
from employees
order by department_id desc;


---- *** 1차정렬, 2차 정렬에 대해서 알아봅니다. *** ----

-- employees 테이블에서 부서번호별 오름차순 정렬을 한 후에 동일한 부서번호 내에서는 
-- 월급의 내림차순으로 정렬하여 사원번호, 사원명, 월급, 부서번호를 나타내세요

select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       nvl(salary + (salary * commission_pct), salary) AS 월급,
       department_id AS 부서번호
from employees
order by 4 asc, 3 desc;
-- 1차 정렬, 4번째 컬럼인 부서번호로 오름차순 정렬(asc는 생략 가능) , 2차 정렬, 3번째 컬럼인 월급을 내림차순으로 정렬


select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       nvl(salary + (salary * commission_pct), salary) AS 월급,
       department_id AS 부서번호
from employees
order by 4, 3 desc;
-- 1차 정렬, 4번째 컬럼인 부서번호로 오름차순 정렬(asc는 생략 가능) , 2차 정렬, 3번째 컬럼인 월급을 내림차순으로 정렬

/*
    employees 테이블에서 commission_pct 가 null인 사람들만 
    사원번호, 사원명, 월급(기본급여 = 수당금액), 부서번호를 나타내되
    부서번호의 오름차순으로 정렬한 후 동일한 부서번호 내에서는 월급의 내림차순으로 나타내세요
*/
select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       nvl(salary + (salary * commission_pct), salary) AS 월급,
       department_id AS 부서번호
from employees
where commission_pct is null
order by 4, 3 desc;

/*
    employees 테이블에서 commission_pct 가 null이 아닌 사람들만 
    사원번호, 사원명, 월급(기본급여 = 수당금액), 부서번호를 나타내되
    부서번호의 오름차순으로 정렬한 후 동일한 부서번호 내에서는 월급의 내림차순으로 나타내세요
*/
select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       nvl(salary + (salary * commission_pct), salary) AS 월급,
       department_id AS 부서번호
from employees
where NOT commission_pct is null
order by 4, 3 desc;


/*
    employees 테이블에서 월급(기본급여 = 수당금액) 10000보다 큰 사원들만 
    사원번호, 사원명, 월급(기본급여 = 수당금액), 부서번호를 나타내되
    부서번호의 오름차순으로 정렬한 후 동일한 부서번호 내에서는 월급의 내림차순으로 나타내세요
*/
select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       nvl(salary + (salary * commission_pct), salary) AS 월급,
       department_id AS 부서번호
from employees
where nvl(salary + (salary * commission_pct), salary) > 10000
order by 4, 3 desc;

/*
    employees 테이블에서 부서번호가 50번 부서가 아닌 사람들만 (null값도 포함)
    사원번호, 사원명, 월급(기본급여 = 수당금액), 부서번호를 나타내되
    부서번호의 오름차순으로 정렬한 후 동일한 부서번호 내에서는 월급의 내림차순으로 나타내세요
*/

--null 이 쓰이는지 안쓰이는지 모르면 먼저 확인해보자 테이블 구조 파악 
desc employees;

select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       nvl(salary + (salary * commission_pct), salary) AS 월급,
       department_id AS 부서번호
from employees
where nvl(department_id, -9999) != 50
order by 4, 3 desc;




-------------------------------------------------------------------------
------------ ****  AND    OR    IN()     NOT  연산자 *** -----------------

-------------------------- AND 부분 ------------------------------
-- employees 테이블에서 80번 부서에 근무하는 사람들중에 기본급여가 10000이상인 사람들만 
-- 사원번호, 사원명, 기본급여, 부서변호를 나타내세요

select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       Salary AS 월급,
       department_id AS 부서번호
from employees
where department_id = 80 AND Salary >= 10000;


----------------------------OR 부분------------------------------
-- employees 테이블에서 30,60,80번 부서에 근무하는 사람들만
-- 사원번호, 사원명, 기본급여, 부서변호를 나타내세요
select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       Salary AS 월급,
       department_id AS 부서번호
from employees
where department_id = 30 OR department_id = 60 OR department_id = 80 
order by 부서번호;

-- 또는
--------------------------- IN() 부분 -----------------------------
-- IN()은 or와 같다.
select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       Salary AS 월급,
       department_id AS 부서번호
from employees
where department_id in(30,60,80)   -- where department_id = 30 OR department_id = 60 OR department_id = 80 와 같은 기능 
order by 부서번호;


-- employees 테이블에서 30,60,80번 부서에 근무하지 않는 사람들만
-- 사원번호, 사원명, 기본급여, 부서변호를 나타내세요

-- 미리미리 테이블 황긴 
desc employees;

select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       Salary AS 월급,
       department_id AS 부서번호
from employees
where NVL(department_id, -9999) != 30 and
        NVL(department_id, -9999) != 60 and
        NVL(department_id, -9999) != 80 
--where NOT department_id in(30,60,80)   -- where department_id = 30 OR department_id = 60 OR department_id = 80 와 같은 기능 
--또는 where department_id != 30 and department_id != 60 and department_id != 800
order by 부서번호;



---------------------------------------- NOT 연산자 -----------------------------------
-- employees 테이블에서 30,60,80번 부서에 근무하지 않는 사람들만
-- 사원번호, 사원명, 기본급여, 부서변호를 나타내세요

-- 미리미리 테이블 황긴 
desc employees;

select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       Salary AS 월급,
       department_id AS 부서번호
from employees
where nvl(department_id,-9999) NOT in(30,60,80)   -- where department_id = 30 OR department_id = 60 OR department_id = 80 와 같은 기능 
--또는 where department_id != 30 and department_id != 60 and department_id != 800
order by 부서번호;

-- 또는 
select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       Salary AS 월급,
       department_id AS 부서번호
from employees
where NOT nvl(department_id,-9999) in(30,60,80)   -- where department_id = 30 OR department_id = 60 OR department_id = 80 와 같은 기능 
--또는 where department_id != 30 and department_id != 60 and department_id != 800
order by 부서번호;


-- employees 테이블에서 부서번호가 30, 50,60번 부서에 근무하는 사원들중에 
-- 연봉(월급*12)이 20000 이상 60000이하인 사원들만 
-- 사원번호, 사원명, 연봉,부서번호를 나타내되
-- 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서는 연봉의 내림차순으로 나타내세요 

select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       nvl(salary + (salary * commission_pct), salary) * 12 AS 연봉 ,
       department_id AS 부서번호
from employees
where department_id = 30 OR department_id = 50 OR department_id = 60 AND
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, 연봉 desc;      
-- 이것은 틀린 풀이이다!!!!! ----


------ *** AND와 OR가 혼용되어지면 우선순위는 AND가 먼저 실행된다. **** -------
--         연산자에서 있어서 가장 최우선은 괄호()가 가장 우선시 된다.

select 2 + 5 * 3, (2+5)*3
from dual;

select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       nvl(salary + (salary * commission_pct), salary) * 12 AS 연봉 ,
       department_id AS 부서번호
from employees
where (department_id = 30 OR department_id = 50 OR department_id = 60) AND
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, 연봉 desc;      
-- ()가 먼저 실행이므로 정답이 된다 !!!!!

-- 또는 
select employee_id AS 사원번호 ,
       first_name || ' ' || last_name AS 사원명,
       nvl(salary + (salary * commission_pct), salary) * 12 AS 연봉 ,
       department_id AS 부서번호
from employees
where department_id in(30,50,60) AND
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, 연봉 desc;    
-- 올바른 풀이이다 in()은 괄호가 있는 OR이다


            ------ ****  ==== 범위 연산자 ====  **** ----------
--     >    <   >=   <= , between A and B (A부터 B까지 )
-- 범위 연산자에 사용되는 데이터는 숫자 뿐만 아니라 문자, 날짜까지 모두 사용된다.
  
   --- *** 현재 시각을 알려주는 것 *** ===

select sysdate, current_date, localtimestamp, current_timestamp, systimestamp
from dual;

/*
    날짜 타입은 date 이다.
    date타입의 기본적인 표현방식은 'RR/MM/DD' 이것으로 나타내어진다.
    
    RR 은 연도의 2자리만 나타내어 주는데 50 ~ 99 는 1950 ~ 1999 을 말하는 것이다.
    RR 은 연도의 2자리만 나타내어 주는데 00 ~ 49 는 2000 ~ 2049 을 말하는 것이다. 
    MM 은 월이고 DD는 일이다.
*/

select sysdate
    , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')  -- mi는 분이다.
    , to_char(sysdate, 'yyyy-mm-dd am hh:mi:ss')  -- 12시간체계는 오후인지 오전인지 모름 고로 am,또는pm을 붙인다.
    , to_char(sysdate, 'yyyy-mm-dd pm hh:mi:ss')
    -- 23/02/03	2023-02-03 16:05:17    	2023-02-03 오후 04:05:17   	2023-02-03 오후 04:05:17
from dual;


desc employees;        -- HIRE_DATE   DATE(날짜)

select employee_id AS 사원번호
    , first_name || ' ' || last_name AS 사원명
    , hire_date AS 입사일자
    , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss')
from employees;
-- 154	Nanette Cambrault	06/12/09	2006-12-09 00:00:00

--update 해보자 
update employees set hire_date = to_date('2006-12-31 09:00:00', 'yyyy-mm-dd hh24:mi:ss')  
-- to_date는 날짜타입으로 변경한다. 위에 = 는 대입하는것을 뜻함 
where employee_id = 154;
-- 1 행 이(가) 업데이트되었습니다.

commit;
-- 커밋 완료.

select employee_id AS 사원번호
    , first_name || ' ' || last_name AS 사원명
    , hire_date AS 입사일자
    , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss')
from employees;
-- 154	Nanette Cambrault	06/12/31	2006-12-31 09:00:00  바뀌었다.


-- ;을 마지막에 꼭 찍어야 할까  당연하다/

select *
from departments;

select employee_id AS 사원번호
,  first_name || ' ' || last_name As 사원명
from employees;

--employees 테이블에서 입사일자가 2005년 1월 1일부터 2006년 12월 31일 까지 입사한 사원들만 
-- 사원번호, 사원명, 입사일자를 나타내세요

select employee_id AS 사원번호,
       first_name || ' ' || last_name AS 사원명,
       hire_date AS 입사일자
       , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss')
from employees
where '05/01/01' <= hire_date AND hire_date <= '06/12/31'
order by 3;
-- 이것은 틀린 풀이이다.!!!!

---- !!!!!!!!!!!!중요!!!!!!!!!!!!------
-- 날짜를 나타낼 때 시,분,초가 없는 년,월,일 만 너타내어주면 자동적으로 시,분,초는 0시0분0초가 된다.
-- 즉 자정(그날의 시작)을 뜻한다.

select employee_id AS 사원번호,
       first_name || ' ' || last_name AS 사원명,
       hire_date AS 입사일자
       , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss')

from employees
where '05/01/01' <= hire_date AND hire_date < '07/01/01'
order by 3; 
---> 이것은 올바른 풀이 !!!

'A' ==> 65
'a' ==> 97
'0' ==> 48
' ' ==> 32  
select ascii('A'), ascii('a'), ascii('0'), ascii(' ')
from dual;
-- 65	97	48	32

select chr(65), chr(97), chr(48), chr(32)
from dual;
-- A	a	0	 ' '



-- employee 테이블에서 first_nae 컬럼의 값이 'EIJ' 부터'I' 까지만 데이터를 가지는 사람들만 dirst_name 을 출력하세요.

select first_name
from employees
where 'EIJ' <= first_name AND first_name <= 'I'
order by 1;
-- 'EIJ' 'EIJa' 'EIjast' ~~~~~~~~ 'HAsdfa' 'HbHW' 'I'   ~~~~~~ 'Hasdfsd' 'Hsdas'  / 'I' 'IA'
-- ============================================================================  /
                                    포함                                              불포함
                                    
-- 또는 !!!!!!!!!!!!!!!!!!!!!between기억하기!!!!!!!!!!!!!!!!!!!!!!!!!!
select first_name
from employees
where first_name between 'EIJ' and 'I'
order by 1;

/*
Eleni
Elizabeth
Ellen
Gerald
Girard
Guy
Harrison
Hazel
Hermann
*/



-------------------------------------------------------------------

-- 어떤 테이블에 존재하는 행의 컬럼의 값을 변경하려고 할 때는 update 명령어를 사용해서 변경해준다.

select *
from employees
where employee_id = 100;
--- Steven King

update employees set first_name = '민', last_name = '동현'
where employee_id = 100;
-- 1 행 이(가) 업데이트되었습니다.

select *
from employees
where employee_id = 100;
-- 100	민	동현	SKING	515.123.4567	03/06/17	AD_PRES	24000			90


-- 메모리 취소하기 
rollback;   --> 메모리(RAM) 상에서 변경되어진 정보를(민   동현)을 삭제해 주는 것이다.
            --> 즉, 위에서 실행한 update 명령을 한 결과를 취소하겠다는 말이다.
-- 롤백 완료.

select *
from employees
where employee_id = 100;
-- 100	Steven	King

update employees set first_name = '민', last_name = '동현'
where employee_id = 100;
-- 1 행 이(가) 업데이트되었습니다.

commit;    --> 메모리(RAM) 상에서 변경되어진 것을 실제 디스크(DISK) 파일에 적용시켜주는 것이다.
-- 커밋 완료.

select *
from employees
where employee_id = 100;
-- 100	민	동현

-- 메모리 취소하기 
rollback;   --> 메모리(RAM) 상에서 변경되어진 정보를(민   동현)을 삭제해 주는 것이다.
            --> 즉, 위에서 실행한 update 명령을 한 결과를 취소하겠다는 말이다.
-- 롤백 완료.

select *
from employees
where employee_id = 100;
-- 100	민	동현
--> 커밋을 하면 rollback 을 해도 저장된 이름이 변경되지 않는다.


update employees set first_name = 'Steven', last_name = 'King'
where employee_id = 100;
-- 1 행 이(가) 업데이트되었습니다.

-- (메모리 상에서 변경된것) 디스크에는 변경 안됨 
select *
from employees
where employee_id = 100;
-- 100	Steven	King

commit;

select *
from employees
where employee_id = 100;
-- 100	Steven	King


    ---- *** employees 테이블에 jubun(주민번호) 이라는 컬럼을 추가해 봅시다 *** -----
    select '01098765432', 01098765432
    from dual;
    -- 01098765432	1098765432  문자열은 앞에 0이 나옴, 숫자는 앞에 0이 생략 
    --(결과에서 왼쪽 맞춤은 문자, 오른쪽 맞춤은 숫자)
/*
    jubun(주민번호) 컬럼의 값을 입력할때는 '-'는 빼고 숫자로만 입력할 것입니다.
    jubun(주민번호) 컬럼의 값을 입력할때는 맨 처음 첫자리에 0이 들어올 수 있가 때문에 
    number 타입이 아니라 varchar2 타입으로 해야 한다.
    왜냐하면 number 타입으로 해주면 맨 앞에 입력한 값이 0 일대는 0이 생략되어지기 때문이다.
    맨 앞의 0도 나오게 하려면 컬럼의 데이터 타입은 varchar2 가 되어야 한다.
*/


    -------------- 컬럼 추가하기 ------------------
    -- employees 테이블을 변경한다.
    alter table employees
    -- 주번을 추가한다.
    add jubun varchar2(13);
    -- Table EMPLOYEES이(가) 변경되었습니다.
    
    desc employees;
    -- JUBUN                   VARCHAR2(13) 
    
    select *
    from employees;
    
    update employees set jubun = '6010151234567'  
    where employee_id = 100;

    update employees set jubun = '8510151234567'
    where employee_id = 101;
    
    update employees set jubun = '6510152234567'
    where employee_id = 102;
    
    update employees set jubun = '7510151234567'
    where employee_id = 103;
    
    update employees set jubun = '6110152234567'
    where employee_id = 104;
    
    update employees set jubun = '6510151234567'
    where employee_id = 105;
    
    update employees set jubun = '6009201234567'
    where employee_id = 106;
    
    update employees set jubun = '0803153234567'
    where employee_id = 107;
    
    update employees set jubun = '0712154234567'
    where employee_id = 108;
    
    update employees set jubun = '8810151234567'
    where employee_id = 109;
    
    update employees set jubun = '8908152234567'
    where employee_id = 110;
    
    update employees set jubun = '9005052234567'
    where employee_id = 111;
    
    update employees set jubun = '6610151234567'
    where employee_id = 112;
    
    update employees set jubun = '6710151234567'
    where employee_id = 113;
    
    update employees set jubun = '6709152234567'
    where employee_id = 114;
    
    update employees set jubun = '6110151234567'
    where employee_id = 115;
    
    update employees set jubun = '6009301234567'
    where employee_id = 116;
    
    update employees set jubun = '6110152234567'
    where employee_id = 117;
    
    update employees set jubun = '7810151234567'
    where employee_id = 118;
    
    update employees set jubun = '7909151234567'
    where employee_id = 119;
    
    update employees set jubun = '7702152234567'
    where employee_id = 120;
    
    update employees set jubun = '7009151234567'
    where employee_id = 121;
    
    update employees set jubun = '7111011234567'
    where employee_id = 122;
    
    update employees set jubun = '8010131234567'
    where employee_id = 123;
    
    update employees set jubun = '8110191234567'
    where employee_id = 124;
    
    update employees set jubun = '9012132234567'
    where employee_id = 125;
    
    update employees set jubun = '9406251234567'
    where employee_id = 126;
    
    update employees set jubun = '9408252234567'
    where employee_id = 127;
    
    update employees set jubun = '9204152234567'
    where employee_id = 128;
    
    update employees set jubun = '8507251234567'
    where employee_id = 129;
    
    update employees set jubun = '6511111234567'
    where employee_id = 130;
    
    update employees set jubun = '0010153234567'
    where employee_id = 131;
    
    update employees set jubun = '0005254234567'
    where employee_id = 132;
    
    update employees set jubun = '0110194234567'
    where employee_id = 133;
    
    update employees set jubun = '0412154234567'
    where employee_id = 134;
    
    update employees set jubun = '0503253234567'
    where employee_id = 135;
    
    update employees set jubun = '9510012234567'
    where employee_id = 136;
    
    update employees set jubun = '9510021234567'
    where employee_id = 137;
    
    update employees set jubun = '9610041234567'
    where employee_id = 138;
    
    update employees set jubun = '9610052234567'
    where employee_id = 139;
    
    update employees set jubun = '7310011234567'
    where employee_id = 140;
    
    update employees set jubun = '7310092234567'
    where employee_id = 141;
    
    update employees set jubun = '7510121234567'
    where employee_id = 142;
    
    update employees set jubun = '7612012234567'
    where employee_id = 143;
    
    update employees set jubun = '7710061234567'
    where employee_id = 144;
    
    update employees set jubun = '7810052234567'
    where employee_id = 145;
    
    update employees set jubun = '6810251234567'
    where employee_id = 146;
    
    update employees set jubun = '6811062234567'
    where employee_id = 147;
    
    update employees set jubun = '6712052234567'
    where employee_id = 148;
    
    update employees set jubun = '6011251234567'
    where employee_id = 149;
    
    update employees set jubun = '6210062234567'
    where employee_id = 150;
    
    update employees set jubun = '6110191234567'
    where employee_id = 151;
    
    update employees set jubun = '5712062234567'
    where employee_id = 152;
    
    update employees set jubun = '5810231234567'
    where employee_id = 153;
    
    update employees set jubun = '6311051234567'
    where employee_id = 154;
    
    update employees set jubun = '6010182234567'
    where employee_id = 155;
    
    update employees set jubun = '6110191234567'
    where employee_id = 156;
    
    update employees set jubun = '6210112234567'
    where employee_id = 157;
    
    update employees set jubun = '6311132234567'
    where employee_id = 158;
    
    update employees set jubun = '8511112234567'
    where employee_id = 159;
    
    update employees set jubun = '8710131234567'
    where employee_id = 160;
    
    update employees set jubun = '8710072234567'
    where employee_id = 161;
    
    update employees set jubun = '9010171234567'
    where employee_id = 162;
    
    update employees set jubun = '9112072234567'
    where employee_id = 163;
    
    update employees set jubun = '9110241234567'
    where employee_id = 164;
    
    update employees set jubun = '9212251234567'
    where employee_id = 165;
    
    update employees set jubun = '9310232234567'
    where employee_id = 166;
    
    update employees set jubun = '9811151234567'
    where employee_id = 167;
    
    update employees set jubun = '9810252234567'
    where employee_id = 168;
    
    update employees set jubun = '9910301234567'
    where employee_id = 169;
    
    update employees set jubun = '0910153234567'
    where employee_id = 170;
    
    update employees set jubun = '1011153234567'
    where employee_id = 171;
    
    update employees set jubun = '1006153234567'
    where employee_id = 172;
    
    update employees set jubun = '1111154234567'
    where employee_id = 173;
    
    update employees set jubun = '1209103234567'
    where employee_id = 174;
    
    update employees set jubun = '1207154234567'
    where employee_id = 175;
    
    update employees set jubun = '0906153234567'
    where employee_id = 176;
    
    update employees set jubun = '0812113234567'
    where employee_id = 177;
    
    update employees set jubun = '9810132234567'
    where employee_id = 178;
    
    update employees set jubun = '8712111234567'
    where employee_id = 179;
    
    update employees set jubun = '8310012234567'
    where employee_id = 180;
    
    update employees set jubun = '6510191234567'
    where employee_id = 181;
    
    update employees set jubun = '6510221234567'
    where employee_id = 182;
    
    update employees set jubun = '6510232234567'
    where employee_id = 183;
    
    update employees set jubun = '8512131234567'
    where employee_id = 184;
    
    update employees set jubun = '8510182234567'
    where employee_id = 185;
    
    update employees set jubun = '7510192234567'
    where employee_id = 186;
    
    update employees set jubun = '8512192234567'
    where employee_id = 187;
    
    update employees set jubun = '9511151234567'
    where employee_id = 188;
    
    update employees set jubun = '7509302234567'
    where employee_id = 189;
    
    update employees set jubun = '8510161234567'
    where employee_id = 190;
    
    update employees set jubun = '9510192234567'
    where employee_id = 191;
    
    update employees set jubun = '0510133234567'
    where employee_id = 192;
    
    update employees set jubun = '0810194234567'
    where employee_id = 193;
    
    update employees set jubun = '0910183234567'
    where employee_id = 194;
    
    update employees set jubun = '1010134234567'
    where employee_id = 195;
    
    update employees set jubun = '9510032234567'
    where employee_id = 196;
    
    update employees set jubun = '9710181234567'
    where employee_id = 197;
    
    update employees set jubun = '9810162234567'
    where employee_id = 198;
    
    update employees set jubun = '7511171234567'
    where employee_id = 199;
    
    update employees set jubun = '7810172234567'
    where employee_id = 200;
    
    update employees set jubun = '7912172234567'
    where employee_id = 201;
    
    update employees set jubun = '8611192234567'
    where employee_id = 202;
    
    update employees set jubun = '7810252234567'
    where employee_id = 203;
    
    update employees set jubun = '7803251234567'
    where employee_id = 204;
    
    update employees set jubun = '7910232234567'
    where employee_id = 205;
    
    update employees set jubun = '8010172234567'
    where employee_id = 206;
    
    commit;
    
    select *
    from employees;