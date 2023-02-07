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


-- employees 테이블에서 부서번호가 30, 50, 60번 부서에 근무하는 사원들중에 
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

--'A' ==> 65
--'a' ==> 97
--'0' ==> 48
--' ' ==> 32  
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
                               -- 포함                                              불포함
                                    
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
    
    
    -------------------------------------------------------------
    
    
    
            ---- **** ==== like 연산자 ==== **** ----
    
    select *
    from employees
    where department_id = 30;
    
    select *
    from employees
    where department_id like 30;
    -- 위 = 와 아래 like 는 같다 
    /*
        like 연산자와 함께 사용되어지는 % 와 _ 를 wild character 라고 부른다.
        like 연산자와 함께 사용되어지는 %의 뜻은 글자수와 관계없이 글자가 있든지 없든지 관계 없다라는 말이고, 
        like 연산자와 함께 사용되어지는 _의 뜻은 반드시 아무글자 1개만을 뜻하는 것이다.
    */
    
    --employees 테이블에서 여자 1990년생과 남자 1991년생의 사원들만 사원번호, 사원명, 주민번호를 나타내세요
    
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원병
          , jubun AS 주민번호 
    from employees
    where jubun like '90____2%' OR jubun like '91____1%';    -- %는 나머지가 다 아무숫자와도 관계없음, _는 한자리만 아무숫자와도 관계없음 
    
    -- employees 테이블에서 first_name 컬럼의 값이 'J'로 시작하는 사원들만 
    -- 사원번호, 이름, 성, 기본급여를 나타내세요
    
    select employee_id, first_name, last_name, salary
    from employees
    where first_name like 'J%';

    
    -- employees 테이블에서 first_name 컬럼의 값이 's'로 끝나는 사원들만 
    -- 사원번호, 이름, 성, 기본급여를 나타내세요

    select employee_id, first_name, last_name, salary
    from employees
    where first_name like '%s';
    
    -- employees 테이블에서 first_name 컬럼의 값이 'ee'라는 글자가 들어있는 사원들만 
    -- 사원번호, 이름, 성, 기본급여를 나타내세요
    
    select employee_id, first_name, last_name, salary
    from employees
    where first_name like '%ee%';
    
    -- employees 테이블에서 first_name 컬럼의 값이 'e'가 2개 이상 들어있는 사원들만 
    -- 사원번호, 이름, 성, 기본급여를 나타내세요
    
    select employee_id, first_name, last_name, salary
    from employees
    where first_name like '%e%e%';
    
    
    -- employees 테이블에서 last_name 컬럼의 값이 첫글자는 'F' 이고, 두번째 글자는 아무거나이고, 
    -- 세번째 글자는 소문자 'e'이며 4번째 부터는 글자가 있던지 없던지 상관없는 사원들만 
    -- 사원번호, 이름, 성, 기본급여를 나타내세요
    
    select employee_id, first_name, last_name, salary
    from employees
    where last_name like 'F_e%';
    
    
    
    
    
    -- 테이블을 만들어보자 
    create table tbl_watch
    (watchname  varchar2(10)   -- varchar2(10) 은 최대 10byte까지만 허용한다.
    );
    -- Table TBL_WATCH이(가) 생성되었습니다.
    
    
    -- 어떤 테이블에 데이터(행) 입력할때는 insert라는 명령어를 사용한다.
    
    select *
    from tbl_watch;
    
    
    insert into tbl_watch values('goldwatch');  -- 한글은 한 글자당 3byte,  9BYTE
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_watch values('gold시계');   -- 10BYTE
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_watch values('손목시계');   -- 12BYTE
    /*
    오류 보고 -
    ORA-12899: "HR"."TBL_WATCH"."WATCHNAME" 열에 대한 값이 너무 큼(실제: 12, 최대값: 10)
    */
    
    select *
    from tbl_watch;
    /*
    goldwatch
    gold시계
    */
    
    
         -- tbl_watch 테이블을 삭제합니다. -- 
    drop table tbl_watch purge;
    -- Table TBL_WATCH이(가) 삭제되었습니다.
    
    
    -- 테이블을 만들어보자 
    create table tbl_watch
    (watchname  Nvarchar2(10)   -- Nvarchar2(10)는 최대 글자수가 10개까지만 허용한다.-- 
    );
    
    insert into tbl_watch values('goldwatch');  --9글자 
     -- 1 행 이(가) 삽입되었습니다.
    insert into tbl_watch values('gold시계');   --6글자 
    -- 1 행 이(가) 삽입되었습니다.
    insert into tbl_watch values('손목시계');   --4글자 
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_watch values('은손목시계');   --5글자 
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_watch values('순은손목시계');   --6글자 
    -- 1 행 이(가) 삽입되었습니다.
   
    insert into tbl_watch values('값비싼황금최고급손목시계');    --12글자 
    /*
    오류 보고 -
    ORA-12899: "HR"."TBL_WATCH"."WATCHNAME" 열에 대한 값이 너무 큼(실제: 12, 최대값: 10)
    */
    
    insert into tbl_watch values('silverwatch');  -- 글자수 11개 
    /*
    오류 보고 -
    ORA-12899: "HR"."TBL_WATCH"."WATCHNAME" 열에 대한 값이 너무 큼(실제: 11, 최대값: 10)
    */
    
    select * 
    from tbl_watch;
    /*
    goldwatch
    gold시계
    손목시계
    은손목시계
    순은손목시계
    */
    desc tbl_watch;
    
    desc employees;
    
         -- tbl_watch 테이블을 삭제합니다. -- 
    drop table tbl_watch purge;
    -- Table TBL_WATCH이(가) 삭제되었습니다.
    
    
     
      -- 테이블을 만들어보자 
    create table tbl_watch
    (watchname  varchar2(4001)   -- varchar2를 사용시 최대 크기는 4000byte이다.
    );                             
    /*
    오류 보고 -
    ORA-00910: 데이터형에 지정된 길이가 너무 깁니다
    */
    
      -- 테이블을 만들어보자 
    create table tbl_watch
    (watchname  varchar2(4000)   -- varchar2를 사용시 최대 크기는 4000byte이다.
    );   
    -- Table TBL_WATCH이(가) 생성되었습니다.



          -- tbl_watch 테이블을 삭제합니다. -- 
    drop table tbl_watch purge;
    -- Table TBL_WATCH이(가) 삭제되었습니다.
    
    
    
    
      -- 테이블을 만들어보자 
    create table tbl_watch
    (watchname  Nvarchar2(2001)   -- Nvarchar2를 사용시 최대 크기는 2000글자이다.
    );  
    /*
    오류 보고 -
    ORA-00910: 데이터형에 지정된 길이가 너무 깁니다
    */
    
      -- 테이블을 만들어보자 
    create table tbl_watch
    (watchname  Nvarchar2(2000)   -- Nvarchar2를 사용시 최대 크기는 2000글자이다.
    ); 
    -- Table TBL_WATCH이(가) 생성되었습니다.


      -- tbl_watch 테이블을 삭제합니다. -- 
    drop table tbl_watch purge;
    -- Table TBL_WATCH이(가) 삭제되었습니다.
    
    
    
     ---- **** ==== like 연산자와 함께 사용되어지는 %와 _ 인 wild character의 escape(탈출) 시키기 ==== **** ----
    
      -- 테이블을 만들어보자 
    create table tbl_watch
    (watchname  Nvarchar2(10)   -- Nvarchar2를 사용시 최대 크기는 2000글자이다.
    , bigo      Nvarchar2(100)
    ); 
    -- Table TBL_WATCH이(가) 생성되었습니다.

    insert into tbl_watch(watchname, bigo) values( '금시계', '순금 99.99% 합류 고급시계');
    -- 1 행 이(가) 삽입되었습니다.

    insert into tbl_watch(watchname, bigo) values('은시계', '고객만족도 99.99점 획득한 고급시계');
    -- 1 행 이(가) 삽입되었습니다.

    -- 여기까지는 메모리 상에만 올라가있다.
    
    select * 
    from tbl_watch;
    
    rollback;
    -- 롤백 완료.

    select * 
    from tbl_watch;
    -- 아무것도 안보임 
    
    
     -- 테이블을 만들어보자 
    create table tbl_watch
    (watchname  Nvarchar2(10)   -- Nvarchar2를 사용시 최대 크기는 2000글자이다.
    , bigo      Nvarchar2(100)
    ); 
    -- Table TBL_WATCH이(가) 생성되었습니다.

    insert into tbl_watch(watchname, bigo) values( '금시계', '순금 99.99% 합류 고급시계');
    -- 1 행 이(가) 삽입되었습니다.

    insert into tbl_watch(watchname, bigo) values('은시계', '고객만족도 99.99점 획득한 고급시계');
    -- 1 행 이(가) 삽입되었습니다.
    
    select * 
    from tbl_watch;
    
    commit;
    -- 커밋 완료.
    -- 디스크에 저장 완료 

    select * 
    from tbl_watch;
    
    rollback;
    -- 롤백 완료.
    -- 롤백 해와도 디스크에 이미 저장했기 때문에 아무리 롤백해도 안됨 
    
    
    
    -- tbl_watch 테이블에서 bigo 컬럼에 99.99% 라는 글자가 들어있는 행만 추출하세요.
    
    select *
    from tbl_watch
    where bigo like '%99.99%%';
    -- 전부 다나옴 
    
    
   
    -- escape 문자로 '\'를 주었으므로 '\' 다음에 나오는 wild character인 % 나 _ 1개만 wild character 기능을 상실하고 글자 그대로 %(퍼센트) 또는 _(언더바) 로 인식을 해준다. 
    select *
    from tbl_watch
    where bigo like '%99.99\%%'  escape '\' ;
    -- 금시계	순금 99.99% 합류 고급시계 만 나온다.
    
    
    -- escape 문자로 '2'를 주었으므로 '2' 다음에 나오는 wild character인 % 나 _ 1개만 wild character 기능을 상실하고 글자 그대로 %(퍼센트) 또는 _(언더바) 로 인식을 해준다. 
    select *
    from tbl_watch
    where bigo like '%99.992%%'  escape '2' ;
    -- 금시계	순금 99.99% 합류 고급시계 
    
    
    -- escape 문자로 'a'를 주었으므로 'a' 다음에 나오는 wild character인 % 나 _ 1개만 wild character 기능을 상실하고 글자 그대로 %(퍼센트) 또는 _(언더바) 로 인식을 해준다. 
    select *
    from tbl_watch
    where bigo like '%99.99a%%'  escape 'a' ;
    -- 금시계	순금 99.99% 합류 고급시계 
    
    
    
    
    ------------------------------------------------------------------------------
                            -- >> 단일행 함수 << --
                          
    /*                      
        ※ 단일행 함수의 종류                     
        
        1. 문자 함수 
        2. 숫자 함수
        3. 날짜 함수 
        4. 변환 함수 
        5. 기타 함수 
    */                    
               
    
    -------------------- >> 1. 문자 함수 << ----------------------------
    
    -- 1.1 upper('문자열')  ==> '문자열' 에서 소문자가 있으면 모두 대문자로 변환시켜주는 것
    
    select 'kOreA SEoul', upper('kOreA SEoul')
    from dual;
    -- kOreA SEoul	KOREA SEOUL                  
    
    
    
    -- 1.2 lower('문자열')  ==> '문자열' 에서 대문자가 있으면 모두 소문자로 변환시켜주는 것
    
    select 'kOreA SEoul', lower('kOreA SEoul')
    from dual;
    -- kOreA SEoul	korea seoul
    
    
    -- 1.3 initcap('문자열')  ==> '문자열' 을 단어별(구분자 공백)로 첫글자만 대문자, 나머지는 소문자로 변환시켜주는 것
    select 'kOreA SEoul', initcap('kOreA SEoul')
    from dual;
    -- kOreA SEoul	Korea Seoul
    
    -- king  출력 --
    select *
    from employees
    where last_name = 'King';
    
    -- 대소문자 구별때문에 안나옴 
    select *
    from employees
    where last_name = 'KIng';
    
    -- 대소문자 구별때문에 안나옴 
    select *
    from employees
    where last_name = 'KING';
    
    
    -- King을 대 소문자 관계없이 King이 나오도록 나타내보자 --
    select last_name,  upper(last_name), lower(last_name), initcap(last_name)
    from employees;


    select *
    from employees
    --where upper(last_name) = upper('king');   -- 'KING'
    -- 또는
    --where lower(last_name) = lower('KING'); -- 'king'
    -- 또는
    where initcap(last_name) = initcap('KiNg'); -- 'King' 
    
    
    
    -- 1.4 substr('문자열', 시작글자번호, 뽑아야할 글자 길이)
    --     ==> '문자열' 중에 문자열의 특정 일부분을 선택해 올 때 사용한다.
    
    select '쌍용교육센터'
          , substr('쌍용교육센터', 2, 3)   -- '쌍용교육센터'에서 2번째 글자인 '용'부터 3글자만 뽑아온다.
          , substr('쌍용교육센터', 2)      --  '쌍용교육센터'에서 2번째 글자인 '용'부터 끝까지 뽑아온다.
    from dual;
    -- 쌍용교육센터	용교육	용교육센터
    
    
    
    ------- (퀴즈) -------
    -- substr() 함수를 사용하여 employees 테이블에서 성별이 '여자' 인 사원들만 
    -- 사원번호, 사원명, 주민번호를 나타내세요.
    
    select employee_id AS 사원번호,
          first_name || ' ' || last_name AS 사원명,
          jubun AS 주민번호
    from employees
    where substr(jubun, 7, 1) in('2','4');
    
    desc employees;
    
    -- substr() 함수를 사용하여 employees 테이블에서 1990년 ~ 1995년에 태어난 사원중 성별이 '남자' 인 사원들만 
    -- 사원번호, 사원명, 주민번호를 나타내세요.
    
    select employee_id AS 사원번호, 
          first_name || ' ' || last_name AS 사원명,
          jubun AS 주민번호
    from employees
    where substr(jubun, 7, 1) in('1') AND substr(jubun, 1, 2) between '90' AND '95';
    -- in 안에 숫자일때는 '' 을 빼줘도 자동 형변환이 된다. 하지만 ''를 적는것이 좋다.
    
    
    
    
    -- 1.5 instr : 어떤 문자열에서 명명된 문자열의 위치를 알려주는 것 --
    select '쌍용교육센터 서울교육대학교 교육문화원'
        
          , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 1, 1)   -- 첫번째 교육의 위치값을 알려줌 여긴 3
          -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나온 위치를 찾는데 
          -- 출발점이 1번째 부터 1번째 째로 나오는 '교육'의 위치를 알려달라는 말이다.
    
          , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 1, 2)   -- 두번째 교육의 위치값을 알려줌 여긴 10
          -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나온 위치를 찾는데 
          -- 출발점이 1번째 부터 2번째 째로 나오는 '교육'의 위치를 알려달라는 말이다.
          
          , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 4, 1)   -- 첫번째 교육의 위치값을 알려줌 여긴 10
          -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나온 위치를 찾는데 
          -- 출발점이 4번째 부터 1번째 째로 나오는 '교육'의 위치를 알려달라는 말이다.
          
          , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 4, 3)   -- 세번째 교육의 위치값을 알려줌 여긴 없다!!!!!
          -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나온 위치를 찾는데 
          -- 출발점이 4번째 부터 3번째 째로 나오는 '교육'의 위치를 알려달라는 말이다.
          -- 그러한 값이 없다라면 0이 나온다.!!!!!!!!
          
          , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 1)   -- 첫번째 교육의 위치값을 알려줌 여긴 3
          -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나온 위치를 찾는데 
          -- 출발점이 1번째 부터 1번째 째로 나오는 '교육'의 위치를 알려달라는 말이다.
          -- 출발점만 나오면 뒤에 , 1이 생략된 것이다.
          
          , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 4)   -- 첫번째 교육의 위치값을 알려줌 여긴 10
          -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나온 위치를 찾는데 
          -- 출발점이 4번째 부터 1번째 째로 나오는 '교육'의 위치를 알려달라는 말이다.
          -- 출발점만 나오면 뒤에 , 1이 생략된 것이다.
          
    from dual;
    
    
    
    -- 1.6 reverse : 어떤 문자열을 거꾸로 보여주는 것이다. --
    
    select 'ORACLE', reverse('ORACLE')
          ,'대한민국',  reverse('대한민국'), reverse(reverse('대한민국')) 
    from dual;
    
    
    
    ------ (퀴즈) -----
    create table tbl_files
    (fileno      number(3)
    , filepath   varchar(200)
    );
    -- Table TBL_FILES이(가) 생성되었습니다.
    
    insert into tbl_files(fileno, filepath) values(1, 'c:\myDocumnets\resume.hwp');
    insert into tbl_files(fileno, filepath) values(2, 'd:\mymusic.mp3');
    insert into tbl_files(fileno, filepath) values(3, 'c:\myphoto\2023\02\face.jpg');
    -- 1 행 이(가) 삽입되었습니다.
    
    select * 
    from tbl_files;
    
    commit;
    -- 커밋 완료.
    
    ----- 아래와 같이 나오도록 하세요 -----
    /*
        --------------------------------
        파일번호                   파일명
        --------------------------------
          1	                    resume.hwp
          2	                    mymusic.mp3
          3	                    face.jpg
    */
    
    select fileno, reverse(filepath)
          -- substr( reverse(filepath), 1, reverse(filepath) 에서 최초로 \가 나오는 위치값 -1)
          -- reverse(filepath)애소 최초로 \가 나오는 위치값
          -- instr( reverse(filepath), '\' , 1)
          --substr( reverse(filepath), 1, instr ( reverse (filepath), '\', 1) -1)
          , reverse(substr( reverse(filepath), 1, instr ( reverse (filepath), '\', 1) -1))
          
    from tbl_files;
    
    select fileno AS 파일번호,
         reverse(substr( reverse(filepath), 1, instr ( reverse (filepath), '\', 1) -1)) AS 파일명
    from tbl_files;
   
   
    select '쌍용교육센터 서울교육대학교 교육문화원'
        
          , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 1, 1)   -- 첫번째 교육의 위치값을 알려줌 여긴 3
          -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나온 위치를 찾는데 
          -- 출발점이 1번째 부터 1번째 째로 나오는 '교육'의 위치를 알려달라는 말이다.
   
          , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', -1, 1)   -- 첫번째 교육의 위치값을 알려줌 여긴 16
          -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나온 위치를 찾는데 
          -- 출발점이 역순으로 끝에서의 1번째 부터 1번째 째로 나오는 '교육'의 위치를 알려달라는 말이다.
   
          , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', -6, 2)   -- 첫번째 교육의 위치값을 알려줌 여긴 3
          -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육'이 나온 위치를 찾는데 
          -- 출발점이 역순으로 끝에서의 6번째 부터 2번째 째로 나오는 '교육'의 위치를 알려달라는 말이다.
    from dual;
   
   
   ------------------- 퀴즈의 다른 풀이 --------------------
    select fileno AS 파일번호
          --, substr( filepath, 마지막으로 \ 가 나오는 위치 값 +1) AS 파일명 
          --, instr(filepath, '\', -1 ) +1 
          , substr( filepath, instr(filepath, '\', -1) +1) AS 파일명 
    from tbl_files;
    /*
        1	resume.hwp
        2	mymusic.mp3
        3	face.jpg
    */
    
    
    
    
    
    -- 1.7 lpad : 왼쪽부터 문자를 자리 채움 ---
    -- 1.8 rpad : 오른쪽부터 문자를 자리 채움 ---
     
     select lpad('교육센터',20,'*') -- 20byte를 확보해서 거기에 '교육센터;를 넣습니다. 넣은 후 빈공간 (12byte)이 있으면 왼쪽부터 '*'로 채워라 .
     -- 두번째 숫자는 byte를 뜻함 , 여기서 한글은 2byte
           ,rpad('교육센터',20,'*') -- 20byte를 확보해서 거기에 '교육센터;를 넣습니다. 넣은 후 빈공간 (12byte)이 있으면 오른쪽부터 '*'로 채워라 .
     from dual;
     -- ************교육센터
     
     
     
     -- 1.9  ltrim : 왼쪽부터 문자를 제거한다.
     -- 1.10 rtrim : 오른쪽부터 문자를 제거한다.
     -- 1.11  trim : 왼, 오른쪽부터 공백문자를 제거한다.
     
     select ltrim('abcdbacbadbcbdadcTabcdcdSSS','abcd')
     -- TabcdcdSSS
           ,rtrim('abcdbacbadbcbdadcTabcdcd','abcd')
     -- abcdbacbadbcbdadcT
          ,ltrim(rtrim('abcdbacbadbcbdadcTabcdcd','abcd'),'abcd')  -- 왼, 오른쪽 abcd제거 
     -- T
     from dual;
     
     --- ltrim
     select '쌍용'   || '                 교육            센터'
          -- 쌍용                 교육            센터
          , '쌍용'   || ltrim('                 교육            센터')
          -- 쌍용교육            센터
     from dual;
     
     ---rtrim
     select '쌍용                     ' || '교육            센터'
          -- 쌍용                     교육            센터
          , rtrim('쌍용                     ') || '교육            센터'
          -- 쌍용교육            센터
     from dual;
     
     --trim
     select '쌍용'||'              교육            ' || '센터'
          -- 쌍용              교육            센터
          , '쌍용'||trim('              교육            ') || '센터'
          -- 쌍용교육센터
     from dual;
     
     
     
     
     -- 1.12 translate
     
     select translate('010-3456-7890'               -- 문자열
                     ,'0123456789'                  -- 바꿀문자
                     ,'영일이삼사오육칠팔구')           -- 바꿔져 출력할 문자
     -- 영일영-삼사오육-칠팔구영
     from dual;
     
     
     
     --1.13 replace
     select replace ('쌍용교육센터 서울교육대학교 교육문화원'   -- 문자열
                    ,'교육'                               -- 바꿀문자
                    ,'education')                        -- 바꿔져 출력할 문자 
     from dual;
     
     
     
     --1.14 length : 문자열의 길이를 알려주는 것
     select length('쌍용center')
     from dual;
     -- 8
     
     
     
     --------------------------------------------------------------------
     -------------------- >> 2. 숫자 함수 << ----------------------------
     
     -- 2.1 mod : 나머지를 구해주는 것 
     select 5/2, mod(5,2), trunc(5/2)
     --   나누기,  나머지,  소수부 제외 목
     from dual;
     -- 2.5     	1	      2
     
     
     -- 2.2 round : 반올림을 해주는 것 
     select 94.547
          , round(94.547, 0) --95     0은 정수 1자리까지만 나타내어준다.
          , round(94.547, 1) --94.5   1은 소수부 1자리까지만 나타내어준다.
          , round(94.547, 2) --95.55  2은 소수부 2자리까지만 나타내어준다.
          , round(94.547, -1) --90   -1은 정수 십자리까지만 나타내어준다.
          , round(94.547, -2) --100   -2은 정수 백자리까지만 나타내어준다.
          , round(94.547)     --95     뒤에 자리수를 생략하면 ,0과 같다 => 0은 정수 1자리까지만 나타내어준다.
     from dual;
     
     
     -- 2.3 trunc : 절삭을 해주는 것 
     select 94.547
          , trunc(94.547, 0) --94     0은 정수 1자리까지만 나타내어준다.
          , trunc(94.547, 1) --94.5   1은 소수부 1자리까지만 나타내어준다.
          , trunc(94.547, 2) --95.54  2은 소수부 2자리까지만 나타내어준다.
          , trunc(94.547, -1) --90   -1은 정수 십자리까지만 나타내어준다.
          , trunc(94.547, -2) --0   -2은 정수 백자리까지만 나타내어준다.
          , trunc(94.547)     --94     뒤에 자리수를 생략하면 ,0과 같다 => 0은 정수 1자리까지만 나타내어준다.
     from dual;
     
     
     
     
     
     --- *** (성적처리) *** ---
     create table tbl_sungjuk
     (hakbun       varchar2(20)
     ,name         Nvarchar2(20)
     ,kor          number(3)
     ,eng          number(3)
     ,math          number(3)
     );
     -- Table TBL_SUNGJUK이(가) 생성되었습니다.
     
     
     --- *** 데이터 입력하기 *** ---
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist001','한석규',90,92,93);
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist002','두석규',100,100,100);
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist003','세석규',71,72,73);
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist004','네석규',89,87,81);
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist005','오석규',60,50,40);
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist006','육석규',80,81,87);
     
    select *
    from tbl_sungjuk;
    
    commit;
    -- 커밋 완료.

    -------------------------------------------------------------------------------------------------------------------------------------------------------------
    --학번     성명       국어      영어      수학      총점      평균(소수부 첫째자리까지 나타내되 반올림해라)     학점(평균이90이상 'A', 80이상이면 'B', .... 60 미만이면 'F')
    -------------------------------------------------------------------------------------------------------------------------------------------------------------
     
     select  hakbun AS 학번,
             name AS 성명,
             kor AS 국어,
             eng AS 영어,
             math AS 수학,
             kor+eng+math AS 총점,
             round ((kor+eng+math)/3, 1) AS 평균, --소수 첫째자리까지 
             case 
             when round ((kor+eng+math)/3, 1) >= 90 then 'A'
             when round ((kor+eng+math)/3, 1) >= 80 then 'B'
             when round ((kor+eng+math)/3, 1) >= 70 then 'C'
             when round ((kor+eng+math)/3, 1) >= 60 then 'D'
             else 'F'
             end AS 학점 
             
           , case trunc(round((kor+eng+math)/3, 1), -1)  -- 10자리까지만 보여라 
             when 100 then 'A' 
             when 90 then 'A' 
             when 80 then 'B' 
             when 70 then 'C'
             when 60 then 'D'
             else         'F'
             end AS 학점2
             
             
           , decode (trunc(round((kor+eng+math)/3, 1), -1), 100 , 'A'
                                                          , 90  , 'A'
                                                          , 80  , 'B'
                                                          , 70  , 'C'
                                                          , 60  , 'D'
                                                                , 'F') AS 학점3
             
     from tbl_sungjuk;
     
            
            
    -------- 2.4 ~ 8 은 잘 사용하지는 않음  -------
    -- 2.4 power : 거듭제곱
    
    select 2*2*2*2*2, power(2,5)
    from dual;
    -- 32	32
    
    
    -- 2.5  sqrt : 제곱근
    select sqrt (4), sqrt(16), sqrt(2), sqrt(3)
    from dual;
    -- 2	4	1.41421356237309504880168872420969807857	1.73205080756887729352744634150587236694


    -- 2.6 sin, cos, tan. asin, acos, atan 
    
    select sin(90), cos(90), tan(90), 
           asin(0.3), acos(0.3), atan(0.3)
    from dual;
    -- 0.89399666360055789051826949840420988005	-0.44807361612917015236547731439963950742	-1.99520041220824202528735307637960237653	0.3046926540153975079720029612275291599	1.2661036727794991112593187304122222822	0.2914567944778670919956046214328911935013
    
    
    -- 2.7 log
    select log(10,100)
    from dual;
    -- 2
    
    
    -- 2.8 sign ==> 결과값이 양수이라면 1, 결과값이 0이라면 0, 결과값이 음수이라면 -1
    select sign(5-2), sign(5-5), sign(2-5)
    from dual;
    -- 1	0	-1
    
    
    
    -- 2.9 ceil(실수)   ==> 입력되어진 실수 보다 큰 최소의 정수를 나타내어 준다.
    --     ceil(정수)   ==> 입력되어진 정수를 그대로 나타내어 준다.
   
    select ceil(10.1), ceil(-10.1), ceil(10), ceil(-10)
    from dual;
    -- 11	-10	  10	-10
    
    
    -- 2.10 floor(실수)   ==> 입력되어진 실수 보다 작은 최대의 정수를 나타내어 준다.
    --      floor(정수)   ==> 입력되어진 정수를 그대로 나타내어 준다.
   
    select  floor(10.1), floor(-10.1), floor(10), floor(-10)
    from dual;
    -- 10	-11	    10	-10
    
    
    
    -- 2.11  ascii, chr
    select ascii('A'), ascii('a'), ascii('0'), ascii(' ')
    from dual;
    -- 65(A)	97(a)	48(0)	32(공백)
    
    select chr(65), chr(97), chr(48), chr(32)
    from dual;
    -- A	a	0	 ' '
    
    
    
    
    
    
    --------------------------------------------------------------------
     -------------------- >> 3. 날짜 함수 << ----------------------------
    
    /*
        날짜1 + 숫자 = 날짜2 ==> 날짜1 에서 숫자(일수)만큼 더한 값이 날짜2가 된다 
        날짜1 - 숫자 = 날짜2 ==> 날짜1 에서 숫자(일수)만큼 뺀 값이 날짜2가 된다 
        
        여기서 중요한 것은 숫자의 단위는 일수 이다.!!!!!!!
    */
    select sysdate - 1 , to_char(sysdate - 1 , 'yyyy-mm-dd hh24:mi:ss') AS 어제시각-- 하루를 뺀다
         , sysdate     , to_char(sysdate - 1 , 'yyyy-mm-dd hh24:mi:ss') AS 현재시각
         , sysdate + 1 , to_char(sysdate - 1 , 'yyyy-mm-dd hh24:mi:ss') AS 내일시각-- 하루를 더한다,
         
    from dual;
    -- 23/02/05	2023-02-05 16:04:32	23/02/06	2023-02-05 16:04:32	23/02/07	2023-02-05 16:04:32
    
    
    -- 단위 환산 --
    /*
        1kg = 1000g
        1g = 1/1000kg
        1 일 = 24시간 
        1 시간 = 60분
        1분 = 1/60초
        1분 = 60초
        1초 = 1/60 분 
    */
    
    --- ** [퀴즈] 현재시각으로 부터 1일 2시간 3분 4초 뒤를 나타내세요 *** ---
    select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') AS 현재시각
                , to_char(sysdate + 1 + 2/24 + 3/(24*60) + 4/(24*60*60), 'yyyy-mm-dd hh24:mi:ss') AS "1일 2시간 3분 4초 뒤"
    from dual;
    -- 2023-02-06 16:09:54	   2023-02-07 18:12:58
    
    
    
    -- 3.1  to_yminterval , to_dsinterval
    
    /*
        to_yminterval 은 년 과 월을 나타내어 연산자가 + 이면 날짜에서 더해주는 것이고, 
        to_dsinterval 은 일 시간 분 초를 나타내어 연산자가 + 이면 날짜에서 더해주는 것이다.
        그런데 연산자가 -를 쓰면 날짜를 빼주는 것이다.
    */
    
    
    -- 현재 시각으로 부터 1년 2개월 3일 4시간 5분 6초 뒤를 나타내서요
    select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') AS 현재시각
        ,  sysdate + to_yminterval('01-02') + to_dsinterval('003 04:05:06')
        -- 01-02 는 1년 2개월 더하는 것 003 04:05:06 은 3일 4시간 5분 6초 더한다.
        , to_char(sysdate + to_yminterval('01-02') + to_dsinterval('003 04:05:06'), 'yyyy-mm-dd hh24:mi:ss') AS "1년 2개월 3일 4시간 5분 6초 뒤"
    from dual;
    -- 2023-02-06 16:30:20	24/04/09	2024-04-09 20:35:26
    
    
    -- 현재 시각으로 부터 1년 2개월 3일 4시간 5분 6초 전를 나타내서요
    select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') AS 현재시각
        ,  sysdate - to_yminterval('01-02') - to_dsinterval('003 04:05:06')
        -- 01-02 는 1년 2개월 더하는 것 003 04:05:06 은 3일 4시간 5분 6초 더한다.
        , to_char(sysdate - to_yminterval('01-02') - to_dsinterval('003 04:05:06'), 'yyyy-mm-dd hh24:mi:ss') AS "1년 2개월 3일 4시간 5분 6초 뒤"
    from dual;
    -- 2023-02-06 16:30:31	21/12/03	2021-12-03 12:25:25
     
     
     
     
     --(자주 쓰임)
     
     -- 3.2 add_months(날짜, 숫자)
     /*
            ==> 숫자가 양수이면 날짜에서 숫자 개월수 만큼 더해준 날짜를 나타내는 것이고, 
                숫자가 음수이면 날짜에서 숫자 개월수 만큼 빼준  날짜를 나타내는 것이다.
                
            여기서 숫자의 단위는 개월수 이다.
     */
    select to_char(add_months(sysdate, -2), 'yyyy-mm-dd hh24:mi:ss') AS "2개월 전"
         , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') AS 현재시각
         , to_char(add_months(sysdate, 2), 'yyyy-mm-dd hh24:mi:ss') AS "2개월 후"
    from dual;
    -- 2022-12-06 16:37:48	  2023-02-06 16:37:48	  2023-04-06 16:37:48


    -- *** 김나희씨가 내일 군대에 입대를 한다. 복무기간이 18개월 이라면 제대일자(년-월-일)을 구하세요 *** ---
    select to_char(sysdate+1, 'yyyy-mm-dd') AS 현재시각
         , to_char(add_months(sysdate+1, 18), 'yyyy-mm-dd') AS "18개월 후"
    from dual;
    -- 2023-02-07	     2024-08-07
    
    
    
    -- 3.3 months_between(날짜1, 날짜2)
    /*
        날짜1에서 날짜2을 뺀 값을 그 결과는 숫자가 나오는데 결과물의 숫자의 단위는 개월수 이다.
        즉, 두 날짜의 개월차이를 구할 때 사용한다.
    */
    select sysdate, add_months(sysdate,3), 
           months_between(add_months(sysdate,3), sysdate)
    from dual;
    -- 23/02/06	23/05/06	3
     
    -- 날짜1 - 날짜2 = 숫자
    -- ==> 날짜1에서 날짜2 를 뺀 값으로 숫자가 나오는데 여기에서 숫자의 단위는 일수이다.
    --     즉 두 날짜의 일수 차이를 구할 때 사용한다.
     
    select sysdate + 3, sysdate , sysdate + 3 - sysdate
    from dual;
    -- 23/02/09	23/02/06	3
    

    
    --3.4  last_day(특정날짜)
    
    --    ==> 특정날짜가 포함된 달력에서 맨 마지막날짜를 알려주는 것이다.
    select sysdate, last_day(sysdate)
    from dual;
    -- 23/02/06	23/02/28
    
    --지난달 마지막 날은??
    select add_months(sysdate, -1) , last_day(add_months(sysdate, -1))
    from dual;
     -- 23/01/06	23/01/31
     
    
    
    -- 3.5 next_day(특정날짜, '요일명') ==> '요일명' 은 '일', '월', '화', ~~~'토' 이다.
    --          ==> 특정날짜로부터 다음번에 돌아오는 가장 빠른 '요일명'에 해당하는 날짜를 알려주는 것이다.
    
    select sysdate
        ,  next_day(sysdate,'금')
        ,  next_day(sysdate,'월')
    from dual;
    -- 23/02/06	   23/02/10	   23/02/13
     
     
     -- 3.6  extract (추출) ==> 날짜에서 년, 월, 일을 숫자형태로 추출해주는 것이다.
     
     select sysdate
         ,  extract(year from sysdate), to_char(sysdate, 'yyyy')  -- 연도만 보겠다.
         ,  extract(month from sysdate), to_char(sysdate, 'mm')  -- 달만 보겠다.
         ,  extract(day from sysdate), to_char(sysdate, 'dd')  -- 일만 보겠다. 
     from dual;
     -- 23/02/06	2023	2023	2	02   	6	06
     
     
     
     
     
     
     --------------------------------------------------------------------
     -------------------- >> 4. 변환 함수 << ----------------------------
     
     
     -- 4.1   to_char(날짜, '형태') ==> 날짜를 '형태' 모양으로 문자형태로 변환시켜주는 것이다.
     --       to_char(숫자, '형태') ==> 숫자를 '형태' 모양으로 문자형태로 변환시켜주는 것이다.
     
     -- 날짜를 문자형태로 변환하기 --
     select to_char(sysdate, 'yyyy') AS 년도
          , to_char(sysdate, 'mm')   AS 월
          , to_char(sysdate, 'dd')   AS 일
          , to_char(sysdate, 'hh24') AS "24시간"
          , to_char(sysdate, 'am hh') AS "12시간"
          , to_char(sysdate, 'pm hh') AS "12시간"
          , to_char(sysdate, 'mi')   AS 분
          , to_char(sysdate, 'ss')   AS 초
          , to_char(sysdate, 'q')    AS 분기       -- 1월~3월 => 1,   4월~6월 => 2,   7월~9월 => 3,    10월~12월 => 4 
          , to_char(sysdate, 'day')  AS 요일명     -- 월요일(Windows) , Monday(Linux) 
          , to_char(sysdate, 'dy')   AS 줄인요일명  -- 월(Windows) , Mon(Linux)
     from dual;
     -- 2023	02	06	17	오후 05	오후 05	13	47	1	월요일	월
     
     select to_char(sysdate, 'd') -- '1'(일요일),  '2'(월요일),  '3'(화요일),  '4'(수요일) , '5'(목요일), '6'(금요일),  '7'(토요일)
     from dual;
     
     select case to_char(sysdate, 'd')
            when '1' then '일'
            when '2' then '월'
            when '3' then '화'
            when '4' then '수'
            when '5' then '목'
            when '6' then '금'
            when '7' then '토'
            end AS "오늘의 요일명 "
            
         ,  decode(to_char(sysdate, 'd') , '1', '일'
                                         , '2', '월'
                                         , '3', '화'
                                         , '4', '수'
                                         , '5', '목'
                                         , '6', '금'
                                         , '7', '토') AS "오늘의 요일명 2"
     from dual;
     -- 월   월 
     
     select to_char(sysdate, 'ddd')  -- sysdate 의 년도 1월 1일 부터 sysdate(지금은 2023년 2월 6일)까지  며칠째인지를 알려주는 것이다.
     from dual;
     -- 037
     
     
     select to_char(sysdate, 'dd')  -- sysdate 의 2월 1일 부터 sysdate(지금은 2023년 2월 6일)까지  며칠째인지를 알려주는 것이다.
     from dual;
     -- 06
     
     
     select to_char(sysdate, 'd')  -- sysdate 의 주의 일요일 부터 sysdate(지금은 2023년 2월 6일)까지  며칠째인지를 알려주는 것이다.
     from dual;
     -- 2
     
     
     -- 숫자를 문자 형태로 변환하기 --
     
     select 1234567890
           , to_char(1234567890, '9,999,999,999')
           , to_char(1234567890, '$9,999,999,999')
           , to_char(1234567890, 'L9,999,999,999')    -- 그 나라의 화폐 기호이다.
     from dual;
     -- 1234567890	 1,234,567,890	 $1,234,567,890	        ￦1,234,567,890
     
     select 100, to_char (100, '999.0')
          , 95.7, to_char(95.7, '999.0')
     from dual;
     -- 100	 100.0	95.7	  95.7
     
     
     
     -------    성적 처리 --------
     select  hakbun AS 학번,
             name AS 성명,
             kor AS 국어,
             eng AS 영어,
             math AS 수학,
             kor+eng+math AS 총점,
             to_char(round ((kor+eng+math)/3, 1), '999.0') AS 평균1 --소수 첫째자리까지 
            ,to_char(round ((kor+eng+math)/3, 1), '999.9') AS 평균2 --소수 첫째자리까지 평균1,2 같음 
     from tbl_sungjuk;
     
     
     -- 4.2 to_date(문자, '형태') ==> 문자를 '형태' 모양으로 날짜형태로 변환시켜주는 것이다.
     
     select '2023-02-07' + 1
     from dual; 
     /*
         ORA-01722: 수치가 부적합합니다
         01722. 00000 -  "invalid number"
    */
     
     
     -- 밑에 무엇을 하든 상관없다. but 달력에 없는 날짜는 나타낼 수 없다.
     select to_date('2023-02-07', 'yyyy-mm-dd') +1 , 
            to_date('2023/02/07', 'yyyy/mm/dd') +1 ,
            to_date('20230207', 'yyyymmdd') +1 ,
            to_date('20200229', 'yyyymmdd') +1 ,  -- 2020년 2월 29일은 달력에 있으므로 정상적으로 돌아간다.
            to_date('20230430', 'yyyymmdd') +1   -- 2023년 4월 30일은 달력에 있으므로 정상적으로 돌아간다.
            -- to_date('20230229', 'yyyymmdd') +1   -- 2023년 2월 29일은 달력에 없으므로 오류가 발생한다,
            -- to_date('20230431', 'yyyymmdd') +1   -- 2023년 4월 31일은 달력에 없으므로 오류가 발생한다,
     from dual;
     -- 23/02/08	23/02/08	23/02/08	20/03/01	23/05/01
     
     
     
     
     -- 4.3 to_nu,ber(문자) ==> 숫자모양을 가지는 문자를 숫자 형태로 변환시켜주는 것이다.
     select '12345' + 1     -- 자동 형변환 
           , to_number('12345') +1
     from dual;
     -- 오른쪽 맞춤이 되어 있으므로 자동적으로 숫자 형태로 변경되었다.(자동 형변환)
     
     
     select to_number('홍길동')
     from dual;
     -- ORA-01722: 수치가 부적합합니다
     
     
     -- 기타 함수가 중요하므로 기타함수부터 다루겠다. --(1846줄 부분을 사용하기 위해 )미리 씀 
     --------------------------------------------------------------------
     -------------------- >> 5. 기타 함수 << ----------------------------
     
     
     -- 5.1 case when then else end  ===>> !!! 암기 !!! <<<====
     select case 5-2
            when 4 then '5-2=4 입니다.'
            when 1 then '5-2=1 입니다.'
            when 3 then '5-2=3 입니다.'
            else '나는 수학을 몰라요ㅠㅠ'
            end AS 결과
     from dual;
     -- 5-2=3 입니다.
     
     
     -- 참 거짓 
     select case
            when 4 > 5 then '4는 5보다 큽니다.'
            when 5 > 7 then '5는 7보다 큽니다.'
            when 3 > 2 then '3는 2보다 큽니다.'
            else '나는 수학을 몰라요ㅠㅠ'
            end AS 결과
    from dual;
    -- 3는 2보다 큽니다.
     
     
     -- 5.2 decode  ===>> !!! 암기 !!! <<<====
     
     select decode(5-2, 4, '5-2=4 입니다.'
                      , 1, '5-2=1 입니다.'
                      , 3, '5-2=3 입니다.'
                      ,  '나는 수학을 몰라요ㅠㅠ') AS 결과
     from dual;
     -- 5-2=3 입니다.
     
     
     -- 5.3 greatest, least
     
     select greatest(10, 90, 100, 80) ,  -- 나열되어진것들 중에 제일 큰 값을 알려주는 것이다.
            least(10, 90, 100, 80)       -- 나열되어진것들 중에 제일 작은 값을 알려주는 것이다.
     from dual;
     -- 100	10
     
     
     select greatest('감유신', '허준' , '고수' , '언정화')
        ,   least('감유신', '허준' , '고수' , '언정화')
     from dual;
     -- 허준	감유신
     
     
     select greatest(to_date('2023-01-01', 'yyyy-mm-dd'), sysdate + 5, sysdate) ,
           least(to_date('2023-01-01', 'yyyy-mm-dd'), sysdate + 5, sysdate)
     from dual;
     -- 23/02/12	23/01/01
     
     
     
     --5.4 rank ==> 등수(석차) 구하기,   dense_rank ==> 서열 구하기 
     
     select employee_id AS 사원번호
          , first_name || ' ' || last_name AS 사원명
          , nvl(salary + (salary * commission_pct), salary) As 월급
          , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급등수 
          , dense_rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급등수 
     from employees;
     
     
     
     select department_id AS 부서번호 
          , employee_id AS 사원번호
          , first_name || ' ' || last_name AS 사원명
          , nvl(salary + (salary * commission_pct), salary) As 월급
          , rank() over(partition by department_id
                        order by nvl(salary + (salary * commission_pct), salary) desc) AS 부서내전체등수 
          , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급전체등수 
          , dense_rank() over(partition by department_id
                              order by nvl(salary + (salary * commission_pct), salary) desc) AS 부서월급서열   
          , dense_rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 전체월급서열 
     from employees
     order by 부서번호;
     
     
     
     
     -- 5.5   lag,  lead 함수 ==> 게시판에서 특정 글을 조회할 때 많이 사용합니다.
     
     --==> lag는 다음을 나타낼때 사용하고 ex) lag(boardno, 1)  boardno 의 1칸 위로 올라가서 표시함
     --==> lead는 이전을 나타낼때 사용한다. ex) lead(boardno, 1)  boardno 의 1칸 아래로 올라가서 표시함
   
     create table tbl_board
     (boardno     number         -- 글 번호 -- number 는 22byte 를 차지하며, 38자리까지 표현 가능하다. , 10의 -130 승 이상 ~ 10의 126 승 까지 숫자를 저장할 수 있다.
     ,subject     Nvarchar2(200) -- 글 제목 Nvarchar2의 최대 크기는 2000이고, varchar2의 최대크기는 4000이다.
     ,content     Nvarchar2(2000)-- 글 내용
     ,userid      varchar2(40)   -- 글쓴이의 ID
     ,registerday date default sysdate  -- 작성 일자 -- default sysdate 는 데이터 입력시  registerday 컬럼의 값을 생략하면 기본적으로 sysdate 가 입력된다는 말이다.
     ,readcount   number(10) default 0  -- 조회수  default 0 은 데이터 입력시 readcount 컬럼의 값을 생략하면 기본적으로 0이 입력된다는 말이다.
     );
     -- Table TBL_BOARD이(가) 생성되었습니다.

    insert into tbl_board(boardno, subject, content, userid , registerday, readcount) 
    values(1, '안녕하세요', '글쓰기 연습입니다', 'leess', sysdate, 0);
    -- 1 행 이(가) 삽입되었습니다.

     
    insert into tbl_board(boardno, subject, content, userid) 
    values(2, '반갑습니다', '모두 취업대박 나십시오', 'eomjh');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_board(subject, boardno, userid , content) 
    values('건강하세요' , 3, 'youks', '로또 1등을 기원합니다.');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_board(boardno, subject, content, userid) 
    values('기쁘고 감사함이 넘치는 좋은 하루 되세요', 4 , '늘 행복하세요', 'leess');
    /*
    오류 보고 -
    ORA-01722: 수치가 부적합합니다
    */
    
    desc tbl_board;
    
    insert into tbl_board
    values(4, '기쁘고 감사함이 넘치는 좋은 하루 되세요', '늘 행복하세요', 'leess', sysdate, 0);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_board(boardno, subject, content, userid , registerday, readcount) 
    values(5, '오늘도 좋은 하루되세요', '늘 감사합니다', 'hongkd', sysdate, 0);
    -- 1 행 이(가) 삽입되었습니다.
    
    
    
    select *
    from tbl_board
    order by boardno desc;
    
    commit;
    -- 커밋 완료.

/*
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------
    이전글번호  이전글제목                            글번호   글제목                             글내용                   다음글번호    다음글제목
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------
    NULL      NULL                                5	      오늘도 좋은 하루되세요	            늘 감사합니다	            4           기쁘고 감사함이 넘치는 좋은 하루 되세요
    5         오늘도 좋은 하루되세요                  4	      기쁘고 감사함이 넘치는 좋은 하루 되세요	늘 행복하세요	            3           건강하세요	
    4         기쁘고 감사함이 넘치는 좋은 하루 되세요    3	      건강하세요	                        로또 1등을 기원합니다.	    2           반갑습니다
    3	      건강하세요                            2	      반갑습니다	                        모두 취업대박 나십시오	    1           안녕하세요
    2	      반갑습니다                            1	      안녕하세요	                        글쓰기 연습입니다	        NULL        NULL
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------

                         1  2  3  4  5  6  7  8  9 10  다음(과거)
              (최근)이잔  11 12 13 14 15 16 17 18 19 20  다음(과거)
              (최근)이잔  21 22 23 24 25 26 27                    
*/

    select lag(boardno, 1) over(order by boardno desc) AS 이전글번호  -- (대상, 올라갈 숫자), over(order by boardno desc) 은 boardno 내림차순 
          -- boardno(글번호)의 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
          ,lag(subject, 1) over(order by boardno desc) AS 이전글제목 
          -- subject(글제목)의 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 subject 컬럼의 값을 가져온다.
          ,boardno AS 글번호 
          ,subject AS 글제목
          ,content AS 글내용
          ,lead(boardno, 1) over(order by boardno desc) AS 다음글번호  -- (대상, 올라갈 숫자), over(order by boardno desc) 은 boardno 내림차순 
          -- boardno(글번호)의 내림차순으로 정렬했을때 아래쪽으로 1칸 내려간 행에서 boardno 컬럼의 값을 가져온다.
          ,lead(subject, 1) over(order by boardno desc) AS 다음글제목 
          -- subject(글제목)의 내림차순으로 정렬했을때 아래쪽으로 2칸 내려간 행에서 subject 컬럼의 값을 가져온다.
    from tbl_board;

    -- ====> 위와 동일하다 ,1 을 생략해도 무방하다.
    select lag(boardno) over(order by boardno desc) AS 이전글번호  -- (대상, 올라갈 숫자), over(order by boardno desc) 은 boardno 내림차순 
          -- boardno(글번호)의 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
          ,lag(subject) over(order by boardno desc) AS 이전글제목 
          -- subject(글제목)의 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 subject 컬럼의 값을 가져온다.
          ,boardno AS 글번호 
          ,subject AS 글제목
          ,content AS 글내용
          ,lead(boardno) over(order by boardno desc) AS 다음글번호  -- (대상, 올라갈 숫자), over(order by boardno desc) 은 boardno 내림차순 
          -- boardno(글번호)의 내림차순으로 정렬했을때 아래쪽으로 1칸 내려간 행에서 boardno 컬럼의 값을 가져온다.
          ,lead(subject) over(order by boardno desc) AS 다음글제목 
          -- subject(글제목)의 내림차순으로 정렬했을때 아래쪽으로 2칸 내려간 행에서 subject 컬럼의 값을 가져온다.
    from tbl_board;
    
    
    -- 이전과 다음이 2칸으로 떨어져 있을때 
    select lag(boardno, 2) over(order by boardno desc) AS 이전이전글번호  -- (대상, 올라갈 숫자), over(order by boardno desc) 은 boardno 내림차순 
          -- boardno(글번호)의 내림차순으로 정렬했을때 위쪽으로 2칸 올라간 행에서 boardno 컬럼의 값을 가져온다.
          ,lag(subject, 2) over(order by boardno desc) AS 이전이전글제목 
           -- subject(글제목)의 내림차순으로 정렬했을때 위쪽으로 2칸 올라간 행에서 subject 컬럼의 값을 가져온다.
          ,boardno AS 글번호 
          ,subject AS 글제목
          ,content AS 글내용
          ,lead(boardno, 2) over(order by boardno desc) AS 다음다음글번호  -- (대상, 올라갈 숫자), over(order by boardno desc) 은 boardno 내림차순 
           -- boardno(글번호)의 내림차순으로 정렬했을때 아래쪽으로 2칸 내려간 행에서 boardno 컬럼의 값을 가져온다.
          ,lead(subject, 2) over(order by boardno desc) AS 다음다음글제목 
           -- subject(글제목)의 내림차순으로 정렬했을때 아래쪽으로 2칸 내려간 행에서 subject 컬럼의 값을 가져온다.
    from tbl_board;
    
    
    
 --//////////////////////////////////////////////////////////////////////////////////////////////--
 --여기까지 2월 6일로 올림 
 
    
    
    -- subject 컬럼의 값이 길이가 16보다 크면 subject 컬럼의 값 중 16글자만 보여주고 뒤에 ... 을 붙여서 나타내세요
    --(진짜 제목이 길면 16글자만 나타내고 나머지는 ... 으로 표시)
    select boardno AS 글번호 
          ,subject AS 글제목1
          ,length(subject) AS 길이
          ,case when length(subject) > 16 then substr(subject, 1, 16) || '...'
                else subject
                end AS 글제목2 
    from tbl_board
    order by boardno desc;
    
    
    
    
    
    create table tbl_members
    (userid    varchar2(20)
    ,passwd    varchar2(20)
    ,name     Nvarchar2(10)
    ,address   Nvarchar2(100)
    );
    -- Table TB1_MEMBERS이(가) 생성되었습니다.

    insert into tbl_members(userid, passwd, name, address)
    values('kimys','abcd','김유신','서울');
    
    insert into tbl_members(userid, passwd, name, address)
    values('young2','abcd','이영이','서울');
    
    insert into tbl_members(userid, passwd, name, address)
    values('leesa','abcd','이에리사','인천');
    
    insert into tbl_members(userid, passwd, name, address)
    values('park','abcd','박이남','서울');
    
    insert into tbl_members(userid, passwd, name, address)
    values('leebon','abcd','이본','인천');
    
    select *
    from tbl_members;
    
    commit;
    
    -- select 되어져 나온 결과물의 행의 개수
    select count(*)
    from tbl_members;  -- 5
    
    select count(*)
    from tbl_members  
    where address = '서울';  -- 3
    
    select count(*)
    from tbl_members  
    where address = '%이%';  -- 4
    
    select count(*)
    from tbl_members  
    where userid = 'kimys' and passwd = 'abcd';  -- 1
    
    select count(*)
    from tbl_members 
    where userid = 'SFDFDF' and passwd = 'abcd';  -- 0
    
    select count(*)
    from tbl_members  
    where userid = 'kimys' and passwd = 'seasxd';  -- 0
    
    /*
    
        -- (퀴즈) -- 
        tbl_members 테이블에서 
        userid 및 passwd 가 모두 올바르면 '로그인 성공' 을 나타내어주고,
        userid 는 올바르지만  passwd 가 틀리면 '암호가 틀립니다.' 을 나타내어주고,
        userid 가 존재하지 않는 것을 넣어주면 '아이디가 존재하지 않습니다.'을 나타내어주도록 select 문장을 만드세요.
    
    */
    
    select case ( select count(*)
                  from tbl_members
                  where userid = 'kimys' and passwd = 'abcd')
            when 1 then '로그인 성공'
            else ( case( select count(*)
                               from tbl_members
                               where userid = 'kimys')
                        when 1 then '암호가 틀립니다.'
                        else ' 아이디가 존재하지 않습니다.'
                        end)
                   end AS 로그인결과
    from dual;
    -- 로그인 성공 
    
    select userid, passwd, ('로그인 성공') AS 결과
    from tbl_members
    where userid = 'kimys' and passwd = 'abcd' or userid = 'SFDFDF' and passwd = 'abcd' or userid = 'kimys' and passwd = 'seasxd';
    
    
    select case ( select count(*)
                  from tbl_members
                  where userid = 'kisffsmys' and passwd = 'abcd')
            when 1 then '로그인 성공'
            else ( case( select count(*)
                               from tbl_members
                               where userid = 'kimffsmys')
                        when 1 then '암호가 틀립니다.'
                        else ' 아이디가 존재하지 않습니다.'
                        end)
                   end AS 로그인결과
    from dual;
    -- 아이디가 존재하지 않습니다.
    
    select case ( select count(*)
                  from tbl_members
                  where userid = 'kimys' and passwd = 'absdsdcd')
            when 1 then '로그인 성공'
            else ( case( select count(*)
                               from tbl_members
                               where userid = 'kimys')
                        when 1 then '암호가 틀립니다.'
                        else ' 아이디가 존재하지 않습니다.'
                        end)
                   end AS 로그인결과
    from dual;
    -- 암호가 틀립니다.
    
    
    
    
    -- [퀴즈] employees 테이블에서 월급등수가 1등부터 10등까지 사원들만 
    --        사원번호, 사원명, 월급, 월급등수를 나타내세요
    
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,nvl(salary + (salary * commission_pct), salary) As 월급
          ,rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급등수
    from employees
    where rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) <=10;
    -- !!! 오류 !!! --
    
    -- !!!!!!!!!!!!!!!!!!!!!!기억하기!!!!!!!!!!!!!!!!!!!!!---- 
    -- rank() 함수는 where 절에 바로 쓸수가 없다 !!!!
    
    -- 해결책은 inline view 를 사용하면 된다.
    
    
    -- **** !!!!!!!!!!!!!!!!!!!!!!!! 아주아주아주아주아주아주아주아주 중요한 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!! **** --
    
    -- view(뷰)란 ? 테이블은 아니지만 select 되어진 결과물을 마치 테이블 처럼 보는 것 (간주하는 것)이다.
    -- view(뷰) 는 2가지 종류가 있다.
    -- 첫번째로 inline view 가 있고, 두번째로 stored view 있다.
    -- inline view 는 select 구문을 괄호() 를 하고 별칭(예. V, K 등등)을 부여한 것을 말한다.
    -- stored wiew 는 복잡한 SQL(Structure Query Language == 정형화된 질의어)을 저장하여 select 문을 간단하게 사용하고자 할때 쓰인다.
    -- 그래서 inline view 는 1회성 이고, stored wiew 는 언제든지 불러내서 재사용이 가능하다.
        
        
        
    -- *** inline view 생성 테스트  (월급 등수 10등까지 )
    
    select V.*
    from 
    (
        select employee_id AS 사원번호
              ,first_name || ' ' || last_name AS 사원명
              ,nvl(salary + (salary * commission_pct), salary) As 월급
              ,rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급등수
        from employees
    ) V                         -- 이것이  inline view 이다 뒤에 V를 붙여줌 
    where V.월급등수 <= 10;      -- V 일때는 무조건 AS 로 받아온 컬럼명(여기서는 한글)을 사용하자 !!!!, V.employee_id를 사용하면 오류
    
    
    -- 또는 아래와 같이 V.은 생략 가능하다.
    select *
    from 
    (
        select employee_id AS 사원번호
              ,first_name || ' ' || last_name AS 사원명
              ,nvl(salary + (salary * commission_pct), salary) As 월급
              ,rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급등수
        from employees
    ) V                         -- 이것이  inline view 이다 뒤에 V를 붙여줌 
    where 월급등수 <= 10;      -- V. 은 생략이 가능하다.
   
    
    
     -- *** stored view(저장된 뷰) 생성 테스트  
     -- 테이블은 아니지만 테이블처럼 보이는 것 
    
    /*
        create or replace view 뷰명
        as
        select 문장;
    */
    
    -- 생성 또는 교체 뷰 
    -- 없으면은 생성, 기존에 있었다면 교체 
    create or replace view view_month_salary
    as
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,nvl(salary + (salary * commission_pct), salary) As 월급
          ,rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급등수
    from employees;
    -- View VIEW_MONTH_SALARY이(가) 생성되었습니다.
    -- 이것이 stored view 
    
    --** 현재 오라클 서버에 접속되어진 사용자 (지금은 "HR")가 만든 (HR의 소유의) 테이블(table) 목록을 조회하겠다. **--
    select * 
    from tab;
    
    
    desc view_month_salary;
    /*
        이름   널?       유형           
        ---- -------- ------------ 
        사원번호 NOT NULL NUMBER(6)    
        사원명          VARCHAR2(46) 
        월급          NUMBER       
        월급등수          NUMBER   
    */
    
    
    
    select *
    from view_month_salary
    where 월급등수 <= 10;    
    
    
    -- *** 뷰의 이름이 desc view_month_salary 인 것의 원본소스(select문)을 알아본다. *** ---
    select *
    from user_views
    where view_name = 'VIEW_MONTH_SALARY';
    /*
        select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,nvl(salary + (salary * commission_pct), salary) As 월급
          ,rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급등수
        from employees;
    */
    
    -- 월급 16000 ~ 25000 만 나타내자
    select *
    from view_month_salary
    where 월급 between 16000 and 25000;
    
    -- 월급 등수를 나타내자 
    select 사원명, 월급 , 월급등수
    from view_month_salary
    where 월급등수 <= 5;
    
    
    /*
        --- [퀴즈] ---
        employees 테이블에서 모든 사원들에 대해
        사원번호, 사원명, 주민번호, 성별, 현재나이, 월급, 입사일자, 정년퇴직일, 정년까지근무개월수, 퇴직금 을 나타내세요.
        
        여기서 정년퇴직일이라 함은 
        해당 사원의 생월이 3월에서 8월에 태어난 사람은 
        해당사원의 나이(한국나이)가 63세가 되는 년도의 8월말일(8월 31일)로 하고,
        해당사원의 생월이 9월에서 2월에 태어난 사람은 
        해당사원의 나이(한국나이)가 63세가 되는 년도의 2월말일(2월 28일 또는 2월 29일)로 한다.
        
        정년까지 근무개월 수 이라 함은 입사일자로 부터 정년퇴직일 까지 개월 차이 
        months_between(정년 최직일, 입사일자)
        
        퇴직금이라 함은 정년퇴직일까지 근무년수 * 월급
        예를 들어 26개월 근무이라 하면 ==> 2년 2개월 ==>  2년 * 월급
    */
   
   /*                 기독성 문제로 아래 코드를 실행!!!
    select V.* 
         --, to_char(add_months(sysdate, (63-V.현재나이)*12), 'yyyy') AS 정년퇴직년도 
         , last_day(to_date(to_char(add_months(sysdate, (63-V.현재나이)*12), 'yyyy')|| case when substr(주민번호, 3, 2) between '03' and '08' then '-08-01' else '-02-01' end , 'yyyy-mm-dd')) AS 정년퇴직일 
    from 
    (
        select employee_id AS 사원번호
             , first_name || ' ' || last_name AS 사원명
             , jubun AS 주민번호
             , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS 성별
             , extract(year from sysdate) - ( to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end ) + 1 AS 현재나이 
             , nvl(salary + (salary * commission_pct), salary) AS 월급
             , hire_date AS 입사일자 
        from employees
    ) V;  
    */
    
    select T.사원번호, T.사원명, T.주민번호, T.현재나이, T.월급, T.입사일자
          , last_day(T.정년퇴직년도 || case when substr(주민번호, 3, 2) between '03' and '08' then '-08-01' else '-02-01' end ) AS 정년퇴직일
          -- , months_between(정년퇴직일, 입사일자)
          -- , months_between(last_day(T.정년퇴직년도 || case when substr(주민번호, 3, 2) between '03' and '08' then '-08-01' else '-02-01' end ), 입사일자) AS 정년까지근무개월수 
          , trunc(months_between(last_day(T.정년퇴직년도 || case when substr(주민번호, 3, 2) between '03' and '08' then '-08-01' else '-02-01' end ), 입사일자), 0) AS 정년까지근무개월수 
          -- , 근무년수 * 월급 AS 퇴직금
          -- , trunc(정년까지근무개월수/12,0) * 월급 AS 퇴직금
          -- , trunc(trunc(months_between(last_day(T.정년퇴직년도 || case when substr(주민번호, 3, 2) between '03' and '08' then '-08-01' else '-02-01' end ), 입사일자), 0)/12,0) * 월급 AS 퇴직금
          , to_char(trunc(trunc(months_between(last_day(T.정년퇴직년도 || case when substr(주민번호, 3, 2) between '03' and '08' then '-08-01' else '-02-01' end ), 입사일자), 0)/12,0) * 월급 , 'L9,999,999') AS 퇴직금 
    from
    (
        select V.* 
             --, to_char(add_months(sysdate, (63-V.현재나이)*12), 'yyyy') AS 정년퇴직년도 
             , to_char(add_months(sysdate, (63-V.현재나이)*12), 'yyyy') AS 정년퇴직년도 
        from 
        (
            select employee_id AS 사원번호
                 , first_name || ' ' || last_name AS 사원명
                 , jubun AS 주민번호
                 , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS 성별
                 , extract(year from sysdate) - ( to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end ) + 1 AS 현재나이 
                 , nvl(salary + (salary * commission_pct), salary) AS 월급
                 , hire_date AS 입사일자 
            from employees
        ) V
    ) T;
    
    
    
    
    
    
    -- [퀴즈] tbl_board 테이블에서 글번호 3번을 조회했을때 아래처럼 나오도록 하세요
    /*
    
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------
    이전글번호  이전글제목                            글번호   글제목                             글내용                   다음글번호    다음글제목
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------
    4         기쁘고 감사함이 넘치는 좋은 하루 되세요    3	      건강하세요	                        로또 1등을 기원합니다.	    2           반갑습니다
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */
    
    --- 틀린 풀이 ~~~~~~~~~~
    select lag(boardno) over(order by boardno desc) AS 이전글번호 
          ,lag(subject) over(order by boardno desc) AS 이전글제목 
          ,boardno AS 글번호 
          ,subject AS 글제목
          ,content AS 글내용
          ,lead(boardno) over(order by boardno desc) AS 다음글번호  
          ,lead(subject) over(order by boardno desc) AS 다음글제목 
    from tbl_board
    where boardno = 3;
    -- null   null		3	건강하세요	로또 1등을 기원합니다.		null     null 
    
    
    ----- 올바른 풀이 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!!--
    
    select V.*
    from
    (
        select lag(boardno) over(order by boardno desc) AS 이전글번호 
              ,lag(subject) over(order by boardno desc) AS 이전글제목 
              ,boardno AS 글번호 
              ,subject AS 글제목
              ,content AS 글내용
              ,lead(boardno) over(order by boardno desc) AS 다음글번호  
              ,lead(subject) over(order by boardno desc) AS 다음글제목 
        from tbl_board
    ) V
    where V.글번호 = 3;
    -- 4	기쁘고 감사함이 넘치는 좋은 하루 되세요	3	건강하세요	로또 1등을 기원합니다.	2	반갑습니다
    
    
    
    
    
    
    ------------------------------------------------------------------------------    
    ------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
                            -- >> 그룹(집계) 함수 << --
                            
    /*                       
        종류  (주로 1~5번을 많이 사용한다.)
        1. sum      -- 합계
        2. avg      -- 평균
        3. max      -- 최대값
        4. min      -- 최소값
        5. count    -- select 되어서 나온 결과물의 행의 개수 
        6. variance -- 분산 
        7. stddev   -- 표준편차 
        
        
        ※ 분산 : 분산의 제곱근이 표준편차 ( 평균에서 떨어진 정도)
        ※ 표준편차 : 표준편차의 제곱승이 분산 ( 평균과의 차액)
        
        >>> 주식투자 <<< 
        50  60  40  50  55  45  52  48   => 평균  50   편차가 적음    -- 안정투자
        10  90  20  80  30  70  90  10   => 평균  50   편차가 큼      -- 투기성투자(위험을 안고서 투자함)
        
        분산과 표준편차는 어떤 의사결정시 도움이 되는 지표이다.
    */                   
    
    -- 단일행 함수
    select substr(jubun, 7,1)    -- 단일행 함수는 결과 값이 메모리에 로드 되어진 행의 개수만큼 동일한 개수로 나온다.   
    from employees;                    
                  
                      
    -- 합계를 구하자                                               
    select sum(salary)        -- 그룹 함수는 결과 값이 1개행만 나온다. 
    from employees;                     
    -691416
    
    
    -- 평균을 구하자
    select avg(salary)        -- 그룹 함수는 결과 값이 1개행만 나온다.          
    from employees;
    -- 6461.831~~~
    
    
    -- 개수를 구하자
    select count(salary)        -- 그룹 함수는 결과 값이 1개행만 나온다.          
    from employees;
    --107
    