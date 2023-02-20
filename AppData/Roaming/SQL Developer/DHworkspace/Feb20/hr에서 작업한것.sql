--                     ↑ 대,소문자 변경 

set hidden param parseThreshold = 1500000;

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
    
    
    -- !!!! 그래서 inline view 는 1회성 이고, stored wiew 는 언제든지 불러내서 재사용이 가능하다. !!!!----
        
        
        
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
    
    
    
    --------------------------------------------------------------------------------
    --                          2월 8일 과정-- 
    --------------------------------------------------------------------------------
    
    
    -----  !!!!!!!!   중요중요중요중요 !!!!!!!!!!---------------------
    -- 그룹함수(집계함수)애서는 null이 있으면 무조건  null은 제외시킨 후 연산을 한다.. !!
    select 20 + 57 + 158 + null + 109
    from dual;
    -- null
    
    select 20 + 57 + 158 + 109
    from dual;
    -- 344
    
    --------------------------------------------
    -- sum 은 null은 자동으로 제외하고 나머지만 더한다. 
    select sum(salary * commission_pct)
    from employees;
    -- 즉 이것은 아래와 같은 것이다.
    
    select sum(salary * commission_pct)
    from employees
    where salary * commission_pct is not null;
    -- 73690   <-- 둘다 결과는 73690 이다.
    --------------------------------------------
    
    
    select salary
    from employees;
    -- 107명이 나옴 
    
    -- 합계
    select sum(salary)
    from employees;
    -- 691416
    
    --평균치 
    select avg(salary)
    from employees;
    -- 6461.831775700934579439252336448598130841
    
    -- 최대치 
    select max(salary)
    from employees;
    -- 24000
    
    -- 최저값 
    select min(salary)
    from employees;
    -- 2100
    
    
    -- 카운트
    select count(salary)
    from employees;
    -- 107
    
    --분산
    select variance(salary)
    from employees;
    -- 15284813.66954681713983424440134015164874
    
    -- 표준편차 
    select stddev(salary)
    from employees;
    -- 3909.579730552481921059198878167256201202
    
    
    -- 합계, 평균, 최대, 최소, 카운트, 분산, 표준편차를 구해보자
    select sum(salary * commission_pct), avg(salary * commission_pct), 
           max(salary * commission_pct), min(salary * commission_pct),
           count(salary * commission_pct), variance(salary * commission_pct),
           stddev(salary * commission_pct)
    from employees; 
    -- 73690	2105.428571428571428571428571428571428571	
    -- 5600	610	
    -- 35	1354447.60504201680672268907563025210085	
    -- 1163.807374543578326917875190458887616995
    
    
    
    -- 컬럼에 대한 구조를 확인하자 
    desc employees;
    
    
    -- count로 컬럼의 개수를 찾아보자 
    select count(*) AS "모든 인원수" ,
           count(department_id) AS "부서번호가 null이 아닌 개수" ,
           count(commission_pct) AS "커미션이 null이 아닌 개수" ,
           count(salary) AS "기본급여가 null이 아닌 개수" ,
           count(job_id) AS "직종이 null이 아닌 개수"
           
    from employees;
    -- 107	106	35	107	107
    
    
                ----- **** avg(평균)을 구하실때는 주의를 요합니다 ****** ------
    
    -- 무엇을 하기 전에는 테이블의 구조를 항상 확인하자 (null 확인 등등)
    desc employees;
    
    
    -- 아래의 것은 employees 테이블의 구조를 고려치 않고 풀이한 경우 --
    -- employees 테이블에 있는 모든 사원들에 대해 기본급여(salary)의 평균치를 구하세요 ...
    
    select sum(salary), count(salary) -- 691416	107
          ,sum(salary) / count(salary)  -- 6461.831775700934579439252336448598130841
          ,avg(salary)  --6461.831775700934579439252336448598130841
    from employees;
    
    
     -- employees 테이블에 있는 모든 사원들에 대해 수당(salary * commission_pct)의 평균치를 구하세요 ...
    
    select sum(salary * commission_pct), count(salary * commission_pct)  -- 73690  35
          ,sum(salary * commission_pct) / count(salary * commission_pct)  -- 2105.428571428571428571428571428571428571
          ,avg(salary * commission_pct)  -- 2105.428571428571428571428571428571428571
    from employees; 
    
    
    
    
    -- 아래의 것은 employees 테이블의 구조를 고려해서 풀이한 경우 --
    -- employees 테이블에 있는 모든 사원들에 대해 기본급여(salary)의 평균치를 구하세요 ...
    
                        -- null이 존재한다면 nvl로 null을 0으로 변경 
    select sum(salary), count(nvl(salary, 0)) -- 691416	107
          ,sum(salary) / count(nvl(salary, 0))  -- 6461.831775700934579439252336448598130841
          ,avg(nvl(salary, 0))  --6461.831775700934579439252336448598130841
    from employees;
    
    
     -- employees 테이블에 있는 모든 사원들에 대해 수당(salary * commission_pct)의 평균치를 구하세요 ...
    
    select sum(salary * commission_pct), count(nvl(salary * commission_pct,0))  -- 73690  107
          ,sum(salary * commission_pct) / count(nvl(salary * commission_pct,0))  -- 688.691588785046728971962616822429906542
          ,avg(nvl(salary * commission_pct,0))  -- 688.691588785046728971962616822429906542
    from employees; 
    
    
    
    -- employees 테이블에서 salary 를 받는(salary가 null이 아닌것) 사원들에 대해 기본급여(salary)의 평균치를 구하세요 ...
    
    select sum(salary), count(salary) -- 691416	107
          ,sum(salary) / count(salary)  -- 6461.831775700934579439252336448598130841
          ,avg(salary)  --6461.831775700934579439252336448598130841
    from employees;
    
    
      -- employees 테이블에서 salary 를 받는(salary가 null이 아닌것) 사원들에 대해 수당(salary * commission_pct)의 평균치를 구하세요 ...
    
    select sum(salary * commission_pct), count(salary * commission_pct)  -- 73690  35
          ,sum(salary * commission_pct) / count(salary * commission_pct)  -- 2105.428571428571428571428571428571428571
          ,avg(salary * commission_pct)  -- 2105.428571428571428571428571428571428571
    from employees; 
    
    
    
    
    -------------------------------------------------------------------------------------------------------
    ------  *****  그룹함수와 함께 사용되어지는 group by 절에 대해서 알아봅니다 *** --------
    
    ---- employees 테이블에서 부서번호 별로 인원수를 나타내세요 -----
    
    select department_id AS 부서번호
           , count(*) AS 인원수
    from employees
    group by department_id       -- department_id 컬럼의 값이 같은것 끼리 그룹을 짓는다.
    order by department_id asc;
    /*
        10	1
        20	2
        30	6
        40	1
        50	45
        60	5
        70	1
        80	34
        90	3
        100	6
        110	2
            1
    */
    
    
    
    ---- employees 테이블에서 성별로 인원수를 나타내세요 -----


    -- 내가 나타낼때 없으면 inline view로 나타내자 !!!!!!!!!!!!!!!!!--
    
    select V.성별, count(*) AS 인원수 
    from
    (
        select case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS 성별
        from employees    
    ) V
    group by 성별;
    -- 남	56
    -- 여	51
    
    /*
        ----------------
        성별    인원수
        ----------------
         남      56
         여      51
    */


    -- [퀴즈] emlpoyees 테이블에서 연력대별로 인원수를 나타내세요.
    
    select V.연령대 , count(*) AS 인원수
    from
    (
        select trunc(extract(year from sysdate) - ( to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end ) + 1, -1) AS 연령대 
        from employees
    ) V
    group by 연령대
    order by 연령대 asc;     ---오름차순 
    /*
       연령대   인원수
         10     15
         20     17
         30     23
         40     20
         50     16
         60     16
    */
    
    
    
    
    ----------------------- *** 1차 그룹, 2차 그룹 짓기 *** -----------------------
    
    --employees 테이블에서 부서번호별, 성별 인원수를 나타내세요
    select department_id AS 부서번호, gender AS 성별, count(*) AS 인원수 
    from
    (
        select department_id
              , case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS GENDER
        from employees
    ) V
    group by V.department_id , V.GENDER
    order by 1 asc;
 
    /*
    -----------------------
      부서번호   성별    인원수
    -----------------------
        10	    여	    1
        20	    여	    2
        30	    남	    4
        30	    여	    2
        40	    여	    1
        50	    남	    23
        50	    여	    22
        60	    남	    4
        60	    여	    1
        70	    남	    1
        80	    남	    19
        80	    여	    15
        90	    남	    2
        90	    여	    1
        100	    남	    3
        100	    여	    3
        110 	여	    2
                여	    1
    */
    
    
    --- [퀴즈] employees 테이블에서 연령대별, 성별 인원수를 구해보세요
    select AgeLine AS 연령대, Gender AS 성별, count(*) AS 모든인원수 
    from
    (
    select trunc(extract(year from sysdate) - ( to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end ) + 1, -1) AS AgeLine 
          , case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS Gender
    from employees
    ) V
    group by V.AgeLine, V.Gender 
    order by 1;
    
    /*
       연령대   성별     인원수
        10	    남	    10
        10	    여	    5
        20	    남	    7
        20	    여	    10
        30	    남	    11
        30	    여	    12
        40	    남	    9
        40	    여	    11
        50	    남	    10
        50	    여	    6
        60	    남	    9
        60	    여	    7
    */
    
    
    ----------------------------------------------------------------------------
    
    ------ **** 요약값을 보여주는 rollup, cube, grouping sets, grouping 에 대해서 알아봅니다 **** --------------
    
    -- employees 테이블에서 부서번호별로 인원수를 나타내면서 동시에 전체 인원수도 나타내세요
    
    select department_id AS 부서번호
          ,count(*) AS 인원수
    from employees
    group by rollup(department_id);
    --> rollup 을 하면 오름차순으로 정렬하고 마지막에 부서번호 null이면서 전체 인원수인 107을 나타낸다.
    --? rollup을 안쓰면 전체 인원수는 나오지 않는다.
    /*
    10	1
    20	2
    30	6
    40	1
    50	45
    60	5
    70	1
    80	34
    90	3
    100	6
    110	2
        1
        107
    */


    --> grouping 추가부분 
    select department_id AS 부서번호
          ,grouping(department_id)       -- grouping(department_id) 이 값은 오로지 딱 2개만 나온다 (0 아니면 1), 
                                         -- 0이라 함은 department_id 컬럼의 값으로 그룹을 지었다는 말이고, 1이라 함은 그룹을 안지었다는 말이다. 
          ,count(*) AS 인원수
    from employees
    group by rollup(department_id);
    /*
    10	0	1
    20	0	2
    30	0	6
    40	0	1
    50	0	45
    60	0	5
    70	0	1
    80	0	34
    90	0	3
    100	0	6
    110	0	2
        0	1
        1	107
    */
    
    
    --> 위 예제에서 null로 나왔던 것을 바꾸어 보자 인턴, 전체를 나타낸다. 원래 null값이였던 1명은 인턴으로, rollup은 전체로
    --> nvl은 원래 null 이였던 값을 인턴으로 바꾸기 위해 사용 
    --         case문과 동일, 그룹핑 (0또는1)  ,  0 이면,  문자열로 바꿈,   나머지는 전체로 바꿈 
    select nvl(decode( grouping(department_id) , 0 , to_char(department_id), '전체'), '인턴') AS 부서번호
           ,count(*) AS 인원수
    from employees
    group by rollup(department_id);
    /*
        10	1
        20	2
        30	6
        40	1
        50	45
        60	5
        70	1
        80	34
        90	3
        100	6
        110	2
        인턴	1
        전체	107
    */
    
    
    -- employees 테이블에서 성별로 인원수를 나타내면서 동시에 전체 인원수도 나타내세요
    --              이것이        ,0이라면, 그대로 출력, 아니면 '전체인원'으로 출력    
    select decode(grouping(Gender), 0, Gender, '전체인원') AS 성별, count(*) AS 인원수 
    from
    (
        select case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
        from employees
    ) V
    group by rollup(Gender);
    /*
        남	56
        여	51
        전체인원	107
    */
    
    
    -- employees 테이블에서 부서번호별, 성별로 인원수를 나타내면서 동시에 전체 인원수도 나타내세요
    
    ---> 개념 길라잡이 코드 
    select department_id AS 부서번호
           , grouping(department_id)
           , gender AS 성별
           , grouping(gender)
           , count(*) AS 인원수 
    from
    (
        select department_id
              , case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS GENDER
        from employees
    ) V
    group by rollup(V.department_id , V.GENDER);
    
    
    --> 부서번호 null을 제외한 나머지 완성본  
    select decode( grouping(department_id) , 0 , to_char(department_id), '전체') AS 부서번호
           , decode( grouping(gender) , 0 , to_char(gender), '전체') AS 성별
           , count(*) AS 인원수 
    from
    (
        select department_id
              , case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS GENDER
        from employees
    ) V
    group by rollup(V.department_id , V.GENDER);
 
    
    --> 완성본  ('')은 null이고 (' ')은 공백이다.
    select nvl(decode( grouping(department_id) , 0 , to_char(department_id), '전체'), '인턴') AS 부서번호
           , decode( grouping(gender) , 0 , to_char(gender), '전체') AS 성별
           , count(*) AS 인원수 
    from
    (
        select department_id
              , case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS GENDER
        from employees
    ) V
    group by rollup(V.department_id , V.GENDER);
 
 
 
    /*
    -----------------------
    부서번호 성별 인원수
    -----------------------
        인턴	여	1
        인턴	전체	1
        10	여	1
        10	전체	1
        20	여	2
        20	전체	2
        30	남	4
        30	여	2
        30	전체	6
        40	여	1
        40	전체	1
        50	남	23
        50	여	22
        50	전체	45
        60	남	4
        60	여	1
        60	전체	5
        70	남	1
        70	전체	1
        80	남	19
        80	여	15
        80	전체	34
        90	남	2
        90	여	1
        90	전체	3
        100	남	3
        100	여	3
        100	전체	6
        110	여	2
        110	전체	2
        전체	전체	107
    */
    
    
    
    ----------------------------------------------------------------------------------------
    
    ----- >>>>> 요약값(rollup, cube, grouping sets) <<<<< ------
  /*
        1. rollup(a,b,c) 은 grouping sets( (a,b,c),(a,b),(a),() ) 와 같다.
        
         group by rollup(department_id, gender) 은
         group by grouping sets( (department_id, gender), (department_id), () ) 와 같다.
        
        2. cube(a,b,c) 은 grouping sets( (a,b,c),(a,b),(b,c),(a,c),(a),(b),(c),() ) 와 같다.
        
         group by cube(department_id, gender) 은
         group by grouping sets( (department_id, gender), (department_id), (gender), () ) 와 같다.
  */
  
  
    --------------> grouping sets  
    select nvl(decode( grouping(department_id) , 0 , to_char(department_id), '전체'), '인턴') AS 부서번호
           , decode( grouping(gender) , 0 , to_char(gender), '전체') AS 성별
           , count(*) AS 인원수 
    from
    (
        select department_id
              , case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS GENDER
        from employees
    ) V
    --group by rollup(V.department_id , V.GENDER);
    -- 또는
    group by grouping sets( (department_id, gender), (department_id), () );
    -- 부서번호 및 성별이 같은것을 묶음(ex. 부서번호 50  남자)  
    -- 두번째 ()는 부서번호만 묶는다. 
    -- 마지막 () 는 아무것도 없을 떄 
    
    
    ----> cube등 다른 것을 사용하여 같은 값을 나타내자
    --------------------> cube
    select nvl(decode( grouping(department_id) , 0 , to_char(department_id), '전체'), '인턴') AS 부서번호
           , decode( grouping(gender) , 0 , to_char(gender), '전체') AS 성별
           , count(*) AS 인원수 
    from
    (
        select department_id
              , case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS GENDER
        from employees
    ) V
    group by cube(V.department_id , V.GENDER)
    order by 1,2;
    
    
    --> cube == grouping set
    select nvl(decode( grouping(department_id) , 0 , to_char(department_id), '전체'), '인턴') AS 부서번호
           , decode( grouping(gender) , 0 , to_char(gender), '전체') AS 성별
           , count(*) AS 인원수 
    from
    (
        select department_id
              , case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS GENDER
        from employees
    ) V
    group by grouping sets((department_id , GENDER), (department_id),(Gender), ())
    order by 1,2;
    
    
    --> cube == grouping set  == rollup
    select nvl(decode( grouping(department_id) , 0 , to_char(department_id), '전체'), '인턴') AS 부서번호
           , decode( grouping(gender) , 0 , to_char(gender), '전체') AS 성별
           , count(*) AS 인원수 
    from
    (
        select department_id
              , case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS GENDER
        from employees
    ) V
    group by rollup( department_id, Gender)
    order by 1,2;
    
    
    
    
    ---> 필요없는 값을 빼고 싶을때는 grouping sets을 쓰는것이 좋다.
    select nvl(decode( grouping(department_id) , 0 , to_char(department_id), '전체'), '인턴') AS 부서번호
           , decode( grouping(gender) , 0 , to_char(gender), '전체') AS 성별
           , count(*) AS 인원수 
    from
    (
        select department_id
              , case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS GENDER
        from employees
    ) V
    group by grouping sets( (department_id),(Gender), ())
    order by 1,2;
    
    
    
    --->필요없는 값을 빼고 싶을때는 grouping sets을 쓰는것이 좋다.222
    select nvl(decode( grouping(department_id) , 0 , to_char(department_id), '전체'), '인턴') AS 부서번호
           , decode( grouping(gender) , 0 , to_char(gender), '전체') AS 성별
           , count(*) AS 인원수 
    from
    (
        select department_id
              , case when substr(jubun,7,1) in('2','4') then '여' else '남' end AS GENDER
        from employees
    ) V
    group by grouping sets( (department_id , GENDER),(Gender), ())
    order by 1,2;
    
    
    -------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------
    
    ---------    *******    having 그룹함수조건절   ********  -----------------
    
    /*  
        group by 절을 사용하여 그룹함수의 값을 나타내었을때 
        group 함수의 값이 특정 조건에 해당하는 것만 추출하고자 할 때는 where 절을 사용하는 것이 아니라 
        having 그룹함수조건절 을 사용해야 한다.
    */
    
    
    -- employees 테이블에서 사원이 10명 이상 근무하는 부서번호와 그 인원수를 나타내세요.
    
    select department_id, count(*)
    from employees
    where count(*) >= 10
    group by department_id;
    -- 오류 발생 !!!!!
    -- 오류 발생 이유는 성별, 연령대, 직종 등등 무엇을 원하는지 모르기 때문에 오류가 발생한다.
    
    select department_id AS 부서번호, 
           count(*) AS 인원수 
    from employees
    group by department_id   -- 부서별로 그룹을 짓고 나서 
    having count(*) >= 10   -- count (*)을 한다.
    order by 2 asc;
    --부서번호 인원수
    --  80	  34
    --  50	  45
    
    
    --- employees 테이블에서 부서번호별로 벌어들이는 salary의 합계가 50000 이상인 부서에 대해서만 
    --- 부서번호, 기본급여의 합계를 나타내세요
    
    select department_id AS 부서번호, 
           to_char(sum(salary), '999,999') AS 기본급여
    from employees
    group by department_id
    having sum(salary) >=50000
    order by 1;
    /*
        50	 156,400
        80	 304,500
        90	  58,000
        100	  51,608
    */
    
    
    --- [퀴즈] employees 테이블에서 부서번호별로 벌어들이는 월급의 합계가 40000 이상인 부서에 대해서만 
    --- 부서번호, 월급의 합계를 나타내세요
    select department_id AS 부서번호, 
           to_char(sum(nvl((salary * COMMISSION_PCT) + salary , salary)), '999,999') AS 월급의 합계
    from employees
    group by department_id
    having sum(nvl((salary * COMMISSION_PCT) + salary , salary)) >=40000
    order by 1;
    /*
        50	 156,400
        80	 377,140
        90	  58,000
        100	  51,608
    */    
    
    --- [퀴즈] employees 테이블에서 부서번호별로 벌어들이는 월급의 합계와 월급 합계의 등수를 나타내라
    --Rank 함수 사용 
    select department_id AS 부서번호
          ,to_char(sum(nvl((salary * COMMISSION_PCT) + salary , salary)), '999,999') AS "월급의 합계" 
          ,rank() over(order by sum(nvl((salary * COMMISSION_PCT) + salary , salary)) desc) AS 월급전체등수 
    from employees
    group by department_id;
    
    -- 또는 
    select department_id AS 부서번호
         , Sum_Monthsal AS 월급의합계
         , rank() over(order by Sum_Monthsal desc) AS 월급합계의등수  
    from
    (
        select department_id
              ,sum(nvl(salary + (salary * commission_pct), salary)) AS Sum_Monthsal
        from employees
        group by department_id
    ) V;
    
    
    --- [퀴즈] employees 테이블에서 부서번호별로 벌어들이는 월급의 합계에 대한 퍼센티지가 5%이상인 부서만 나타내라 
    ---       부서번호, 월급의 합계, 퍼센티지 를 나타내세요...
    
    /*
        모든 직원들이 벌어들이는 월급의 합계가 만약에 500 이라면
        
        부서번호 10번의 월급의 합계가 30이라면 퍼센티지는 (30/500*100) ==> 6%
        부서번호 20번의 월급의 합계가 50이라면 퍼센티지는 (50/500*100) ==> 10%
        부서번호 30번의 월급의 합계가 10이라면 퍼센티지는 (10/500*100) ==> 2%
        부서번호 40번의 월급의 합계가 100이라면 퍼센티지는 (100/500*100) ==> 20%
    */
    
    -- 전체 직원의 월급 합
    select sum(nvl((salary * COMMISSION_PCT) + salary , salary))
    from employees;
    
    -- group by 때문에 또 따로 select로 전체 직원의 월급의 합을 구해와야 한다. !!!!!!!!!!!!!
    select department_id AS 부서번호, 
           to_char(sum(nvl((salary * COMMISSION_PCT) + salary , salary)), '999,999') AS "월급의 합계", 
           round( ( sum( nvl(salary + (salary * commission_pct), salary) ) / (select sum( nvl(salary + (salary * commission_pct), salary) ) from employees) )*100 , 1 )  AS 퍼센티지
    from employees
    group by department_id
    having ( sum( nvl(salary + (salary * commission_pct), salary) ) / (select sum( nvl(salary + (salary * commission_pct), salary) ) from employees) )*100 >= 5 
    order by 1;
   
   -- 또는 
   
   select department_id AS 부서번호 
         , to_char(Sum_MONTHSAL, '999,999') AS "부서월급의 합계"
         , TOTAL AS "전체 직원 월급의 합계"
         , round((SUM_MONTHSAL / TOTAL) * 100, 1) AS 퍼센티지
   from 
   (
       -- 부서별 전체 월급 
       select  department_id,
               sum(nvl((salary * COMMISSION_PCT) + salary , salary)) AS SUM_MONTHSAL, 
               -- 직원의 전체 월급은 765106
               -- 서브쿼리이다. () 안에 새롭게 select와 from을 사용할 수 있음 , () 안에 있는것을 컬럼으로 생각함 
               (select sum( nvl(salary + (salary * commission_pct), salary) ) from employees) AS TOTAL
               
               
       from employees
       group by department_id
   ) V
   WHERE ROUND( (SUM_MONTHSAL/TOTAL)*100, 1 ) >= 5
   ORDER BY 2 DESC;
   
   
   
   
   
   ------    ***   !!!!  누적(누계)에 대해서 알아봅니다. !!! ***   ---------
   /*
        sum(누적되어야할 컬럼명) over(order by 누적되어질 기준이 되는 컬럼명 asc[desc] )
        
        sum(누적되어야할 컬럼명) over(partition by 그룹화 되어질 컬럼명 
                                   order by 누적되어질 기준이 되는 컬럼명 asc[desc] )
   */
   
   -- 테이블 생성 
   create table tbl_panmae
   (panmaedate  date
    ,jepumname   varchar2(20)
    ,panmaesu    number
   );
   -- Table TBL_PANMAE이(가) 생성되었습니다.

     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( add_months(sysdate,-2), '새우깡', 10);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( add_months(sysdate,-2)+1, '새우깡', 15); 
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( add_months(sysdate,-2)+2, '감자깡', 20);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( add_months(sysdate,-2)+3, '새우깡', 10);
     
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( add_months(sysdate,-2)+3, '새우깡', 3);
     
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( add_months(sysdate,-1), '고구마깡', 7);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( add_months(sysdate,-1)+1, '새우깡', 8); 
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( add_months(sysdate,-1)+2, '감자깡', 10);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( add_months(sysdate,-1)+3, '감자깡', 5);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( sysdate - 4, '허니버터칩', 30);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( sysdate - 3, '고구마깡', 15);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( sysdate - 2, '고구마깡', 10);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( sysdate - 1, '허니버터칩', 20);
    
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( sysdate, '새우깡', 10);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( sysdate, '새우깡', 10);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( sysdate, '감자깡', 5);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( sysdate, '허니버터칩', 15);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( sysdate, '고구마깡', 20);
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( sysdate, '감자깡', 10); 
    
     insert into tbl_panmae(panmaedate, jepumname, panmaesu)
     values( sysdate, '새우깡', 10);
    
     commit;
     
     
     select *
     from tbl_panmae;


    --- *** tbl_panmae 테이블에서 '새우깡' 에 대한 일별판매량과 일별 누적 판매량을 나타내세요. *** ---
    
    -- 각각 판매 시간이 다르다 
    select to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss')
          , panmaesu
    from tbl_panmae
    where jepumname = '새우깡';
    /*
        2022-12-08 16:08:42	10
        2022-12-09 16:08:44	15
        2022-12-11 16:08:48	10
        2022-12-11 16:08:49	3
        2023-01-09 16:08:54	8
        2023-02-08 16:09:08	10
        2023-02-08 16:09:10	10
        2023-02-08 16:09:20	10
    */
    
    
   -- 각각 판매 시간이 다르기 때문에 sum을 해도 완전하게 합쳐지지 않는다.
   -- 즉 연,월,일만 같게 하면 sum이 제대로 될 수 있다.
   select to_char(panmaedate , 'yyyy-mm-dd') AS 판매일자
        , sum(panmaesu) AS "일별 판매량"
   from tbl_panmae
   where jepumname = '새우깡'
   group by to_char(panmaedate , 'yyyy-mm-dd')
   order by 1;
   /*
       ------------------- 
         판매일자    판매량 
       -------------------  
        2022-12-08	10
        2022-12-09	15
        2022-12-11	13
        2023-01-09	8
        2023-02-08	30
    */
    
    
    
    --    ****    ---
    --> 누적판매량을 나타내어 보자 
    -- sum(누적되어야할 컬럼명) over(order by 누적되어질 기준이 되는 컬럼명 asc[desc] ) 를 사용한다.
    
   select to_char(panmaedate , 'yyyy-mm-dd') AS 판매일자
        , sum(panmaesu) AS "일별 판매량"
        , sum(sum(panmaesu)) over(order by to_char(panmaedate , 'yyyy-mm-dd') asc ) AS 누적판매량
   from tbl_panmae
   where jepumname = '새우깡'
   group by to_char(panmaedate , 'yyyy-mm-dd');
    /*
       ------------------------------- 
         판매일자    판매량    누적판매량
       -------------------------------  
        2022-12-08	10         10
        2022-12-09	15         25
        2022-12-11	13         38
        2023-01-09	8          46
        2023-02-08	30         76
    */
    
    
    
    
     --- *** tbl_panmae 테이블에서 모든제품에 대한 일별판매량과 일별 누적 판매량을 나타내세요. *** ---
     --sum(누적되어야할 컬럼명) over(partition by 그룹화 되어질 컬럼명 
     --                              order by 누적되어질 기준이 되는 컬럼명 asc[desc] ) 를 사용한다.

   select jepumname AS 제품명
        , to_char(panmaedate , 'yyyy-mm-dd') AS 판매일자
        , sum(panmaesu) AS "일별 판매량"
        
        --sum(누적되어야할 컬럼명) over(partition by 그룹화 되어질 컬럼명 
        --                           order by 누적되어질 기준이 되는 컬럼명 asc[desc] )
        
        , sum(sum(panmaesu)) over(partition by jepumname
                                   order by to_char(panmaedate , 'yyyy-mm-dd') asc ) AS 누적판매량
   from tbl_panmae
   group by jepumname, to_char(panmaedate , 'yyyy-mm-dd');
   
    /*
       ------------------------------------------
        제품명       판매일자     판매량    누적판매량
       ------------------------------------------  
        감자깡	    2022-12-10	20	    20
        감자깡	    2023-01-10	10	    30
        감자깡	    2023-01-11	5	    35
        감자깡	    2023-02-08	15	    50
        고구마깡	    2023-01-08	7	    7
        고구마깡	    2023-02-05	15	    22
        고구마깡	    2023-02-06	10	    32
        고구마깡	    2023-02-08	20	    52
        새우깡	    2022-12-08	10	    10
        새우깡	    2022-12-09	15	    25
        새우깡	    2022-12-11	13	    38
        새우깡	    2023-01-09	8	    46
        새우깡	    2023-02-08	30	    76
        허니버터칩	2023-02-04	30	    30
        허니버터칩	2023-02-07	20	    50
        허니버터칩	2023-02-08	15	    65
    */
    
    -- 뷰 한개를 만드는 방법
   create or replace view view_panmae
   as
   select jepumname AS 제품명
        , to_char(panmaedate , 'yyyy-mm-dd') AS 판매일자
        , sum(panmaesu) AS "일별 판매량"
        
        --sum(누적되어야할 컬럼명) over(partition by 그룹화 되어질 컬럼명 
        --                           order by 누적되어질 기준이 되는 컬럼명 asc[desc] )
        
        , sum(sum(panmaesu)) over(partition by jepumname
                                   order by to_char(panmaedate , 'yyyy-mm-dd') asc ) AS 누적판매량
   from tbl_panmae
   group by jepumname, to_char(panmaedate , 'yyyy-mm-dd');
   -- View VIEW_PANMAE이(가) 생성되었습니다.


    --뷰를 생성한것을 가져다 쓰고 감자깡과 새우깡을 보고 싶다면 
    select *
    from view_panmae
    where 제품명 in('감자깡','새우깡');
   
   
   --뷰를 생성한것을 가져다 쓰고 감자깡과 허니버터칩을 보고 싶다면 
    select *
    from view_panmae
    where 제품명 in('감자깡','허니버터칩');
   
   
   --- *** [퀴즈] tbl_panmae 테이블에서 판매일자가 1개월전 '01'일 (즉, 현재가 2023년 2월 8일 이므로 2023년 1월 1일) 부터 현재까지 판매된 
   ---           모든 제품에 대해 일별판매량과 일별 누적판매량을 나타내세요
   
   --> 저번달 '01'일을 날짜로 나타내어주기
   select sysdate
         , add_months(sysdate, -1)
         , to_char(add_months(sysdate, -1), 'yyyy-mm-')    -- 저번달 
         , to_char(add_months(sysdate, -1), 'yyyy-mm-') || '01'
         , to_date(to_char(add_months(sysdate, -1), 'yyyy-mm-') || '01', 'yyyy-mm-dd' )
    from dual;
   
   
   
     --> 퀴즈 성공 코드 
   select jepumname AS 제품명
        , to_char(panmaedate , 'yyyy-mm-dd') AS 판매일자
        , sum(panmaesu) AS "일별 판매량"
        
        --sum(누적되어야할 컬럼명) over(partition by 그룹화 되어질 컬럼명 
        --                           order by 누적되어질 기준이 되는 컬럼명 asc[desc] )
        
        , sum(sum(panmaesu)) over(partition by jepumname
                                   order by to_char(panmaedate , 'yyyy-mm-dd') asc ) AS 누적판매량
   from tbl_panmae
   where panmaedate >= to_date(to_char(add_months(sysdate, -1), 'yyyy-mm-') || '01', 'yyyy-mm-dd' )
   group by jepumname, to_char(panmaedate , 'yyyy-mm-dd');
    
   
   --------------------------------------------------------------------------------------------
   --                         2월 9일자 시작 부분
   --------------------------------------------------------------------------------------------
   
   
   ----- ====== **** 아래처럼 나오도록 하세요 **** ====== ------
   
   --------------------------------------------------------------------------
   -- 전체사원수      10대      20대       30대     40대      50대     60대
   --------------------------------------------------------------------------
   --    107	     15	      17	     23	      20	   16	    16    
   
   select count(AGELINE) AS 전체사원수
        , sum(decode(AGELINE, 10, 1)) AS "10대"
        , sum(decode(AGELINE, 20, 1)) AS "20대"
        , sum(decode(AGELINE, 30, 1)) AS "30대"
        , sum(decode(AGELINE, 40, 1)) AS "40대"
        , sum(decode(AGELINE, 50, 1)) AS "50대"
        , sum(decode(AGELINE, 60, 1)) AS "60대"
   from
   (
       select trunc(extract(year from sysdate) - (to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end) +1, -1) AS AGELINE
       from employees
   ) V;
   
   
   ----- ====== **** 아래처럼 나오도록 하세요 **** ====== ------
   ------------------------------------------------------------------------------------------------------------------------------------------------------
   -- 직종ID    남자기본급여평균      여자기본급여평균      기본급여평균    (남자기본급여평균 - 기본급여평균)     (여자기본급여평균 - 기본급여평균)
   ------------------------------------------------------------------------------------------------------------------------------------------------------
   --  ...          ...               ...               ...                  ...                              ...
   -- FI_ACCOUNT    7900              7950              7920                 -20                              30
   -- IT_PROG       5700              6000              5760                 -60                              240
   --  ...          ...               ...               ...                  ...                              ... 
   
   select job_id AS 직종ID
        , to_char(nvl(trunc(avg(decode(GENDER, '남' , salary))), 0), '99,999') AS 남자기본급여평균 -- '남' 일때만 실행한다. decode는 case when then else end와 같다. 
        , to_char(nvl(trunc(avg(decode(GENDER, '여' , salary))), 0), '99,999') AS 여자기본급여평균 -- '여' 일때만 실행한다. decode는 case when then else end와 같다. 
        , to_char(trunc(avg(salary)), '99,999') AS 기본급여평균 
        , to_char(trunc(nvl(avg(decode(GENDER, '남' , salary)),0) - avg(salary)), '99,999') AS "평균과 남자평균 차액"
        , to_char(trunc(nvl(avg(decode(GENDER, '여' , salary)),0) - avg(salary)), '99,999') AS "평균과 여자평균 차액"
   from 
   (
   select job_id 
        , salary
        , case when substr(jubun, 7,1) in('1','3') then '남' else '여' end AS Gender 
   from employees
   ) V
   group by job_id
   order by 1;
  
   -- 결과 
   /*
   ------------------------------------------------------------------------------------------------------------------------------------------------------
   -- 직종ID    남자기본급여평균      여자기본급여평균      기본급여평균    (남자기본급여평균 - 기본급여평균)     (여자기본급여평균 - 기본급여평균)
   ------------------------------------------------------------------------------------------------------------------------------------------------------
   AC_ACCOUNT	      0	             8,300	           8,300	           -8,300	                          0
    AC_MGR	          0	            12,008	          12,008	          -12,008                   	      0
    AD_ASST	          0	             4,400	           4,400	           -4,400	                          0
    AD_PRES	     24,000	                 0	          24,000	                0	                    -24,000
    AD_VP	     17,000	            17,000	          17,000	                0	                          0
    FI_ACCOUNT	  7,900	             7,950	           7,920	              -20	                         30
    FI_MGR	          0	            12,008	          12,008	          -12,008	                          0
    HR_REP	          0	             6,500	           6,500	           -6,500	                          0
    IT_PROG	      5,700	             6,000	           5,760	              -60	                        240
    MK_MAN	          0	            13,000	          13,000	          -13,000	                          0
    MK_REP	          0	             6,000	           6,000	           -6,000	                          0
    PR_REP	     10,000	                 0	          10,000	                0	                    -10,000
    PU_CLERK	  2,775	             2,800	           2,780	               -5	                         20
    PU_MAN	          0	            11,000	          11,000	          -11,000	                          0
    SA_MAN	     12,000	            12,333	          12,200	             -200	                        133
    SA_REP	      8,335	             8,369	           8,350	              -14	                         19
    SH_CLERK	  3,255	             3,181	           3,215	               40	                        -33
    ST_CLERK	  2,860	             2,710	           2,785	               75	                        -75
    ST_MAN	      7,100	             8,000	           7,280	             -180	                        720
   */
   
   
   ----------------------------------------------------------------------------------------------------------------
   -- 그룹함수 종료
   ----------------------------------------------------------------------------------------------------------------
   
   
   
   
   
   ------------------------------ ***** sub Query (서브쿼리) ***** ----------------------------------------------
   /*
        -- sub Query (서브쿼리)란?
        select 문속에 또 다른 select 문이 포함되어져 있을 때 포함되어진 select문을 sub Query(서브쿼리) 라고 부른다.
        
        from .... ==> Main query (메인쿼리 == 외부쿼리)
        where ... in(select ...
                     from ... ) => sub Query (서브쿼리 == 내부 쿼리)
                     
        select ...
            , (select ... from ... )  => sub Query (서브쿼리 == 내부 쿼리)
        from ...==> Main query (메인쿼리 == 외부쿼리)
   */
   
   
   
    -- employees 테이블에서 기본급여가 제일 많은 사원과 기본급여가 제일 적은 사원의 정보를 
    -- 사원번호, 사원명, 기본급여로 나타내세요 ...
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , salary AS 기본급여
   from employees
   where salary = (select max(salary) from employees) OR salary = (select min(salary) from employees);
   
   /*
   where salary = (employees 테이블에서 salary의 최대값) OR salary = (employees 테이블에서 salary의 최소값)
   employees 테이블에서 salary의 최대값 ==> select max(salary) from employees  ==> 24000
   employees 테이블에서 salary의 최대값 ==> select min(salary) from employees  ==> 2100
   */
   
   
   -- 결과
   ------------------------------
   -- 사원번호  사원명     기본급여
   ------------------------------
   --  100	Steven King	24000
   --  132	TJ Olson	2100
   
   
   
   ----------------------------------------------------------------- 퀴즈 -----------------------------------------------------
   /*
        [퀴즈] 
        employees 테이블에서 부서번호가 60,80 번 부서에 근무하는 사원들중에
        월급이 50번 부서 직원들의 '평균월금' 보다 많은 사원들만
        부서번호. 사원번호, 사원명, 월급을 나타내세요
   */
   
   -- 기존 코드
   /*
   select DEPARTMENT_ID AS 부서번호
         , employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , nvl((salary + (salary * commission_pct)),salary) AS 월급 
   from employees
   where department_id in(60,80) and nvl((salary + (salary * commission_pct)),salary) > 50번 직원들의 '평균월금'
   */
   
   /*
   -- 50번 부서 직원들의 '평균월급'
   select avg( nvl((salary + (salary * commission_pct)),salary))
   from employees
   where department_id = 50;
   */
   
   
   -- 기존 코드와 50번 부서 직원들의 '평균월급; 보다 크면은 실행 완성본 !!!!!
   select DEPARTMENT_ID AS 부서번호
         , employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , to_char(nvl((salary + (salary * commission_pct)),salary),'99,999') AS 월급 
   from employees
   where department_id in(60,80) and nvl((salary + (salary * commission_pct)),salary) > (select avg( nvl((salary + (salary * commission_pct)),salary))
                                                                                         from employees
                                                                                         where department_id = 50) 
   order by 1 asc, 4 desc;
   
   
   
   
   ------------------------------------- 퀴즈 --------------------------------------
   -- [퀴즈] employees 테이블에서 부서번호별로 인원수와 퍼센티지를 나타내세요
   
   /*
   -----------------------------------
        부서번호    인원수    퍼센티지
   -----------------------------------
         10	        1	    0.9
         20	        2	    1.9
         30	        6	    5.6
         40	        1	    0.9
         50	       45	    42.1
         60	        5	    4.7
         70	        1	    0.9
         80	       34	    31.8
         90	        3	    2.8
         100	    6	    5.6
         110	    2	    1.9
         인턴	    1	    0.9
         전체	  107	    100
   */
   
   select nvl(decode( grouping(department_id) , 0 , to_char(department_id), '전체'), '인턴') AS 부서번호
         , count(*) AS 인원수
         , to_char(round(count(*) / (select count(*) from employees) * 100, 1), '990.0') AS 퍼센티지   -- 소수점을 나타낼때 정수자리에 0이 필요하면은 '999.0'을 '990.0'으로 변경하면 자리수에 0을 표시할 수 있다. 
   from employees
   group by rollup(department_id);
   -- 또는
   --group by grouping sets ((department_id), ())
   
   /*
   ---------------------------
      성별    인원수    퍼센티지
   ---------------------------
      남       56       52.3 
      여       51       47.7
      전체     107       100
    */
   
   select decode( grouping(GENDER), 0, to_char(GENDER), '전체') AS 성별
        , count (*) AS 인원수
        , to_char(round(count(*) / (select count(*) from employees) * 100, 1), '990.0') AS 퍼센티지
   from
   (
        select case when substr(jubun , 7, 1) in('1','3') then '남' else '여' end AS GENDER
        from employees
   ) V
   group by rollup(GENDER);
   
   
   
   --------------------------------------------------------------------------------------------------------
   
   create table tbl_authorbook
   (bookname     Nvarchar2(20)
   ,authorname   Nvarchar2(10)
   ,loyalty     number(5));
   -- Table TBL_AUTHORBOOK이(가) 생성되었습니다.


   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('자바프로그래밍','이순신',1000);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('로빈슨크루소','한석규',800);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('로빈슨크루소','이순신',500);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('조선왕조실록','엄정화',2500);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','유관순',1200);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','이혜리',1300);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','서강준',1700);

   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('어린왕자','김유신',1800);
   
   commit;
   -- 커밋 완료.

   -- 해당 테이블 보기
   select *
   from tbl_authorbook;
   

   -- tbl_authorbook 테이블에서 공저(도서명은 동일하지만 작가명이 다른 도서)로 지어진 도서정보를 나타내세요..
   /*
        ---------------------------------------------------
        도서명       작가명        로얄티
        ---------------------------------------------------
        로빈슨크루소   한석규       800
        로빈슨크루소   이순신       500
        그리스로마신화 유관순       1200
        그리스로마신화 이혜리       1300
        그리스로마신화 서강준       1700
   */
   
   select bookname, count(*)
   from tbl_authorbook
   group by bookname
   having  count(*) > 1;  -- bookname에서 카운트가 1보다 큰 값만 
   -- 로빈슨크루소  	2
   -- 그리스로마신화	3
   
   -- 도서 이름만 출력
   select bookname
   from tbl_authorbook
   group by bookname
   having  count(*) > 1;  -- bookname에서 카운트가 1보다 큰 값만 
   -- 로빈슨크루소
   -- 그리스로마신화
   
    개념
   /*
   select *
   from tbl_authorbook
   where bookname in('로빈슨크루소', '그리스로마신화');
   */
   
   
   select *
   from tbl_authorbook
   where bookname in( select bookname
                         from tbl_authorbook
                         group by bookname
                         having count(*) > 1 );
                         
   -- 결과 
   /*
    로빈슨크루소	한석규	800
    로빈슨크루소	이순신	500
    그리스로마신화	유관순	1200
    그리스로마신화	이혜리	1300
    그리스로마신화	서강준	1700
   */
   
   
   
            ------- ====== ***** Fairwise(쌍) sub Query ***** ======== --------
   
   -- 두개 이상의 컬럼을 하나로 뭉치는 것을 Fairwise(쌍) sub Query 이라고 부른다.
   --예시로 보여주자면 (department_id , salary) 이런것을 뜻한다.
   
   /*
       employees 테이블에서 
       부서번호별로 salary 가 최대인 사원과 
       부서번호별로 salary 가 최소인 사원의 정보를 
       부서번호, 사원번호, 사원명, 기본급여를 나타내세요.
    */
    
    select department_id AS 부서번호
          , employee_id AS 사원번호
          , first_name || ' ' || last_name AS 사원명  
          , salary AS 기본급여
    from employees
    order by 1, 2;
    
        /*
        -----------------------
        department_id    salary
        -----------------------
            10	        4400
            20	        6000
            20	        13000
            30	        2500
            30	        2600
            30      	2800
            30	        2900
            30	        3100
            30	        11000
            40	        6500
            ...          ...
            60	        4200
            60	        4800
            60	        4800
            60	        6000
            60	        9000
            ...          ...
   
   
   -- 내가 원하는 결과값
   
        -----------------------
        department_id    salary
        -----------------------
            10	        4400
            20	        6000
            20	        13000
            30	        2500
            30	        11000
            40	        6500
            ...          ...
            60	        4200
            60	        9000
            ...          ...
            
    */
    
    -- 부서마다 가장 작은 기본급여는?
    select department_id, min(salary)
    from employees
    group by department_id;
    /*
         ...   ...
          30   2500
          60   4200
         ...   ...
    */
    
    -- 부서마다 가장 큰 기본급여는?
    select department_id, max(salary)
    from employees
    group by department_id;
    /*
         ...   ...
          30   11000
          60    9000
         ...   ...
    */
    
    -- 각각의 부서에 최소와 최대값을 보여준다. 완성 코드 
    select nvl(department_id, -9999) AS 부서번호  -- 여기 null을 -9999로 바꾼것 뿐이다.
          , employee_id AS 사원번호
          , first_name || ' ' || last_name AS 사원명  
          , salary AS 기본급여
    from employees
    -- in 안에는 null값이 nvl이 나오지만 전체코드에서 안나오는 결과가 있었다
    -- 이것을 고치기 위해서는 in안에도 nvl을 써주고 in밖에도nvl을 써주면 null 값을 표시 가능하다.
    where (nvl(department_id,-9999) , salary) in( select nvl(department_id, -9999), min(salary)
                                       from employees
                                       group by department_id)
            OR 
          (nvl(department_id,-9999) , salary) in(select nvl(department_id,-9999), max(salary)
                                      from employees
                                      group by department_id)
        -- where (department_id , salary)는 Fairwise(쌍) sub Query 라고 부른다.
    order by 부서번호, 기본급여;   -- 오름차순 정렬
    
    
    
    ----------------------------------------------------------------------------------------
    --------  ============ ********* 상관서브쿼리(== 서브상관쿼리) ********* ============== ----------
    
    /*
       상관서브쿼리라 함은 MAin Query(==외부쿼리)에서 사용된 테이블(뷰)에 존재하는 컬럼이 
       sub Query(== 내부쿼리)의 조건절(where절,  having 그룹함수조건절) 에 사용되어질때
       상관서브쿼리(==서브상관쿼리)라고 부른다.
    */
    
    
    -- employees 테이블에서 기본 급여에 대해 전체 등수 및 부서내 등수를 구하세요.
    -- Rank()함수를 쓰지 않고 count(*)를 이용하여 상관서브쿼리를 사용하여 구해보겠습니다
    
    -- 기본 급여를 나타내는 것
    select salary
    from employees;
    
    
    -- 기본 급여가 12008보다 높은 사람을 표시하세요 
    select salary
    from employees
    where salary > 12008;   
    
    -- 자신의 기본 급여가 12008이라면 기본 급여가 12008인 사람은 몇등일까요?
    select count(salary) + 1 AS 등수
    from employees
    where salary > 12008; 
    
    
    -- 위의 모든 예제들을 종합한 완성코드 
    select E.department_id AS 부서번호
          ,E.employee_id AS 사원번호
          ,E.salary AS 기본급여
          , (select count(salary)+1
             from employees
             where department_id = E.department_id AND  
                   salary > E.salary )AS 부서내등수 
                   
          , (select count(salary)+1
             from employees
             where salary > E.salary ) AS 전체등수
    from employees E   -- E는 별칭이다. 
    -- 서브쿼리에 Main 쿼리의 값을 쓰고 싶을때는 별칭으로써 나타내어 주면 된다.
    -- 내부쿼리안에 Main 쿼리 조건절에서 쓰일때 상관서브쿼리(서브상관쿼리)라고 부른다.!!!!!!!!
    order by 부서번호, 기본급여 desc;
    
    
    
    -------------------------------------------------------------------------------
    ----- ======= ******  sub Query를 사용하여 테이블을 생성할 수 있습니다. ****** ======== ------
    
    create table tbl_employees_3060
    as
    select department_id
          , employee_id
          , first_name || ' ' || last_name AS ENAME   -- 이것은 컬럼명이 아니므로 반드시 별명을 지어주어야함 
          , nvl(salary + (salary * commission_pct), salary) AS MONTHSAL
          , case when substr(jubun, 7, 1) in('1','3') then'남' else '여' end as GENDER
          , jubun
    from employees
    where department_id in(30,60);
    -- Table TBL_EMPLOYEES_3060이(가) 생성되었습니다.

    
    select * 
    from tab;
    
    -- 테이블 구조 보기
    desc TBL_EMPLOYEES_3060;
    
    select *
    from TBL_EMPLOYEES_3060;
    
    
     ----- == ***  employees 테이블을 가지고 데이터 값이 employees 테이블의 구조만 동일한 tbl_employees_sub 이라는 테이블을 생성해본다. *** == ------
    -- 데이터 나옴
    select *
    from employees
    where 1=1;
    
    --데이터 안나오고 컬럼 이름만 나옴
    select *
    from employees
    where 1=2;

    
    -- 데이터는 안받아오고 컬럼이름만 복사하고 싶을 시 !!!
    create table tbl_employees_sub
    as
    select *
    from employees
    where 1=2;
    -- Table TBL_EMPLOYEES_SUB이(가) 생성되었습니다.

    select *
    from TBL_EMPLOYEES_SUB;
    
    desc employees;
    desc TBL_EMPLOYEES_SUB;
    
    
    --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    --- 중요부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
     ---- ****** 필수로 꼭 알아두시길 바랍니다.  +++ 
     -- 상관서브쿼리(==서브상관쿼리)를 사용한 update 처리하기 ====
           
     /*
        회사에 입사하셔서 delete 또는 update를 할 때 먼저 반드시 해당 테이블을 백업해두시고
        delete 또는 update 하셔야 합니다.  실수하면 복구하기 위한 것이다.
     */
    
    --백업 테이블 생성 
    create table tb1_employees_backup
    as
    select *
    from employees;
    -- Table TB1_EMPLOYEES_BACKUP이(가) 생성되었습니다.

    -- 백업을 되었는지 확인해보기 
    select *
    from tb1_employees_backup;
    
    -- 원본을 업데이트 시켜봄 
    update employees set first_name = '순신' , last_name = '이';
  -- 107개 행 이(가) 업데이트되었습니다.

    
    -- 업데이트 된 내용 확인 
    select *
    from employees;
    
    -- 커밋 디스크에 저장
    commit;
    
    -- 롤백 해도 안됨
    roolback;
    
    -- 다시한번 백업 테이블 보기 
    select *
    from tb1_employees_backup;
    
    -- 업데이트로 백업테아블처럼 변경하기 위해 
    update employees E set first_name = (select first_name 
                                       from tb1_employees_backup
                                       where employee_id = E.employee_id)
                         , last_name = (select last_name 
                                       from tb1_employees_backup
                                       where employee_id = E.employee_id);
    -- 107개 행 이(가) 업데이트되었습니다.

    -- 결과 확인 
    select *
    from employees;

    commit;
    -- 커밋 완료
    
    
    
    --------------------------------------------------------------------------------
    ------ **** sub Query 절을 사용하여 데이터를 입력(insert) 할 수 있다, **** ------------
    
    -- 부서번호 30, 60이 들어가있는 테이블 
    select * 
    from TBL_EMPLOYEES_3060;
    
    desc TBL_EMPLOYEES_3060;
    
    -- 부서번호 40 60 을 추가시키고 싶다면 (오류부분)
    insert into TBL_EMPLOYEES_3060
    select first_name || ' ' || last_name
          , department_id
          , employee_id
          , nvl(salary + (salary * commission_pct), salary)
          , case when substr(jubun, 7, 1) in('1','3') then'남' else '여' end
          , jubun
    from employees
    where department_id in(40,50)
    order by department_id;
    /*
        오류 보고 
        ORA-01722 : 수치가 부적합합니다
    */    
    
     -- 부서번호 40 60 을 추가시키고 싶다면 (성공)
    insert into TBL_EMPLOYEES_3060(ENAME, DEPARTMENT_ID, EMPLOYEE_ID, MONTHSAL, GENDER, JUBUN)
    select first_name || ' ' || last_name
          , department_id
          , employee_id
          , nvl(salary + (salary * commission_pct), salary)
          , case when substr(jubun, 7, 1) in('1','3') then'남' else '여' end
          , jubun
    from employees
    where department_id in(40,50)
    order by department_id;
    -- 46개 행 이(가) 삽입되었습니다.

    -- 결과를 확인해보자
    select * 
    from TBL_EMPLOYEES_3060;
    
    -- 부서번호 90,100 추가하기 (꼭 순서가 같아야만 함)
    insert into TBL_EMPLOYEES_3060
    select department_id
          , employee_id
          , first_name || ' ' || last_name
          , nvl(salary + (salary * commission_pct), salary)
          , case when substr(jubun, 7, 1) in('1','3') then'남' else '여' end
          , jubun
    from employees
    where department_id in(90,100)
    order by department_id;
    -- 9개 행 이(가) 삽입되었습니다.

    -- 결과를 확인해보자
    select * 
    from TBL_EMPLOYEES_3060;
    
    commit;
    -- 커밋 완료 
    
    
    ------ **** sub Query 절을 사용하여 데이터를 수정(update) 할 수 있다, **** ------------
    
    -- tbl_employees_3060 테이블에서 부서번호 60번에 해당하는 사원들의 monthsal 컬럼의 값을 수정
    -- employees 테이블에 있는 부서번호 30번 직원들의 월급의 평균값으로 monthsal 값으로 수정한다.
    
    /*  해야 할 부분!! 
    update tbl_employees_3060 monthsal = (employees 테이블에 있는 부서번호 30번 직원들의 월급의 평균값)
    where department_id =60;
    */
    
    -- employees 테이블에 있는 부서번호 30번 직원들의 월급의 평균값
    select avg(nvl(salary + (salary * commission_pct), salary)) 
    from employees
    where department_id = 30;
    -- 4150
    
    
    -- 완성본
    update tbl_employees_3060 set monthsal = (select avg(nvl(salary + (salary * commission_pct), salary)) 
                                             from employees
                                             where department_id = 30)
    where department_id =60;
    -- 5개 행 이(가) 업데이트되었습니다.


    -- 결과 확인하기 
    select *
    from tbl_employees_3060;
    -- 부서 60번은 모두  4150으로 변경됨
    
    commit;
    -- 커밋 완료
    
    
    
    
    ------ **** sub Query 절을 사용하여 데이터를 삭제(delete) 할 수 있다, **** ------------
    
    select *
    from tbl_employees_3060;
    
    delete from tbl_employees_3060;    -- tbl_employees_3060테이블에 있는 모든 행들을 삭제하는 것이다.
                                       -- 테이블은 존재하지만 데이터는 삭제된다.
    -- 66개 행 이(가) 삭제되었습니다.
          
    -- 결과 는 아무것도 없는 공백으로 나옴      
    select *
    from tbl_employees_3060;            
    
    -- 실행 취소하기
    rollback;
    -- 롤백 완료
    
    -- 결과는 다시 행이 생겼다.
    select *
    from tbl_employees_3060;  
    
    
    -- 부서 번호 30,100을 삭제해보자
    delete from tbl_employees_3060
    where department_id in(30,100);
    -- 12개 행 이(가) 삭제되었습니다.
   
   
    -- 결과는 30,100 행을 삭제한 값이 나온다. 
    select *
    from tbl_employees_3060;

    -- 실행 취소하기
    rollback;
    -- 롤백 완료
    
    -- 결과는 다시 행이 생겼다.
    select *
    from tbl_employees_3060;  




    ------ **** employees_3060 테이블에서 monthsal 이 employees 테이블의 월급평균보다 작은 행들만 삭제하세요 *** ----
    
    /*  문제 개념
         delete from tbl_employees_3060
         where monthsal < ( employees 테이블 월급평균값)
    */
    
    -- employees 테이블의 월급평균값
    select avg(nvl(salary + (salary * commission_pct) , salary))
    from employees;
    -- 7150.523364485981308411214953271028037383
    
    
    -- 완성본 
    delete from tbl_employees_3060
    where monthsal < (select avg(nvl(salary + (salary * commission_pct) , salary))
                      from employees);
    -- 54개 행 이(가) 삭제되었습니다.


    -- 결과 홧인 
    select *
    from tbl_employees_3060;
    
    commit;
    -- 커밋 완료.



--!!!!!!!!!!!!!!!!!!!!!!!!!!! 회사 면접에서 무조건 물어보는 항복 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-----------------------------------------------------------------------------------------
----- !!!!!!!!! 아주아주 중요    join은 면접에 가시면 무조건 물어봅니다  !!!  아주아주 중요 !!!!!!!!
-----------------------------------------------------------------------------------------

                        ----- ***** join ***** ------

/*
    JOIN(조인)은 테이블(뷰)과 테이블(뷰) 을 합치는 것을 말하는데
    행(ROW) 과 행(ROW)을 합치는 것이 아니라, 컬럼(COLUME) 과 컬럼(COLUME)을 합치는 것을 말한다.
    위에서 말한 행(ROW) 과 행(ROW)을 합치는 것은 UNION 연산자를 사용하는 것이다.
    
    -- 면접질문 : INNER JOIN(내부조인) 과 OUTER JOIN(외부조인)의 차이점에 대해서 말하세요
    -- 면접질문 : JOIN과 UNION의 차이점에 대해서 말해보세요
    
    (집합)
    A = {1, 2, 3} 원소가 3개
    B = {a, b}    원소가 2개
    
    -- 집합 A와 B의 모든 경우의 수를 나타낸다,
    A ⊙ B = { (1,a) , (1,b)
              , (2,a) , (2,b)
              , (3,a) , (3,b)
             }
    
    데카르트곱(수학) ==> 원소의 곱 :  3 * 2 = 6개(모든 경우의 수)
    --> 수학에서 말하는 데카르트곱을 데이터베이스에서는 Catersian product 라고 부른다.
    
    
    JOIN ==> SQL 1992 CODE  방식 --> 테이블(뷰) 과 테이블(뷰) 사이에 콤마(,)를 찍어주는 것.
                                    콤마(,)를 찍어주는 것을 제외한 나머지 문법은 데이터베이스 벤더(회사) 제품마다 조금씩 다르다.
    
    JOIN ==> SQL 1999 CODE  방식(ANSI(표준)) --> 테이블(뷰) 과 테이블(뷰) 사이에 JOIN 이라는 단어를 넣어주는 것이다.
                                              ANSI(표준화) 되어진 SQL
*/

    -- SQL 1992 CODE  방식 Catersian product를 사용하자
    select *
    from employees;
    
    select count(*)
    from employees;  --107개 행 
    
    select *
    from departments;
    
    select count(*)
    from departments;  -- 27개 행

    -- SQL 1992 CODE  방식 Catersian product
    -- JOIN은 컬럼과 컬럼을 합치므로 가로로 길게 나온다.
    select *
    from employees , departments; 
    
    
    -- SQL 1992 CODE  방식 Catersian product
    select count(*)
    from employees , departments; 
    -- 2889개 행이 존재 
    
    -- 이것과 같다
    select 107 * 27
    from dual;
    --2889
    
    
    
    -- -- SQL 1999 CODE  방식 Catersian product를 사용하자
    
    
    -- JOIN은 컬럼과 컬럼을 합치므로 가로로 길게 나온다.
    select *
    from employees CROSS JOIN departments; 
    
    
    select count(*)
    from employees CROSS JOIN departments; 
    -- 2889개 행이 존재 
    
    
    
    
    ----- 1. Cross JOIN 사용 예) --
    ----- Cross Join은 그룹함수로 나온 1개의 행을 가지고 어떤 데이터 값을 얻으려고 할 때 사용된다.
    
    /*
        사원번호,  사원명,   부서번호,  기본급여,   모든사원들의기본급여평균   기본급여평균의차액
        이 나오도록 해보아라 
    */
    
    --오류 --
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          , department_id AS 부서번호
          , salary AS 기본급여
          , avg(salary)  AS "모든 사원들의 기본급여 평균"
    from employees;
    -- 오류 avg(salary) 이것이 그룹 함수이므로 오류발생 
    
    
    -- 그룹함수 때문에 오류가 발생하므로 나누어서 보자 (그룹함수 아닌것)
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          , department_id AS 부서번호
          , salary AS 기본급여
          --, avg(salary)  AS "모든 사원들의 기본급여 평균"
    from employees; --107개 행 


    -- 그룹함수 때문에 오류가 발생하므로 나누어서 보자 (그룹함수 인것) 
    select trunc(avg(salary))  AS "모든 사원들의 기본급여 평균"
    from employees;  -- 1개 행 
    -- 6461
    
    
    -- SQL 1999 CODE  방식을 사용하여 보자 ---
    -- CROSS JOIN 해보자 
    -- 사원번호    사원명    부서번호    기본급여     모든사람들의기본급여평균
    
    select A.사원번호, A.사원명, A.부서번호, A.기본급여, B.모든사원들의기본급여평균 
         , A.기본급여 - B.모든사원들의기본급여평균 AS 기본급여평균의차액
    from  
    (
        select employee_id AS 사원번호
              ,first_name || ' ' || last_name AS 사원명
              , department_id AS 부서번호
              , salary AS 기본급여
        from employees
    ) A   --- 107개 행 
    CROSS JOIN   -- JOIN시키자 (테이블(뷰) 와 테이블(뷰) 사이에 넣는다. (SQL 1999 CODE  방식)(표준)
    (
        select trunc(avg(salary))  AS 모든사원들의기본급여평균
        from employees
    ) B;  -- 1개 행 
    
    -- 결과는 전체 107개가 다 나온다. 
    
    
    -- SQL 1992 CODE  방식 을 사용하여 보자 ---
    select A.사원번호, A.사원명, A.부서번호, A.기본급여, B.모든사원들의기본급여평균 
         , A.기본급여 - B.모든사원들의기본급여평균 AS 기본급여평균의차액
    from  
    (
        select employee_id AS 사원번호
              ,first_name || ' ' || last_name AS 사원명
              , department_id AS 부서번호
              , salary AS 기본급여
        from employees
    ) A   --- 107개 행 
    ,    -- SQL 1992 CODE  방식
    (
        select trunc(avg(salary))  AS 모든사원들의기본급여평균
        from employees
    ) B;  -- 1개 행 
    
    
    ---------------------------------------------------------------------------
    
    
    --- *** EQUI JOIN (SQL 1992 CODE 방식)
    /*
        (EQUI JOIN 예)
        
        부서번호   부서명    사원번호    사원명    기본급여
        아 나오도록 하세요///
        
        부서번호                       부서명              사원번호    사원명    기본급여
        -----------                  -------           ---------------------------
        departments.department_id    departments                employees
        employees.department_id
    */
    
    select *
    from employees  , departments 
    where employees.department_id = departments.department_id;
    -- 이때 where 절을 JOIN조건절 이라고 부른다.
    
    
    select *
    from employees E , departments D 
    where employees.department_id = departments.department_id;
    -- 오류 ORA-00904: "DEPARTMENTS"."DEPARTMENT_ID": 부적합한 식별자
    
    
    select *
    from employees E , departments D 
    where E.department_id = D.department_id;
    -- 오류 발생 X
    
    -- 틀린 풀이이다.
    select *
    from employees E , departments D 
    where nvl(E.department_id,-9999) = nvl(D.department_id, -9999);
    
    
    
    --------------
    ----------------- 올바른 풀이
    select *
    from employees E , departments D 
    where E.department_id = D.department_id;
    /*
        위의 SQL문을 실행하면 department_id 가 NULL 인 Kimberely Grant는 출력되지 않는다.
    */
    
    -- 올바른 풀이 null이 보임 
    -- JOIN조건절 (+)
    select *
    from employees E , departments D 
    where E.department_id = D.department_id(+);
    
    /*
        중요!!!!!!!!!!!!
        조인 조건절에서 (+) 가 안 붙은 테이블인 E (emplotees) 테이블의 모든 행을 모두 출력해주고 나서 그 다음에 
        where E.department_id = D.department_id 조건에 만족하는 행들을 보여준다.
    */
    
    
    -- 틀린 풀이
    select department_id AS 부서번호
          ,department_name AS부서명
          , employee_id AS 사원번호
          , first_name || ' ' || last_name AS 사원명
          , salary AS 기본급여
    from employees E , departments D 
    where E.department_id = D.department_id(+);
    -- ORA-00918: 열의 정의가 애매합니다
    -- 00918. 00000 -  "column ambiguously defined"
    
    
    -----------------------정답 풀이-------------------------
    select E.department_id AS 부서번호
          ,D.department_name AS부서명
          ,E.employee_id AS 사원번호
          ,E.first_name || ' ' || last_name AS 사원명
          ,E.salary AS 기본급여
    from employees E , departments D 
    where E.department_id = D.department_id(+);
    -- 또는 
    
    --- employees 테이블과 departments 테이블에서 모두에 있지 않은 컬럼은 E., D. 을 빼고 무방하다
    select E.department_id AS 부서번호          -- employees 테이블을 모두 보여주겠다
          ,department_name AS부서명
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,salary AS 기본급여
    from employees E , departments D 
    where E.department_id = D.department_id(+);
    
    
    
    select D.department_id AS 부서번호   -- departments 테이블을 다 보여주겠다.
          ,department_name AS부서명
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,salary AS 기본급여
    from employees E , departments D 
    where E.department_id(+) = D.department_id;
    /*
        중요!!!!!!!!!!!!
        조인 조건절에서 (+) 가 안 붙은 테이블인 D (departments) 테이블의 모든 행을 모두 출력해주고 나서 그 다음에 
        where E.department_id = D.department_id 조건에 만족하는 행들을 보여준다.
        
        위의 SQL문을 실행하면 department_id 가 employees 테이블에 존재하지 않는 120번 부터 270번 부서까지 출력된다.
    */
    
    
    select D.department_id AS 부서번호
          ,department_name AS부서명
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,salary AS 기본급여
    from employees E , departments D 
    where E.department_id(+) = D.department_id(+);
    -- 오류 !! ORA-01468: outer-join된 테이블은 1개만 지정할 수 있습니다
    -- (+)는 양쪽에 모두 사용할 수 없다
    -- 그렇기에 밑에 있는 FULL JOIN을 이용하여서 나타내야 한다.
    
    
    
    
    ---------------------------------------------------------------------------
    
    
    --- *** INNER JOIN (SQL 1999 CODE 방식)
    /*
        (INNER JOIN 예)
        
        부서번호   부서명    사원번호    사원명    기본급여
        아 나오도록 하세요///
        
        부서번호                       부서명              사원번호    사원명    기본급여
        -----------                  -------           ---------------------------
        departments.department_id    departments                employees
        employees.department_id
    */
    
    select *
    from employees E INNER JOIN departments D 
    ON E.department_id = D.department_id;
    -- 이때 ON 절은 JOIN 조건절이라고 부른다.!!!!!
    -- 부서번호가 일치하는 것만 나옴 (106명 나옴 ) null값 가진 킴벨리는 안나옴 
    -- INNER JOIN 은 JOIN 조건절에 맞는 행만 메모리 로딩한다.
    -- 그래서 E.department_id 값이 null인 Kimbarely Grant 는 출력되지 않는다.
    
    
    select E.department_id AS 부서번호
          ,department_name AS부서명
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,salary AS 기본급여
    from employees E INNER JOIN departments D 
    ON E.department_id = D.department_id;
    -- 행이 106개 
    -- 또는 
    select E.department_id AS 부서번호
          ,department_name AS부서명
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,salary AS 기본급여
    from employees E JOIN departments D 
    ON E.department_id = D.department_id;
    -- 행이 106개 (INNER은 생략이 가능하다)


    --- *** OUTER JOIN (SQL 1999 CODE 방식)
    /*
        (OUTER JOIN 예)
        
        부서번호   부서명    사원번호    사원명    기본급여
        아 나오도록 하세요///

        부서번호                       부서명              사원번호    사원명    기본급여
        -----------                  -------           ---------------------------
        departments.department_id    departments                employees
        employees.department_id
    */
    
    select *
    from employees E LEFT OUTER JOIN departments D 
    ON E.department_id = D.department_id;
    -- LEFT는 왼쪽에 있는 employees를 모두 출력 
    -- 이때 ON 절은 JOIN 조건절이라고 부른다.!!!!!
    -- LEFT OUTER JOIN 은 왼쪽에 기술된 employees 테이블의 모든 행 (107개)을 출력해 준 다음에
    -- JOIN 조건절인 E.department_id = D.department_id 으로 매칭해준다.
    -- 그래서 E.department_id 값이 null인 Kimbarely Grant 는 출력해준다.
    
    
    select E.department_id AS 부서번호
          ,department_name AS부서명
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,salary AS 기본급여
    from employees E LEFT OUTER JOIN departments D 
    ON E.department_id = D.department_id;
    -- 행이 107개 
    
    
     select D.department_id AS 부서번호   -- departments 테이블을 다 보여주겠다.
          ,department_name AS부서명
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,salary AS 기본급여
    from employees E RIGHT OUTER JOIN departments D    -- 오른쪽에 있는 departments를 모두 보여주겠다.
    ON E.department_id = D.department_id;
    /*
        이때 ON 절은 JOIN 조건절이라고 부른다.!!!!!
        RIGHT OUTER JOIN 은 오른쪽에 기술된 departments 테이블의 모든 행 (27개)을 출력해 준 다음에
        JOIN 조건절인 E.department_id = D.department_id 으로 매칭해준다.
        
        위의 SQL문을 실행하면 department_id 가 employees 테이블에 존재하지 않는 120번 부터 270번 부서까지 출력된다.
    */
    
    
    -- FULL JOIN
    select D.department_id AS 부서번호   -- departments 테이블을 다 보여주겠다.
          ,department_name AS부서명
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,salary AS 기본급여
    from employees E FULL OUTER JOIN departments D    -- FULL은 employees와 departments를 모두 보여주겠다.
    ON E.department_id = D.department_id;
    /*
        이때 ON 절은 JOIN 조건절이라고 부른다.!!!!!
        FULL OUTER JOIN 은 양쪽에 기술된 employees 테이블의 모든 행(107개) 와 departments 테이블의 모든 행 (27개)을 출력해 준 다음에
        JOIN 조건절인 E.department_id = D.department_id 으로 매칭해준다.
        
        위의 SQL문을 실행하면 
        E.department_id 값이 NULL인 Kimberely Grant 도 출력되고
        department_id 가 employees 테이블에 존재하지 않는 120번 부터 270번 부서까지 출력된다.
    */
    
    
    ---------------- OUTER 은 생략이 가능하다 ----------------------------
    select E.department_id AS 부서번호
          ,department_name AS부서명
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,salary AS 기본급여
    from employees E LEFT JOIN departments D   --LEFT OUTER JOIN과 동일하다. 
    ON E.department_id = D.department_id;
    -- 행이 107개 
    -- OUTER를 생략해도 문제 없음 
    
    
    select E.department_id AS 부서번호
          ,department_name AS부서명
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,salary AS 기본급여
    from employees E RIGHT JOIN departments D   --RIGHT OUTER JOIN과 동일하다. 
    ON E.department_id = D.department_id;
    -- 행이 122개 
    -- OUTER를 생략해도 문제 없음 
    
    
    select E.department_id AS 부서번호
          ,department_name AS부서명
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,salary AS 기본급여
    from employees E FULL JOIN departments D   --FULL OUTER JOIN과 동일하다. 
    ON E.department_id = D.department_id;
    -- 행이 123개 
    -- OUTER를 생략해도 문제 없음 
    
    
    
    
    
    ---------------------- *** JOIN 을 사용한 응용문제 *** --------------------------
    /*
        아래와 같이 나오도록 하세요
        
        -----------------------------------------------------------------
        부서번호  사원번호   사원명    기본급여   부서평균기본급여   부서평균과의차액
        -----------------------------------------------------------------
        
        ----------------------------------           ---------------------------------
        부서번호  사원번호   사원명    기본급여             부서번호   부서평균기본급여  
        ----------------------------------           ---------------------------------
           10     1001    홍길동    3700                  10         3500
           10     1002    이순신    2500                  20         4000
           20     2001    엄정화    3500                  30         2800
           20     2002    유관순    4500                  ...        ...
           ..      ...    ...       ...                  110        3200
    */
    
    SELECT A.department_id AS 부서번호
        , A.employee_id AS 사원번호
        , A.ENAME AS 사원명
        , A.salary AS 기본급여
        , B.AVG_SALARY AS 부서평균기본급여
        , A.salary - B.AVG_SALARY AS 부서평균과의차액
    FROM 
    (
      select department_id , employee_id
           , first_name || ' ' || last_name AS ENAME
           , salary
      from employees
    ) A
    JOIN 
    (
      select department_id , trunc(avg(salary)) AS AVG_SALARY
      from employees
      group by department_id
    ) B
    ON NVL(A.department_id, -9999) = NVL(B.department_id, -9999)
    order by 1;
    

     /*
        아래와 같이 나오도록 하세요
        
        -------------------------------------------------------------------------------------------------
        부서번호  사원번호   사원명    기본급여   부서평균기본급여   부서평균과의차액  부서내기본급여등수   전체기본급여등수
        -------------------------------------------------------------------------------------------------
        
     */
     
     SELECT A.department_id AS 부서번호
        , A.employee_id AS 사원번호
        , A.ENAME AS 사원명
        , to_char(A.salary,'999,999') AS 기본급여
        , to_char(B.AVG_SALARY,'999,999') AS 부서평균기본급여
        , to_char(A.salary - B.AVG_SALARY,'999,999') AS 부서평균과의차액
        , rank() over(partition by A.department_id
                     order by A.salary desc) AS 부서내기본급여등수
        , rank() over (order by A.salary desc) AS 전체기본급여등수 
    FROM 
    (
      select department_id , employee_id
           , first_name || ' ' || last_name AS ENAME
           , salary
      from employees
    ) A
    JOIN 
    (
      select department_id , trunc(avg(salary)) AS AVG_SALARY
      from employees
      group by department_id
    ) B
    ON NVL(A.department_id, -9999) = NVL(B.department_id, -9999)
    order by 1;
     
     
    ---------------------------------------------------------------------
    /*
    
        부서 10,30,50에 근무하는 사원들만 아래처럼 나오도록 출력합니다
        
        -------------------------------------------------------------------------------------------------
        부서번호  사원번호   사원명    기본급여   부서평균기본급여   부서평균과의차액  부서내기본급여등수   전체기본급여등수
        -------------------------------------------------------------------------------------------------
        
     */
     
     SELECT A.department_id AS 부서번호
        , A.employee_id AS 사원번호
        , A.ENAME AS 사원명
        , to_char(A.salary,'999,999') AS 기본급여
        , to_char(B.AVG_SALARY,'999,999') AS 부서평균기본급여
        , to_char(A.salary - B.AVG_SALARY,'999,999') AS 부서평균과의차액
        , rank() over(partition by A.department_id
                     order by A.salary desc) AS 부서내기본급여등수
        , rank() over (order by A.salary desc) AS 전체기본급여등수 -- 사원전체 107면 중에 등수가 아니라 부서번호 10,30,50 번 중에서 등수인것이다.
    FROM 
    (
      select department_id , employee_id
           , first_name || ' ' || last_name AS ENAME
           , salary
      from employees
    ) A
    JOIN 
    (
      select department_id , trunc(avg(salary)) AS AVG_SALARY
      from employees
      group by department_id
    ) B
    ON NVL(A.department_id, -9999) = NVL(B.department_id, -9999)
    where A.department_id in(10,30,50);
    
    -- 위에 처럼 하지 마시고 아래처럼 하시기 바랍니다!!!!!!!!!!!!!!!
    -- 왜냐하면 nvl 매칭을 할 필요가 없음 10,30,50부서만 보기 때문에 
    
     SELECT A.department_id AS 부서번호
        , A.employee_id AS 사원번호
        , A.ENAME AS 사원명
        , to_char(A.salary,'999,999') AS 기본급여
        , to_char(B.AVG_SALARY,'999,999') AS 부서평균기본급여
        , to_char(A.salary - B.AVG_SALARY,'999,999') AS 부서평균과의차액
        , rank() over(partition by A.department_id
                     order by A.salary desc) AS 부서내기본급여등수
        , rank() over (order by A.salary desc) AS 전체기본급여등수 -- 사원전체 107면 중에 등수가 아니라 부서번호 10,30,50 번 중에서 등수인것이다.
    FROM 
    (
      select department_id , employee_id
           , first_name || ' ' || last_name AS ENAME
           , salary
      from employees
      where department_id in(10,30,50)
    ) A
    JOIN 
    (
      select department_id , trunc(avg(salary)) AS AVG_SALARY
      from employees
      where department_id in(10,30,50)
      group by department_id
    ) B
    ON A.department_id = B.department_id;
    
    
    -- 위에 풀이도 되지만 문제가 있으므로 위처럼 하지 마시고 아래처럼 하시기 바랍니다!!!!!!!!!!!!!!!
    -- 총 등수가 107명에서의 등수로 비교해야 하기 때문이다.
    
    
    SELECT A.department_id AS 부서번호
        , A.employee_id AS 사원번호
        , A.ENAME AS 사원명
        , to_char(A.salary,'999,999') AS 기본급여
        , to_char(B.AVG_SALARY,'999,999') AS 부서평균기본급여
        , to_char(A.salary - B.AVG_SALARY,'999,999') AS 부서평균과의차액
        , A.DEPT_RANK AS 부서내기본급여등수
        , A.TOTAL_RANK AS 전체기본급여등수 -- 사원전체 107면 중에 등수
    FROM 
    (
      select department_id , employee_id
           , first_name || ' ' || last_name AS ENAME
           , salary
           , rank() over(partition by department_id
                     order by salary desc) AS DEPT_RANK
           , rank() over (order by salary desc) AS TOTAL_RANK
      from employees
    ) A
    JOIN 
    (
      select department_id , trunc(avg(salary)) AS AVG_SALARY
      from employees
      where department_id in(10,30,50)
      group by department_id
    ) B
    ON A.department_id = B.department_id
    order by 1, 4 desc;
    

    ----- 또는 ----
    
    ------- ===== with 절을 사용하며 inline view 를 사용한 JOIN ===== ----------
    with 
    A as 
    (
      select department_id , employee_id
           , first_name || ' ' || last_name AS ENAME
           , salary
           , rank() over(partition by department_id
                     order by salary desc) AS DEPT_RANK
           , rank() over (order by salary desc) AS TOTAL_RANK
      from employees
    ), 
    B as
    (
      select department_id , trunc(avg(salary)) AS AVG_SALARY
      from employees
      where department_id in(10,30,50)
      group by department_id
    )  
    SELECT A.department_id AS 부서번호
        , A.employee_id AS 사원번호
        , A.ENAME AS 사원명
        , to_char(A.salary,'999,999') AS 기본급여
        , to_char(B.AVG_SALARY,'999,999') AS 부서평균기본급여
        , to_char(A.salary - B.AVG_SALARY,'999,999') AS 부서평균과의차액
        , A.DEPT_RANK AS 부서내기본급여등수
        , A.TOTAL_RANK AS 전체기본급여등수 -- 사원전체 107면 중에 등수
    from A JOIN B
    ON A.department_id = B.department_id
    order by 1, 4 desc;
    
    
    
    
    -----------------------------------------------------
    -------- =====  ***** NON-EQUI JOIN *** ====== ----------
    
    /*
        조인조건절에 사용되는 컬럼의 값이 특정한 범위에 속할 때 사용하는 것이 NON-EQUI JOIN 이다
        NON-EQUI JOIN 에서는 조인조건절에 = 을 사용하는 것이 아니라 between A and B 를 사용한다.
    */
    
    -- 소득세율 지표 관련 테이블을 생성한다. 
  create table tbl_taxindex
  (lowerincome   number       -- 연봉의 최저
  ,highincome    number       -- 연봉의 최대
  ,taxpercent    number(2,2)  -- 세율  -0.99 ~ 0.99 
  );
  -- Table TBL_TAXINDEX이(가) 생성되었습니다.

   
  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(1, 99999, 0.02);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(100000, 149999, 0.05);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(150000, 199999, 0.08);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(200000, 10000000000000000, 0.1);

  commit;
  -- 커밋 완료.


  select * 
  from tbl_taxindex;
  
  /*
    ------------------------------------------------------
    사원번호     사원명     연봉     세율      소득세액
    ------------------------------------------------------
    1001       홍길동    50000    0.02      50000 *  0.02
    1002       엄정화   170000    0.08     170000 *  0.08
    ....       ......  ......    .....     .............
  */  
  
  
  
  
  ---SQL 1992 CODE ------
  /*
    ---------------------------     ---------------------------
    사원번호     사원명     연봉          세율     소득세액
    --------------------------      ----------------------------
            emloyees테이블          tbl_taxindex 테이블
            
  */
  
  ---SQL 1992 CODE ------
  select E.employee_id AS 사원번호
        ,E.first_name || ' ' || E.last_name AS 사원명
        , nvl( E.salary + (E.salary + E.commission_pct) , E.salary)*12 AS 연봉
        , T.*
  from employees E, tbl_taxindex T --- SQL 1992 CODE
  where nvl( E.salary + (E.salary + E.commission_pct) , E.salary)*12 between T.lowerincome and T.highincome;  -- 조인조건절 이것이 NON-EQUI JOIN 
  -- 조인조건절
  
  
  ---- 완성본
   select E.employee_id AS 사원번호
        ,E.first_name || ' ' || E.last_name AS 사원명
        , nvl( E.salary + (E.salary + E.commission_pct) , E.salary)*12 AS 연봉
        , T.taxpercent AS 세율
        , nvl( E.salary + (E.salary + E.commission_pct) , E.salary)*12 * T.taxpercent AS소득세액
  from employees E, tbl_taxindex T 
  where nvl( E.salary + (E.salary + E.commission_pct) , E.salary)*12 between T.lowerincome and T.highincome;  -- 조인조건절 이것이 NON-EQUI JOIN 
  --> 연봉에 대해 오름차순으로 나온다.(조인조건절에 쓰인 것에 대해 오름차순)
  --NON-EQUI JOIN 은 조인조건절에 사용되는 컬럼의 값의 오름차순으로 자동정렬되어 보여진다.
  
  
  ----- 완성본을 SQL 1999 CODE 로 변경 ------
  select E.employee_id AS 사원번호
        ,E.first_name || ' ' || E.last_name AS 사원명
        , nvl( E.salary + (E.salary + E.commission_pct) , E.salary)*12 AS 연봉
        , T.taxpercent AS 세율
        , nvl( E.salary + (E.salary + E.commission_pct) , E.salary)*12 * T.taxpercent AS소득세액
  -- from employees E INNER Join tbl_taxindex T -- SQL 1999 CODE
  from employees E Join tbl_taxindex T  -- SQL 1999 CODE
  ON nvl( E.salary + (E.salary + E.commission_pct) , E.salary)*12 between T.lowerincome and T.highincome;  -- 조인조건절 이것이 NON-EQUI JOIN 
  --> 연봉에 대해 오름차순으로 나온다.(조인조건절에 쓰인 것에 대해 오름차순)
  --NON-EQUI JOIN 은 조인조건절에 사용되는 컬럼의 값의 오름차순으로 자동정렬되어 보여진다.
  
  
  
  
  
  ----  ==== **** self join(자기 조인) **** ==== ------------
  /*
    자기자신의 테이블(뷰)을 자기자신의 테이블(뷰)과 JOIN 시키는 것을 말한다.
    이때 반드시 테이블(뷰)에 대한 alias(별칭)을 달리 주어서 실행해야 한다.
  */
  
    --아래처럼 나오도록 하세요 ... 
    
    /*
    ---------------------------------------------------------------
    사원번호               사원명                      이메일     급여    직속상관번호    직속상관명
    employee_id  first_name || ' ' || last_name     email    salart   employee_id     E.first_name || ' ' || last_name
     100             Steven King                  SKING     24000     null          null 
     102             Lex De Haan                  LDEHAAN   17000     100           Steven King
     103             Alexander   Hunold           AHUNOLD   9000      102           Lex De Haan
     104             Bruce Ernst                  BERNST    6000      103           Alexander Hunold
    */
  
  -- 과정들 
  select *
  from employees;
  
  -- 과정들 2
  select *
  from employees E1, employees E2
  where E1.manager_id = E2.employee_id(+);
  -- E1이 모두 나와야 하므로 E2에(+)을 넣어준다 그럼 E1은 모두 출력 가능 
  
  -- SQL 1992 CODE 완성본
  select E1.employee_id AS 사원번호
        ,E1.first_name || ' '|| E1.last_name AS 사원명
        ,E1.email AS 이메일
        ,E1.salary AS 급여
        ,E1.manager_id AS 직속상관번호1
        ,E2.employee_id AS 직속상관번호2
        ,E2.first_name || ' ' || E2.last_name AS 직속상관명
  from employees E1, employees E2
  where E1.manager_id = E2.employee_id(+)
  -- E1이 모두 나와야 하므로 E2에(+)을 넣어준다 그럼 E1은 모두 출력 가능 
  order by 1;
  -- 총 107행 
  
  
  -- SQL 1999 CODE 완성본
  select E1.employee_id AS 사원번호
        ,E1.first_name || ' '|| E1.last_name AS 사원명
        ,E1.email AS 이메일
        ,E1.salary AS 급여
        ,E1.manager_id AS 직속상관번호1
        ,E2.employee_id AS 직속상관번호2
        ,E2.first_name || ' ' || E2.last_name AS 직속상관명
  from employees E1 LEFT JOIN employees E2
  ON E1.manager_id = E2.employee_id(+)
  -- E1이 모두 나와야 하므로 E2에(+)을 넣어준다 그럼 E1은 모두 출력 가능 
  order by 1;
  -- 총 107행 
  
  
  
  
  
  
  -- tbl_authorbook 테이블에서 공저(도서명은 동일하지만 작가명이 다른 도서)로 지어진 도서정보를 나타내세요..
  -- 중복되어진 값을 제외하자  distinct을 사용하자 ---
   /*
        ---------------------------------------------------
        도서명       작가명        로얄티
        ---------------------------------------------------
        로빈슨크루소   한석규       800
        로빈슨크루소   이순신       500
        그리스로마신화 유관순       1200
        그리스로마신화 이혜리       1300
        그리스로마신화 서강준       1700
   */
  -- 시작전 확인
  select *
  from tbl_authorbook;
  
  -- join하기 위해 설정 (책이름이 같고, 작가가 다를때) 
  select B1.*
  from tbl_authorbook B1, tbl_authorbook B2
  where B1.bookname = B2.bookname AND
        B1.authorname != B2.authorname;
  
  
  -- SQL 1992 CODE
  
  
  -- 중복되어진 값을 제외하자  distinct을 사용하자 
  -- select 되어진 행의 결과물에서 중복된 행이 1번만 나오도록 하려면 select 바로 다음에 distinct를 사용하면 된다. 
  select distinct B1.*
  from tbl_authorbook B1, tbl_authorbook B2   --- SQL 1992 CODE
  where B1.bookname = B2.bookname AND
        B1.authorname != B2.authorname;
  
  
  -- SQL 1999 CODE
  
  -- 중복되어진 값을 제외하자  distinct을 사용하자 
  -- select 되어진 행의 결과물에서 중복된 행이 1번만 나오도록 하려면 select 바로 다음에 distinct를 사용하면 된다. 
  select distinct B1.*
  from tbl_authorbook B1 JOIN tbl_authorbook B2   --- SQL 1992 CODE
  ON B1.bookname = B2.bookname AND
        B1.authorname != B2.authorname;
  
  
  ------------------------------
  /*
        !!!! select 문에서 distinct 와 order by 절을 함깨 사용할때는 조심해야 한다.!!!
        select 문에 distinct 가 있는 경우 order by 절에는 select문에서 사용한 컬럼만 들어올 수 있다.
        또는 select 문에 distinct 가 있는 경우 order by 절을 사용하지 않아야 한다.
  */
  
  --> 예시 
  
  -- 이순신이 지은 것들 다 보고 싶다(오류 없음)
  select bookname, authorname
  from tbl_authorbook
  where authorname = '이순신'
  order by loyalty asc;
  
  
  -- 중복 제거 부분 (오류 없음)
  select distinct authorname
  from tbl_authorbook
  where authorname = '이순신';
  
  
  -- 오류 발생  ORA-01791: SELECT 식이 부적합합니다
  select distinct authorname
  from tbl_authorbook
  where authorname = '이순신'
  order by loyalty asc;
  
  -- 오류 없음
  select distinct authorname
  from tbl_authorbook
  where authorname = '이순신'
  order by authorname asc;
  
  
  
  
  
  ---------- ====== ***** Multi tavle JOIN (다중 테이블 조인) **** ===== ------
  
  --> 3개 이상의 테이블(뷰)를 가지고 조인 시켜주는 것이다.
  
   /*
       
      -------------------------------------------------------------------------------------------------------------------------
         대륙명        국가명                       부서주소                    부서번호   부서명      사원번호  사원명       기본급여
      --------------------------------------------------------------------------------------------------------------------------   
         Americas     United States of America     Seattle 2004 Charade Rd      90      Executive   100    Steven King   24000
   
   
         대륙명   ==>  regions.region_name                                    regions.region_id 
         국가명   ==>  countries.country_name                                 countries.region_id       countries.country_id
         부서주소  ==> locations.city || ' ' || locations.street_address      locations.country_id      locations.location_id
         부서명   ==> departments.department_name                             departments.location_id   departments.department_id 
         사원명   ==> employees.first_name || ' ' || employees.last_name      employees.department_id
   */
  
  select *
  from tab;
  
  select *
  from REGIONS;
  
  select *
  from COUNTRIES;
  
  select *
  from locations;
  
  select *
  from DEPARTMENTS;
  
  select *
  from EMPLOYEES;
  
  
  -- 위에 전체 실행한것을 하나로 합친것. (테이블을 3개 이상 붙임)
  select *
  from REGIONS R
  JOIN COUNTRIES C
  ON R.region_id = C.region_id
  Join LOCATIONS L
  ON L.country_id= C.country_id
  Join DEPARTMENTS D
  ON D.location_id = L.location_id
  Join EMPLOYEES E
  ON E.department_id = D.department_id
  order by 1;
  
  
  -- 행106개로 반절 성공 
  select R.region_name AS 대륙명
        ,C.country_name AS 국가명
        ,L.city || ' ' || L.street_address AS 부서주소
        ,E.department_id AS 부서번호
        ,D.department_name AS 부서명
        ,E.employee_id AS 사원번호
        ,E.first_name || ' '||last_name AS 사원명
        ,E.salary AS 기본급여
  from REGIONS R
  JOIN COUNTRIES C
  ON R.region_id = C.region_id
  Join LOCATIONS L
  ON L.country_id= C.country_id
  Join DEPARTMENTS D
  ON D.location_id = L.location_id
  Join EMPLOYEES E
  ON E.department_id = D.department_id
  order by 1;
  -- 행 106 
  
  
  -- 행 107으로 완전 성공 
  select R.region_name AS 대륙명
        ,C.country_name AS 국가명
        ,L.city || ' ' || L.street_address AS 부서주소
        ,E.department_id AS 부서번호
        ,D.department_name AS 부서명
        ,E.employee_id AS 사원번호
        ,E.first_name || ' '||last_name AS 사원명
        ,E.salary AS 기본급여
  from REGIONS R
  JOIN COUNTRIES C
  ON R.region_id = C.region_id
  Join LOCATIONS L
  ON L.country_id= C.country_id
  Join DEPARTMENTS D
  ON D.location_id = L.location_id
  RIGHT Join EMPLOYEES E   -- 오른쪽으로 employees를 다 보여준다 OUTER JOIN
  ON E.department_id = D.department_id
  order by 1;
  -- 행 107
  
  
  
  
  ----------------------------------------------
  
  -- 아래와 같이 나오도록 하세요
  
  /*
        ----------------------------------------------------------------------------------------------------------------------------
        부서번호             부서명                부서장성명                     사원번호             사원명                        입사일자
        ----------------------------------------------------------------------------------------------------------------------------
        D.department_id    D.department_name   E.first_name || E.last_name  E.employee_id   E.first_name || E.last_name   E.hire_date
        E.department_id    
        
                    D.manager_id         E.employee_id 
                   (부서장의 사원번호)      (사원번호)
  */
  
  select *
  from employees;
  
  select *
  from departments;
  
  ----- 부서명, 부서장 사원번호, 부서장 성명 까지 ----
  select D.department_id AS 부서번호
        ,D.department_name AS 부서명
        ,D.manager_id AS 부서장의사원번호
        ,E.employee_id AS 부서장의사원번호2
        ,E.first_name || ' '|| E.last_name AS 부서장성명
  from departments D JOIN employees E
  ON D.manager_id = E.employee_id
  order by 1;
  
  
  ------ 나머지 모두 출력 반절 완성본 (행 106)------------
  select D.department_id AS 부서번호
        ,D.department_name AS 부서명
        ,MGR.first_name || ' '|| MGR.last_name AS 부서장성명
        ,ENP.employee_id AS 사원번호
        ,ENP.first_name || ' '|| ENP.last_name AS 사원명
        ,ENP.hire_date AS 입사일자 
  from departments D JOIN employees MGR 
  ON D.manager_id = MGR.employee_id
  JOIN employees ENP  -- join
  ON D.department_id = ENP.department_id
  order by 1;
  
  
   ------ 나머지 모두 출력 완성본 (행 107)------------
  select D.department_id AS 부서번호
        ,D.department_name AS 부서명
        ,MGR.first_name || ' '|| MGR.last_name AS 부서장성명
        ,ENP.employee_id AS 사원번호
        ,ENP.first_name || ' '|| ENP.last_name AS 사원명
        ,ENP.hire_date AS 입사일자 
  from departments D JOIN employees MGR 
  ON D.manager_id = MGR.employee_id
  RIGHT JOIN employees ENP  -- join
  ON D.department_id = ENP.department_id
  order by 1;
  -- 107 행 
  
  
  ------- !!!!!!!!!!!!!!!!!!!!! 과제 !!!!!!!!!!!!!!!!!!!----
  ---- [과제] ----- email : tjdudgkr0959@naver.com
  --메일제목 : SQL과제_민동현
  --첨부파일 : SQL과제_민동현.txt
  --제출기한 : 2023년 2월 14일까지 (화요일까지)
    
    --  사원수가 107명이 나오도록 아래와 같이 나오도록 하세요...
    
    /*
        ----------------------------------------------------------------------------------------------------------------------------------------------------
         부서번호    부서명    부서주소    부서장성명    사원번호   사원명    성별    나이    연봉    연봉소득세액    부서내연봉평균차액    부서내연봉등수     전체연봉등수 
        ----------------------------------------------------------------------------------------------------------------------------------------------------
    */
    
    --대륙 
    select *
    from REGIONS;
    
    -- 나라이름과 나라 아이디 
    select *
    from COUNTRIES;
    
    -- 부서 주소 
    select *
    from LOCATIONS;
    
    -- 세금 
    select *
    from tbl_taxindex;
    
    -- 직원
    select *
    from employees;
    -- 부서 
    select *
    from departments;
    
    -- 부서 평균 
    select trunc(avg(nvl(salary + (salary * commission_pct), salary)) * 12) 
            from employees
            group by department_id;
  
  
  
  -- 완성본 
  select D.department_id AS 부서번호
        ,D.department_name AS 부서명
        ,L.city || ' ' || L.street_address AS 부서주소
        ,MGR.first_name || ' ' || MGR.last_name AS 부서장성명
        ,ENP.employee_id AS 사원번호
        ,ENP.first_name || ' '||ENP.last_name AS 사원명
        ,case when substr(ENP.jubun, 7, 1) in('1','3') then '남' else '여' end AS 성별
        ,extract(year from sysdate) - ( to_number(substr(ENP.jubun, 1, 2)) + case when substr(ENP.jubun, 7, 1) in('1','2') then 1900 else 2000 end ) + 1 AS 나이
        ,to_char(nvl(ENP.salary +(ENP.salary * ENP.commission_pct), ENP.salary)*12, '999,999') AS 연봉
        ,to_char(nvl(ENP.salary +(ENP.salary + ENP.commission_pct) ,ENP.salary)*12 * T.taxpercent, '99,999.999') AS 연봉소득세액
        ,to_char(trunc(nvl(ENP.salary +(ENP.salary + ENP.commission_pct) ,ENP.salary) *12 - 
        (
            select avg(nvl(salary + (salary * commission_pct), salary)) * 12 
            from employees
            where department_id = ENP.department_id
        )),'999,999') AS 부서평균과의차액    
        ,rank() over(partition by ENP.department_id
                     order by nvl(ENP.salary +(ENP.salary + ENP.commission_pct) ,ENP.salary)*12 desc)  AS 부서내연봉등수
        ,rank() over(order by nvl(ENP.salary +(ENP.salary + ENP.commission_pct) ,ENP.salary)*12 desc) AS 전체연봉등수 
  from REGIONS R                            -- 각각의 JOIN으로 하나씩 묶는다 JOIN은 같은 컬럼이 있을때 가능한듯?
  JOIN COUNTRIES C
  ON R.region_id = C.region_id
  Join LOCATIONS L
  ON L.country_id= C.country_id
  JOIN departments D
  ON D.location_id = L.location_id
  JOIN employees MGR 
  ON D.manager_id = MGR.employee_id
  RIGHT JOIN employees ENP  
  ON D.department_id = ENP.department_id
  Join tbl_taxindex T
  ON nvl(ENP.salary + (ENP.salary + ENP.commission_pct) , ENP.salary)*12 between T.lowerincome and T.highincome 
  order by 1 , 5;


-- 신준하씨 과제 풀이 

select E.department_id AS 부서번호
        , D.department_name AS 부서명
        , L.city || ' ' || L.street_address AS 부서주소
        , M.first_name || ' '||  M.last_name AS 부서장성명
        , E.employee_id AS 사원번호
        , E.first_name  ||' '||  E.last_name AS 사원명
        , case when substr(E.jubun, 7, 1) in('1','3') then '남' else '여' end AS 성별
        , extract(year from sysdate) - ( to_number(substr(E.jubun, 1, 2)) + case when substr(E.jubun, 7, 1) in('1','2') then 1900 else 2000 end ) + 1 AS 나이 
        , nvl( E.salary + (E.salary * E.commission_pct), E.salary) * 12 AS 연봉
        , nvl( E.salary + (E.salary * E.commission_pct), E.salary) * 12 * T.taxpercent AS 연봉소득세액
        , nvl( E.salary + (E.salary * E.commission_pct), E.salary) * 12 - A.AVG_SALARY AS 부서내연봉평균차액
        , R.DEPT_RANK AS 부서내연봉등수
        , R.TOTAL_RANK AS 전체연봉등수
    from EMPLOYEES E
       LEFT JOIN DEPARTMENTS D
       ON E.department_id = D.department_id
       LEFT JOIN LOCATIONS L
       ON D.location_id = L.location_id
       LEFT JOIN EMPLOYEES M
       ON D.manager_id = M.employee_id
       LEFT JOIN tbl_taxindex T
       ON nvl( E.salary + (E.salary * E.commission_pct), E.salary ) * 12
        between T.lowerincome and T.highincome
       LEFT JOIN
       (
         select department_id , employee_id
              , rank() over(partition by department_id
                            order by (nvl( salary + (salary * commission_pct), salary) * 12) desc) AS DEPT_RANK
              , rank() over(order by (nvl( salary + (salary * commission_pct), salary) * 12) desc) AS TOTAL_RANK
         from employees
       ) R
       ON E.employee_id = R.employee_id
       LEFT JOIN
       (
            select department_id
                , trunc(avg(nvl( salary + (salary * commission_pct), salary) * 12)) AS AVG_SALARY
            from employees
            group by department_id
        ) A
        ON nvl(D.department_id,-9999) = nvl(A.department_id,-9999);

---------------------------------------------------------------------------------------------------------
-----------------------------------------2월 13일 (월)시작 ------------------------------------

-- 오늘은 UNION 등등을 알아보자 

------------  =========  ***** SET Operator (SET 연산자, 집합연산자)  **** ======= -----------

/*
    --- 종류 --- 
    1. UNION
    2. UNION ALL
    3. INTERSECT
    4. MINUS
    --------------------- 면접시 -----------------------
    -- 면접시 JOIN과 UNION의 차이점에 대해서 말해보세요 !!!!!!!!!!!!!!!!!!--
    -> UNION 은 테이블(뷰)과 테이블(뷰)을 합쳐서 보여주는 것으로써, 이것은 행(ROW) 과 행(ROW)를 합친 결과를 보여주는 것이다.
    JOIN은 컬럼과 컬럼을 합친 결과를 보여주는 것이다.
    
    A = (a , x, b, e, g)
    
    B = (c, d, a, b, y, k ,m)
    
    1) UNION
    A ∪ B = (a , x, b, e, g, c, d, y, k ,m)
    
    A UNION B ==> (a, b, c, d, e, g, k, m, x, y)
    --> 합집합과 비슷한데 대신 오름차순으로 자동으로 된다.
    B UNION A ==> (a, b, c, d, e, g, k, m, x, y)
    --> A와 B 순서를 바꿔도 결과는 똑같다.
    
    2) UNION ALL
    A UNION ALL B ==> (a, x, b, e, g, c, d, a, b, y, k, m)
    --> 중복도 나오고 정렬도 되지 않는다.
    B UNION ALL A ==> (c, d, a, b, y, k ,m, a , x, b, e, g)
    --> 중복도 나오고 정렬도 되지않고 앞에 B집합에 있는 것부터 출력된다.
    
    3)INTERSECT
    A ∩ B = (a, b)
    A INTERSECT B = (a, b)
    --> 교집합과 같다.
    
    4)MINUS
    A - B = (x, e, g)
    A MINUS B (x, e, g)
    
    B - A = (c, d, y, k, m)
    B MINUS A = (c, d, y, k, m)
    (집합을 빼는것과 같다)
    
*/

select *
from tbl_panmae;


--- tbl_panmae 테이블에서 2달전에 해당하는 월(현재 2023년 02월) 이므로 2달 전인 (2022년 12월) 월에 판매되어진 정보만 추출해서 tbl_panmae_202212 라는 테이블을 생성하세요
create table tbl_panmae_202212
as 
select *
from tbl_panmae
where to_char(panmaedate, 'yyyy-mm') =  to_char(add_months(sysdate, -2), 'yyyy-mm'); 
--                                   =  '2022-12'
-- Table TBL_PANMAE_202212이(가) 생성되었습니다.


-- 결과 확인 
select *
from tbl_panmae_202212;


--- tbl_panmae 테이블에서 1달전에 해당하는 월(현재 2023년 02월) 이므로 2달 전인 (2023년 1월) 월에 판매되어진 정보만 추출해서 tbl_panmae_202301 라는 테이블을 생성하세요
create table tbl_panmae_202301
as 
select *
from tbl_panmae
where to_char(panmaedate, 'yyyy-mm') =  to_char(add_months(sysdate, -1), 'yyyy-mm'); 
--                                   =  '2023-01'
-- Table TBL_PANMAE_202301이(가) 생성되었습니다.


-- 결과 확인 
select *
from tbl_panmae_202301;

------------- 지금까지 1,2 달전 판매 기록을 백업하였다. -----------

select * 
from tbl_panmae;

-- tbl_panmae 테이블에서 이번달에 해당하는 월 (현재가 2023년 2월)에 판매되었던 정보만 남기고 나머지는 모두 삭제하세요

delete from tbl_panmae
where to_char(panmaedate, 'yyyy-mm') < to_char(sysdate, 'yyyy-mm');
--                과거                    '2023-02'
-- 9개 행 이(가) 삭제되었습니다.


-- 확인해보기 
select *
from tbl_panmae;

commit;
-- 커밋 완료.


--- **** 최근 3개월간 판매되어진 정보를 가지고 제품별 판매량의 합계를 추출하세요 **** ------

-- 이번달 판매 + 1 달전 판매 + 2 달전 판매 

select *
from tbl_panmae;  --- 이번달

select *
from tbl_panmae_202301; -- 한달전 

select *
from tbl_panmae_202212; -- 2달전 


----------------- UNION 으로 묶어보기------------------- 
select *
from tbl_panmae_202212  --- 2달전 
UNION
select *
from tbl_panmae_202301 -- 한달전 
UNION
select *
from tbl_panmae; --  이번달 


-- UNION을 하면 순서를 변경하여도 항상 첫번째 컬럼( 지금은 PANMAEDATE) 을 기준으로 오름차순 정렬이 되어 나온다.
select *
from tbl_panmae  --- 이번달
UNION
select *
from tbl_panmae_202212 -- 2달전 
UNION
select *
from tbl_panmae_202301; -- 한달전 
-- 오름차순으로 정렬이 되었기 때문에 2022년 12월 데이터 부터 결과가 나온다.


-- 요것은 jepunname 이 첫번째 컬럼이 되므로 jepunname에서 오름차순으로 정렬이 된다.
select jepumname, panmaedate, panmaesu
from tbl_panmae  --- 이번달
UNION
select jepumname, panmaedate, panmaesu
from tbl_panmae_202212 -- 2달전 
UNION
select jepumname, panmaedate, panmaesu
from tbl_panmae_202301; -- 한달전 
-- UNION을 하면 항상 첫번째 컬럼( 지금은 JEPUNNAME) 을 기준으로 오름차순 정렬이 되어 나온다.
-- 오름차순으로 정렬이 되었기 때문에 감자깡 데이터 부터 결과가 나온다.



------------------UNION ALL 일때 -------------------

select *
from tbl_panmae_202212  --- 2달전 
UNION ALL
select *
from tbl_panmae_202301 -- 한달전 
UNION ALL
select *
from tbl_panmae; --  이번달 
-- UNION ALL 을 하면 정렬 없이 그냥 순서대로 행을 붙여서 보여줄 뿐이다.
-- 그래서 맨 처음이 tbl_panmae_202212 테이블이고, 그 다음이 tbl_panmae_202301 테이블이고, 마지막이 tbl_panmae 테이블 이므로
-- 순서대로 보여질 뿐이다.


-- 오름차순이 되지 않고 이번달이 나오고 2달전이 나오고 한달전으로 나온다 
-- 붙인 순서대로 나온다.
select *
from tbl_panmae  --- 이번달
UNION ALL
select *
from tbl_panmae_202212 -- 2달전 
UNION ALL
select *
from tbl_panmae_202301; -- 한달전 
-- UNION ALL 을 하면 정렬 없이 그냥 순서대로 행을 붙여서 보여줄 뿐이다.
-- 그래서 맨 처음이 tbl_panmae 테이블이고, 그 다음이 tbl_panmae_202212 테이블이고, 마지막이 tbl_panmae_202301 테이블 이므로
-- 순서대로 보여질 뿐이다.



-- 정렬이 되지 않고 이번달, 2달전, 한달전 순으로 출력된다.
select jepumname, panmaedate, panmaesu
from tbl_panmae  --- 이번달
UNION ALL
select jepumname, panmaedate, panmaesu
from tbl_panmae_202212 -- 2달전 
UNION ALL
select jepumname, panmaedate, panmaesu
from tbl_panmae_202301; -- 한달전 

----------------------------------------------------------------------


-- inline view로 판매수를 보여주는 것을 만들기 
select jepumname AS 제품명
      ,sum(panmaesu) AS 판매량 
from
(
    select *
    from tbl_panmae_202212
    UNION
    select *
    from tbl_panmae_202301
    UNION
    select *
    from tbl_panmae
) V
group by jepumname
order by 2 desc;

------------ 또는 with 절로 써보자 

With
V as
(
    select *
    from tbl_panmae_202212
    UNION
    select *
    from tbl_panmae_202301
    UNION
    select *
    from tbl_panmae
)
select jepumname AS 제품명
      ,sum(panmaesu) AS 판매합계
from V
group by jepumname
order by 2 desc;
  
/*
새우깡	76
허니버터칩	65
고구마깡	52
감자깡	50
*/  



--*************************************** 중요부분 ************************************************--

-- 최근 3개월간 판매되어진 판매량의 총 합계는?


            -- 개념부분 --
    select panmaedate, jepumname, panmaesu
    from tbl_panmae_202212  -- 5개 행 
    UNION
    select panmaedate, jepumname, panmaesu
    from tbl_panmae_202301  -- 4개 행 
    UNION
    select panmaedate, jepumname, panmaesu
    from tbl_panmae;   -- 11개 행 
    -- 행이 총 20개


    select jepumname, panmaesu
    from tbl_panmae_202212  -- 5개 행 
    UNION
    select jepumname, panmaesu
    from tbl_panmae_202301  -- 4개 행 
    UNION
    select jepumname, panmaesu
    from tbl_panmae;   -- 11개 행 
    -- 행이 총 14개
    -- UNION 은 항상 행의 결과물이 동일하게 나오는 것은 중복된 행은 제거해 버리고 1번만 나오게 만든다
    -- 그리고 항상 첫번째 컬럼의 값을 기준으로 오름차순 정렬되어 보여진다.
    -- 여기서는 새우깡 10 번이 중복되어 있는데  그것을 1번만 나오게 하기 때문이다.
    
    select jepumname
    from tbl_panmae_202212  -- 5개 행 
    UNION
    select jepumname
    from tbl_panmae_202301  -- 4개 행 
    UNION
    select jepumname
    from tbl_panmae;   -- 11개 행 
    -- 행이 총 4개
    -- UNION 은 항상 행의 결과물이 동일하게 나오는 것은 중복된 행은 제거해 버리고 1번만 나오게 만든다
    -- 그리고 항상 첫번째 컬럼의 값을 기준으로 오름차순 정렬되어 보여진다.
    
    

-- 최근 3개월간 판매되어진 판매량의 총 합계는?
    
    -- UNION 알때 , 틀린 풀이이다.
    
    select sum(panmaesu)   --- 98
    from
    (
        select panmaesu
        from tbl_panmae_202212  -- 5개 행 
        UNION
        select panmaesu
        from tbl_panmae_202301  -- 4개 행 
        UNION
        select panmaesu
        from tbl_panmae   -- 11개 행
        -- 행이 총 8개
    ) V;
    ------> 틀린 풀이이다.
    
    
    --UNION ALL 일떄 , 정답 풀이 이다.
    
    select sum(panmaesu)   --- 243
    from
    (
        select panmaesu
        from tbl_panmae_202212  -- 5개 행 
        UNION ALL
        select panmaesu
        from tbl_panmae_202301  -- 4개 행 
        UNION ALL
        select panmaesu
        from tbl_panmae   -- 11개 행
        -- 행이 총 20개
    ) V;
    ------> 정답 풀이이다.




-------- *** [퀴즈] 최근 3개월간 판매되어진 정보를 가지고    
--       아래와 같이 제품명, 판매년월, 판매량의합계, 백분율(%) 을 추출하세요  *** ------

/*
    ---------------------------------------------------------------------------------
    제품명,  판매년월,      판매량의합계,     백분율(%)
    ---------------------------------------------------------------------------------
    감자깡   2022-12         20             8.2
    감자깡   2023-01         15             6.2
    감자깡   2023-02         15             6.2
    감자깡                   50             20.6
    .....    ....           ....           ....
    새우깡   2022-12         38             15.6
    새우깡   2023-01         8              3.3
    새우깡   2023-02         30             12.3
    새우깡                   76             31.3
    .....    ....           ....           ....
    전체                     243            100.0    
*/

-- 정답을 맞춰가는 과정 1
 select sum(panmaesu)   
 from 
 (
    select panmaesu
    from tbl_panmae_202212  
    UNION ALL 
    select panmaesu
    from tbl_panmae_202301  
    UNION ALL  
    select panmaesu
    from tbl_panmae        
 );
 -- 243 
 
 -- 정답을 맞춰가는 과정 2
 select decode( grouping(jepumname), 0, jepumname, '전체') AS 제품명
      , decode( grouping( to_char(panmaedate, 'yyyy-mm') ), 0, to_char(panmaedate, 'yyyy-mm'), ' ' ) AS 판매년월
      , sum(panmaesu) AS 판매량의합계
      , to_char( ROUND( sum(panmaesu) / ( 243 ) * 100, 1 ), '990.0') AS "백분율(%)"
 from 
  (  
    select *
    from tbl_panmae_202212
    UNION 
    select *
    from tbl_panmae_202301
    UNION 
    select *
    from tbl_panmae
  ) V 
 group by grouping sets( (jepumname, to_char(panmaedate, 'yyyy-mm')), (jepumname), () ); 
 -- 또는
 -- group by rollup( jepumname, to_char(panmaedate, 'yyyy-mm') );


-- 첫번째 풀이방법 
select decode(grouping(jepumname), 0, jepumname, '전체') AS 제품명
     , decode(grouping(to_char(panmaedate, 'yyyy-mm')), 0, to_char(panmaedate, 'yyyy-mm'), ' ') AS 판매년월
     , sum(panmaesu) AS 판매량의합계
     , to_char(round(100 * sum(panmaesu) /
        (select sum(panmaesu)   --- 243
        from
        (
            select panmaesu
            from tbl_panmae_202212  -- 5개 행 
            UNION ALL
            select panmaesu
            from tbl_panmae_202301  -- 4개 행 
            UNION ALL
            select panmaesu
            from tbl_panmae   -- 11개 행
            -- 행이 총 20개
        ) A
        ), 1), '990.0')AS "백문율(%)" 
from 
(
    select *
    from tbl_panmae_202212
    UNION
    select *
    from tbl_panmae_202301
    UNION
    select *
    from tbl_panmae
) V
group by grouping sets((jepumname, to_char(panmaedate, 'yyyy-mm')), (jepumname) ,());
-- 또는
--group by rollup (jepumname, to_char(panmaedate, 'yyyy-mm'));




--강사님 첫번째 풀이
-- 첫번째 방법
 select decode( grouping(jepumname), 0, jepumname, '전체') AS 제품명
      , decode( grouping( to_char(panmaedate, 'yyyy-mm') ), 0, to_char(panmaedate, 'yyyy-mm'), ' ' ) AS 판매년월
      , sum(panmaesu) AS 판매량의합계
      , to_char( ROUND( sum(panmaesu) / ( select sum(panmaesu)   
                                          from 
                                          (
                                            select panmaesu
                                            from tbl_panmae_202212  
                                            UNION ALL 
                                            select panmaesu
                                            from tbl_panmae_202301  
                                            UNION ALL  
                                            select panmaesu
                                            from tbl_panmae        
                                           ) ) * 100, 1 ), '990.0') AS "백분율(%)"
 from 
  (  
    select *
    from tbl_panmae_202212
    UNION 
    select *
    from tbl_panmae_202301
    UNION 
    select *
    from tbl_panmae
  ) V 
 group by grouping sets( (jepumname, to_char(panmaedate, 'yyyy-mm')), (jepumname), () ); 
 -- 또는
 -- group by rollup( jepumname, to_char(panmaedate, 'yyyy-mm') ); 




-- 두번째 풀이방법 (with절 사용)
with
V as
(
    select *
    from tbl_panmae_202212
    UNION 
    select *
    from tbl_panmae_202301
    UNION 
    select *
    from tbl_panmae
)
select decode(grouping(jepumname) , 0, jepumname , '전체') AS 제품명
      ,decode(grouping(to_char(panmaedate, 'yyyy-mm')), 0, to_char(panmaedate, 'yyyy-mm'), ' ') AS 판매년월
      ,sum(panmaesu) AS 판매량의합계
      ,to_char(round(100 * sum(panmaesu) / (select sum(panmaesu) from V), 1), '990.0') AS "백분율(%)"  
      -- (select sum(panmaesu) from V), 1) 이거나 첫번째 방법 UNION ALL이나 합계는 같기 때문에 이것으로 해도 됨
from V
--group by grouping sets((jepumname, to_char(panmaedate, 'yyyy-mm')), (jepumname) , ());
-- 또는
group by rollup (jepumname, to_char(panmaedate, 'yyyy-mm'));





------------------------------------------- INTERSECT --------------------------------------------

                             ---- ==== **** INTERSECT (교집합) **** ===== ---- 

insert into tbl_panmae_202212(panmaedate, jepumname, panmaesu)
values(to_date('2022-11-11' , 'yyyy-mm-dd'), '빼빼로', 20);
-- 1 행 이(가) 삽입되었습니다.

insert into tbl_panmae_202301(panmaedate, jepumname, panmaesu)
values(to_date('2022-11-11' , 'yyyy-mm-dd'), '빼빼로', 20);
-- 1 행 이(가) 삽입되었습니다.

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values(to_date('2022-11-11' , 'yyyy-mm-dd'), '빼빼로', 20);
-- 1 행 이(가) 삽입되었습니다.

commit;
-- 커밋 완료

    -- UNION은 중복을 제거하기 때문에 22/11/11 은 한번만 나옴 
    select *
    from tbl_panmae_202212
    UNION 
    select *
    from tbl_panmae_202301
    UNION 
    select *
    from tbl_panmae;


    -- UNION ALL은 중복을 제거 X, 정렬 X 
    select *
    from tbl_panmae_202212
    UNION ALL
    select *
    from tbl_panmae_202301
    UNION ALL
    select *
    from tbl_panmae;

    -- INTERSECT는 같은 것만 뽑아온다.
    select *
    from tbl_panmae_202212
    INTERSECT
    select *
    from tbl_panmae_202301
    INTERSECT
    select *
    from tbl_panmae;
    -- 22/11/11	빼빼로	20

    
    delete from tbl_panmae_202212
    where (panmaedate, jepumname, panmaesu) in(select panmaedate, jepumname, panmaesu
                                            from tbl_panmae_202212
                                            INTERSECT
                                            select panmaedate, jepumname, panmaesu
                                            from tbl_panmae_202301
                                            INTERSECT
                                            select panmaedate, jepumname, panmaesu
                                            from tbl_panmae);
    -- 1 행 이(가) 삭제되었습니다.

    delete from tbl_panmae_202301
    where (panmaedate, jepumname, panmaesu) in(
                                            select panmaedate, jepumname, panmaesu
                                            from tbl_panmae_202301
                                            INTERSECT
                                            select panmaedate, jepumname, panmaesu
                                            from tbl_panmae);
    -- 1개 행 이(가) 삭제되었습니다

    delete from tbl_panmae
    where (panmaedate, jepumname, panmaesu) in(
                                            select panmaedate, jepumname, panmaesu
                                            from tbl_panmae_202301
                                            INTERSECT
                                            select panmaedate, jepumname, panmaesu
                                            from tbl_panmae);
    -- 0개 행 이(가) 삭제되었습니다

    commit;
    -- 커밋 완료 
    
    
    select *
    from tbl_panmae_202212
    where jepumname = '빼빼로';
    - 없음
    
    select *
    from tbl_panmae_202301
    where jepumname = '빼빼로';
    - 없음
    
    
    select *
    from tbl_panmae
    where jepumname = '빼빼로';
    - 22/11/11	빼빼로	20
    
    
    
------------------------------------------- MINUS --------------------------------------------

                             ---- ==== **** MINUS (차집합) **** ===== ----    
    
-- 백업부분
select * from tab;
--> TB1_EMPLOYEES_BACKUP

select *
from TB1_EMPLOYEES_BACKUP;
    

-- 행 확인하기  원본 
select *
from employees
where employee_id in(173,185,195);

-- 행 확인하기 백업본
select *
from TB1_EMPLOYEES_BACKUP
where employee_id in(173,185,195);    
    


--- ==== **** 개발자가 실수로 employees 테이블에 있던 사원들을 삭제(delete)했다.
--            그런데 누구를 삭제했는지 모른다.!!!
--            백업받은 TB1_EMPLOYEES_BACKUP 테이블을 이용하여 삭제된 사원들을 다시 복구하도록 하겠다. *** ==== ----


-- 행을 삭제하자 
delete from employees
where employee_id in(173,185,195);
-- 3개 행 이(가) 삭제되었습니다.

commit;
-- 커밋 완료.


--백업 파일에는 있고 원본에 없을때 차집합으로 제거한 항목을 알 수 있다.!!!!!!!!!!!!!!

select *
from TB1_EMPLOYEES_BACKUP
MINUS
select *
from employees;
/*
173	Sundita	Kumar	SKUMAR	011.44.1343.329268	08/04/21	SA_REP	6100	0.1	148	80	1111154234567
185	Alexis	Bull	ABULL	650.509.2876	05/02/20	SH_CLERK	4100		121	50	8510182234567
195	Vance	Jones	VJONES	650.501.4876	07/03/17	SH_CLERK	2800		123	50	1010134234567
*/
-- TB1_EMPLOYEES_BACKUP 테이블에만 존재하고 employees 테이블에는 존재하지 않는 행들을 조회해주는 것이다.


-- 현재 원본 상태
select *
from employees
where employee_id in(173,185,195);


-- 원본에 제거된 항목 추가하는 방법 
insert into employees 
select *
from TB1_EMPLOYEES_BACKUP
MINUS
select *
from employees;
-- 3개 행 이(가) 삽입되었습니다.


-- 현재 원본 상태
select *
from employees
where employee_id in(173,185,195);
-- 3개 행의 결과가 나온다.
-- 즉 복구 완료 됨

commit;
-- 커밋 완료


-- 현재 원본 상태
select *
from employees;
-- 107 개의 행 




-----------------------------------------------------------------------------------------------
                        ---- ==== **** Fseudo(의사, 유사, 모조) column **** ===== ----  

-- Fseudo(의사, 유사, 모조) column 은 rowid와 rownum 이 있다.

/*
    1. rowid
    
    rowid는 오라클이 내부적으로 사용하기 위해 만든 id 값으로써
    행에 대한 id 값 인데, 오라클 전체내에서 고유한 값을 가진다.
    
*/

    -- 테이블 추가하기 
    create table tbl_heowon
    (userid     varchar2(20)
    ,name      Nvarchar2(10)
    ,address   Nvarchar2(100)
    );
    -- Table TBL_HEOWON이(가) 생성되었습니다.

    -- 추가 
    insert into tbl_heowon(userid, name, address) Values('leess', '이순신', '서울');
    insert into tbl_heowon(userid, name, address) Values('eomjh', '엄정화', '인천');
    insert into tbl_heowon(userid, name, address) Values('kangkc', '강감찬', '수원');
    
    -- 의도치 않은 추가 
    insert into tbl_heowon(userid, name, address) Values('leess', '이순신', '서울');
    insert into tbl_heowon(userid, name, address) Values('eomjh', '엄정화', '인천');
    insert into tbl_heowon(userid, name, address) Values('kangkc', '강감찬', '수원');

    -- 의도치 않은 추가 2
    insert into tbl_heowon(userid, name, address) Values('leess', '이순신', '서울');
    insert into tbl_heowon(userid, name, address) Values('eomjh', '엄정화', '인천');
    insert into tbl_heowon(userid, name, address) Values('kangkc', '강감찬', '수원');

    commit;
    -- 커밋 완료 

    -- 지금 테이블 상태
    select * 
    from tbl_heowon;

    
    -- 지금 테이블 상태
    -- rowid의 값은 고유하다.!!! (연속으로 나옴)
    select rowid, userid, name, address 
    from tbl_heowon;
    
    -- 3개 행만 보기 
    select rowid, userid, name, address 
    from tbl_heowon
    where rowid in ('AAASaWAAHAAAAGrAAA', 'AAASaWAAHAAAAGrAAB', 'AAASaWAAHAAAAGrAAC');
    
    
    -- 3개 행 빼고 제거하기 
    delete from tbl_heowon
    where rowid > 'AAASaWAAHAAAAGrAAC'; 
    -- 6개 행 이(가) 삭제되었습니다.
    
    commit;
    -- 커밋 완료
    
    
    -- 지금 테이블 상태 ( 3개 빼고 나머지 제외)
    select * 
    from tbl_heowon;
    -- 또는
    select rowid, userid, name, address 
    from tbl_heowon;
    
    
    --------------------------------------------------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!엄청 많이 사용된다, !!!!!!!!!!!!!!!!!!!!!!!!
/*
    2. rownum
    
    rownum -- (!!!!!!!!!! 게시판 등 웹에서 아주 많이 사용됩니다. !!!!!)    
*/

select employee_id, first_name , last_name, salary
from employees
where rownum <= 10;





-- employees 테이블에서 salary 컬럼의 값을 내림차순 정렬 했을때 위에서부터 10개까지 행만 추출하세요 


--- 이것은 틀린 풀이이다. (값이 들어온데로 rownum)
select employee_id, first_name , last_name, salary
from employees
where rownum <= 10
order by salary desc;   




-- inline 뷰를 사용하여 재 정의 (급여 순으로 rownum을 해주는 것이다.)
select employee_id, first_name , last_name, salary
from 
(
    select employee_id, first_name , last_name, salary
    from employees
    order by salary desc   
) V
where rownum <= 10;    --이것이 맞는 풀이이다.



-----------------------------------------
-- 보드 테이블을 사용해보자 
select *
from tbl_board;

insert into tbl_board(boardno, subject, content, userid , registerday, readcount) 
values(6, '즐거운 하루 되세요 - 1', '감사합니다 - 1 ', 'leess', sysdate, 0);
-- 1 행 이(가) 삽입되었습니다.
    
insert into tbl_board(boardno, subject, content, userid , registerday, readcount) 
values(7, '즐거운 하루 되세요 - 2', '감사합니다 - 2 ', 'leess', sysdate, 0);
-- 1 행 이(가) 삽입되었습니다.

insert into tbl_board(boardno, subject, content, userid , registerday, readcount) 
values(8, '즐거운 하루 되세요 - 3', '감사합니다 - 3 ', 'leess', sysdate, 0);
-- 1 행 이(가) 삽입되었습니다.
    
insert into tbl_board(boardno, subject, content, userid , registerday, readcount) 
values(9, '즐거운 하루 되세요 - 4', '감사합니다 - 4 ', 'leess', sysdate, 0);
-- 1 행 이(가) 삽입되었습니다.

insert into tbl_board(boardno, subject, content, userid , registerday, readcount) 
values(10, '즐거운 하루 되세요 - 5', '감사합니다 - 5 ', 'leess', sysdate, 0);
-- 1 행 이(가) 삽입되었습니다.

insert into tbl_board(boardno, subject, content, userid , registerday, readcount) 
values(11, '즐거운 하루 되세요 - 6', '감사합니다 - 6 ', 'leess', sysdate, 0);
-- 1 행 이(가) 삽입되었습니다.

insert into tbl_board(boardno, subject, content, userid , registerday, readcount) 
values(12, '즐거운 하루 되세요 - 7', '감사합니다 - 7 ', 'leess', sysdate, 0);
-- 1 행 이(가) 삽입되었습니다.

insert into tbl_board(boardno, subject, content, userid , registerday, readcount) 
values(13, '즐거운 하루 되세요 - 8', '감사합니다 - 8 ', 'leess', sysdate, 0);
-- 1 행 이(가) 삽입되었습니다.


commit;
-- 커밋 완료

-- 현재 보드 테이블을 보자 
select boardno, subject, userid, to_char(registerday, 'yyyy-mm-dd hh24:mi:ss')
from tbl_board
order by boardno desc;

/*
--------------------------------------------------------------------------------
-- 번호   글번호   글제목                               글쓴이    작성일자 
--------------------------------------------------------------------------------
    1     13	즐거운 하루 되세요 - 8	                 leess	2023-02-13 14:24:03
    2     12	즐거운 하루 되세요 - 7                 	 leess	2023-02-13 14:24:03
    3     11	즐거운 하루 되세요 - 6	                 leess	2023-02-13 14:24:03
--------------------------------------------------------------------------------
                  1 2 3 4 5 ==> 페이지바 
*/
 
/*
--------------------------------------------------------------------------------
-- 번호   글번호   글제목                               글쓴이    작성일자 
--------------------------------------------------------------------------------
    4     10	즐거운 하루 되세요 - 5	                 leess	2023-02-13 14:24:03
    5     9	    즐거운 하루 되세요 - 4	                 leess	2023-02-13 14:24:03
    6     8	    즐거운 하루 되세요 - 3	                 leess	2023-02-13 14:24:03
--------------------------------------------------------------------------------
                  1 2 3 4 5 ==> 페이지바 
*/
/*
--------------------------------------------------------------------------------
-- 번호   글번호   글제목                               글쓴이    작성일자 
--------------------------------------------------------------------------------
    7     7	    즐거운 하루 되세요 - 2	                 leess	2023-02-13 14:24:03
    8     6	    즐거운 하루 되세요 - 1	                 leess	2023-02-13 14:24:03
    9     5	    오늘도 좋은 하루되세요	                 hongkd	2023-02-07 10:27:58
--------------------------------------------------------------------------------
                1 2 3 4 5 ==> 페이지바 
*/
/*
--------------------------------------------------------------------------------
-- 번호   글번호   글제목                               글쓴이    작성일자 
--------------------------------------------------------------------------------
    10    4	    기쁘고 감사함이 넘치는 좋은 하루 되세요	 leess	2023-02-07 10:27:56
    11    3   	건강하세요                           	 youks	2023-02-07 10:27:14
    12    2	    반갑습니다                        	 eomjh	2023-02-07 10:27:09
--------------------------------------------------------------------------------
                1 2 3 4 5 ==> 페이지바 
*/
/*
--------------------------------------------------------------------------------
-- 번호   글번호   글제목                               글쓴이    작성일자 
--------------------------------------------------------------------------------
    13    1	    안녕하세요	                         leess	2023-02-07 10:27:06
--------------------------------------------------------------------------------
                1 2 3 4 5 ==> 페이지바 
*/

select  rownum  -- rownum(행번호)은 기본적으로 insert가 되어진 순서대로 나온다.
     , boardno AS 글번호
     , subject AS 글제목
     , userid AS 글쓴이 
     , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS 작성일자 
from tbl_board;



-- 완성본 
select rownum, boardno, subject, userid, REGISTERDAY 
from
(
    select  rownum  
         , boardno 
         , subject 
         , userid 
         , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
    from tbl_board
    order by boardno desc
) V;

-- 또는 with 절을 사용해서 

with 
V as
(
    select  rownum  
         , boardno 
         , subject 
         , userid 
         , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
    from tbl_board
    order by boardno desc
) 
select rownum, boardno, subject, userid, REGISTERDAY 
from V;


------- 위에 표에 보여줬던것 처럼 각각의 페이지를 보고 싶다면 ---------------
--      1페이지 ==> rownum : 1 ~ 3 까지 / boardno : 13 ~ 11

-- 틀린 풀이 이다.!!!!!
select rownum, boardno, subject, userid, REGISTERDAY 
from
(
    select  rownum  
         , boardno 
         , subject 
         , userid 
         , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
    from tbl_board
    order by boardno desc
) V
where rownum between 1 and 3;


-- 정답(올바른) 1페이지 풀이 이다.!!!!!

select RNO, boardno, subject, userid, REGISTERDAY 
from
(
    select rownum AS RNO, boardno, subject, userid, REGISTERDAY 
    from
    (
        select  rownum  
             , boardno 
             , subject 
             , userid 
             , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
        from tbl_board
        order by boardno desc
    ) V
) T
where RNO between 1 and 3;




/*
==== 페이징 처리 공식 ====
where RNO between (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) - (한페이지당 보여줄 행의 개수 - 1) and (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) 

where RNO between (1 * 3) - (3 - 1) and (1 * 3);
where RNO between (3) -(2) and (3);
where RNO between 1 and 3;

*/


--      2페이지 ==> rownum : 4 ~ 6 까지 / boardno : 10 ~ 8

-- 틀린 풀이 이다.!!!!!
select rownum, boardno, subject, userid, REGISTERDAY 
from
(
    select  rownum  
         , boardno 
         , subject 
         , userid 
         , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
    from tbl_board
    order by boardno desc
) V
where rownum between 4 and 6;   -- 페이징 처리시 rownum은 where절에 바로 쓸 수가 없다!!!!!!!!!!!!!!!!!
                                -- 그래서 rownum 을 가지는 컬럼의 별칭을 만든 후에 inline veiw를 사용해야만 한다.


-- 정답(올바른) 2페이지 풀이 이다.!!!!!!

select RNO, boardno, subject, userid, REGISTERDAY 
from
(
    select rownum AS RNO, boardno, subject, userid, REGISTERDAY 
    from
    (
        select  rownum  
             , boardno 
             , subject 
             , userid 
             , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
        from tbl_board
        order by boardno desc
    ) V
) T
where RNO between 4 and 6;


/*
==== 페이징 처리 공식 ====
where RNO between (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) - (한페이지당 보여줄 행의 개수 - 1) and (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) 

where RNO between (2 * 3) - (3 - ) and (2 * 3);
where RNO between (6) -(2) and (6);
where RNO between 4 and 6 ;

*/



--      3페이지 ==> rownum : 7 ~ 9 까지 / boardno : 7 ~ 5
-- 정답(올바른) 3페이지 풀이 이다.!!!!!!

select RNO, boardno, subject, userid, REGISTERDAY 
from
(
    select rownum AS RNO, boardno, subject, userid, REGISTERDAY 
    from
    (
        select  rownum  
             , boardno 
             , subject 
             , userid 
             , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
        from tbl_board
        order by boardno desc
    ) V
) T
where RNO between 7 and 9;


/*
==== 페이징 처리 공식 ====
where RNO between (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) - (한페이지당 보여줄 행의 개수 - 1) and (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) 

where RNO between (3 * 3) - (3 - ) and (3 * 3);
where RNO between (9) -(2) and (9);
where RNO between 7 and 9 ;

*/




--      4페이지 ==> rownum : 10 ~ 12 까지 / boardno : 4 ~ 2
-- 정답(올바른) 4페이지 풀이 이다.!!!!!!

select RNO, boardno, subject, userid, REGISTERDAY 
from
(
    select rownum AS RNO, boardno, subject, userid, REGISTERDAY 
    from
    (
        select  rownum  
             , boardno 
             , subject 
             , userid 
             , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
        from tbl_board
        order by boardno desc
    ) V
) T
where RNO between 10 and 12;


/*
==== 페이징 처리 공식 ====
where RNO between (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) - (한페이지당 보여줄 행의 개수 - 1) and (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) 

where RNO between (4 * 3) - (3 - 1) and (4 * 3);
where RNO between (12) -(2) and (12);
where RNO between 10 and 12 ;

*/




--      5페이지 ==> rownum : 13 ~ 15 까지 / boardno : 1
-- 정답(올바른) 4페이지 풀이 이다.!!!!!!

select RNO, boardno, subject, userid, REGISTERDAY 
from
(
    select rownum AS RNO, boardno, subject, userid, REGISTERDAY 
    from
    (
        select  rownum  
             , boardno 
             , subject 
             , userid 
             , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
        from tbl_board
        order by boardno desc
    ) V
) T
where RNO between 13 and 15;

/*
==== 페이징 처리 공식 ====
where RNO between (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) - (한페이지당 보여줄 행의 개수 - 1) and (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) 

where RNO between (5 * 3) - (3 - 1) and (5 * 3);
where RNO between (15) -(2) and (15);
where RNO between 13 and 15 ;

*/





---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

-------- 또는 rownum을 사용하지 않고 row_number() 함수를 사용하여 페이징 처리를 할 수 있다. ---------


-- 개념 부분 
select  row_number() over (order by boardno desc)  -- 글번호의 내림차순  
      , boardno 
      , subject 
      , userid 
      , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
from tbl_board;



-- 오류 부분이다.
select  row_number() over (order by boardno desc)  -- 글번호의 내림차순  
      , boardno 
      , subject 
      , userid 
      , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
from tbl_board;
where row_number() over (order by boardno desc) between 1 and 3;
-- 오류 row_number() over (order by boardno desc 은 where 절에 바로 쓸 수 없다
-- 그러므로 이것 또한 inline weiw를 사용해야 한다.




-- 정답(올바른) 부분이다 (풀이이다)


----        1 페이지 부분 -------------
select --RNO
     boardno 
    , subject 
    , userid 
    , REGISTERDAY 
from
(
select  row_number() over (order by boardno desc) AS RNO  -- 글번호의 내림차순  
      , boardno 
      , subject 
      , userid 
      , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
from tbl_board
) V
where RNO between 1 and 3;  ---   1 페이지


/*
==== 페이징 처리 공식 ====
where RNO between (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) - (한페이지당 보여줄 행의 개수 - 1) and (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) 

where RNO between (1 * 3) - (3 - 1) and (1 * 3);
where RNO between (3) -(2) and (3);
where RNO between 1 and 3;

*/



----        2 페이지 부분 -------------
select --RNO
     boardno 
    , subject 
    , userid 
    , REGISTERDAY 
from
(
select  row_number() over (order by boardno desc) AS RNO  -- 글번호의 내림차순  
      , boardno 
      , subject 
      , userid 
      , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
from tbl_board
) V
where RNO between 4 and 6;  ---   2 페이지


/*
==== 페이징 처리 공식 ====
where RNO between (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) - (한페이지당 보여줄 행의 개수 - 1) and (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) 

where RNO between (2 * 3) - (3 - 1) and (2 * 3);
where RNO between (6) -(2) and (6);
where RNO between 4 and 6;

*/


----        3 페이지 부분 -------------
select --RNO
     boardno 
    , subject 
    , userid 
    , REGISTERDAY 
from
(
select  row_number() over (order by boardno desc) AS RNO  -- 글번호의 내림차순  
      , boardno 
      , subject 
      , userid 
      , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
from tbl_board
) V
where RNO between 7 and 9;  ---   3 페이지


/*
==== 페이징 처리 공식 ====
where RNO between (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) - (한페이지당 보여줄 행의 개수 - 1) and (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) 

where RNO between (3 * 3) - (3 - 1) and (3 * 3);
where RNO between (9) -(2) and (9);
where RNO between 7 and 9;

*/



----        4 페이지 부분 -------------
select --RNO
     boardno 
    , subject 
    , userid 
    , REGISTERDAY 
from
(
select  row_number() over (order by boardno desc) AS RNO  -- 글번호의 내림차순  
      , boardno 
      , subject 
      , userid 
      , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
from tbl_board
) V
where RNO between 10 and 12;  ---   4 페이지


/*
==== 페이징 처리 공식 ====
where RNO between (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) - (한페이지당 보여줄 행의 개수 - 1) and (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) 

where RNO between (4 * 3) - (3 - 1) and (4 * 3);
where RNO between (12) -(2) and (12);
where RNO between 10 and 12;

*/



----        5 페이지 부분 -------------
select --RNO
     boardno 
    , subject 
    , userid 
    , REGISTERDAY 
from
(
select  row_number() over (order by boardno desc) AS RNO  -- 글번호의 내림차순  
      , boardno 
      , subject 
      , userid 
      , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
from tbl_board
) V
where RNO between 13 and 15;  ---   5 페이지


/*
==== 페이징 처리 공식 ====
where RNO between (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) - (한페이지당 보여줄 행의 개수 - 1) and (조회하고자하는 페이지 번호 * 한페이지당 보여줄 행의 개수) 

where RNO between (5 * 3) - (3 - 1) and (5 * 3);
where RNO between (15) -(2) and (15);
where RNO between 13 and 15;

*/






-------------------------------------------------------------------------------
        --------  ====== **** 계층형 쿼리 **** ======= ------------------

/*
    계층형 쿼리는 spring 프레임워크 시간에 답변형 게시판에서 사용한다.
    또한 전자결제 에서도 사용된다.
*/

/*
    직급
    1       이순신
              |
    2       엄정화 
              |
    ------------------------
        |     |      |
    3 강감찬  유관순  안중근
        |          
    ------------------------ 
        |    |     |
    4 홍길동 이해리 서강준
    
    --> 홍길동은 강감찬에게 결제 -> 강감찬은 엄정화에게 결제 -> 엄정화는 이순신에게 결제 (계층형 쿼리)
*/

    select *
    from employees
    order by employee_id asc;

-- 결제라인을 만들어 보겠습니다
-- 출발    104  ==> 103  ==>  102  ==>   100  ==>  NULL  
-- level   1        2         3          4

    
    --104번 출발일때 
    select level
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,manager_id AS 직속결재권자사원번호
    from employees
    start with employee_id = 104    --104번 부터 출발한다. 
    connect by prior manager_id = employee_id;
/* 
    직원 104번의 상사는 103번이므로 
    connect by prior 103 = employee_id 
    즉 employee_id 값 103이 level 2 로 연결이 된다.
    
    직원 103번의 상사는 102번이므로 
    그 다음 connect by prior 102 = employee_id
    즉 employee_id 값 102이 level 3 로 연결이 된다.
    
    직원 102번의 상사는 100번이므로 
    그 다음 connect by prior 100 = employee_id
    즉 employee_id 값 100이 level 4 로 연결이 된다.
    
    직원 10번의 상사는 NULL 
    더이상 연결할 것이 없다.
*/    
    
-- *** !!! prior 다음에 나오는 manager_id 컬럼은 start with 되어지는 행의 manager_id 컬럼의 값이다. !!!! **** ----
    
    
    -- 103 번 출발일때 
    select level
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,manager_id AS 직속결재권자사원번호
    from employees
    start with employee_id = 103    --103번 부터 출발한다. 
    connect by prior manager_id = employee_id;
    /*
        1	103	Alexander Hunold	102
        2	102	Lex De Haan	        100
        3	100	Steven King	        null
    */
    
    
    -- 100 번 출발일때 
    select level
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,manager_id AS 직속결재권자사원번호
    from employees
    start with employee_id = 100    --100번 부터 출발한다. 
    connect by prior manager_id = employee_id;


    
--- 직속결재권자사원명 까지 추가해보자(JOIN)사용
    
    select A.level_no AS 단계
         , A.employee_id AS 사원번호
         , A.ENAME AS 사원명
         , A.MANAGER_id AS 직속결재권자사원번호
         , B.MGR_ENAME AS 작속결재권자사원명 
    from 
    (
    select level AS level_no
          ,employee_id 
          ,first_name || ' ' || last_name AS ENAME
          ,manager_id
    from employees
    start with employee_id = 104    --104번 부터 출발한다. 
    connect by prior manager_id = employee_id
    ) A
    LEFT JOIN      -- 앞에 것은 다 나와야 하므로 (NULL) 도 나와야 한다. 
    (
    select employee_id
         , first_name || ' ' || last_name as MGR_ENAME
    from employees
    ) B
    ON A.manager_id = B.employee_id
    order by 1;
/*
    1	104	Bruce Ernst	        103	Alexander Hunold
    2	103	Alexander Hunold	102	Lex De Haan
    3	102	Lex De Haan	        100	Steven King
    4	100	Steven King		
*/
    
    
    
    ------------------------------------------------------------------------
    --결제라인을 보는 것이 아닌 부하를 보고 싶다면 
    
    -- 100 번 출발일때 (부하를 다 보는 방법)
    select level
          ,employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,manager_id AS 직속결재권자사원번호
    from employees
    start with employee_id = 100    -- start with employee_id = 101 
    connect by prior employee_id = manager_id;
    /*
        connect by prior 100 = manager_id;
        connect by prior 101 = manager_id;
        connect by prior 108 = manager_id;
        connect by prior 109 = manager_id;
    */
    -- *** !!! prior 다음에 나오는 employee_id 컬럼은 start with 되어지는 행의 employee_id 컬럼의 값이다. !!!! **** ----
    
    
    
    -- 사장 바로 밑에 있는 사람들을 나타내는 것 (밑으로 내려가는 순으로 연결됨)
    select *
    from employees
    where 100 = manager_id;
    
    select *
    from employees
    where 101 = manager_id;
    
    select *
    from employees
    where 108 = manager_id;
    
    select *
    from employees
    where 109 = manager_id;
    --- 마지막임 가장 막내 그 뒤는 null
    
    
    -----------------------------------------------------------------------------------------------
    -----------------------------여기까지가 select의 마지막 부분이다.------------------------------------
    
    
    --------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------- 
   
   
   /*
        DML(Data Manuplation Language) : 데이터 조작어 ==> insert, update, delete, merge
                                     : 수동 commit 이므로 rollback 이 가능하다.
                                     
        DDL(Data Definition Language) : 데이터 정의어 ==> create, drop, alter, truncate
                                    : 자동 commit( Auto commit) 이므로 rollback 이 불가하다.
                                    
        DCL(Data Control Language) : 데이터 제어어 ==> grant, revoke     
                                 : 자동 commit( Auto commit) 이므로 rollback 이 불가하다.
                                 
        TCL(Transaction Control Language) : 트랜잭션 제어어 ==> commit, rollback
        
        DQL(Data Query Language) : 데이터 질의어 ==> select  ==> 신입들은 이것만 잘해도 된다.
   */
    
    
    --------------------------------------------------------------------------------------
    --DML(Data Manuplation Language) : 데이터 조작어 ==> insert, update, delete, merge
    --                               : 수동 commit 이므로 rollback 이 가능하다. 시작 
    ---------------------------------------------------------------------------------------
    
    
       -------- **** 데이터 조작어(DML == Data Manuplation Language) **** ---------
    --- DML 문은 기본적으로 수동 commit 이다.
    --- 즉, DML 문을 수행한 다음에는 바로 디스크(파일)에 적용되지 않고 commit 해야만 적용된다.
    --- 그래서 DML 문을 수행한 다음에 디스크(파일)에 적용치 않고자 한다라면 rollback 하면 된다.
   
    1. insert  --> 데이터 입력
    2. update  --> 데이터 수정
    3. delete  --> 데이터 삭제
    4. merge   --> 데이터 병합 
    
    insert 는 문법이
    insert into 테이블명(컬럼명1,컬럼명2,...) values(값1,값2,...); 
    이다.
    
    ※ Unconditional insert all  -- ==>조건이 없는 insert (unconditional 은 무조건)
    [문법] insert all 
           into 테이블명1(컬럼명1, 컬럼명2, ....)
           values(값1, 값2, .....)
           into 테이블명2(컬럼명3, 컬럼명4, ....)
           values(값3, 값4, .....)
           SUB Query문;
           
           
   create table tbl_emp1
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(6)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );       
   -- Table TBL_EMP1이(가) 생성되었습니다.
   
   
   create table tbl_emp1_backup
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(6)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );  
   -- Table TBL_EMP1_BACKUP이(가) 생성되었습니다. 
    
   --현재 상태 (아무것도 없음)
   select *
   from  tbl_emp1;
   
   select *
   from  tbl_emp1_backup;
   
   
   -- 모든 테이블에 대입한다. (원본과 백업 둘다 들어간다.!!!!)
   insert all -- 이 뒤에 모든 테이블에 정보를 저장한다.
   into tbl_emp1(empno , ename, monthsal, gender, manager_id, department_id, department_name)  -- 테이블에 대입 
   values(employee_id, ename, month_sal, gender||'자', manager_id, department_id, department_name) -- 값을 변경하는것 gender에 남자 여자로 나타내도록 함 
   into tbl_emp1_backup(empno , ename, monthsal, gender, manager_id, department_id, department_name)  --테이블에 대입
   values(employee_id, ename, month_sal, gender||'자', manager_id, department_id, department_name)  -- 값을 변경하는것 gender에 남자 여자로 나타내도록 함 
   select employee_id
        , first_name || ' ' || last_name AS ename 
        , nvl(salary + (salary * commission_pct), salary) AS month_sal
        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end AS gender
        , E.manager_id  -- 직속상관 번호
        , E.department_id  -- 부서 번호   
        , department_name
   from employees E LEFT JOIN departments D 
   on E.department_id = D.department_id
   order by E.department_id asc, employee_id asc;
   -- 107개 행 + 107개 행 ==> 214개
   -- 214개 행 이(가) 삽입되었습니다.

    commit;
    -- 커밋 완료
    
     --현재 상태 (107행씩 존재 )
   select *
   from  tbl_emp1;
   
   select *
   from  tbl_emp1_backup;
   
---------------------------------------------------------------------------------------------------------
-----------------------------------2월 14일 시작 부분 ----------------------------------------
---------------------------------------------------------------------------------------------


    ※ Conditional insert all  -- ==>조건이 있는 insert
    --조건(where 절)에 일치하는 행들만 특정 테이블로 찾아가서 insert 하도록 하는 것이다

   
    create table tbl_dept30
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(6)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );   
   -- Table TBL_DEPT30이(가) 생성되었습니다.

    create table tbl_dept50
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(6)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );   
   -- Table TBL_DEPT50이(가) 생성되었습니다.


   create table tbl_dept80
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(6)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );   
    -- Table TBL_DEPT80이(가) 생성되었습니다.


    -- 조건있는 insert부분~~~~~~
    -- 모든 테이블에 대입한다. 
   insert all -- 이 뒤에 모든 테이블에 정보를 저장한다.
   when department_id = 30 then 
   into tbl_dept30(empno , ename, monthsal, gender, manager_id, department_id, department_name)  -- 테이블에 대입 
   values(employee_id, ename, month_sal, gender, manager_id, department_id, department_name) 
   when department_id = 50 then
   into tbl_dept50(empno , ename, monthsal, gender, manager_id, department_id, department_name)  --테이블에 대입
   values(employee_id, ename, month_sal, gender, manager_id, department_id, department_name)  
   when department_id = 80 then
   into tbl_dept80(empno , ename, monthsal, gender, manager_id, department_id, department_name)  --테이블에 대입
   values(employee_id, ename, month_sal, gender, manager_id, department_id, department_name)   
   select employee_id
        , first_name || ' ' || last_name AS ename 
        , nvl(salary + (salary * commission_pct), salary) AS month_sal
        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end AS gender
        , E.manager_id  -- 직속상관 번호
        , E.department_id  -- 부서 번호   
        , department_name
   from employees E JOIN departments D 
   on E.department_id = D.department_id
   where E.department_id in(30, 50, 80)
   order by E.department_id asc, employee_id asc;
   -- 85개 행 이(가) 삽입되었습니다.

   
   commit; 
   
   -- 상태 확인해보기
   select *
   from tbl_dept30;
   
   select *
   from tbl_dept50;
   
   select *
   from tbl_dept80;
   
   
   
------------------ ==== **** merge(병합) **** ==== -------------------------
-- 어떤 2개 이상의 테이블에 존재하는 데이터를 다른 테이블 한곳으로 모으는 것(병합)이다.

   create table tbl_busec_10
   (empno            number(6)
   ,ename            varchar2(50)
   ,department_id    number(4)
   );   
   -- Table TBL_BUSEC_10이(가) 생성되었습니다.

   create table tbl_busec_20
   (empno            number(6)
   ,ename            varchar2(50)
   ,department_id    number(4)
   );   
   -- Table TBL_BUSEC_20이(가) 생성되었습니다.
   
   create table tbl_busec_30
   (empno            number(6)
   ,ename            varchar2(50)
   ,department_id    number(4)
   );   
   --Table TBL_BUSEC_30이(가) 생성되었습니다.

    create table tbl_busec_total
   (empno            number(6)
   ,ename            varchar2(50)
   ,department_id    number(4)
   );   
   -- Table TBL_BUSEC_TOTAL이(가) 생성되었습니다.


    insert into tbl_busec_10(empno, ename, department_id) values(1001, '이순신', 10);
    insert into tbl_busec_20(empno, ename, department_id) values(2001, '엄정화', 20);
    insert into tbl_busec_30(empno, ename, department_id) values(3001, '안중근', 30);
    
    commit;
    --커밋 완료 
    
    -- 확인하기
    select *
    from tbl_busec_10;
    
    select *
    from tbl_busec_20;
    
    select *
    from tbl_busec_30;
    
    select *
    from tbl_busec_total;
    --(아무것도 없음)
    
    --merge 합병
    merge into tbl_busec_total T 
    using tbl_busec_10 B10
    ON (T.empno = B10.empno)
    when matched then  
        update set T.ename = B10.ename
                  ,T.department_id = B10.department_id
    when not matched then  -- insert into는 사용하면 오류
        insert (empno, ename, department_id) values(B10.empno, B10.ename, B10.department_id);  -- 컬럼내용을 직접 입력
    -- 1 행 이(가) 병합되었습니다.

   -- 병합확인
   select *
    from tbl_busec_total;
    
    --rollback
    rollback;
    
    select *
    from tbl_busec_total;
    --(아무것도 없음)
    
    
    -- 다시 값을 넣어주고 commit
    commit;
    -- 커밋 완료.

    
    insert into tbl_busec_10(empno, ename, department_id) values(1002, '삼순신', 10);
    -- 1 행 이(가) 삽입되었습니다.

    commit;
    -- 커밋 완료.
    
    -- 10번 테이블 확인
    select *
    from tbl_busec_10;
    /*
        1001	이sunsin	10
        1002	SAM순신	10
        1003	오순신	10
    */
    --total테이블 확인
    select *
    from tbl_busec_total;
    
    
    --merge 합병
    merge into tbl_busec_total T 
    using tbl_busec_10 B10
    ON (T.empno = B10.empno)
    when matched then  
        update set T.ename = B10.ename
                  ,T.department_id = B10.department_id
    when not matched then  -- insert into는 사용하면 오류 (매치가 안된 것)
        insert (empno, ename, department_id) values(B10.empno, B10.ename, B10.department_id);  -- 컬럼내용을 직접 입력
    -- 2 행 이(가) 병합되었습니다.


    commit;
    -- 커밋 완료.

    
    --total테이블 확인
    select *
    from tbl_busec_total;
    /*
        1001	이순신	10
        1002	삼순신	10
    */

    -- total에 있는 이름을 바꿔보자 
    update tbl_busec_10 set ename = '이sunsin'
    where empno = 1001;
    
    update tbl_busec_10 set ename = 'SAM순신'
    where empno = 1002;
    
    commit;
    -- 커밋 완료
    
    
    
    insert into tbl_busec_10(empno, ename, department_id) values(1003, '오순신', 10);
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    -- 커밋 완료
    
    
    -- 10번 테이블 확인
    select *
    from tbl_busec_10;
    /*
        1001	이sunsin	10
        1002	SAM순신	10
        1003	오순신	10
    */
    
    
    --total테이블 확인
    select *
    from tbl_busec_total;
    
    
    
    --merge 합병
    merge into tbl_busec_total T 
    using tbl_busec_10 B10
    ON (T.empno = B10.empno)
    when matched then  
        update set T.ename = B10.ename
                  ,T.department_id = B10.department_id
    when not matched then  -- insert into는 사용하면 오류 (매치가 안된 것)
        insert (empno, ename, department_id) values(B10.empno, B10.ename, B10.department_id);  -- 컬럼내용을 직접 입력
    -- 3 행 이(가) 병합되었습니다.
    
    commit;
    -- 커밋 완료
    
    
    -- 10번 테이블 확인
    select *
    from tbl_busec_10;
    
    --total테이블 확인
    select *
    from tbl_busec_total;
    
    -- 20번 테이블 확인
    select *
    from tbl_busec_20;
    
    
    --merge 합병 (20번 부분)
    merge into tbl_busec_total T 
    using tbl_busec_20 B20
    ON (T.empno = B20.empno)
    when matched then  
        update set T.ename = B20.ename
                  ,T.department_id = B20.department_id
    when not matched then  -- insert into는 사용하면 오류 (매치가 안된 것)
        insert (empno, ename, department_id) values(B20.empno, B20.ename, B20.department_id);  -- 컬럼내용을 직접 입력
    -- 1 행 이(가) 병합되었습니다.
    
    commit;
    -- 커밋 완료
    
    -- 20번 테이블 확인
    select *
    from tbl_busec_20;
    -- 2001	엄정화	20
    
    --total테이블 확인
    select *
    from tbl_busec_total;
    
    
    --merge 합병 (30번 부분)
    merge into tbl_busec_total T 
    using tbl_busec_30 B30
    ON (T.empno = B30.empno)
    when matched then  
        update set T.ename = B30.ename
                  ,T.department_id = B30.department_id
    when not matched then  -- insert into는 사용하면 오류 (매치가 안된 것)
        insert (empno, ename, department_id) values(B30.empno, B30.ename, B30.department_id);  -- 컬럼내용을 직접 입력
    -- 1 행 이(가) 병합되었습니다.
    
    commit;
    -- 커밋 완료
    
    -- 30번 테이블 확인
    select *
    from tbl_busec_30;
    -- 3001	안중근	30
    
    
    --total테이블 확인
    select *
    from tbl_busec_total;
    /*
        1001	이sunsin	10
        1002	SAM순신	10
        1003	오순신	10
        2001	엄정화	20
        3001	안중근	30
    */
    
    -------------------------------------DML 끝 --------------------------------
    ---------------------------------------------------------------------------
    
                ---- ==== ***** === 시퀀스(sequence) === ***** ==== ----
    
    -- 시퀀스(sequence) 란? 쉽게 생각하면 은행에서 발급해주는 대기번호표와 비슷한 것이다
    -- 시퀀스(sequence) 는 숫자로 이루어져 있으며. 매번 정해진 증가치 만큼 숫자가 증가되어지는 것이다.

/*
    create sequence seq_yeyakno  --  seq_yeyakno 은 시퀀스(sequence) 이름이다.
    start with 1                 -- 첫번째 출발은 1부터 한다.
    increment by 1               -- 증가치 값  2  3  4  5 ....
    maxvalue 5                   -- 최대값이 5 이다 (nomaxvalue랑 같이 못씀)
    --nomaxvalue                 -- 최대값이 없는 무제한, 계속 증가시키겠다는 말이다.
    minvalue 2                   -- 최소값이 2이다. 
                                 -- cycle 이 있을때만 minvalue에 주어진 값이 사용된다.
                                 -- nocycle 이 있을때만 minvalue에 주어진 값이 사용되지 않는다.
                                 -- minvalue 숫자에 해당하는 숫자 값은 start with 숫자에 해당하는 숫자 값과 같은지 아니면 start with 숫자에 해당하는 숫자보다 작아야 한다.   
                                 
                                        
    --nominvalue                 --최소값이 없다.
    cycle                        -- 반복을 한다.
    --nocycle                    -- 반복이 없는 직진 , (nomaxvalue와 사용)
    nocache;                     -- 메모리에는 캐쉬하지마라    

*/

    -- !!!!!!!!!오류부분!!!!!!!!!!!--
    create sequence seq_yeyakno_1 
    start with 1                 -- 첫번째 출발은 1부터 한다.
    increment by 1               -- 증가치는 1, 즉 1씩 증가
    maxvalue 5                   -- 최대값 5
    minvalue 2                   -- 최소값 2 (오류!!!) 시작값에 비해 크다 
    cycle                        -- 반복을 한다
    nocache;                 

    
    -- !!!!!!!!!올바른 부분!!!!!!!!!!!--
    create sequence seq_yeyakno_1 
    start with 2                 -- 첫번째 출발은 2부터 한다.
    increment by 1               -- 증가치는 1, 즉 1씩 증가
    maxvalue 5                   -- 최대값 5
    minvalue 1                   -- 최소값 1 
    cycle                        -- 반복을 한다
    nocache;      
    -- Sequence SEQ_YEYAKNO_1이(가) 생성되었습니다.





            ----- ***** 생성되어진 시퀀스(sequence) 를 조회해 봅시다. ***** ------
    
    select * 
    from user_sequences;
    
    -- 다음번에 들어올 시퀀스 값을 미리 알려주는 것이다.

    select last_number
    from user_sequences
    where sequence_name = 'SEQ_YEYAKNO_1';


    -- 테이블 생성 
    create table tbl_board_test_1
    (boardno      number
    ,subject      Nvarchar2(100)
    ,registerday  date default sysdate
    );
    -- Table TBL_BOARD_TEST_1이(가) 생성되었습니다.

    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '첫번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 2
 
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '두번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 3
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '세번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 4

    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '네번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 5

    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '다섯번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 1
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '여섯번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 2
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '일곱번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 3
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '여덟번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 4
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '아홉번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 5
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '열번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 1
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '열한번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 2
    
    commit;
    -- 커밋 완료
    
    -- 결과 확인해 보기 
    select *
    from tbl_board_test_1;
/*
    2	첫번째 글입니다,	23/02/14
    3	두번째 글입니다,	23/02/14
    4	세번째 글입니다,	23/02/14
    5	네번째 글입니다,	23/02/14
    1	다섯번째 글입니다,	23/02/14
    2	여섯번째 글입니다,	23/02/14
    3	일곱번째 글입니다,	23/02/14
    4	여덟번째 글입니다,	23/02/14
    5	아홉번째 글입니다,	23/02/14
    1	열번째 글입니다,	23/02/14
    2	열한번째 글입니다,	23/02/14
    3	열두번째 글입니다,	23/02/14
*/

    
    -- 두번째 만들어 본다 (일반적으로 웹을 만들때 게시판은 이렇게 만든다.)
    create sequence seq_yeyakno_2 
    start with 1                 -- 첫번째 출발은 1부터 한다.
    increment by 1               -- 증가치는 1, 즉 1씩 증가
    nomaxvalue                   -- 최대값이 없는 무제한이다. 계속 증가시키겠다는 말이다.
    nominvalue                   -- 최소값이 없다 
    nocycle                      -- 반복을 안하고 직진
    nocache;      
    -- Sequence SEQ_YEYAKNO_2이(가) 생성되었습니다.


             ----- ***** 생성되어진 시퀀스(sequence) 를 조회해 봅시다. ***** ------
    select *
    from user_sequences;




     ----- ***** 시퀀스(sequence) seq_yeyakno_1 이 마지막으로 사용되어진 값을 알고자 한다. 
    select seq_yeyakno_1.currval
    from dual;
    -- 2
    
    insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '열두번째 글입니다,');-- registerday 생략하면 default로 현재시간이 나옴  
    -- 1 행 이(가) 삽입되었습니다.  -- 3
    
    commit;
    -- 커밋 완료
    
    -- 시퀀스 부분 보기 
    select *
    from user_sequences;
    
    -- 시퀀스 마지막 사용 부분
    select seq_yeyakno_1.currval
    from dual;
    -- 3
    
    
    ------ ***** 시퀀스(sequence) 삭제하기 ***** ---------  
    drop sequence SEQ_YEYAKNO_2; 
    -- Sequence SEQ_YEYAKNO_2이(가) 삭제되었습니다.



    ----- ***** 생성되어진 시퀀스(sequence) 를 조회해 봅시다. ***** ------
    -- Sequence SEQ_YEYAKNO_2 가 사라진 것을 확인 할 수 있다.
    select *
    from user_sequences;

    
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

     --DDL(Data Definition Language) : 데이터 정의어 ==> create, drop, alter, truncate
     --                              : 자동 commit( Auto commit) 이므로 rollback 이 불가하다.


-- 자동 commit 이 되는지 확인해 보자 

create table tbl_test01
(no     number
,name   Nvarchar2(20)
);
-- Table TBL_TEST01이(가) 생성되었습니다.


insert into tbl_test01 values(1, '한석규');
insert into tbl_test01 values(2, '두석규');
insert into tbl_test01 values(3, '세석규');
insert into tbl_test01 values(4, '네석규');
insert into tbl_test01 values(5, '오석규');
    
commit;

-- 현재 결과 보기 
select * 
from tbl_test01;


-- 테이블에 있는 값들을 삭제하기 
delete from tbl_test01;
-- 5개 행 이(가) 삭제되었습니다.


-- 현재 결과 보기 (값 없음)
select * 
from tbl_test01;


rollback;
-- 롤백 완료


-- 현재 결과 보기 (값 있음)
select * 
from tbl_test01;


-- 테이블에 있는 값들을 삭제하기 
delete from tbl_test01;
-- 5개 행 이(가) 삭제되었습니다.
    

-- 테이블 생성하기 create는 DDL문 이므로 내부적으로 COMMIT 이 실행되어진다..
create table tbl_test02
(no     number
,name   Nvarchar2(20)
);
-- Table TBL_TEST02이(가) 생성되었습니다.



-- 현재 결과 보기 (값 없음)
select * 
from tbl_test01;


rollback;
-- 롤백 완료

-- 현재 결과 보기 (값 없음)
select * 
from tbl_test01;
-- 위에서 DDL 문인 reate를 했으므로 내부적으로 commit이 실행 되었기에 roolback을 해봐야 아무 소용이 없다 
--그래서 행이 없다   


----------------------------------------------------------------------------------------------
-- ================================== 중요중요중요중요중요 =======================================--

        -- === *** constranint(제약조건)을 사용하여 테아블을 생성해 보겠습니다 *** === ---
        
/*
    >>>> 오라클의 제약조건(constranint)의 종류 <<<<<<<
    
    -- 제약조건(constranint)의 이름은 오라클 전체에서 고유해야 한다.
       즉, 제약조건(constranint)의 이름은 중복을 허락치 않는다.
       
    1. Primary key(기본키, 대표식별자) 제약(P) --(대문자 P)
       -- 하나의 테이블당 오로지 1개만 생성할 수 있다.
       -- 어떤 컬럼에 Primary key(기본키) 제약을 주면 그 컬럼에는 자동적으로 NOT NULL 이 주어지면서
          동시에 그 컬럼에는 중복된 값은 들어올 수 없고 오로지 고유한 값만 들어오게 되어진다.
       -- 컬럼 1개를 가지고 생성된 Primary key 를 single Primary key라고 부르고,
          컬럼 2개 이상을 가지고 생성된 Primary key 를 composite(복합) Primary key 라고 부른다.
          
    2. Unique 제약 [U]
     -- 하나의 테이블당 여러개를 생성할 수 있다.
     어떤 컬럼에 Unique 제약을 주면 그 컬럼에는 NULL 을 허용할 수 있으며, 
     그 컬럼에는 중복된 값은 들어올 수 없고 오로지 고유한 값만 들어오게 되어진다.
     -- 여러개의 Unique key 중에 후보키(후보식별자)가 되려면 해당 컬럼은 NOT NULL 이여야 한다.
     
    3. Check 제약 [C]
    -- 하나의 테이블당 여러개를 생성할 수 있다.
    -- insert(입력) 또는 update(수정) 시 어떤 컬럼에 입력되거나 수정되는 데이터값을 아무거나 허락하는 것이 아니라 
    -- 조건에 맞는 데이터 값만 넣고자(수정하고자) 할 경우에 사용된다.
    
    4. Foreign key (외래키) 제약 (참조키) [R]
    -- 하나의 테이블 당 여러개를 생성할 수 있다.
    -- Foreign key(외래키) 제약에 의해 참조(Reference)받는 컬럼은 반드시 중복된 값을 허락하지 않는 고유한 값만 가지는 컬럼(Primary key 또는 Unique key) 이어야 한다.!!!!!
    -- 또한 Foreign key(외래키) 제약에 의해 참조(Reference)받는 컬럼은 NOT NULL 이어야 한다.
    
    5. NOT NULL 제약[C]
    -- 하나의 테이블당 여러개를 생성할 수 있다.
    -- 특정 컬럼에 NOT NULL 제약을 주면 그 컬럼에는 반드시 데이터 값을 주어여 한다는 말이다.
*/



    ----- >>> Primary key(기본키, 대표식별자) 제약(P) 에 대해서 알아봅니다 <<< ---------

-- single Primary key
create table tbl_gogek
(gogekId       varchar2(30)     primary key  -- COLUMN LEVEL 제약 조건 
,gogekName     Nvarchar2(20)    not null
,gogekPhone    varchar2(20)
);
-- Table TBL_GOGEK이(가) 생성되었습니다.


desc tbl_gogek;
/*
    이름         널?       유형            
    ---------- -------- ------------- 
    GOGEKID    NOT NULL VARCHAR2(30)    ---> 어떤 컬럼에 Primary key(기본키) 제약을 주면 그 컬럼에는 자동적으로 NOT NULL
    GOGEKNAME  NOT NULL NVARCHAR2(20) 
    GOGEKPHONE          VARCHAR2(20) 
*/

insert into tbl_gogek(GOGEKID, GOGEKNAME, GOGEKPHONE) values ('hongkd', '홍길동', '010-2345-6789');
--1 행 이(가) 삽입되었습니다.


insert into tbl_gogek(GOGEKID, GOGEKNAME, GOGEKPHONE) values ('hongkd', '홍갑덕', '010-3333-5555');
--ORA-00001: 무결성 제약 조건(HR.SYS_C008439)에 위배됩니다
-- Primary key의 값은 고유해야 함 
-- COLUMN LEVEL 제약조건을 주면 제약조건의 이름은 오라클 서버가 알아서 자동적으로 고유한 값인 SYS_C숫자인 형태로 되어진다.


insert into tbl_gogek(GOGEKID, GOGEKNAME, GOGEKPHONE) values ('hongkd02', '홍갑덕', '010-3333-5555');
--1 행 이(가) 삽입되었습니다.

commit;
-- 커밋 완료

-- 결과 확인 
select *
from tbl_gogek;



--- tbl_gogek 테이블에 대한 제약조건(Constraint)을 조회해보겠습니다. *** ----
select *
from user_constraints
where table_name = 'TBL_GOGEK';
/*
    HR	SYS_C008438	C	TBL_GOGEK	"GOGEKNAME" IS NOT NULL	"GOGEKNAME" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			23/02/14					1
    HR	SYS_C008439	P	TBL_GOGEK						ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			23/02/14	HR	SYS_C008439			1
*/






-- 한번더 연습해오겠다. (위에 방식으로 컬럼을 줘도 되지만 새롭게 , 로 만들어오는것이 훨씬 좋다)

-- single Primary key
create table tbl_newgogek
(gogekId       varchar2(30)      
,gogekName     Nvarchar2(20)             not null
,gogekPhone    varchar2(20)
,constraint    PK_tbl_newgogek_gogekId   primary key(gogekId)  -- ROW LEVEL 제약 조건
-- gogekId 컬럼에 primary key 제약조건을 주는데 그 제약조건의 이름은 PK_tbl_newgogek_gogekId 이다.
);
-- Table TBL_newGOGEK이(가) 생성되었습니다.


--- tbl_gogek 테이블에 대한 제약조건(Constraint)을 조회해보겠습니다. *** ----
select *
from user_constraints
where table_name = 'TBL_NEWGOGEK';
-- PK_tbl_newgogek_gogekId


insert into tbl_newgogek(GOGEKID, GOGEKNAME, GOGEKPHONE) values ('hongkd', '홍길동', '010-2345-6789');
--1 행 이(가) 삽입되었습니다.

insert into tbl_newgogek(GOGEKID, GOGEKNAME, GOGEKPHONE) values ('hongkd', '홍갑덕', '010-3333-5555');
--ORA-00001: 무결성 제약 조건(HR.PK_TBL_NEWGOGEK_GOGEKID)에 위배됩니다

commit;
-- 커밋 완료

select *
from tbl_newgogek;
-- hongkd	홍길동	010-2345-6789



---------------------- 테이블 오류인 경우를 살펴보자 ------------------------------
-- 다시 테이블을 만들어보자 (오류)
create table tbl_newgogek_02
(gogekId       varchar2(30)      
,gogekName     Nvarchar2(20)             not null
,gogekPhone    varchar2(20)
,constraint    PK_tbl_newgogek_gogekId   primary key(gogekId)  -- ROW LEVEL 제약 조건
-- gogekId 컬럼에 primary key 제약조건을 주는데 그 제약조건의 이름은 PK_tbl_newgogek_gogekId 이다.
);
-- 오류 보고 - ORA-02264: 기존의 제약에 사용된 이름입니다
-- The specified constraint name has to be unique. 유니크는 고유해야 한다.!!!!!
-- 


-- 다시 테이블을 만들어보저 (오류) -- Primary key는 테이블당 하나의 키만 가질 수 있음
create table tbl_newgogek_02
(gogekId       varchar2(30)              primary key     
,gogekName     Nvarchar2(20)             not null
,gogekPhone    varchar2(20)              primary key
);
-- 오류보고 - ORA-02260: 테이블에는 하나의 기본 키만 가질 수 있습니다.


-- 다시 테이블을 만들어보저 (오류) -- Primary key는 테이블당 하나의 키만 가질 수 있음
create table tbl_newgogek_02
(gogekId       varchar2(30)                 
,gogekName     Nvarchar2(20)             not null
,gogekPhone    varchar2(20) 
,constraint PK_tbl_newgogek_02_gogekId primary key(gogekId)
,constraint PK_tbl_newgogek_02_gogekPhone primary key(gogekPhone)
);
-- 오류보고 - ORA-02260: 테이블에는 하나의 기본 키만 가질 수 있습니다.



------------------------  composite(복합) Primary key ---------------------
-- 테이블 지우는 식 
drop table tbl_jumun purge;
-- Table TBL_JUMUN이(가) 삭제되었습니다.


-- composite(복합) Primary key
create table tbl_jumun
(gogekId       varchar2(20)   
,productCode   varchar2(20)
,jumunday      date default sysdate 
,jumunsu       number(10) 
,constraint PK_tbl_jumun_gogekId primary key(gogekId, productCode, jumunday)
);
-- Table TBL_JUMUN이(가) 생성되었습니다.


insert into tbl_jumun(gogekId, productCode, jumunday, jumunsu)
values ('leess', 'SWK', default, 10);
-- 1 행 이(가) 삽입되었습니다.


insert into tbl_jumun(gogekId, productCode, jumunday, jumunsu)
values ('leess', 'KJK', default, 20);
-- single primary key 일때는 오류가 생김 -->오류 보고 - ORA-00001: 무결성 제약 조건(HR.PK_JUMUN_GOGEKID)에 위배됩니다
-- but composite(복합) Primary key 일때는  1 행 이(가) 삽입되었습니다.


insert into tbl_jumun(gogekId, productCode, jumunday, jumunsu)
values ('leess', 'SWK', default, 30);
-- 오류 보고 - ORA-00001: 무결성 제약 조건(HR.PK_TBL_JUMUN_GOGEKID)에 위배됩니다 
-- 'leess'과 'SWK' 이 같기 때문에 키 값은 고유하므로 오류가 발생한다.(jumunday)를 추가 하기 전에는 
-- 'leessl과 'SWK'이 같더라도 jumunday 시간이 다르므로 1행이 (가) 삽입되었습니다.

commit;
-- 커밋 완료

-- 결과값 보기
select *
from tbl_jumun;
/*
    leess	SWK	23/02/14	10
    leess	KJK	23/02/14	20
    leess	SWK	23/02/14	30
*/




--- TBL_NEWGOGEK 테이블에 생성되어진 primary key를 조회해 봅시다. *** ----
select *
from user_constraints
where table_name = 'TBL_NEWGOGEK' and constraint_type = 'P';
--> 이것은 single


-- 위에것과 동일하게 나오는 것은 constraint_name 이 공동 컬럼이 있다.
select *
from user_cons_columns
where table_name = 'TBL_NEWGOGEK';


-- 아래와 같이 JOIN 해서 조회를 한다.

select A.constraint_name, A.constraint_type, A.search_condition,
      B.column_name, B.position
from user_constraints A JOIN user_cons_columns B
ON A.constraint_name = B.constraint_name
where A.TABLE_NAME = 'TBL_NEWGOGEK';
/*
    SYS_C008440	C	"GOGEKNAME" IS NOT NULL	GOGEKNAME	
    PK_TBL_NEWGOGEK_GOGEKID	P		GOGEKID	1
*/




--- TBL_jumun 테이블에 생성되어진 primary key를 조회해 봅시다. *** ----
select *
from user_constraints
where table_name = 'TBL_JUMUN' and constraint_type = 'P';
-- 이것은 composite(복합)

-- 아래와 같이 JOIN 해서 조회를 한다.
select A.constraint_name, A.constraint_type, A.search_condition,
      B.column_name, B.position
from user_constraints A JOIN user_cons_columns B
ON A.constraint_name = B.constraint_name
where A.TABLE_NAME = 'TBL_JUMUN';
-- position은 primary key가 들어오는 순서 나타낸다.




-------------------------------------------------------------------------------------------
    ----- >>> Unique key(후보키, 후보식별자) 제약(U) 에 대해서 알아봅니다 <<< ---------

 -- 여러개의 Unique key 중에 후보키(후보식별자)가 되려면 해당 컬럼은 NOT NULL 이여야 한다.
 -- 아래의 예제에서는 gogekEmail 컬럼이 후보키, 후보식별자가 된다.

    drop table tbl_gogek purge;
    -- Table TBL_GOGEK이(가) 삭제되었습니다.


    -- 한 테이블에 unique 제약을 여러개 생성 가능함.
    create table tbl_gogek
    (gogekId       varchar2(30)     
    ,gogekName     Nvarchar2(20)    not null
    ,gogekPhone    varchar2(20)     --null   ==> null 을 허용함 
    ,gogekEmail    varchar2(30)     not null
    ,constraint PK_tbl_gogek_gogekId primary key(gogekId)   -- 고객 아이디가 대표 식별자 
    ,constraint UQ_tbl_gogek_gogekPhone unique(gogekPhone)  -- gogekPhone 컬럼에 unique 제약을 준것이다.
    ,constraint UQ_tbl_gogek_gogekEmail unique (gogekEmail) -- gogekEmail 컬럼에 unique 제약을 준것이다 (중복 안됨!!)
    );
    -- Table TBL_GOGEK이(가) 생성되었습니다.


    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail )
    values('leess','이순신','010-2345-6789','leess@gmail.com');
    -- 1 행 이(가) 삽입되었습니다.

    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail )
    values('youks','유관순',null,'youks@gmail.com');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail )
    values('eomjh','엄정화',null,'eomjh@gmail.com');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail )
    values('seokj','서강준','010-2345-6789','seokj@gmail.com');
    -- 오류 보고 - ORA-00001: 무결성 제약 조건(HR.UQ_TBL_GOGEK_GOGEKPHONE)에 위배됩니다
    -- 전화번호가 이순신과 같기 때문에 중복된 값이 안되는 unique 특성상 오류 발생 (고유 값)
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail )
    values('seokj','서강준','010-7777-8888','eomjh@gmail.com');
    -- 오류 보고 - ORA-00001: 무결성 제약 조건(HR.UQ_TBL_GOGEK_GOGEKEMAIL)에 위배됩니다
    -- 이메일이 엄정화와 같기 때문에 중복된 값이 안되는 unique 특성상 오류 발생(고유 값) 
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail )
    values('seokj','서강준','010-7777-8888',null);
    -- 오류 보고 - ORA-01400: NULL을 ("HR"."TBL_GOGEK"."GOGEKEMAIL") 안에 삽입할 수 없습니다
    -- 이메일에는 반드시 null이 아닌 값이 들어와야 한다.
    
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail )
    values('seokj','서강준','010-7777-8888','seokj@gmail.com');
    -- 1 행 이(가) 삽입되었습니다.

    commit;
    -- 커밋 완료.


    -- 결과 확인해보기 
    select *
    from tbl_gogek;
    /*
        leess	이순신	010-2345-6789	leess@gmail.com
        youks	유관순		youks@gmail.com
        eomjh	엄정화		eomjh@gmail.com
        seokj	서강준	010-7777-8888	seokj@gmail.com
    */
    
    
    -- 아래와 같이 JOIN 해서 조회를 한다.
    -- TBL_GOGEK 테이블에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_GOGEK';
    
    
    
    
    
    --- *** comosite(복합) Unique key 예제 *** ----
    
    drop table tbl_jumun purge;
    --Table TBL_JUMUN이(가) 삭제되었습니다.

    
    -- composite(복합) Unique key 
    create table tbl_jumun
    (gogekId       varchar2(20)   not null      --고객ID
    ,productCode   varchar2(20)   not null      --제품코드 
    ,jumunday      date default sysdate   not null      -- 주문일자
    ,jumunsu       number(10)                   -- 주문량
    ,constraint UQ_tbl_jumun unique(gogekId, productCode, jumunday)
    );
    -- Table TBL_JUMUN이(가) 생성되었습니다.
    
    
    
    insert into tbl_jumun(gogekId, productCode, jumunday, jumunsu)
    values ('leess', 'SWK', default, 10);
    -- 1 행 이(가) 삽입되었습니다.
    
    
    insert into tbl_jumun(gogekId, productCode, jumunday, jumunsu)
    values ('leess', 'KJK', default, 20);
    -- single primary key 일때는 오류가 생김 -->오류 보고 - ORA-00001: 무결성 제약 조건(HR.PK_JUMUN_GOGEKID)에 위배됩니다
    -- but composite(복합) Primary key 일때는  1 행 이(가) 삽입되었습니다.
    
    
    insert into tbl_jumun(gogekId, productCode, jumunday, jumunsu)
    values ('leess', 'SWK', default, 30);
    -- 오류 보고 - ORA-00001: 무결성 제약 조건(HR.PK_TBL_JUMUN_GOGEKID)에 위배됩니다 
    -- 'leess'과 'SWK' 이 같기 때문에 키 값은 고유하므로 오류가 발생한다.(jumunday)를 추가 하기 전에는 
    -- 'leessl과 'SWK'이 같더라도 jumunday 시간이 다르므로 1행이 (가) 삽입되었습니다.
    
    commit;
    -- 커밋 완료
    
    -- 결과값 보기
    select *
    from tbl_jumun;
    /*
        leess	SWK	23/02/14	10
        leess	KJK	23/02/14	20
        leess	SWK	23/02/14	30
    */


    -- TBL_JUMUN 테이블에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JUMUN';
    
    
    
    
    ----- >>> check 제약(C) 에 대해서 알아봅니다 <<< ---------
    
    create table tbl_sawon
    (sano         number(5)
    ,saname       Nvarchar2(10)    not null
    ,salary       number(5)        not null   -- 급여는 커미션 보다 커야한다.
    ,commission   number(5)                   -- 커미션은 0 이상이여야 한다.(0 포함)
    ,jik          Nvarchar2(10) default '사원' -- 직급의 종류는 '사장', '부장', '과장', '대리', '사원' 만 가능합니다.
    ,email        varchar2(50)     not null
    ,constraint PK_tbl_sawon_sano primary key(sano)
    ,constraint UQ_tbl_sawon_email Unique(email)
    ,constraint CK_tbl_sawon_salary_commission check (salary > commission and commission >= 0)  -- 이 조건에 맞을때만 insert나 update가 된다.
    ,constraint CK_tbl_sawon_jik check (jik in('사장', '부장', '과장', '대리', '사원')) -- 이 조건 아니면 오류 발생 
    );
    
    --Table TBL_SAWON이(가) 생성되었습니다.
    
    insert into tbl_sawon(sano, saname, salary, commission, jik, email)
    values(1001, '홍길동', 500, 1000, '과장', 'hongkd@fmail.com');
    -- 오류 보고 - ORA-02290: 체크 제약조건(HR.CK_TBL_SAWON_SALARY_COMMISSION)이 위배되었습니다
    -- 체크 조건에 맞지 않아 오류 발생 (salary보다 commission이 커서)
    
    insert into tbl_sawon(sano, saname, salary, commission, jik, email)
    values(1001, '홍길동', 500, -100, '과장', 'hongkd@fmail.com');
    -- 오류 보고 - ORA-02290: 체크 제약조건(HR.CK_TBL_SAWON_SALARY_COMMISSION)이 위배되었습니다
    -- 체크 조건에 맞지 않아 오류 발생 (commission이 음수라서)

    insert into tbl_sawon(sano, saname, salary, commission, jik, email)
    values(1001, '홍길동', 500, 100, '정무', 'hongkd@fmail.com');
    -- 오류 보고 - ORA-02290: 체크 제약조건(HR.CK_TBL_SAWON_SALARY_COMMISSION)이 위배되었습니다
    -- 체크 조건에 맞지 않아 오류 발생  (직급이 오류 발생 )
    
    insert into tbl_sawon(sano, saname, salary, commission, jik, email)
    values(1001, '홍길동', 500, 100, '과장', 'hongkd@fmail.com');
    -- 1 행 이(가) 삽입되었습니다.

    commit;
    -- 커밋 완료
    
    -- 확인해보기 
    select *
    from tbl_sawon;
    -- 1001	홍길동	500	100	과장	hongkd@fmail.com
    

    update tbl_sawon set commission = 500
    where sano = 1001;
    -- 오류 보고 - ORA-02290: 체크 제약조건(HR.CK_TBL_SAWON_SALARY_COMMISSION)이 위배되었습니다 (salary가 commission보다 커야함)

    update tbl_sawon set commission = 499
    where sano = 1001;
    -- 1 행 이(가) 업데이트되었습니다.

    commit;
    -- 커밋 완료
    
    -- 확인해보기 
    select *
    from tbl_sawon;
    -- 1001	홍길동	500	499	과장	hongkd@fmail.com
    
    
    -- tbl_sawon 테이블에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_SAWON';
    
    
    
    
    
    ----- >>> Foreign key(외래키, 참조키) 제약(R) 에 대해서 알아봅니다 <<< ---------
    
    --- *** 고객들의 예약을 받아주는 "예약" 테이블을 생성하겠습니다 *** ----
    
    select *
    from tbl_gogek;
    
    -- 동명이인을 만들어 보자 
    insert into tbl_gogek(gogekId, gogekName, gogekPhone, gogekEmail )
    values('sunsin','이순신','010-3232-7676','sunsin@gmail.com');
    -- 1 행 이(가) 삽입되었습니다. 
    
    commit;
    -- 커밋 완료
    
    -- 결과 확인 
    select *
    from tbl_gogek;
    /*
        leess	이순신	010-2345-6789	leess@gmail.com
        youks	유관순		youks@gmail.com
        eomjh	엄정화		eomjh@gmail.com
        seokj	서강준	010-7777-8888	seokj@gmail.com
        sunsin	이순신	010-3232-7676	sunsin@gmail.com    
    */
    
    -- 타입이 뭔지 보자 
    desc tbl_gogek;
    /*
        이름         널?       유형            
        ---------- -------- ------------- 
        GOGEKID    NOT NULL VARCHAR2(30)  
        GOGEKNAME  NOT NULL NVARCHAR2(20) 
        GOGEKPHONE          VARCHAR2(20)  
        GOGEKEMAIL NOT NULL VARCHAR2(30)  

    */
    
    -- TBL_gogek 테이블에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_GOGEK';
    /*
        SYS_C008447	C	"GOGEKNAME" IS NOT NULL	GOGEKNAME	
        SYS_C008448	C	"GOGEKEMAIL" IS NOT NULL	GOGEKEMAIL	
        PK_TBL_GOGEK_GOGEKID	P		GOGEKID	1
        UQ_TBL_GOGEK_GOGEKPHONE	U		GOGEKPHONE	1
        UQ_TBL_GOGEK_GOGEKEMAIL	U		GOGEKEMAIL	1
    */
    
    
    
    -- 시퀀스 생성하기 
    create sequence seq_reservation
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    -- Sequence SEQ_RESERVATION이(가) 생성되었습니다.

    
    --------------------------------- 실패 ------------------------------
    -- 테이블 생성하기 (오류)
    create table tbl_reservation
    (reservation_no        number      --> 예약번호, 예약번호의 값은 Not Null 이면서 고유한 값만 가져야 한다.
                                       -- 그러므로 reserVation_no 컬럼에는 Primary key 제약을 주어야 한다.
                                        /*
                                            예약번호는 사용자가 수동적으로 입력치 않고 자동적으로 들어와야 한다.
                                            그리고 예약번호는 매번 그 숫자가 증가되면서 고유해야 한다.
                                            이렇게 되려면 sequence를 사용하면 된다.
                                        */
    ,fk_gogekname         Nvarchar2(20)    not null    -- 고객명                                     
                                        
    ,constraint PK_tbl_reservation_reservation_no primary key(reservation_no)
    ,constraint FK_tbl_reservation_fk_gogekname foreign key(fk_gogekname) references tbl_gogek(gogekname) -- reference는 참조 
    );
    
    /*
    오류 보고 
    ORA-02270 : 이 열목록에 대해 일치하는 고유 또는 기본키가 없습니다
    
    왜 위와 같이 오류가 나오냐 함은 foreign key 제약 생성시
    references tbl_gogek(gogekname)을 했으므로 오류이다.
    왜냐하면 tbl_gogek 테이블의 gogekname 컬럼은 unique key 제약이나 또는 Primary key 제약으로 되어있지 않기 때문이다. 
    */    
    
    
    -----------------------------------------------------------------------------------
    
    -- 테이블 생성하기 (실패2)
    create table tbl_reservation
    (reservation_no        number      --> 예약번호, 예약번호의 값은 Not Null 이면서 고유한 값만 가져야 한다.
                                       -- 그러므로 reserVation_no 컬럼에는 Primary key 제약을 주어야 한다.
                                        /*
                                            예약번호는 사용자가 수동적으로 입력치 않고 자동적으로 들어와야 한다.
                                            그리고 예약번호는 매번 그 숫자가 증가되면서 고유해야 한다.
                                            이렇게 되려면 sequence를 사용하면 된다.
                                        */
    ,fk_gogekphone         varchar2(20)    not null    -- 고객핸드폰                                      
                                        
    ,constraint PK_tbl_reservation_reservation_no primary key(reservation_no)
    ,constraint FK_tbl_reservation_fk_gogekphone foreign key(fk_gogekphone) references tbl_gogek(gogekphone) -- reference는 참조 
    );
    -- Table TBL_RESERVATION이(가) 생성되었습니다.

    
    -- 테이블에 대입하기 
    insert into tbl_reservation(reservation_no, fk_gogekphone) values(1, '010-9999-1234');
    -- 오류 보고 - ORA-02291: 무결성 제약조건(HR.FK_TBL_RESERVATION_FK_GOGEKPHONE)이 위배되었습니다- 부모 키가 없습니다
    -- 전화번호가 위반되었다 
    
    
     -- 테이블에 대입하기 
    insert into tbl_reservation(reservation_no, fk_gogekphone) values(1, '010-7777-8888');
    -- 1 행 이(가) 삽입되었습니다.
    
     -- 테이블에 대입하기 
    insert into tbl_reservation(reservation_no, fk_gogekphone) values(2, '010-2345-6789');
    -- 1 행 이(가) 삽입되었습니다.
    
     -- 테이블에 대입하기 
    insert into tbl_reservation(reservation_no, fk_gogekphone) values(2, null);
    -- 오류 보고 ORA-01400: NULL을 ("HR"."TBL_RESERVATION"."FK_GOGEKPHONE") 안에 삽입할 수 없습니다
    --> null 값을 가진 사람들을 나타낼 수 없다.
    
    commmit;
    -- 커밋 완료
    
    -- 확인해보기
    select *
    from tbl_reservation;
    /*
        1	leess	23/02/14
        2	eomjh	23/02/14
        3	sunsin	23/02/14
        5	seokj	23/02/14
        6	leess	23/02/14
    */
    

    --------------------------------성공-------------------------------------------
    
    drop table tbl_reservation;
    -- Table TBL_RESERVATION이(가) 삭제되었습니다.


    desc tbl_gogek;

    
    -- 테이블 생성하기 (성공)
    
    --- *** ==== foreign key 가 존재하는 컬럼을 가지는 테이블을 "자식"(child) 테이블이라고 부른다. ==== *** ----!!!!
    --- *** ==== foreign key 생성시 references tbl_gogek(gogekId) 되어지는 tbl_gogek 테이블을 "부모"(parent) 테이블이라고 부른다. === **** -- ~~    
    --       지금은 tbl_reservation 테이블이  tbl_gogek 테이블의 자식 테이블이 된다.
    --       지금은 tbl_gogek 테이블이  tbl_reservation 테이블의 부모 테이블이 된다.
    create table tbl_reservation
    (reservation_no        number      --> 예약번호, 예약번호의 값은 Not Null 이면서 고유한 값만 가져야 한다.
                                       -- 그러므로 reserVation_no 컬럼에는 Primary key 제약을 주어야 한다.
                                        /*
                                            예약번호는 사용자가 수동적으로 입력치 않고 자동적으로 들어와야 한다.
                                            그리고 예약번호는 매번 그 숫자가 증가되면서 고유해야 한다.
                                            이렇게 되려면 sequence를 사용하면 된다.
                                        */
    ,fk_gogekId         varchar2(20)    not null    -- 고객아이디     
    ,registerday        date default sysdate
    ,constraint PK_tbl_reservation_reservation_no primary key(reservation_no)
    ,constraint FK_tbl_reservation_fk_gogekId  foreign key(fk_gogekId ) references tbl_gogek(gogekId) -- reference는 참조 
    );
    -- Table TBL_RESERVATION이(가) 생성되었습니다.
    
    
     -- 테이블에 대입하기 
    insert into tbl_reservation(reservation_no, fk_gogekId) values(seq_reservation.nextval, 'leess');
    -- 1 행 이(가) 삽입되었습니다.
    
    -- 테이블에 대입하기 
    insert into tbl_reservation(reservation_no, fk_gogekId) values(seq_reservation.nextval, 'eomjh');
    -- 1 행 이(가) 삽입되었습니다.
    
    -- 테이블에 대입하기 
    insert into tbl_reservation(reservation_no, fk_gogekId) values(seq_reservation.nextval, 'sunsin');
    -- 1 행 이(가) 삽입되었습니다.
    
    -- 테이블에 대입하기 
    insert into tbl_reservation(reservation_no, fk_gogekId) values(seq_reservation.nextval, 'batman');
    -- 오류 보고 ORA-02291: 무결성 제약조건(HR.FK_TBL_RESERVATION_FK_GOGEKID)이 위배되었습니다- 부모 키가 없습니다 
    --batman 은 원래 없던 것
    
    commit;
    -- 커밋 완료
    
    -- 결과 확인 
    select *
    from tbl_reservation;
    /*
        1	leess	23/02/14
        2	eomjh	23/02/14
        3	sunsin	23/02/14
        5	seokj	23/02/14
        6	leess	23/02/14
    */
    
    -- 테이블에 대입하기 
    insert into tbl_reservation(reservation_no, fk_gogekId) values(seq_reservation.nextval, 'seokj');
    -- 1 행 이(가) 삽입되었습니다.
    
     -- 테이블에 대입하기 
    insert into tbl_reservation(reservation_no, fk_gogekId) values(seq_reservation.nextval, 'leess');
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    -- 커밋 완료 

    -- 결과 확인 
    select *
    from tbl_reservation;
    /*
        1	leess	23/02/14
        2	eomjh	23/02/14
        3	sunsin	23/02/14
        5	seokj	23/02/14
        6	leess	23/02/14
    */
    
    select * 
    from tbl_gogek;
    /*
        leess	이순신	010-2345-6789	leess@gmail.com
        youks	유관순		youks@gmail.com
        eomjh	엄정화		eomjh@gmail.com
        seokj	서강준	010-7777-8888	seokj@gmail.com
        sunsin	이순신	010-3232-7676	sunsin@gmail.com
    */
    
    
    
    --> 위에 두개는 고객 테이블이 같은 컬럼이 있다/ JOIN 해주자 
    
    select R.reservation_no, R.fk_gogekid, G.gogekname, G.gogekphone, G.gogekemail
         , to_char(R.registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday
    from tbl_reservation R JOIN tbl_gogek G
    ON R.fk_gogekid = G.gogekid
    order by 1 desc;
    /*
        6	leess	이순신	010-2345-6789	leess@gmail.com	2023-02-14 16:33:22
        5	seokj	서강준	010-7777-8888	seokj@gmail.com	2023-02-14 16:24:05
        3	sunsin	이순신	010-3232-7676	sunsin@gmail.com	2023-02-14 16:20:27
        2	eomjh	엄정화		eomjh@gmail.com	2023-02-14 16:19:39
        1	leess	이순신	010-2345-6789	leess@gmail.com	2023-02-14 16:18:52
    */



    -- 2개의 테이블이 foreign key 제약조건에 의해 "부모" 테이블과 "자식" 테이블의 관계로 설정되었을시
    -- "부모" 테이블에 있는 행을 삭제할 때 어떻게 되어지는지 알아봅시다.
    
    select *
    from tbl_reservation;  -- "자식" 테이블
    -- youks 은 예약을 한 적이 없다.
    -- seokg 은 예약을 했다.
    
    select *
    from tbl_gogek;  -- "부모" 테이블
    
    
    -- 자식 테이블에 youks 이 없기 때문에 삭제가 진행된다.
    -- 부모 테이블중 하나 삭제
    delete from tbl_gogek
    where gogekid = 'youks';
    -- 1 행 이(가) 삭제되었습니다.


    -- 부모 테이블중 하나를 삭제할때 foreign key 로 되어진 자식 테이블에 seokj 이 있으면 삭제가 안된다.
    -- 부모 테이블중 하나 삭제 (오류 실패)
   delete from tbl_gogek
   where gogekid = 'seokj';
    -- 오류 보고 - ORA-02292: 무결성 제약조건(HR.FK_TBL_RESERVATION_FK_GOGEKID)이 위배되었습니다- 자식 레코드가 발견되었습니다

    rollback;
    -- 롤백 완료
    
    
    
    ---------------------- 서강준을 삭제하고 싶다면 
    -- 자식 테이블에서 서강준을 삭제해야만 한다.
    
    --> "부모" 테이블인 tbl_gogek 테이블에서 gogekid 가 'seokj' 인 행을 삭제하려고 한다.
    -- 먼저 "자식" 테이블인 tbl_reservation 테이블에서 fk_gogekid 컬럼의 값이 'seokj' 로 되어진 행을 먼저 삭제한다.
    -- 그런 다음에 "부모" 테이블인 tbl_gogek 테이블에서 gogekid 가 'seokj' 인 행을 삭제하면 된다.
    
    delete tbl_reservation  -- "자식" 테이블
    where fk_gogekid = 'seokj';
    -- 1 행 이(가) 삭제되었습니다.

    
    delete tbl_gogek
    where gogekid = 'seokj';
    -- 1 행 이(가) 삭제되었습니다.

    -- 결과 보기 
    select *
    from tbl_reservation;
    /*
        1	leess	23/02/14
        2	eomjh	23/02/14
        3	sunsin	23/02/14
        5	seokj	23/02/14
        6	leess	23/02/14
    */
    
    select *
    from tbl_gogek;
    /*
        leess	이순신	010-2345-6789	leess@gmail.com
        youks	유관순		youks@gmail.com
        eomjh	엄정화		eomjh@gmail.com
        seokj	서강준	010-7777-8888	seokj@gmail.com
        sunsin	이순신	010-3232-7676	sunsin@gmail.com
    */
    
    
    -- 복구하기 
    rollback;
    --롤백 완료 
    
    
    
    ------ **** !!!! ==== Foreign key 생성시 on delete cascade 옵션을 주는 것 ==== !!!! **** -----
                        -- >>> (한방에 삭제가 가능) <<< --
    
  
    
    create table tbl_board_01   --> "원글" 테이블
    (writeno      number         --원글의 글번호
    ,subject      varchar2(100)  not null
    ,constraint PK_tbl_board_01_writeno primary key(writeno)
    );
    -- Table TBL_BOAED_01이(가) 생성되었습니다.


    insert into tbl_board_01(writeno, subject) values(1001, '천일번째 원글입니다.');
    insert into tbl_board_01(writeno, subject) values(1002, '천이번째 원글입니다.');
    insert into tbl_board_01(writeno, subject) values(1003, '천삼번째 원글입니다.');
    
    commit;
    -- 커밋 완료
    
    -- 확인하기 
    select *
    from tbl_board_01;
    /*
        1001	천일번째 원글입니다.
        1002	천이번째 원글입니다.
        1003	천삼번째 원글입니다.
    */
    
    create table tbl_board_01_add   ---> "원글" 테이블에 대한 "댓글" 테이블
    (addno       number             -- 댓글의 글번호
    ,subject     Nvarchar2(100)     -- 댓글의 글제목
    ,fk_writeno  number             -- 원글의 글번호 
    ,constraint PK_tbl_board_01_add_addno primary key(addno)
    ,constraint FK_tbl_board_01_add_fk_writeno foreign key(fk_writeno) references tbl_board_01(writeno) on delete cascade
    );
    -- Table TBL_BOARD_01_ADD이(가) 생성되었습니다.
    /*
        on delete cascade 의 의미는 
        부모 테이블인 tbl_board_01 테이블에서 행을 delete 할 시 
        자식 테이블인 tbl_board_01_add 테이블의 fk_writeno에 삭제하려는 부모 테이블의 writeno 컬럼의 값을 
        가지는 행이 있더라면 자동적으로 먼저 자식 테이블인 tbl_board_01_add 테이블에서 먼저 행을 삭제 하고서 
        그 다음에 부모 테이블인 tbl_board_01 테이블에서 행을 삭제하는 것이다
    */
    
    insert into tbl_board_01_add(addno, subject, fk_writeno) 
    values ( 1, '천일번째 원글에 대한 첫번째 댓글 입니다.' ,1001);
    
    insert into tbl_board_01_add(addno, subject, fk_writeno) 
    values ( 2, '천이번째 원글에 대한 첫번째 댓글 입니다.' ,1002);
    
    insert into tbl_board_01_add(addno, subject, fk_writeno) 
    values ( 3, '천일번째 원글에 대한 두번째 댓글 입니다.' ,1001);
    
    commit;
   
   
    --- ***** 원글 삭제하기 **** ---
    
    -- 확인하기 
    select *
    from tbl_board_01_add;
    
    -- 삭제하기 
    delete from tbl_board_01   --- "부모" 테이블
    where writeno = 1001;
    -- 1 행 이(가) 삭제되었습니다.
    
    select *
    from tbl_board_01;         --"부모" 테이블 
    -- writeno 컬럼의 값이 1001인 행은 삭제가 되었다.
    /*
        1002	천이번째 원글입니다.
        1003	천삼번째 원글입니다.
    */
    select *             
    from tbl_board_01_add;    --"자식" 테이블 
    -- fk_writeno 컬럼의 값이 1001인 행은 모두 삭제가 되었다.
    -- 2	천이번째 원글에 대한 첫번째 댓글 입니다.	1002
    
    rollback;


-------------------------------------------------------------------------
----------------------------- 2월 15일 시작 -------------------------------
------------------------------------------------------------------------

    select * 
    from employees;    --"자식" 테이블
    -- 107행
    -- department_id ==> foreign key 로 되어있다.
    
    
    select *
    from departments;  --"부모" 테이블
    -- 27개행 
    -- department_id ==> primary key 로 되어있다.
    
    
    -- 변경을 해보자 100번 사람을 50번으로 변경 
    update employees set department_id = 50
    where employee_id = 100;
    -- 1 행 이(가) 업데이트되었습니다.
    
    
    update employees set department_id = 88
    where employee_id = 100;
    -- 오류 보고 - ORA-00001: 무결성 제약 조건(HR.JHIST_EMP_ID_ST_DATE_PK)에 위배됩니다
    -- 없는 부서번호로 하려면 오류가 발생한다.
    -- departments 테이블에는 department_id 컬럼의 값이 88 인 행이 없기 때문이다.
    
    rollback;
    -- 롤백 완료
    
    
    
    
    
    -- 무조건 on delete cascade 을 사용하면 안된다 그 이유는 다음 예시에서 보자 
    -- department 테이블에서 50번 부서는 폐지하고서, 부서번호 50번인 사원들을 80번 부서로 인사이동을 하려고 한다.
   
   
    --> 문제 풀이의 정석은 
    --> 먼저 50번에 있는 사람들을 null로 부서이동을 시킨 다음에 50번 부서를 폐지 시킨후 각각의 부서로 인사이동을 시키는 것이 정답이다. 
   
    
    delete from departments
    where department_id = 50;
    -- 오류 보고 - ORA-02292: 무결성 제약조건(HR.EMP_DEPT_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다
    -- employees 자식 테이블에 50번 부서에서 근무하는 사원들이 있기 때문에 지우기 오류 
    
    
    -- 즉 update 부터 해야 한다. (원래는 null 값을 가져서 먼저 null 값을 만들고 부서이동을 진행한다.) 
    update employees set department_id = null
    where department_id = 50;
    -- 45개 행 이(가) 업데이트되었습니다.

    
    -- 확인해보기 
    select *
    from employees
    where department_id = 50;
    
    -- 삭제하기!!!
    delete from departments
    where department_id = 50;
    
    
    rollback;
    -- 롤백 완료
    -- 만약 on delete cascade을 다 사용해 줬다면 어떤 테이블을 삭제할때 그 정보값이 다른 테이블의 같은 컬럼의 정보 값도 다 삭제된다
    
    
    
    
    ------ **** !!!! ==== Foreign key 생성시 on delete set null 옵션을 주는 것 ==== !!!! **** -----
    
    
    create table tbl_board_02   --> "원글" 테이블
    (writeno      number         --원글의 글번호
    ,subject      varchar2(100)  not null
    ,constraint PK_tbl_board_02_writeno primary key(writeno)
    );
    -- Table TBL_BOAED_01이(가) 생성되었습니다.


    insert into tbl_board_02(writeno, subject) values(1101, '천백일번째 원글입니다.');
    insert into tbl_board_02(writeno, subject) values(1102, '천백이번째 원글입니다.');
    insert into tbl_board_02(writeno, subject) values(1103, '천백삼번째 원글입니다.');
    
    commit;
    -- 커밋 완료
    
    
    -- 확인하기 
    select *
    from tbl_board_02;
    /*
        1001	천일번째 원글입니다.
        1002	천이번째 원글입니다.
        1003	천삼번째 원글입니다.
    */
    
    create table tbl_board_02_add   ---> "원글" 테이블에 대한 "댓글" 테이블
    (addno       number             -- 댓글의 글번호
    ,subject     Nvarchar2(100)     -- 댓글의 글제목
    ,fk_writeno  number             -- 원글의 글번호 
    ,constraint PK_tbl_board_02_add_addno primary key(addno)
    ,constraint FK_tbl_board_02_add_fk_writeno foreign key(fk_writeno) references tbl_board_02(writeno) on delete set NULL
    );
    -- Table TBL_BOARD_02_ADD이(가) 생성되었습니다.
    /*
        on delete cascade 의 의미는 
        부모 테이블인 tbl_board_02 테이블에서 행을 delete 할 시 
        자식 테이블인 tbl_board_02_add 테이블의 fk_writeno에 삭제하려는 부모 테이블의 writeno 컬럼의 값을 
        가지는 행이 있더라면 자동적으로 먼저 자식 테이블인 tbl_board_02_add 테이블에서 먼저 그 행의 fk_writeno 컬럼의 값을 null로 수정해 준다.
        그 다음에 부모 테이블인 tbl_board_02 테이블에서 행을 삭제하는 것이다
        
        !!!!!이렇게 하기 위해서는 fk_writeno 컬럼은 반드시 NULL 을 허용해야만 한다.!!!!!
    */
    
    insert into tbl_board_02_add(addno, subject, fk_writeno) 
    values ( 1, '천백일번째 원글에 대한 첫번째 댓글 입니다.' ,1101);
    
    insert into tbl_board_02_add(addno, subject, fk_writeno) 
    values ( 2, '천백이번째 원글에 대한 첫번째 댓글 입니다.' ,1102);
    
    insert into tbl_board_02_add(addno, subject, fk_writeno) 
    values ( 3, '천백일번째 원글에 대한 두번째 댓글 입니다.' ,1101);
    
    commit;
   -- 커밋 완료
   
   
   select * 
   from tbl_board_02_add;
   
   
  --- ***** 원글 삭제하기 **** ---
    
    -- 확인하기 
    select *
    from tbl_board_02;
    
    -- 삭제하기 
    delete from tbl_board_02   --- "부모" 테이블
    where writeno = 1101;
    -- 1 행 이(가) 삭제되었습니다.
    
    select *
    from tbl_board_02;         --"부모" 테이블 
    -- writeno 컬럼의 값이 1101인 행은 삭제가 되었다.
    /*
        1102	천백이번째 원글입니다.
        1103	천백삼번째 원글입니다.
    */
    

    select *             
    from tbl_board_02_add;    --"자식" 테이블 
    -- fk_writeno 컬럼의 값이 1101인 행은 fk_writeno 컬럼의 값이 모두 null로 변경되었다.
    /*
        1	천백일번째 원글에 대한 첫번째 댓글 입니다.	 
        2	천백이번째 원글에 대한 첫번째 댓글 입니다.	1102
        3	천백일번째 원글에 대한 두번째 댓글 입니다.	
    */
    
    rollback;
    
    select *
    from tbl_board_02;      -- "부모" 테이블
    
    select *
    from tbl_board_02_add;  -- "자식" 테이블
    

    
    ------- ***** 부모 테이블의 테이블 삭제하려는 경우  ***** --------------------


    -- TBL_BOARD_01 테이블에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_BOARD_01';

    drop table tbl_board_01 purge;
    -- 오류 보고 - ORA-02449: 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
    -- 02449. 00000 -  "unique/primary keys in table referenced by foreign keys"

    -- 즉 삭제하기 위해서는 자식테이블을 알아와야 한다.
    --> *** tbl_board_01 테이블을 참조하고 있는 자식테이블이 누구인지 알아오도록 한다. *** ---
    
    
    -- Primary , Unique 등을 확인해보자
    select * 
    from user_constraints
    where table_name = 'TBL_BOARD_01_ADD';
    -- 결과 : HR	PK_TBL_BOARD_01_ADD_ADDNO	P	TBL_BOARD_01_ADD						ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			23/02/14	HR	PK_TBL_BOARD_01_ADD_ADDNO			1
    -- 결과 : HR	FK_TBL_BOARD_01_ADD_FK_WRITENO	R	TBL_BOARD_01_ADD			HR	PK_TBL_BOARD_01_WRITENO	CASCADE	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			23/02/14					1
    
    
    --P 와 U 를 확인해 보자 
    select constraint_name
    from user_constraints 
    where TABLE_NAME = 'TBL_BOARD_01' and constraint_type in('P','U');
    -- 결과 : PK_TBL_BOARD_01_WRITENO
    
    
    -- R을 확인해 보자 
    select *
    from user_constraints
    where r_constraint_name in ( select constraint_name
                                 from user_constraints
                                 where table_name = 'TBL_BOARD_01' and constraint_type in ('P','U') );
    -- 결과 : HR	FK_TBL_BOARD_01_ADD_FK_WRITENO	R	TBL_BOARD_01_ADD			HR	PK_TBL_BOARD_01_WRITENO	CASCADE	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			23/02/14					1


    
    -- 자식 테이블을 확인하는 방법이다.!!!!!!!!!!!!!!!! 알아두기 
    select table_name
    from user_constraints
    where r_constraint_name in ( select constraint_name
                                 from user_constraints
                                 where table_name = 'TBL_BOARD_01' and constraint_type in ('P','U') );
    -- 결과 : TBL_BOARD_01_ADD
    -- !!! r_constraint_name 은 자식테이블에서 참조하고 있는 부모테이블의 Primary ket 제약조건 이름 또는 Unique 제액조건의 이름을 말한다.!!!!
    
    
    
    -- TBL_BOARD_01_add 테이블(자식 테이블)에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_BOARD_01_ADD';
    -- 결과 : FK_TBL_BOARD_01_ADD_FK_WRITENO	R		FK_WRITENO	1
    -- 결과 : PK_TBL_BOARD_01_ADD_ADDNO	P		ADDNO	1
    
    
    
    
    
    -- 부모 테이블인 TBL_BOAED_01 테이블과 자식 테이블인 TBL_BOARD_01_ADD 테이블 사이의
    -- foreign key 를 삭제해 보겠다.
    -- foreign key 는 자식 테이블인 TBL_BOARD_01_ADD 테이블에 존재한다.
    alter table tbl_board_01_add
    drop constraint FK_TBL_BOARD_01_ADD_FK_WRITENO;
    -- 결과 : Table TBL_BOARD_01_ADD이(가) 변경되었습니다.  
    -- !!!!!!!!!!!!!!(foreign key를 삭제해주는 것이다.)!!!!!!!!!!!!!!!!!!!!!


    -- TBL_BOARD_01_add 테이블(자식 테이블)에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_BOARD_01_ADD';
    --> R 부분이 삭제된 것을 확인 할 수 있다.(constraint_type)에서 안보인다.
    -- 결과 : PK_TBL_BOARD_01_ADD_ADDNO	P		ADDNO	1
    
    
    drop table tbl_board_01 purge;
    -- Table TBL_BOARD_01이(가) 삭제되었습니다.

    -- 확인해보기
    select *
    from tbl_board_01;
    -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다 (삭제됨)
    
    -- 확인해보기 자식 테이블
    select *
    from tbl_board_01_add;
    /*
        1	천일번째 원글에 대한 첫번째 댓글 입니다.	1001
        2	천이번째 원글에 대한 첫번째 댓글 입니다.	1002
        3	천일번째 원글에 대한 두번째 댓글 입니다.	1001
    */
    
    -------------------------------------------------------------------------------------
    -- ******** 한방에 삭제하기 *************--
    
    drop table tbl_board_02 purge;
    -- 오류 보고 - ORA-02449: 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
    -- 02449. 00000 -  "unique/primary keys in table referenced by foreign keys"
    
    
     -- 자식 테이블을 확인하는 방법이다.!!!!!!!!!!!!!!!! 알아두기 
    select table_name
    from user_constraints
    where r_constraint_name in ( select constraint_name
                                 from user_constraints
                                 where table_name = 'TBL_BOARD_02' and constraint_type in ('P','U') );
    -- 결과 : TBL_BOARD_02_ADD  (자식 테이블이 이 친구이다.)
    
    
    -- TBL_BOARD_02_add 테이블(자식 테이블)에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_BOARD_02_ADD';
    -- 결과 : FK_TBL_BOARD_02_ADD_FK_WRITENO	R		FK_WRITENO	1
    -- 결과 : PK_TBL_BOARD_02_ADD_ADDNO	P		ADDNO	1 
    -- 여기도 constraint_type 에 R 이 존재한다.
    -- Foreign key 제약조건이 존재했었다
    
    
    
    --********--
    -- 자식 테이블이 있어도 삭제하는 방법이다.
    drop table tbl_board_02 cascade constraints purge;
    -- 결과 : Table TBL_BOARD_02이(가) 삭제되었습니다.
    -- cascade constraints 을 넣어주면 tbl_board_02 테이불에 딸린 모든 자식테이블에서 먼저 Foreign key 제약조건을 삭제한 후에 
    -- tbl_board_02 테이블을 삭제해주는 것이다
    
    
    
    -- 다시 한번 확인해보자 
    -- TBL_BOARD_02_add 테이블(자식 테이블)에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_BOARD_02_ADD';
    -- 결과 : PK_TBL_BOARD_02_ADD_ADDNO	P		ADDNO	1
    -- 'R'인  Foreign key 제약조건이 사라졌다.!!!!
    
    
    --- 확인해보기
    select *
    from TBL_BOARD_02;
    
    
    --- 확인해보기 자식 테이블 
    select *
    from TBL_BOARD_02_ADD;
    /*
        1	천백일번째 원글에 대한 첫번째 댓글 입니다.   null	
        2   천백이번째 원글에 대한 첫번째 댓글 입니다.   null
        3	천백일번째 원글에 대한 두번째 댓글 입니다.	  null
    */
    
    
    
                ----- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ------
    -- 만약에 A라는 부모테이블이 있고 A라는 테이블을 참조하는 B라는 자식테이블이 있을 경우 
    -- 테이블 A와 테이블 B 를 모두 삭제할 경우 이라면 
    -- 먼저 자식 테이블인 테이블 B 부터 삭제하고 그 다음에 부모테이블인 A를 삭제해야 한다.
    
    
    
    
    ------- *****===== NOT NULL 제약에 대해 알아봅시다 ===== ***** ----------
    -- 어떤 컬럼에 값을 입력하거나 수정할때 NULL을 허락하지 않는다는 말이다 
    
    
    create table tbl_jikwon
    (sano         number(5)
    ,saname       Nvarchar2(10)  constraint NN_tbl_jikwon_saname  not null
    ,salary       number(5)        not null   -- 급여는 커미션 보다 커야한다.
    ,commission   number(5)                   -- 커미션은 0 이상이여야 한다.(0 포함)
    ,jik          Nvarchar2(10) default '사원' -- 직급의 종류는 '사장', '부장', '과장', '대리', '사원' 만 가능합니다.
    ,email        varchar2(50)     not null
    ,constraint PK_tbl_jikwon_sano primary key(sano)
    ,constraint UQ_tbl_jikwon_email Unique(email)
    ,constraint CK_tbl_jikwon_salary_commission check (salary > commission and commission >= 0)  -- 이 조건에 맞을때만 insert나 update가 된다.
    ,constraint CK_tbl_jikwon_jik check (jik in('사장', '부장', '과장', '대리', '사원')) -- 이 조건 아니면 오류 발생 
    );
    
    --Table TBL_JIKWON이(가) 생성되었습니다.
    
    insert into TBL_JIKWON(sano, saname, salary, commission, jik, email)
    values(1001, '홍길동', 500, 100, '과장', 'hongkd@fmail.com');
    -- 1 행 이(가) 삽입되었습니다.

    insert into TBL_JIKWON(sano, saname, salary, commission, jik, email)
    values(1002, null, 500, 100, '대리', 'eomjh@fmail.com');
    -- 오류 보고 - ORA-01400: NULL을 ("HR"."TBL_JIKWON"."SANAME") 안에 삽입할 수 없습니다
    -- 이름이 null이기 때문에 오류 
    
    insert into TBL_JIKWON(sano, salary, commission, jik, email)
    values(1002, 500, 100, '대리', 'eomjh@fmail.com');
    -- 오류 보고 - ORA-01400: NULL을 ("HR"."TBL_JIKWON"."SANAME") 안에 삽입할 수 없습니다
    -- 이름이 null이기 때문에 오류 (값을 넣지 않으면 자동으로 null이 들어간다 ) 그렇기에 default가 필요함 
    
    insert into TBL_JIKWON(sano, saname, salary, commission, jik, email)
    values(2001, '엄정화', 700, 100, '부장', 'eomjh@fmail.com');
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    -- 커밋 완료
    
    
    -- TBL_JIKWON 테이블에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON';
    /*
        NN_TBL_JIKWON_SANAME	C	"SANAME" IS NOT NULL	SANAME	
        SYS_C008554	C	"SALARY" IS NOT NULL	SALARY	
        SYS_C008555	C	"EMAIL" IS NOT NULL	EMAIL	
        CK_TBL_JIKWON_SALARY_COMMISSION	C	salary > commission and commission >= 0	SALARY	
        CK_TBL_JIKWON_SALARY_COMMISSION	C	salary > commission and commission >= 0	COMMISSION	
        CK_TBL_JIKWON_JIK	C	jik in('사장', '부장', '과장', '대리', '사원')	JIK	
        PK_TBL_JIKWON_SANO	P		SANO	1
        UQ_TBL_JIKWON_EMAIL	U		EMAIL	1
    */
    -- 이름을 준 NN_TBL_JIKWON_SANAME 이것은 이름이 나오고 이름을 안준것은 SYS_C~~~ 로 나온다.
    
    
    
    
    
    
    
    ----- !!!! **** sub Query 을 사용하여 어떤 테이블을 생성할 경우 원본테이블에 존재하던 제약조건중 NOT NULL 제약만 복사가 되어지고 
                 -- 나머지 제약 조건은 복사가 안됩니다 또한 복사되는 NOT NULL 제약의 제약 조건명도 SYS_C ~~~ 로 새로이 변경되어진다. ---- !!!! *** 
   
    -- 확인하기 
    select *
    from tbl_jikwon;
              
    -- 복사본 만들기      
    create table tbl_jikwon_copy
    as
    select *
    from tbl_jikwon;
    -- Table TBL_JIKWON_COPY이(가) 생성되었습니다.

    -- 확인하기 
    select *
    from tbl_jikwon_COPY;

    -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    /*
        SYS_C008560	C	"SANAME" IS NOT NULL	SANAME	
        SYS_C008561	C	"SALARY" IS NOT NULL	SALARY	
        SYS_C008562	C	"EMAIL" IS NOT NULL	EMAIL	
    */
    -- 제약조건은 C NOT NULL 만 나오고 이름도 SYS_C~~~ 로 변경되었다.
    -- NOT NULL 이름을 지어준것도 SYS_C 로 변경됨
    
    
    -- 추가해보기 (오류)
    insert into TBL_JIKWON(sano, saname, salary, commission, jik, email)
    values(2001, '유관순', 700, 100, '대리', 'youks@fmail.com');
    -- 오류 보고 - ORA-00001: 무결성 제약 조건(HR.PK_TBL_JIKWON_SANO)에 위배됩니다
    
    
    
    
    
    -- !!!! 원래는 COPY본도 제약조건이 있어야 하는데 NOT NULL 제약만 COPY가 되어서 데이터 값이 추가된다.!!!!
    
    
    -- 추가해보기 (COPY 에 추가하기 )
    insert into TBL_JIKWON_COPY(sano, saname, salary, commission, jik, email)
    values(2001, '유관순', 700, 100, '대리', 'youks@fmail.com');
    -- 1 행 이(가) 삽입되었습니다.

    -- 추가해보기 (COPY 에 추가하기 )
    insert into TBL_JIKWON_COPY(sano, saname, salary, commission, jik, email)
    values(2001, null, 700, 100, '대리', 'youks@fmail.com');
    -- 오류 보고 - ORA-01400: NULL을 ("HR"."TBL_JIKWON_COPY"."SANAME") 안에 삽입할 수 없습니다
    -- NOT NULL 을 지정했기 때문에 이름에서 오류 발생 
    
    commit;
    -- 커밋 완료 
    
    
    select *
    from tbl_jikwon_copy;
    /*
        1001	홍길동	500	100	과장	hongkd@fmail.com
        2001	엄정화	700	100	부장	eomjh@fmail.com
        2001	유관순	700	100	대리	youks@fmail.com
    */
    
    
    
    
    ------ ===== **** 어떤 테이블에 제약조건을 추가하기 **** ==== ------
    
    /*
        제약조건 추가시 NOT NULL 제약을 제외한 나머지 4개는 아래와 같이 한다.
        
        alter table 테이블명 add constraint 제약조건명 primary key(컬럼명);
        alter table 테이블명 add constraint 제약조건명 unique(컬럼명);
        alter table 테이블명 add constraint 제약조건명 check( ..... );
        
        alter table 테이블명 add constraint 제약조건명 foreign key(컬럼명) references 부모 테이블명(식별자컬럼);
        alter table 테이블명 add constraint 제약조건명 foreign key(컬럼명) references 부모 테이블명(식별자컬럼) on delete cascade;
        alter table 테이블명 add constraint 제약조건명 foreign key(컬럼명) references 부모 테이블명(식별자컬럼) on delete set null;
    */
    
    
    /* 
         제약조건 추가시 NOT NULL 제약을 추가 할때는 아래와 같이 한다.
         
         alter table 테이블명 modify 컬럼명 [constraint 제약조건명] not null;   --[내용]은 생략가능
    */
    
    
    -- TBL_JIKWON_COPY 테이블의 sano 컬럼에 primary key 제약조건 추가하기 --
    alter table TBL_JIKWON_COPY add constraint PK_TBL_JIKWON_COPY_SANO primary key(SANO);
    -- 오류 보고 -ORA-02437: (HR.PK_TBL_JIKWON_COPY_SANO)을 검증할 수 없습니다 - 잘못된 기본 키입니다
    -- 이미 중복된 데이터가 있기 때문에 오류가 발생한다. sano에 2001 이 두개나 존재함 
    
    -- 확인하기 
    select *
    from tbl_jikwon;
    /*
        1001	홍길동	500	100	과장	hongkd@fmail.com
        2001	엄정화	700	100	부장	eomjh@fmail.com
        2001    유관순   700 100 부장 eomjh@fmail.com
    */
    
    -- 모든것이 중복이라면 중복을 제거하려면 ROWID를 사용한다
    select rowid, sano, saname, salary, commission, jik, email
    from tbl_jikwon_COPY;
    
    
    delete TBL_JIKWON_COPY
    where rowid = 'AAASfAAAHAAAALUAAA';
    -- 1 행 이(가) 삭제되었습니다.


    -- 확인해보기 
    select rowid, sano, saname, salary, commission, jik, email
    from tbl_jikwon_COPY;
    /*
        1001	홍길동	500	100	과장	hongkd@fmail.com
        2001	엄정화	700	100	부장	eomjh@fmail.com
    */
    
    
                        -- 원본과 복사본의 제약조건을 똑같이 만들어 보자 --
       
     -- 원본은 다음과 같다.                    
    /*
        NN_TBL_JIKWON_SANAME	C	"SANAME" IS NOT NULL	SANAME	
        SYS_C008554	C	"SALARY" IS NOT NULL	SALARY	
        SYS_C008555	C	"EMAIL" IS NOT NULL	EMAIL	
        CK_TBL_JIKWON_SALARY_COMMISSION	C	salary > commission and commission >= 0	SALARY	
        CK_TBL_JIKWON_SALARY_COMMISSION	C	salary > commission and commission >= 0	COMMISSION	
        CK_TBL_JIKWON_JIK	C	jik in('사장', '부장', '과장', '대리', '사원')	JIK	
        PK_TBL_JIKWON_SANO	P		SANO	1
        UQ_TBL_JIKWON_EMAIL	U		EMAIL	1
    */
    -- 복사본을 원본과 똑같이 만들어보자 
    
    
    -- TBL_JIKWON_COPY 테이블의 sano 컬럼에 primary key 제약조건 추가하기 --
    alter table TBL_JIKWON_COPY 
    add constraint PK_TBL_JIKWON_COPY_SANO primary key(SANO);
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.
    ---> alter는 DDL문이므로 자동 commit이 되어진다.
    
    
    
    -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    /*
        SYS_C008560	C	"SANAME" IS NOT NULL	SANAME	
        SYS_C008561	C	"SALARY" IS NOT NULL	SALARY	
        SYS_C008562	C	"EMAIL" IS NOT NULL	EMAIL	
        PK_TBL_JIKWON_COPY_SANO	P		SANO	1
    */
    
    
    
    -- TBL_JIKWON_COPY 테이블의 email 컬럼에 Unique key 제약조건 추가하기 --
    alter table TBL_JIKWON_COPY 
    add constraint UQ_TBL_JIKWON_COPY_EMAIL unique (email);
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.

    
    
    -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    /*
        SYS_C008560	C	"SANAME" IS NOT NULL	SANAME	
        SYS_C008561	C	"SALARY" IS NOT NULL	SALARY	
        SYS_C008562	C	"EMAIL" IS NOT NULL	EMAIL	
        PK_TBL_JIKWON_COPY_SANO	P		SANO	1
        UQ_TBL_JIKWON_COPY_EMAIL	U		EMAIL	1
    */
    
    
    
    -- TBL_JIKWON_COPY 테이블의 jik 컬럼에 check 제약조건 추가하기 --
    alter table TBL_JIKWON_COPY 
    add constraint CK_TBL_JIKWON_COPY_JIK check (jik in('사장', '부장', '과장', '대리', '사원'));
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.


    -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    /*
        CK_TBL_JIKWON_COPY_JIK	C	jik in('사장', '부장', '과장', '대리', '사원')	JIK	
        SYS_C008560	C	"SANAME" IS NOT NULL	SANAME	
        SYS_C008561	C	"SALARY" IS NOT NULL	SALARY	
        SYS_C008562	C	"EMAIL" IS NOT NULL	EMAIL	
        PK_TBL_JIKWON_COPY_SANO	P		SANO	1
        UQ_TBL_JIKWON_COPY_EMAIL	U		EMAIL	1
    */
    


    -- TBL_JIKWON_COPY 테이블의 salary와 commission 컬럼에 check 제약조건 추가하기 --
    alter table TBL_JIKWON_COPY 
    add constraint CK_TBL_JIKWON_COPY_SAL_COMM check (salary > commission and commission >= 0);
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.


    -- TBL_JIKWON_COPY 테이블의 jik 컬럼에 NOT NULL 제약조건 추가하기 -- (오류부분)
    alter table TBL_JIKWON_COPY 
    add constraint NN_TBL_JIKWON_COPY_JIK not null;
    -- 오류!!!!!!!!!!!!!!!!!!--
    
    
    -- NOT NULL 추가하기 
    -- alter table 테이블명 modify 컬럼명 [constraint 제약조건명] not null;   --[내용]은 생략가능
    alter table TBL_JIKWON_COPY modify JIK constraint NN_TBL_JIKWON_COPY_JIK not null;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.

    
    
    

    -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다. ---
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    /*
        CK_TBL_JIKWON_COPY_JIK	C	jik in('사장', '부장', '과장', '대리', '사원')	JIK	
        NN_TBL_JIKWON_COPY_JIK	C	"JIK" IS NOT NULL	JIK	  
        SYS_C008560	C	"SANAME" IS NOT NULL	SANAME	
        SYS_C008561	C	"SALARY" IS NOT NULL	SALARY	
        SYS_C008562	C	"EMAIL" IS NOT NULL	EMAIL	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	SALARY	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	COMMISSION	
        PK_TBL_JIKWON_COPY_SANO	P		SANO	1
        UQ_TBL_JIKWON_COPY_EMAIL	U		EMAIL	1
    */
    
    
                 --- >>> 백업본을 원본과 똑같이 만들어 주었다. NOT NULL 추가 <<< ---
     
     
    
    
    
    ----  ****  어떤 테이블에 제약조건을 삭제하기 **** -----           
    
    /*
        (1)   alter table 테이블명 drop constraint 제약조건명;
        
        그런데 NOT NULL 제약은 위(1)의 것처럼 해도 되고, 또는 아래처럼 해도 된다.
        alter table 테이블명 modify 컬럼명 null;
        
        어떤 테이블에 primary key 제약 조건을 삭제할 경우에는 위(1)에 것처럼 해도 되고, 또는 아래처럼 해도 된다.
        alter table 테이블명 drop primary key;  
    */
    
    --'U' 제거
    alter table TBL_JIKWON_COPY drop constraint UQ_TBL_JIKWON_COPY_EMAIL;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.

    
    --'P' 제거
    --alter table TBL_JIKWON_COPY drop constraint PK_TBL_JIKWON_COPY_SANO;
    -- 또는
    alter table TBL_JIKWON_COPY drop primary key;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.


    -- saname 제거
    alter table TBL_JIKWON_COPY drop constraint SYS_C008560;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.

    -- not null 제거
    alter table TBL_JIKWON_COPY modify salary null;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.


    -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다. --- 'U','P',saname, not null 제거
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    /*
        CK_TBL_JIKWON_COPY_JIK	C	jik in('사장', '상무', '부장', '과장', '대리', '사원')	JIK	
        NN_TBL_JIKWON_COPY_JIK	C	"JIK" IS NOT NULL	JIK	
        SYS_C008562	C	"EMAIL" IS NOT NULL	EMAIL	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	SALARY	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	COMMISSION	
    */
    

    ------ **** 어떤 테이블의 제액조건의 내용물을 변경하고 싶다라면 제약조건의 내용물만 변경해주는 명령어는 없기에
            --  기존 제약조건을 삭제한 후, 다시 새로운 내용물로 제약조건을 추가해주는 것이다.


        --> 상무를 추가해보자 <---
    
    alter table TBL_JIKWON_COPY drop constraint CK_TBL_JIKWON_COPY_JIK;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.

    
    -- TBL_JIKWON_COPY 테이블의 jik 컬럼에 check 제약조건 추가하기 --
    alter table TBL_JIKWON_COPY 
    add constraint CK_TBL_JIKWON_COPY_JIK check (jik in('사장', '상무', '부장', '과장', '대리', '사원'));
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.


      -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다. --- 'U','P',saname, not null 제거
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    /*
        CK_TBL_JIKWON_COPY_JIK	C	jik in('사장', '상무', '부장', '과장', '대리', '사원')	JIK	
        NN_TBL_JIKWON_COPY_JIK	C	"JIK" IS NOT NULL	JIK	
        SYS_C008562	C	"EMAIL" IS NOT NULL	EMAIL	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	SALARY	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	COMMISSION	
    */
    
    
    
    
    ----- ***** 어떤 테이블에 생성되어진 제약조건의 이름을 변경하기 ***** -----
    /*
        alter table 테이블명 rename constraint 현재사용중인제약조건명 to 새로운제약조건명;
    */
    
    
    alter table TBL_JIKWON_COPY rename constraint SYS_C008562 to NN_TBL_JIKWON_COPY_EMAIL;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.


    
    -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다. 
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    /*
        CK_TBL_JIKWON_COPY_JIK	C	jik in('사장', '상무', '부장', '과장', '대리', '사원')	JIK	
        NN_TBL_JIKWON_COPY_JIK	C	"JIK" IS NOT NULL	JIK	
        NN_TBL_JIKWON_COPY_EMAIL	C	"EMAIL" IS NOT NULL	EMAIL	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	SALARY	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	COMMISSION	
    */  

    
    
    
    
    --- *** 어떤 테이블에 존재하는 제약조건을 비활성화 시키기 *** ---
    /*
        alter table 테이블명 disable constraint 제약조건명;
    */
    
    
    -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다.  (A.status 의 ENABLED 는 활성화 중이라는 뜻이다.)
    select A.constraint_name, A.constraint_type, A.search_condition, A.status,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    
    
    alter table TBL_JIKWON_COPY disable constraint CK_TBL_JIKWON_COPY_JIK;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.

    
    -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다.  (A.status 의 DISABLED 는 비활성화 중이라는 뜻이다.)
    select A.constraint_name, A.constraint_type, A.search_condition, A.status,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    /*
        NN_TBL_JIKWON_COPY_JIK	C	"JIK" IS NOT NULL	ENABLED	JIK	
        NN_TBL_JIKWON_COPY_EMAIL	C	"EMAIL" IS NOT NULL	ENABLED	EMAIL	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	ENABLED	SALARY	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	ENABLED	COMMISSION	
        CK_TBL_JIKWON_COPY_JIK	C	jik in('사장', '상무', '부장', '과장', '대리', '사원')	DISABLED	JIK	
    */
    
    --- *** 어떤 테이블에 존재하는 제약조건을 활성화 시키기 *** ---
   /*
        alter table 테이블명 enable constraint 제약조건명;
    */  
    
    -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다.  (A.status 의 ENABLED 는 활성화 중이라는 뜻이다.)
    select A.constraint_name, A.constraint_type, A.search_condition, A.status,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    
    
    alter table TBL_JIKWON_COPY enable constraint CK_TBL_JIKWON_COPY_JIK;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.

    
    -- TBL_JIKWON_COPY 테이블에 생성된 제약 조건을 조회해본다.  (A.status 의 DISABLED 는 비활성화 중이라는 뜻이다.)
    select A.constraint_name, A.constraint_type, A.search_condition, A.status,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    ON A.constraint_name = B.constraint_name
    where A.TABLE_NAME = 'TBL_JIKWON_COPY';
    /*
        CK_TBL_JIKWON_COPY_JIK	C	jik in('사장', '상무', '부장', '과장', '대리', '사원')	ENABLED	JIK	
        NN_TBL_JIKWON_COPY_JIK	C	"JIK" IS NOT NULL	ENABLED	JIK	
        NN_TBL_JIKWON_COPY_EMAIL	C	"EMAIL" IS NOT NULL	ENABLED	EMAIL	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	ENABLED	SALARY	
        CK_TBL_JIKWON_COPY_SAL_COMM	C	salary > commission and commission >= 0	ENABLED	COMMISSION	
    */
    
    
    
    
    
    --- *** 어떤 테이블에 새로운 컬럼 추가하기 *** ----
    /*
        alter table 테이블명 add 추가할컬럼명 데이터타입;
    */
    
    desc TBL_JIKWON_COPY;
    -- jubun 컬럼이 없으므로 추가해보자 
    /*
        이름         널?       유형            
        ---------- -------- ------------- 
        SANO                NUMBER(5)     
        SANAME              NVARCHAR2(10) 
        SALARY              NUMBER(5)     
        COMMISSION          NUMBER(5)     
        JIK        NOT NULL NVARCHAR2(10) 
        EMAIL      NOT NULL VARCHAR2(50) 
    */
    
    alter table TBL_JIKWON_COPY add jubun varchar2(12);
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.

    -- 롹인해보자
    desc TBL_JIKWON_COPY;
    -- jubun 컬럼이 없으므로 추가해보자 
    
    /*
        이름         널?       유형            
        ---------- -------- ------------- 
        SANO                NUMBER(5)     
        SANAME              NVARCHAR2(10) 
        SALARY              NUMBER(5)     
        COMMISSION          NUMBER(5)     
        JIK        NOT NULL NVARCHAR2(10) 
        EMAIL      NOT NULL VARCHAR2(50)  
        JUBUN               VARCHAR2(12)  

    */
    
    select * 
    from TBL_JIKWON_COPY;
    -- 1001	홍길동	500	100	과장	hongkd@fmail.com	
    -- 2001	엄정화	700	100	부장	eomjh@fmail.com	
    
    
    -- 오류 (테이블이 비어져있지 않으면 오류)
    alter table TBL_JIKWON_COPY add mobile varchar2(20) not null;
    -- 오류 보고 - ORA-01758: 테이블은 필수 열을 추가하기 위해 (NOT NULL) 비어 있어야 합니다.
    -- 01758. 00000 -  "table must be empty to add mandatory (NOT NULL) column"
    
    
    
    -- 성공
    --> 어떤 테이블에 컬럼을 추가하는데 not null 되어야 한다면 아래와 같이 default를 주면 된다.
    alter table TBL_JIKWON_COPY add mobile varchar2(20) default ' ' not null;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.



    -- 롹인해보자
    desc TBL_JIKWON_COPY;
    /*
        이름         널?       유형            
        ---------- -------- ------------- 
        SANO                NUMBER(5)     
        SANAME              NVARCHAR2(10) 
        SALARY              NUMBER(5)     
        COMMISSION          NUMBER(5)     
        JIK        NOT NULL NVARCHAR2(10) 
        EMAIL      NOT NULL VARCHAR2(50)  
        JUBUN               VARCHAR2(12)  
        MOBILE     NOT NULL VARCHAR2(20)
    */
    
    select * 
    from TBL_JIKWON_COPY;
    /*
        1001	홍길동	500	100	과장	hongkd@fmail.com	null   ' '	 
        2001	엄정화	700	100	부장	eomjh@fmail.com		null   ' '
    */
    
    
    
    
    
    --- *** 어떤 테이블에 존재하는 컬럼을 삭제하기 *** ----
    /*
        alter table 테이블명 drop column 삭제할컬럼명;
    */
    
    
    alter table TBL_JIKWON_COPY drop column mobile;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.

    -- 롹인해보자
    desc TBL_JIKWON_COPY;
    /*
        이름         널?       유형            
        ---------- -------- ------------- 
        SANO                NUMBER(5)     
        SANAME              NVARCHAR2(10) 
        SALARY              NUMBER(5)     
        COMMISSION          NUMBER(5)     
        JIK        NOT NULL NVARCHAR2(10) 
        EMAIL      NOT NULL VARCHAR2(50)  
        JUBUN               VARCHAR2(12)  

    */
    
    select *
    from TBL_JIKWON_COPY;
    /*
        1001	홍길동	500	100	과장	hongkd@fmail.com	null
        2001	엄정화	700	100	부장	eomjh@fmail.com	    null
    */
    
    
    
    ----- **** 어떤 테이블에 존재하는 컬럼명을 변경하기 **** -----
    /*
        alter table 테이블명 rename column 현재컬럼명 to 새로이변경할컬럼명;
    */
    
    alter table TBL_JIKWON_COPY rename column jubun to jumunbunho;
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.

    -- 롹인해보자
    desc TBL_JIKWON_COPY;
    /*
        이름         널?       유형            
        ---------- -------- ------------- 
        SANO                NUMBER(5)     
        SANAME              NVARCHAR2(10) 
        SALARY              NUMBER(5)     
        COMMISSION          NUMBER(5)     
        JIK        NOT NULL NVARCHAR2(10) 
        EMAIL      NOT NULL VARCHAR2(50)  
        JUMUNBUNHO               VARCHAR2(12)  

    */
    
    select *
    from TBL_JIKWON_COPY;
    /*
        1001	홍길동	500	100	과장	hongkd@fmail.com	null
        2001	엄정화	700	100	부장	eomjh@fmail.com	    null
    */
    
    
    
    ---- **** 어떤 테이블에 존재하는 컬럼의 데이터타입 변경하기 **** -----
    /*
        alter table 테이블명 modify 컬럼명 새로운데이터타입;
    */
    
    
            ------> 데이터가 없는 테이블이라면  < -----------------
    -- 테이블 생성 
    create table tbl_memo_01
    (memonum     varchar2(10)
    ,contect     Nvarchar2(300)
    );
    -- Table TBL_MEMO_01이(가) 생성되었습니다.

    desc tbl_memo_01;
    /*
        이름      널? 유형             
        ------- -- -------------- 
        MEMONUM    VARCHAR2(10)   
        CONTECT    NVARCHAR2(300) 
    */
    
    -- 현재 tbl_memo_01 테이블에는 입력된 데이터가 없다.
    
    
    alter table tbl_memo_01 modify memonum number(8);
    -- Table TBL_MEMO_01이(가) 변경되었습니다.

    desc tbl_memo_01;
    /*
        이름      널? 유형             
        ------- -- -------------- 
        MEMONUM    NUMBER(8) 
        CONTECT    NVARCHAR2(300) 
    */
    
    
    ----------> 데이터가 있는 테이블이라면 <--------------------
    
    select *
    from TBL_JIKWON_COPY;
    
    -- 현재 TBL_JIKWON_COPY 테이블에는 입력된 데이터가 있다.
    
    alter table TBL_JIKWON_COPY modify saname number(8);
    -- 오류 보고 - ORA-01439: 데이터 유형을 변경할 열은 비어 있어야 합니다
    -- 기존 데이터가 있으므로 데이터 변경하기 쉽지 않음 
    
    desc tbl_JIKWON_COPY;
    
    
    
    insert into TBL_JIKWON_COPY(sano, saname, salary, commission, jik, email)
    values(3001, '김수한무거북이두루이삼천갑자동방석', 600, 200, '대리', 'kimsu@gmail.com');
    -- 오류 보고 - ORA-12899: "HR"."TBL_JIKWON_COPY"."SANAME" 열에 대한 값이 너무 큼(실제: 17, 최대값: 10)
    -- nvarchar2(10) 인데 이름이 초과함 17글자
    
    
    
    alter table TBL_JIKWON_COPY modify saname Nvarchar2(20);
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다.

    
    insert into TBL_JIKWON_COPY(sano, saname, salary, commission, jik, email)
    values(3001, '김수한무거북이두루이삼천갑자동방석', 600, 200, '대리', 'kimsu@gmail.com');
    -- 1 행 이(가) 삽입되었습니다. (사이즈가 20으로 늘어났으므로 들어간다
    
    commit;
    -- 커밋 완료 
    
    desc tbl_JIKWON_COPY;
    /*
        이름         널?       유형            
        ---------- -------- ------------- 
        SANO                NUMBER(5)     
        SANAME              NVARCHAR2(20) 
        SALARY              NUMBER(5)     
        COMMISSION          NUMBER(5)     
        JIK        NOT NULL NVARCHAR2(10) 
        EMAIL      NOT NULL VARCHAR2(50)  
        JUMUNBUNHO          VARCHAR2(12)
    */
    
    -- 현재 데이터 상태
    select *
    from TBL_JIKWON_COPY;
    /*
        1001	홍길동	500	100	과장	hongkd@fmail.com	
        2001	엄정화	700	100	부장	eomjh@fmail.com	
        3001	김수한무거북이두루이삼천갑자동방석	600	200	대리	kimsu@gmail.com	
    */
    
    
    ---- email을 10글자 제한으로 줄이려 했지만 데이터가 존재하므로 오류가 발생항다.
    alter table TBL_JIKWON_COPY modify email Nvarchar2(10); 
    -- 오류 보고 - ORA-01441: 일부 값이 너무 커서 열 길이를 줄일 수 없음
    
    
    -- 성공
    alter table TBL_JIKWON_COPY modify email Nvarchar2(20); 
    -- Table TBL_JIKWON_COPY이(가) 변경되었습니다. 


    desc tbl_JIKWON_COPY;
    /*
        이름         널?       유형            
        ---------- -------- ------------- 
        SANO                NUMBER(5)     
        SANAME              NVARCHAR2(20) 
        SALARY              NUMBER(5)     
        COMMISSION          NUMBER(5)     
        JIK        NOT NULL NVARCHAR2(10) 
        EMAIL      NOT NULL NVARCHAR2(20) 
        JUMUNBUNHO          VARCHAR2(12)  

    */
    
    
    ---- *** 어떤 테이블의 테이블명 변경하기 *** ------
    /*
        rename 현재테이블명 to 새로운테이블명;  
    */
    
    rename tbl_JIKWON_COPY to tbl_JIKWON_BACKUP;
    -- 테이블 이름이 변경되었습니다.

    -- 현재 데이터 상태
    select *
    from TBL_JIKWON_COPY;
    -- 테이블이 존재하지 않습니다
    

    -- 현재 데이터 상태
    select *
    from TBL_JIKWON_BACKUP;
    /*
        1001	홍길동	500	100	과장	hongkd@fmail.com	
        2001	엄정화	700	100	부장	eomjh@fmail.com	
        3001	김수한무거북이두루이삼천갑자동방석	600	200	대리	kimsu@gmail.com	
    */  
    
    
    
    --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-- 
    ----- !!!!!!!! 테이블을 생성한 이후에 웬만하면 테이블명에 대한 주석문을 꼭 달아 주도록 합시다  !!!!!!!!!!!! ----
    
    --- *** 테이블명에 달려진 주석문 조회하기  *** ---
    
    select *
    from user_tab_comments;
    -- comments 에 설명문이 자세하게 나온다.

    -- comment 를 넣어주기 
    comment on table TBL_JIKWON_BACKUP
    is '우리회사 직원들의 정보가 들어있는 백업 테이블';
    -- Comment이(가) 생성되었습니다.


    -- 확인하기 
    select *
    from user_tab_comments;
    -- comments 에 설명문이 자세하게 나온다.


    ----- !!!!!!!! 테이블을 생성한 이후에 웬만하면 컬럼명에 대한 주석문을 꼭 달아 주도록 합시다  !!!!!!!!!!!! ----
    
    select *
    from user_col_comments
    where table_name = 'EMPLOYEES';
    -- comments에 설명이 되어 있음
    
    
    -- 우리가 만들고 아무것도 comment 안달아 줘서 모두 null
    select *
    from user_col_comments
    where table_name = 'TBL_JIKWON_BACKUP';
    -- comments에 설명이 되어 있음
    
    
    comment on column TBL_JIKWON_BACKUP.SANO is'사원번호 primary key';
    comment on column TBL_JIKWON_BACKUP.SANAME is'사원명 NOT null';
    comment on column TBL_JIKWON_BACKUP.SALARY is'기본급여 0보다 크면서 commission 컬럼보다 더 커야한다.';
    comment on column TBL_JIKWON_BACKUP.COMMISSION is'커미션 최소 0이면서 SALARY 보다 작다';
    comment on column TBL_JIKWON_BACKUP.JIK is'직급, 사장, 상무, 부장, 과장, 대리, 사원만 가능하며 default로 사원이다.';
    comment on column TBL_JIKWON_BACKUP.EMAIL is'Email을 나타낸다.';
    comment on column TBL_JIKWON_BACKUP.JUMUNBUNHO is'주민번호를 나타낸다';
    -- Comment이(가) 생성되었습니다.

    -- 우리가 만들고 comment 를 써줬다
    select column_name, comments
    from user_col_comments
    where table_name = 'TBL_JIKWON_BACKUP';
    -- comments에 설명이 되어 있음
    
    
    
    
    --- *** 어떤 테이블에 어떤 컬럼에 달려진 default 값 조회해 보기 *** ---
    -- DATA_DEFAULT 컬럼을 확인하자 
    
    select *
    from user_tab_columns
    where table_name = 'TBL_JIKWON';

     select *
    from user_tab_columns
    where table_name = 'TBL_JUMUN';
    
    
    
    
    ---- ***** 어떤 테이블에 어떤 컬럼에 달려진 default 값 변경하기 **** -----
    /*
        alter table 테이블명 modify 컬럼명 default 새로운값;
    */
    
    alter table TBL_JIKWON modify jik default '대리';
    -- Table TBL_JIKWON이(가) 변경되었습니다.

    -- 확인헤보기 (jik 컬럼의 DATA_DEFAULT 컬럼은 대리로 정상적으로 변경됨)
    select data_default
    from user_tab_columns
    where table_name = 'TBL_JIKWON' and column_name = 'JIK';
    -- '대리'
        
    
    -- 한번 더 해보자
    
    -- 확인헤보기 (jik 컬럼의 DATA_DEFAULT 컬럼은 null로 정상적으로 보여줌 (변경한적이 없기 때문에)
    select data_default
    from user_tab_columns
    where table_name = 'TBL_JIKWON_BACKUP' and column_name = 'JIK';
    -- null
    
    
    alter table TBL_JIKWON_BACKUP modify jik default '대리';
    -- Table TBL_JIKWON_BACKUP이(가) 변경되었습니다.
.
    
    -- 확인헤보기 (jik 컬럼의 DATA_DEFAULT 컬럼은 대리로 정상적으로 변경됨)
    select data_default
    from user_tab_columns
    where table_name = 'TBL_JIKWON_BACKUP' and column_name = 'JIK';
    -- '대리'
    
    
    
    ---- ***** 어떤 테이블에 어떤 컬럼에 달려진 default 값 삭제하기 **** -----
    /*
        alter table 테이블명 modify 컬럼명 default NULL:
    */
    
    
    alter table TBL_JIKWON_BACKUP modify jik default NULL;  -- 대소문자 구분 X
    -- Table TBL_JIKWON_BACKUP이(가) 변경되었습니다.
    
    
    -- 확인헤보기 (jik 컬럼의 DATA_DEFAULT 컬럼은 null로 정상적으로 보여줌)
    select data_default
    from user_tab_columns
    where table_name = 'TBL_JIKWON_BACKUP' and column_name = 'JIK';
    -- null
    
    
    
    --------------------- 여기까지 table에 관련된 명령문을 알아보았다 ------------------------
    
    -----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------
    
    
    
    ---- !!! 테이블을 삭제시 휴지통에 버리기 ==> drop 되어진 테이블을 복구가 가능하도록 만들어 주는 것이다 !!! ----
    
    create table tbl_exam_01
    (name Nvarchar2(10));
    -- Table TBL_EXAM_01이(가) 생성되었습니다.

    insert into tbl_exam_01(name) values('연습1');
    commit;
    
    create table tbl_exam_02
    (name Nvarchar2(10));
    -- Table TBL_EXAM_01이(가) 생성되었습니다.

    insert into tbl_exam_02(name) values('연습2');
    commit;
    
    create table tbl_exam_03
    (name Nvarchar2(10));
    -- Table TBL_EXAM_01이(가) 생성되었습니다.

    insert into tbl_exam_03(name) values('연습3');
    commit;
    
    create table tbl_exam_04
    (name Nvarchar2(10));
    -- Table TBL_EXAM_01이(가) 생성되었습니다.

    insert into tbl_exam_04(name) values('연습4');
    commit;
    
    create table tbl_exam_05
    (name Nvarchar2(10));
    -- Table TBL_EXAM_01이(가) 생성되었습니다.

    insert into tbl_exam_05(name) values('연습5');
    commit;
    
    
    create table tbl_exam_06
    (name Nvarchar2(10));
    -- Table TBL_EXAM_01이(가) 생성되었습니다.

    insert into tbl_exam_06(name) values('연습6');
    commit;
    
    
    drop table tbl_exam_01;   --> tbl_exam_01 테이블을 영구히 삭제하는 것이 아니라 휴지통에 버리는 것이다
    -- Table TBL_EXAM_01이(가) 삭제되었습니다.

    
    select *
    from tab;
    -- NAME 에 BIN$ 가 있음
    -- 결과물에서 tname 컬럼에 BIN$로 시작하는 것은 휴지통에 버려진 테이블이다.
    
    
    drop table tbl_exam_02;   --> tbl_exam_02 테이블을 영구히 삭제하는 것이 아니라 휴지통에 버리는 것이다
    -- Table TBL_EXAM_02이(가) 삭제되었습니다.
    
    select *
    from tab;
    -- NAME 에 BIN$ 가 있음
    -- 결과물에서 tname 컬럼에 BIN$로 시작하는 것은 휴지통에 버려진 테이블이다.
    
    
    -- drop 되어서 결과값이 없음
    select *
    from tbl_exam_02;
    -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
    --00942. 00000 -  "table or view does not exist"
    
    
    
    -- 휴지통에 버린 테이블 결과를 볼 수 있다,
    select *
    from "BIN$DIB5zUFOTCOkE78Zngyb5A==$0";
    -- 연습1
    
    select *
    from "BIN$Pm0KHgLGRmemje1kmPPUrQ==$0";
    --??
    
    select *
    from "BIN$WdDrNZGuS9C5deDP4hbOxg==$0";
    -- 1	010-7777-8888
    -- 2	010-2345-6789
    
    select *
    from "BIN$wtYrWDnPRi616tzhUy9Cww==$0";
    -- 연습2
    
    
    ----- ***** 휴지통 조회하기 ***** -----
    
    select *
    from user_recyclebin;
    -- 원래 이름 타입 등등이 존재한다.
    
    
    ----- ***** 휴지통에 있던 테이블을 복구하기 ***** -----
    flashback table TBL_EXAM_01 to before drop; 
    -- Flashback을(를) 성공했습니다.
    -- TBL_EXAM_01 은 original_name 컬럼에 나오는 것이다.
    

    -- 복원된 값을 확인하자 
    select *
    from TBL_EXAM_01;
    -- 연습1
    
    select * 
    from tab;
    
    -- 휴지통 조회하기
    select *
    from user_recyclebin;
    -- 원래 이름 타입 등등이 존재한다.
    
    
    
    ----- ==== ***** 휴지통에 있던 특정 테이블을 영구히 삭제하기 **** ==== ------
    
    -- 휴지통 조회하기 
    select *
    from user_recyclebin;
    -- 원래 이름 타입 등등이 존재한다.
    
    purge table TBL_EXAM_02;
    -- Table이(가) 비워졌습니다.
    -- TBL_EXAM_02 은 original_name 컬럼에 나오는 것이다.
    
    
    
    ----- ===== ***** 휴지통에 있던 모든 테이블을 영구히 삭제하기 *** ==== ----
    
    drop table tbl_exam_03;
    -- Table TBL_EXAM_03이(가) 삭제되었습니다.
    
    drop table tbl_exam_04;
    -- Table TBL_EXAM_04이(가) 삭제되었습니다.

    -- 휴지통 조회하기 (TBL_EXAM_03, TBL_EXAM_04 가 존재한다.)
    select *
    from user_recyclebin;
    -- 원래 이름 타입 등등이 존재한다.
    
    
    purge recyclebin;
    -- Recyclebin이(가) 비워졌습니다.
    

    -- 휴지통 조회하기 (아무것도 없음)
    select *
    from user_recyclebin;
    -- 원래 이름 타입 등등이 존재한다.
    
    
    select *
    from tab;
    -- BIN$가 전부 사라졌다.
    
    
    -- tbl_exam_05 가 아직 존재한다.
    select *
    from tbl_exam_05;
    -- 연습5
    
    
    
    
    ---- **** 테이블을 영구히 삭제하기 ==> 이렇게 drop 되어진 테이블은 복원이 불가능 하다. ***** -----
    
    
    drop table tbl_exam_05 purge;
    -- Table TBL_EXAM_05이(가) 삭제되었습니다.

    
    -- 휴지통 조회하기 (아무것도 없음)
    select *
    from user_recyclebin;
    -- 원래 이름 타입 등등이 존재한다.
    
    
    
    
    
    ---------- ===== ***** INDEX(인덱스, 색인) ***** ===== ------------------
    
    /* 
       index(==색인)는 예를 들어 설명하면 아주 두꺼운 책 뒤에 나오는 "찾아보기" 와 같은 기능을 하는 것이다.
       "찾아보기" 의 특징은 정렬되어 있는 것인데 index(==색인) 에 저장된 데이터도 정렬되어 저장되어 있다는 것이 특징이다.
    */
    -- index(==색인)를 생성해서 사용하는 이유는 where 절이 있는 select 명령문의 속도를 향상 시키기 위함이다.
    -- index(==색인)은 어떤 컬럼에 만들어 할까요?
    /*
       1. where 절에서 자주 사용되어진 컬럼에 만들어야 한다.
       
       2. 선택도(selectivity)가 높은 컬럼에 만들어야 한다.
       ※ 선택도(selectivity)가 높다라는 것은 고유한 데이터일수록 선택도(selectivity)가 높아진다.
       예: 성별컬럼 --> 선택도(selectivity)가 아주 낮다. 왜냐하면 수많은 사람중 남자 아니면 여자중 하나만 골라야 하므로 선택의 여지가 아주 낮다.
           학번    --> 선택도(selectivity)가 아주 좋다. 왜냐하면 학번은 다양하고 고유하므로 골라야할 대상이 아주 많으므로 선택도가 높은 것이다.
    
       3. 카디널리티(cardinality)가 높은 컬럼에 만들어야 한다.
       ※ 카디널리티(cardinality)의 사전적인 뜻은 집합원의 갯수를 뜻하는 것으로서,
          카디널리티(cardinality)가 높다라는 것은 중복도가 낮아 고유한 데이터일수록 카디널리티(cardinality)가 상대적으로 높다 라는 것이다.
          카디널리티(cardinality)가 낮다라는 것은 중복도가 높아 중복된 데이터가 많을수록 카디널리티(cardinality)가 상대적으로 낮다 라는 것이다.
          
          카디널리티(cardinality)는 "상대적인 개념" 이다.
          예를들어, 주민등록번호 같은 경우는 중복되는 값이 없으므로 카디널리티(cardinality)가 높다고 할 수 있다.
          이에 비해 성명같은 경우는 "주민등록번호에 비해" 중복되는 값이 많으므로, 성명은 "주민등록번호에 비해" 카디널리티가 낮다고 할 수 있다.
          이와같이 카디널리티(cardinality)는 상대적인 개념으로 이해해야 한다.
    */
    
    
    create table tbl_student_1
    (hakbun      varchar2(20) not null
    ,name        varchar2(20)
    ,email       varchar2(30)
    ,address     varchar2(200)
    );
    --Table TBL_STUDENT_1이(가) 생성되었습니다.

    
    --- *** unique 한 index 생성하기 *** ---
    /*
        어떤 컬럼에 unique 한 index를 생성하면 그 컬럼에 들어오는 값은 중복된 값은 들어올 수 없으며 
        오로지 고유한 값만 들어오게 된다.
        unique 한 index 가 뒤에 나오는 non-unique 한 index 보다 검색속도가 조금 더 빠르다.
    */
    /*
        [문법]
        create unique index 인덱스명
        on 해당테이블명(컬럼명 asc | desc); --오름차순이나 내림차순이나 한개만 고르자
    */  
    
    create unique index idx_tbl_student_1_hakbun
    on tbl_student_1(hakbun);  -- on tbl_student_1(hakbun asc); 와 동일하다 
    -- Index IDX_TBL_STUDENT_1_HAKBUN이(가) 생성되었습니다.

    
    insert into tbl_student_1(hakbun, name, email, address)
    values('1', '일미자', 'ilm@naver.com', '서울시 강동구');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_student_1(hakbun, name, email, address)
    values('1', '이미자', 'two@naver.com', '서울시 강서구');
    -- 오류 보고 - ORA-00001: 무결성 제약 조건(HR.IDX_TBL_STUDENT_1_HAKBUN)에 위배됩니다
    
    insert into tbl_student_1(hakbun, name, email, address)
    values('2', '이미자', 'two@naver.com', '서울시 강서구');
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    -- 커밋 완료.
    
    
    
    --- **** tbl_student_1 테이블에 생성 되어진 index 조회하기 **** ------
    
    select *
    from user_indexes
    where table_name = 'TBL_STUDENT_1';
    -- IDX_TBL_STUDENT_1_HAKBUN	NORMAL	HR	TBL_STUDENT_1	TABLE	UNIQUE	DISABLED		USERS	2	255	65536	1048576	1	2147483645						10	YES	0	0	0	0	0	0	VALID	0	0	23/02/20	1	1	NO	N	N	N	DEFAULT	DEFAULT	DEFAULT	NO						YES				NO	NO	NO	VISIBLE		YES	NO	FULL
    
    select *
    from user_ind_columns
    where table_name = 'TBL_STUDENT_1';
    -- IDX_TBL_STUDENT_1_HAKBUN	TBL_STUDENT_1	HAKBUN	1	20	20	ASC	
    
    
    -- JOIN 한것을 확인하기 
    select A.index_name, UNIQUENESS, COLUMN_NAME, DESCEND
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    -- IDX_TBL_STUDENT_1_HAKBUN	UNIQUE	HAKBUN	ASC
  
    
    --- *** non-unique 한 index 생성하기 *** ---
    /*
        어떤 컬럼에 non-unique 한 index를 생성하면 그 컬럼에 들어오는 값은 중복된 값은 들어올 수 있다.
        non-unique 한 index 가 뒤에 나오는 unique 한 index 보다 검색속도가 다소 늦은 편이다.
    */
    /*
        [문법]
        create index 인덱스명
        on 해당테이블명(컬럼명 asc | desc); --오름차순이나 내림차순이나 한개만 고르자
    */  
    
    create index idx_tbl_student_1_name
    on tbl_student_1(name);
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 생성되었습니다.

    insert into tbl_student_1(hakbun, name, email, address)
    values('3', '삼미자', 'threemj@naver.com', '서울시 강남구');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_student_1(hakbun, name, email, address)
    values('4', '삼미자', 'sammj@naver.com', '서울시 강북구');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_student_1(hakbun, name, email, address)
    values('5', '오미자', 'fivemj@naver.com', '서울시 강남구');
    -- 1 행 이(가) 삽입되었습니다.

    commit;
    -- 커밋 완료
    
    
    -- 조회하기 
    select *
    from tbl_student_1;
    /*
        1	일미자	ilm@naver.com	서울시 강동구
        2	이미자	two@naver.com	서울시 강서구
        3	삼미자	threemj@naver.com	서울시 강남구
        4	삼미자	sammj@naver.com	서울시 강북구
    */
    
    -- JOIN 한것을 확인하기 
    select A.index_name, UNIQUENESS, COLUMN_NAME, DESCEND
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
    ------------------------------------------------------------------
        index_name                 UNIQUENESS  COLUMN_NAME  DESCEND
    ------------------------------------------------------------------
        IDX_TBL_STUDENT_1_HAKBUN	UNIQUE	      HAKBUN	  ASC
        IDX_TBL_STUDENT_1_NAME	    NONUNIQUE	  NAME	      ASC
    */
    
    --유니크한 것을 조회
    select *
    from tbl_student_1
    where hakbun = '2'; --> unique 한 IDX_TBL_STUDENT_1_HAKBUN 를 사용하여 빠르게 조회해봄.
    -- 2	이미자	two@naver.com	서울시 강서구
    
    
    -- 비유니크한 것을 조회
    select *
    from tbl_student_1
    where name = '이미자'; --> non-unique 한 IDX_TBL_STUDENT_1_NAME 를 사용하여 빠르게 조회해봄.
    -- 2	이미자	two@naver.com	서울시 강서구
    
    
    -- 인덱스 지정 안한것을 조회 (TABLE FULL-SCAN(인덱스를 사용하지 않고 테이블을 전체 조회))
    select *
    from tbl_student_1
    where address = '서울시 강남구';  --> address 컬럼에는 인덱스가 없으므로 tbl_student_1 테이블에 있는 모든 데이터를 전부다 조회해서
                                    --> address 컬럼의 값이 '서울시 강남구'인 데이터를 가져온다.
                                    --> 이와 같이 인덱스를 사용하지 않고 데이터를 조회해올 때는 TABLE FULL-SCAN(인덱스를 사용하지 않고 테이블을 전체 조회)이라고 부른다.
                                    -- TABLE FULL-SCAN(인덱스를 사용하지 않고 테이블을 전체 조회)이 속도가 가장 느린 것이다.
    /*
        3	삼미자	threemj@naver.com	서울시 강남구
        5	오미자	fivemj@naver.com	서울시 강남구
    */
    
    
    delete from tbl_student_1;
    -- 5개 행 이(가) 삭제되었습니다.


    commit;
    -- 커밋 완료
    
    
    create sequence seq_tbl_student_1
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    -- Sequence SEQ_TBL_STUDENT_1이(가) 생성되었습니다.


    --익명 프로시저일때는 변수선언을 declare 뒤에 해야 한다.
    declare 
        v_cnt      number := 1;  -- 초기치 1값 줌 
        v_seq      number;
        v_day      varchar2(8);
    
    begin
        select to_char(sysdate, 'yyyymmdd') into v_day
        from dual;
            
        loop
            -- 10000번 반복을 위해 설정  
            exit when v_cnt > 10000;
            
            select seq_tbl_student_1.nextval into v_seq       --채번한다
            from dual;
            
            -- 출력 형식
            insert into tbl_student_1(hakbun, name, email, address)
            values('20230220'||'-'||v_seq, '이순신'||v_seq, 'leess'||v_seq||'@naver.com', '서울시 마포구 월드컵로 '||v_seq);
            -- 카운트를 올린다.
            v_cnt := v_cnt + 1;
        
        end loop;
    
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.

    commit;
    -- 커밋 완료
    
    -- 확인해보기
    select count(*)
    from tbl_student_1;
    -- 10000 개 데이터가 존재 
    
    
    -- 최근에 쓰여진 시퀀스 값을 조회해 본다.
    select seq_tbl_student_1.currval AS 최근에사용한시퀀스값
    from dual;
    -- 10000
    
    
    -- 데이터 대입 
    insert into tbl_student_1(hakbun, name, email, address)
    values(to_char(sysdate, 'yyyymmdd')||'-'||(seq_tbl_student_1.currval + 1), '배수지'||(seq_tbl_student_1.currval + 1), 'baesuji'||(seq_tbl_student_1.currval + 1)||'@gmail.com', '서울시 마포구 월드컵로 '||(seq_tbl_student_1.currval + 1));
    --       '20230220-10001'
    
    insert into tbl_student_1(hakbun, name, email, address)
    values(to_char(sysdate, 'yyyymmdd')||'-'||(seq_tbl_student_1.currval + 2), '배수지'||(seq_tbl_student_1.currval + 2), 'baesuji'||(seq_tbl_student_1.currval + 2)||'@gmail.com', '서울시 마포구 월드컵로 '||(seq_tbl_student_1.currval + 2));
    --       '20230220-10002'
    insert into tbl_student_1(hakbun, name, email, address)
    values(to_char(sysdate, 'yyyymmdd')||'-'||(seq_tbl_student_1.currval + 3), '배수지'||(seq_tbl_student_1.currval + 3), 'baesuji'||(seq_tbl_student_1.currval + 3)||'@gmail.com', '서울시 마포구 월드컵로 '||(seq_tbl_student_1.currval + 3));
    --       '20230220-10003'
    
    commit;
    -- 커밋 완료
    
    -- 데이터 몇개인지 조회
    select count(*)
    from tbl_student_1; 
    -- 10003
    
    
    -- JOIN 한것을 확인하기 
    select A.index_name, UNIQUENESS, COLUMN_NAME, DESCEND
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
    ------------------------------------------------------------------
        index_name                 UNIQUENESS  COLUMN_NAME  DESCEND
    ------------------------------------------------------------------
        IDX_TBL_STUDENT_1_HAKBUN	UNIQUE	      HAKBUN	  ASC
        IDX_TBL_STUDENT_1_NAME	    NONUNIQUE	  NAME	      ASC
    */
    
    
    
    
    
    -- ==== *** SQL*Developer 에서 Plan(실행계획) 확인하는 방법 *** ==== --
    
    /*
        select 문이 실행될 때 인덱스를 사용하여 데이터를 얻어오는지 인덱스를 사용하지 않고 
        Table Full Scan 하여 얻어오는지 알아봐야 한다.
        이럴때 사용하는 것이 SQL Plan(실행계획)이다. 
        
        SQL*Developer 에서는 "SQL편집창(SQL 워크시트)"에 Plan(실행계획) 과 Trace(자동추적) 메뉴가 상단에 있다.
        
        Plan(실행계획) 과 Trace(자동추적) 의 차이는,
        Plan(실행계획) 은 SQL을 실행하기 전에 Oracle Optimizer(옵티마이저, 최적화기)가 SQL을 어떻게 실행할지를 미리 알려주는 것이고,
        Trace(자동추적) 는 SQL을 실행해보고, Oracle Optimizer(옵티마이저, 최적화기)가 SQL을 어떻게 실행했는지 그 결과를 알려주는 것이다.
        
        그러므로, 정확도로 말하자면, Trace(자동추적)가 Plan(실행계획) 보다 훨씬 정확한 것이다.
        Plan(실행계획) 은 말그대로 계획이라서 Oracle Optimizer가 계획은 그렇게 세우긴 했으나 
        실제 실행할때는 여러가지 이유로 다르게 실행할 수도 있기 때문이다.
        그래서 Trace(자동추적)가 정확하기는 하나 Trace(자동추적)는 한번 실행해봐야 하는것이라서 
        시간이 오래 걸리는 SQL인 경우에는 한참 기다려야 하는 단점이 있기는 하다.
   */       
    
    
   /* 
        실행해야할 SQL문을 블럭으로 잡은 후에
        "SQL 워크시트" 의 상단 아이콘들중에 3번째 아이콘( 계획 설명... (F10) )을 클릭하면 현재 SQL의 Plan(실행계획)을 아래에 보여준다.
        COST(비용)의 값이 적을 수록 속도가 빠른 것이다.
   */
    
    -- F10 or 워크시트 아이콘 3번째를 누르면 실행계획이 된다.
    -- 위에 두개는 index를 통해서 나오게 된다.
    --유니크인것 확인
    select *
    from tbl_student_1
    where hakbun = '20230220-6789'; -- 학번에는 유니크(unique) 인덱스 IDX_TBL_STUDENT_1_HAKBUN 을 사용하여 빠르게 조회해 옴 
    
    --non-유니크인것 확인
    select *
    from tbl_student_1
    where name = '이순신5783';  -- non-unique 한 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 빠르게 조회해봄.
    
    
    --유니크 안쓴것 주소 확인
    -- index를 통해서 나오지 않고 TABLE ACCESS가 나온다.
    select *
    from tbl_student_1
    where address = '서울시 마포구 월드컵로 3987'; --> address 컬럼에는 인덱스가 없으므로 tbl_student_1 테이블에 있는 모든 데이터를 조회해서 
                                               --  address 컬럼의 값이  '서울시 마포구 월드컵로 3987' 인 데이터를 가져온다.
                                               --  이와 같이 인덱스를 사용하지 않고 데이터를 조회해올 때를 Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회) 이라고 부른다.
                                               --  Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회)이 속도가 가장 느린 것이다.

    --유니크 안쓴것 이메일 확인
    -- index를 통해서 나오지 않고 TABLE ACCESS가 나온다.
    select *
    from tbl_student_1
    where email = 'leess2654@naver.com';  --email 컬럼에는 인덱스가 없으므로 Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회) 하여 조회해 온다.
    
    
    
    
    -------------------------------------------------------------------------------------------------------------------------------------
    
    ---- **** Trace(자동추적)을 하기 위해서는 SYS 또는 SYSTEM으로 부터 권한을 부여 받은 후 HR은 재접속을 해야 한다. *****-----
    
    ------------------------------------------------------------------------------------------------------
    
    show user;
    -- USER이(가) "SYS"입니다.


    grant select_catalog_role to hr;
    -- Grant을(를) 성공했습니다.

    grant select any dictionary to hr;
    -- Grant을(를) 성공했습니다.

    ----------------------------------------------------------------------------------------------------------
    
    -- hr로 재접속을 하도록 하자 
    
    show user;
    -- USER이(가) "HR"입니다.

    /* 
      실행해야할 SQL문을 블럭으로 잡은 후에
      "SQL 워크시트" 의 상단 아이콘들중에 4번째 아이콘( 자동 추적... (F6) )을 클릭하면 현재 SQL의 Trace(자동추적)을 아래에 보여준다.
      
      Trace(자동추적)을 하면 Plan(실행계획) 도 나오고, 동시에 아래쪽에 통계정보도 같이 나온다.

      오른쪽에 Plan(실행계획)에서는 보이지 않던 LAST_CR_BUFFER_GETS 와 LAST_ELAPSED_TIME 컬럼이 나온다.
      LAST_CR_BUFFER_GETS 는 SQL을 실행하면서 각 단계에서 읽어온 블록(Block) 갯수를 말하는 것이고,
      LAST_ELAPSED_TIME 은 경과시간 정보이다.
      즉, 이 정보를 통해서 어느 구간에서 시간이 많이 걸렸는지를 확인할 수 있으므로, 이 부분의 값이 적게 나오도록 SQL 튜닝을 하게 된다.
    */ 


    --유니크인것 확인 --> 속도가 가장 빠르다 
    select *
    from tbl_student_1
    where hakbun = '20230220-6789'; -- 학번에는 유니크(unique) 인덱스 IDX_TBL_STUDENT_1_HAKBUN 을 사용하여 빠르게 조회해 옴 
    
    --non-유니크인것 확인 --> 학번보다는 걸린 시간이 조금 더 많다 
    select *
    from tbl_student_1
    where name = '이순신5783';  -- non-unique 한 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 빠르게 조회해봄.
    
    
    --유니크 안쓴것 주소 확인 --> 유니크 안쓴것에 비해 느리다
    -- index를 통해서 나오지 않고 TABLE ACCESS가 나온다.
    select *
    from tbl_student_1
    where address = '서울시 마포구 월드컵로 3987'; --> address 컬럼에는 인덱스가 없으므로 tbl_student_1 테이블에 있는 모든 데이터를 조회해서 
                                               --  address 컬럼의 값이  '서울시 마포구 월드컵로 3987' 인 데이터를 가져온다.
                                               --  이와 같이 인덱스를 사용하지 않고 데이터를 조회해올 때를 Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회) 이라고 부른다.
                                               --  Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회)이 속도가 가장 느린 것이다.

    --유니크 안쓴것 이메일 확인 --> 유니크 안쓴것에 비해 느리다
    -- index를 통해서 나오지 않고 TABLE ACCESS가 나온다.
    select *
    from tbl_student_1
    where email = 'leess2654@naver.com';  --email 컬럼에는 인덱스가 없으므로 Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회) 하여 조회해 온다.
    
    
    ---- *** DML(insert, update, delete)이 빈번하게 발생하는 테이블에 index가 생성되어 있으면
    ---      DML(insert, update, delete) 작업으로 인해 Index 에 나쁜 결과를 초래하므로  
    ---      index 가 많다고 해서 결코 좋은 것이 아니기에 테이블당 index 의 개수는 최소한의 개수로 만드는 것이 좋다.
    
    ---- *** index 가 생성되어진 테이블에 insert 를 하면 Index Split(인덱스 쪼개짐) 가 발생하므로
    ----     index 가 없을시 보다 insert 의 속도가 떨어지게 된다.
    ----     그러므로 index 가 많다고 결코 좋은 것이 아니므로 최소한의 개수로 index 를 만드는 것이 좋다.
    ----     Index Split(인덱스 쪼개짐)란 Index 의 block(블럭)들이 1개에서 2개로 나뉘어지는 현상을 말한다.
    ----     Index Split(인덱스 쪼개짐)이 발생하는 이유는 Index 는 정렬이 되어 저장되기 때문에 
    ---      Index 의 마지막 부분에 추가되는 것이 아니라 정렬로 인해 중간 자리에 끼워들어가는 현상이
    ----     발생할 수 있기 때문이다. 
    
    
    ---- *** index 가 생성되어진 테이블에 delete 를 하면 테이블의 데이터는 삭제가 되어지지만 
    ----     Index 자리에는 데이터는 삭제되지 않고서 사용을 안한다는 표시만 하게 된다.
    ----     그래서 10만 건이 들어있던 테이블에 9만건의 데이터를 delete 를 하면 테이블에는 데이터가 삭제되어 지지만
    ----     Index 자리에는 10만 건의 정보가 그대로 있고 1만건만 사용하고 9만건은 사용되지 않은채로 되어있기에
    ----     사용하지 않는 9만건의 Index 정보로 인해서 index를 사용해서 select를 해올 때 index 검색속도가 떨어지게 된다.   
    ----     이러한 경우 Index Rebuild 작업을 해주어 사용하지 않는 9만건의 index 정보를 삭제해주어야만 
    ----     select를 해올 때 index 검색속도가 빨라지게 된다. 
    
    
    ---- *** index 가 생성되어진 테이블에 update 를 하면 테이블의 데이터는 "수정" 되어지지만 
    ----     Index 는 "수정" 이라는 작업은 없고 index 를 delete 를 하고 새로이 insert 를 해준다.
    ----     그러므로 index 를 delete 할 때 발생하는 단점 및 index 를 insert 를 할 때 발생하는 Index Split(인덱스 쪼개짐) 가 발생하므로
    ----     Index 에는 최악의 상황을 맞게 된다. 
    ----     이로 인해 테이블의 데이터를 update를 빈번하게 발생시켜 버리면 select를 해올 때 index 검색속도가 현저히 느려지게 된다. 
    ----     이러한 경우도 select를 해올 때 index 검색속도가 빨라지게끔 Index Rebuild 작업을 해주어야 한다.       
    
    
    
    
    
    --- *** index(인덱스) 의 상태 확인하기 *** ---
    
    
    analyze index IDX_TBL_STUDENT_1_NAME validate structure;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 분석되었습니다.
    
    
    -- 인덱스의 상태 
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    -- 0
    /* 
        인덱스 상태(Balance)
        ------------------
              0      <-- 0 에 가까울 수록 인덱스 상태가 좋은 것이다.
              
    */
    
    -- 현재 테이블 상태
    select count(*)
    from tbl_student_1;
    -- 10003
    
    --  테이블 데이터 값 삭제하기
    delete from tbl_student_1
    where hakbun between '20230220-400' and '20230220-9400';
    -- 6,001개 행 이(가) 삭제되었습니다.

    commit;
    -- 커밋 완료.

    -- 삭제되었는지 테이블 상태 확인하기 
    select count(*)
    from tbl_student_1;
    -- 4002
    
    
    -- 인덱스의 상태 (여기서는 delete 하기 전의 index를 분석한 것이므로 0이라고 나올 뿐이다.)
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    -- 0
    /* 
        인덱스 상태(Balance)
        ------------------
              0      <-- 여기서는 delete 하기 전의 index를 분석한 것이므로 0이라고 나올 뿐이다.
    */
    
    
    
    -- 다시 분석한 후에 다시 검사해보자 
    
    analyze index IDX_TBL_STUDENT_1_NAME validate structure;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 분석되었습니다.
    
    
    -- 인덱스의 상태 0이 아니므로 balance가 깨졌다 
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /* 
        인덱스 상태(Balance)
        ------------------
        59.99108333467217197114534967787542374243   <--- 인덱스 밸런스가 대략 60% 정도가 깨진 것이다.
    */
    
    update tbl_student_1 set name = '홍길동'
    where hakbun between '20230220-9401' and '20230220-9901';
    -- 556개 행 이(가) 업데이트되었습니다.
    
    commit;
    
    
    -- 다시 분석한 후에 다시 검사해보자 
    
    analyze index IDX_TBL_STUDENT_1_NAME validate structure;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 분석되었습니다.
    
    
    -- 인덱스의 상태 0이 아니므로 balance가 깨졌다 
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /* 
        인덱스 상태(Balance)
        ------------------
        60.05468311259228287647929297276912166788   <--- 인덱스 밸런스가 대략 60% 정도가 깨진 것이다.
    */
    

    
    
    
    --- *** ===== index Rebuild(인덱스 재건축) 하기 ===== **** ----
    
    -- 인덱스 밸런스가 대략 60% 정도 깨진 IDX_TBL_STUDENT_1_NAME 을 Index Rebuild(인덱스 재건축) 하겠습니다. -- 


    alter index IDX_TBL_STUDENT_1_NAME rebuild;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 변경되었습니다.


    -- 다시 분석한 후에 다시 검사해보자 
    
    analyze index IDX_TBL_STUDENT_1_NAME validate structure;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 분석되었습니다.
    
    
    -- 인덱스의 상태 0
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /* 
        인덱스 상태(Balance)
        ------------------
              0      <-- 0 에 가까울 수록 인덱스 상태가 좋은 것이다.
    */




    ----- *** index 삭제하기 *** ----
    
    ---> drop index 삭제할인덱스명;
    
    
    -- JOIN 한것을 확인하기 
    select A.index_name, UNIQUENESS, COLUMN_NAME, DESCEND
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
    ------------------------------------------------------------------
        index_name                 UNIQUENESS  COLUMN_NAME  DESCEND
    ------------------------------------------------------------------
        IDX_TBL_STUDENT_1_HAKBUN	UNIQUE	      HAKBUN	  ASC
        IDX_TBL_STUDENT_1_NAME	    NONUNIQUE	  NAME	      ASC
    */

    --삭제 하기     
    drop index IDX_TBL_STUDENT_1_NAME;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 삭제되었습니다.


    -- JOIN 한것을 확인하기 
    select A.index_name, UNIQUENESS, COLUMN_NAME, DESCEND
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
    ------------------------------------------------------------------
        index_name                 UNIQUENESS  COLUMN_NAME  DESCEND
    ------------------------------------------------------------------
        IDX_TBL_STUDENT_1_HAKBUN	UNIQUE	      HAKBUN	  ASC
    */
    
    
    --삭제 하기     
    drop index IDX_TBL_STUDENT_1_HAKBUN;
    --Index IDX_TBL_STUDENT_1_HAKBUN이(가) 삭제되었습니다.

    
    -- JOIN 한것을 확인하기 
    select A.index_name, UNIQUENESS, COLUMN_NAME, DESCEND
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
    ------------------------------------------------------------------
        index_name                 UNIQUENESS  COLUMN_NAME  DESCEND
    ------------------------------------------------------------------
    */
    
    
    
    
    
    
    ---- **** !!!! 복합인덱스 (composite index) 생성하기 !!!! **** -----
    
    -- 복합인덱스(composite index)란?
    -- 2개 이상의 컬럼으로 묶여진 인덱스를 말하는 것으로서 
    -- where 절에 2개의 컬럼이 사용될 경우 각각 1개 컬럼마다 각각의 인덱스를 만들어서 사용하는 것보다 
    -- 2개의 컬럼을 묶어서 하나의 인덱스로 만들어 사용하는 것이 속도가 좀 더 빠르다.
    
    
    -- 각각의 컬럼을 만들어 사용
    select *
    from tbl_student_1
    where name = '배수지10001' and address = '서울시 마포구 월드컵로 10001'; -- 각각의 컬럼을 만들어 사용 
    -- 20230220-10001	배수지10001	baesuji10001@gmail.com	서울시 마포구 월드컵로 10001
    
    
    
    
                                 -- !!!!! 중요 !!!!!---
                                 
    -- 복합인덱스 (composite index) 생성시 중요한 것은 선행컬럼을 정하는 것이다.
    -- 선행컬럼은 맨처음에 나오는 것으로서 아래에서는 name 컬럼이 선행컬럼이 된다.
    -- 복합인덱스 (composite index) 로 사용되는 컬럼중 선행컬럼으로 선정되는 기준은 where 절에 가장 많이 사용되는 것이며 
    -- 선택도(selectivity) 가 높은 컬럼이 선행컬럼으로 선정되어야 한다.
    
     -- 컬럼의 순서는 매우 중요하다 (두개의 컬럼을 합쳐서 만듬)
    create index idx_tbl_student_1_name_addr
    on tbl_student_1(name, address);        -- name 컬럼이 선행컬럼이 된다 
    --on tbl_student_1(address, name);      -- address 컬럼이 선행컬럼이 된다 
    
    -- Index IDX_TBL_STUDENT_1_NAME_ADDR이(가) 생성되었습니다.

    
    
    -- JOIN 한것을 확인하기 
    select A.index_name, A.UNIQUENESS, B.COLUMN_NAME, B.DESCEND, B.column_position
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
    ----------------------------------------------------------------------------------
        index_name                 UNIQUENESS  COLUMN_NAME  DESCEND   COLUMN_POSITION
    ----------------------------------------------------------------------------------
        IDX_TBL_STUDENT_1_NAME_ADDR	NONUNIQUE	ADDRESS	      ASC           2
        IDX_TBL_STUDENT_1_NAME_ADDR	NONUNIQUE	NAME	      ASC           1 (숫자 1이 선행컬럼이다)
    */
    
    
    -- 실행계획을 해보자 
    select *
    from tbl_student_1
    where name = '배수지10001' and address = '서울시 마포구 월드컵로 10001';
    -- where 절에 선행컬럼인 name 이 사용되어지면 복합인덱스 (composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하여 빨리 조회해온다.
    
    
    -- 순서를 변경해도 됨
    select *
    from tbl_student_1
    where address = '서울시 마포구 월드컵로 10001' and name = '배수지10001' ;
    -- where 절에 선행컬럼인 name 이 사용되어지면 복합인덱스 (composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하여 빨리 조회해온다.
    
    
    -- 똑같이 실행계획이 나온다.
    select *
    from tbl_student_1
    where name = '배수지10001' ;
    -- where 절에 선행컬럼인 name 이 사용되어지면 복합인덱스 (composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하여 빨리 조회해온다.
    
    
    --where 절에 name(선행컬럼) 이 없다면 TABLE FULL SCAN이 된다.
    select *
    from tbl_student_1
    where address = '서울시 마포구 월드컵로 10001';
    -- where 절에 선행컬럼이 없으므로 복합인덱스 (composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하지 못하고 TABLE FULL SCAN 하여 조회해오므로 속도가 떨어진다. 

    
    
    
    --> 복합 인덱스를 사용하는 이유 2
    
    create table tbl_member
    (userid      varchar2(20)
    ,passwd      varchar2(30) not null
    ,name        varchar2(20) not null 
    ,address     varchar2(100)
    ,email       varchar2(50) not null 
    ,constraint  PK_tbl_member_userid primary key(userid)
    ,constraint  UQ_tbl_member_email unique(email)
    );    
    -- Table TBL_MEMBER이(가) 생성되었습니다.


    declare
        v_cnt      number :=1;                -- 변수의 선언 및 초기화
    begin
        loop
           exit when v_cnt > 10000;
           
           insert into tbl_member(userid, passwd, name, address, email) 
           values('hongkd'||v_cnt, 'qwer1234$', '홍길동'||v_cnt, '서울시 마포구 '||v_cnt, 'hongkd'||v_cnt||'@naver.com');
        
           v_cnt := v_cnt + 1;
        end loop;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    
    commit;
     -- 커밋 완료.
     
     -- 확인
     select *
    from tbl_member;
    
    
    -- 로그인을 하는데 로그인이 성공되어지면 그 회원의 성명만을 보여주도록 한다.
    select name 
    from tbl_member
    where userid = 'hongkd201' and passwd = 'qwer1234$';
    -- 홍길동201
    
    
    --- *** userid, passwd, name 컬럼을 가지고 복합인덱스(composits incdex)를 생성해 봅시다 *** ----
    create index idx_tbl_member_userid_passwd_name
    on tbl_member(userid, passwd, name);
    -- Index IDX_TBL_MEMBER_USERID_PASSWD_NAME이(가) 생성되었습니다.

    
    -- 복합 인덱스를 통해 간다. (실행 계획)******
    select name
    from tbl_member
    where userid = 'hongkd201' and passwd = 'qwer1234$';
    --홍길동201  --> 이름만 나옴 
    -- where 절 및 select 에 복합인덱스(composite index)인 IDX_TBL_MEMBER_USERID_PASSWD_NAME 에 사용되어진 컬럼만 있으므로
    -- 테이블 tbl_member 에는 접근하지 않고 인덱스 IDX_TBL_MEMBER_USERID_PASSWD_NAME 에만 접근해서 조회하므로 속도가 빨라진다. 
    
    
    
    -- address는 복합 인덱스가 없음) (실행 계뢱) --> 테이블을 거쳐야 한다.
    select address
    from tbl_member
    where userid = 'hongkd201' and passwd = 'qwer1234$';
    -- 서울시 마포구 201
    -- where 절에 userid 및 passwd 가 사용되었으므로 복합인덱스(composite index)인 IDX_TBL_MEMBER_USERID_PASSWD_NAME 을 사용하는데 
    -- select 절에 IDX_TBL_MEMBER_USERID_PASSWD_NAME 에 없는 address 컬럼이 있으므로 테이블 tbl_member 에 접근해야 한다.
    -- 그러므로 인덱스 IDX_TBL_MEMBER_USERID_PASSWD_NAME 만 접근하는 것 보다는 조회 속도가 쬐금 느려진다. 
    
    
    -- 인덱스 삭제하기 
    drop index IDX_TBL_MEMBER_USERID_PASSWD_NAME;
    -- Index IDX_TBL_MEMBER_USERID_PASSWD_NAME이(가) 삭제되었습니다.

    
    
    
    
    --- *** 함수기반 인덱스(function based index) 생성하기 **** ----
    
    -- JOIN 한것을 확인하기 
    select A.index_name, A.UNIQUENESS, B.COLUMN_NAME, B.DESCEND, B.column_position
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    
    drop index IDX_TBL_STUDENT_1_NAME_ADDR;
    -- Index IDX_TBL_STUDENT_1_NAME_ADDR이(가) 삭제되었습니다.


    -- JOIN 한것을 확인하기 (깔끔해짐 아무 데이터도 없음)
    select A.index_name, A.UNIQUENESS, B.COLUMN_NAME, B.DESCEND, B.column_position
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    
    --name 컬럼에 인덱스를 주었다 
    create index idx_tbl_student_1_name
    on tbl_student_1(name);
    --Index IDX_TBL_STUDENT_1_NAME이(가) 생성되었습니다.

    -- 실행 계획에서 볼때 index를 타고 온다.
    select *
    from tbl_student_1
    where name = '배수지10002';
    -- IDX_TBL_STUDENT_1_NAME 인덱스를 사용하여 조회해온다.
    
    -- 변형을 하면은 실행 계획에서 볼때 index가 아니라 TABLE FULL SCAN을 한다 
    select *
    from tbl_student_1
    where substr(name,2,2) = '수지';  -- '수지'만 보고싶을때 
    -- IDX_TBL_STUDENT_1_NAME 인덱스를 사용하지 않고 TABLE FULL SCAN을 하여 조회해온다.
    
    
    -- 함수 기반 인덱스를 만들자
    create index idx_func_student_1_name
    on tbl_student_1(substr(name,2,2));  -- 함수기반 인덱스(function based index) 생성
    -- Index IDX_FUNC_STUDENT_1_NAME이(가) 생성되었습니다.


    -- 아까와 다르게 index로 들어가게 된다.(IDX_FUNC_STUDENT_1_NAME)
    select *
    from tbl_student_1
    where substr(name,2,2) = '수지';
    -- 함수기반 인덱스인 IDX_FUNC_STUDENT_1_NAME 을 사용하여 조회해온다.
    
    
    -- index 삭제하기 
    drop index IDX_FUNC_STUDENT_1_NAME;
    -- Index IDX_FUNC_STUDENT_1_NAME이(가) 삭제되었습니다.


    -- JOIN 한것을 확인하기 
    select A.index_name, A.UNIQUENESS, B.COLUMN_NAME, B.DESCEND, B.column_position
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    -- IDX_TBL_STUDENT_1_NAME	NONUNIQUE	NAME	ASC	1
    
    
    select * 
    from employees
    where func_age(jubun) = 39;
    -- Table full Scan 하여 조회해 온다
    
    
    create index idx_func_age
    on employees( func_age(jubun));
    -- 오류 보고 - ORA-30553: 함수가 결정적인 것이 아닙니다
    -- 오류 나오는 이유는 func_age 함수 소스에 sysdate 가 들어가 있으므로 매번 값이 변경되어지므로
    -- 인덱스를 생성할 수 없다.!!!!
    
    -- JOIN 한것을 확인하기 
    select A.index_name, A.UNIQUENESS, B.COLUMN_NAME, B.DESCEND, B.column_position
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    -- IDX_TBL_STUDENT_1_NAME	NONUNIQUE	NAME	ASC	1
    
    
    
    
    select *
    from tbl_student_1
    where name = '배수지10002';
    -- 실행 계획을 보니 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 조회해 온다
    
    select *
    from tbl_student_1
    where name like '배수지10002';
    -- 실행 계획을 보니 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 조회해 온다
    
    select *
    from tbl_student_1
    where name like '배수지%';
    -- 실행 계획을 보니 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 조회해 온다
    
    select *
    from tbl_student_1
    where name like '%배수지%';
    -- 맨 앞에 % 또는 _ 가 나오면 인덱스 IDX_TBL_STUDENT_1_NAME 를 사용하지 않고 TABLE FULL SCAN 하여 조회해온다.
    
    
    
    /*
        어떤 테이블의 어떤 컬럼에 Primary Key 제약 또는 Unique 제약을 주면
        자동적으로 그 컬럼에는 unique 한 index 가 생성되어진다.
        인덱스명은 제약조건명이 된다.
    */
    
    
    create table tbl_student_2
    (hakbun      varchar2(20) not null
    ,name        varchar2(20)
    ,email       varchar2(30) not null 
    ,address     varchar2(200)
    ,constraint PK_tbl_student_2_hakbun primary key(hakbun)
    ,constraint UQ_tbl_student_2_email unique(email)
    );
    --Table TBL_STUDENT_2이(가) 생성되었습니다.
    
    
    -- JOIN 한것을 확인하기 
    select A.index_name, A.UNIQUENESS, B.COLUMN_NAME, B.DESCEND, B.column_position
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_2';
    
    
    /* 
        Primary key 제약 또는 unique 제약으로 생성되어진 index 의 제거는 
        drop index 인덱스명; 이 아니라
        alter table 테이블명 drop constraint 제약조건명; 이다
        제약조건을 삭제하면 자동적으로 index도 삭제된다.
    */
    
    drop index PK_TBL_STUDENT_2_HAKBUN;
    /*
        오류 보고 -
         ORA-02429: 고유/기본 키 적용을 위한 인덱스를 삭제할 수 없습니다.
    */
    drop index UQ_TBL_STUDENT_2_EMAEL;
    /*
        오류 보고 -
        ORA-02429: 고유/기본 키 적용을 위한 인덱스를 삭제할 수 없습니다.
    */
    
    alter table tbl_student_2
    drop primary key;
    -- Table TBL_STUDENT_2이(가) 변경되었습니다.

    
    alter table tbl_student_2
    drop constraint UQ_TBL_STUDENT_2_EMAIL;
    --Table TBL_STUDENT_2이(가) 변경되었습니다.

    
    -- 확인해보기 
    select A.constraint_name, A.constraint_type, A.search_condition,
           B.column_name, B.position
    from user_constraints A JOIN user_cons_columns B
    on A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_STUDENT_2';
    -- SYS_C008937	C	"HAKBUN" IS NOT NULL	HAKBUN	
    -- SYS_C008938	C	"EMAIL" IS NOT NULL	EMAIL	
    
    -- JOIN 한것을 확인하기 
    select A.index_name, A.UNIQUENESS, B.COLUMN_NAME, B.DESCEND, B.column_position
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_2';
    -- 아무것도 없음
    
    ------------------------------------------------------------------------
    
            ----- ***** PL/SQL(Procedure Language / Structured Query Language) ***** -----
            
            
    --- *** PL/SQL 구문에서 변수의 사용법 *** ----
    
    exec pcd_empInfo(101);   --101번 사원
    /*
        <결과물>
        ----------------------------------
        사원번호    사원명     성별     월급 
          101      ...      ...     ...
    */
    
    exec pcd_empInfo(103);   --103번 사원
    /*
        <결과물>
        ----------------------------------
        사원번호    사원명     성별     월급 
          103      ...      ...     ...
    */
    
    
    -- '-' 40개를 직접 쓰지 않고 채우는 방법이다.
    select lpad('-',40,'-')
    from dual;
    -- ----------------------------------------
   
    -- 'a' 를 왼쪽부터 채우되 '-'가 아니면 a를 찍어라 총 40개.
    select lpad('-',40,'a')
    from dual;
    -- aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-
    
    
    
    -- 모드는 in, out, in out 3가지가 존재    (in 타입명)
    -- 타입에는 자리수를 절대로 쓰지 말자 !!!!!!!!!
    create or replace procedure pcd_empInfo(P_employee_id IN number)  -- IN 은 입력모드를 말한다. number(5)와 같이 자리수를 넣어주면 오류이다!!!!!!!!
    is
        -- 변수의 선언부 
        V_employee_id  number(5);  -- 자리수를 사용한다. 
        V_ename        varchar2(50); -- 자리수를 사용한다.
        V_gender      Nvarchar2(1);
        V_monthsal     Varchar2(10);    
    begin
        -- 실행부
        
        select employee_id
             , first_name || ' ' ||last_name
             , case when substr(jubun,7,1) in('1','3') then '남' else '여' end
             , to_char(nvl(salary + (salary * commission_pct), salary),'9,999,999')
             INTO
             V_employee_id, V_ename, V_gender, V_monthsal
        from employees
        where employee_id = P_employee_id;
        
        dbms_output.put_line(lpad('-',40,'-'));  -- 자바에서 sysout 한것과 같다.
        dbms_output.put_line('사원번호    사원명     성별     월급');
        dbms_output.put_line(lpad('-',40,'-'));  -- 자바에서 sysout 한것과 같다.
        dbms_output.put_line(V_employee_id || ' ' || V_ename || ' ' || V_gender || ' ' || V_monthsal);
    end pcd_empInfo;
    -- Procedure PCD_EMPINFO이(가) 컴파일 되었습니다
    
    /*
        == SQL Debeloper 의 메뉴의 보기를 클릭하여 DRMS 출력을 클릭해주어야 한다 ===
        == 이어서 하단부에 나오는 DBRS 출력 부분의 녹색 + 기호를 클릭하여 접속에 local_hr 로 연결을 해준다. ===
    */
    
    exec pcd_empInfo(101);
    /*
        ----------------------------------------
        사원번호    사원명     성별     월급
        ----------------------------------------
        101 Neena Kochhar 남     17,000
    */
    
    exec pcd_empInfo(103);
    /*
        ----------------------------------------
        사원번호    사원명     성별     월급    나이
        ----------------------------------------
        103 Alexander Hunold 남      9,000 49
    */
    
     create or replace procedure pcd_empInfo(P_employee_id IN number)  
    is
        
        V_employee_id  number(5);  
        V_ename        varchar2(50); 
        V_gender      Nvarchar2(1);
        V_monthsal     Varchar2(10);    
        V_age          number(3);
    begin
        
        
        select employee_id
             , first_name || ' ' ||last_name
             , case when substr(jubun,7,1) in('1','3') then '남' else '여' end
             , to_char(nvl(salary + (salary * commission_pct), salary),'9,999,999')
             , extract(year from sysdate) - (to_number(substr(jubun,1,2))+ case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end) +1
             INTO
             V_employee_id, V_ename, V_gender, V_monthsal, V_age 
        from employees
        where employee_id = P_employee_id;
        
        dbms_output.put_line(lpad('-',40,'-')); 
        dbms_output.put_line('사원번호    사원명     성별     월급    나이');
        dbms_output.put_line(lpad('-',40,'-')); 
        dbms_output.put_line(V_employee_id || ' ' || V_ename || ' ' || V_gender || ' ' || V_monthsal || ' ' || V_age );
    end pcd_empInfo;
    -- Procedure PCD_EMPINFO이(가) 컴파일 되었습니다
    
    
    
    exec pcd_empInfo(101);
    /*
        ----------------------------------------
        사원번호    사원명     성별     월급    나이
        ----------------------------------------
        101 Neena Kochhar 남     17,000 39
    */
    
    exec pcd_empInfo(103);
    /*
        ----------------------------------------
        사원번호    사원명     성별     월급    나이
        ----------------------------------------
        103 Alexander Hunold 남      9,000 49
    */
    
    
    ---------------------------------------------------------------------------------------
    ----------------------------- 2월 16일 시작부분 -----------------------------------------
    ---------------------------------------------------------------------------------------
    
    -- PL/SQL(Procedure Language / Structured Query Language)는 명령 프롬포트가 오류잡기 좋다
    -- 명령프롬프트에 오류잡을때 코드를 복사해서 붙여놓고 마지막에 /를 써준다.
    -- 그리고 에러를 보기위해 show errors 를 하면 에러의 위치가 보이므로 편하게 에러를 고칠 수 있다!!!!
    
    
    
    ----- **** 생성되어진 프로시저의 소스를 조회해봅시다. **** ------
    
    select *
    from user_source
    where type = 'PROCEDURE' and name = 'PCD_EMPINFO';
/*
    "procedure pcd_empInfo(P_employee_id IN number)  -- IN 은 입력모드를 말한다. number(5)와 같이 자리수를 넣어주면 오류이다!!!!!!!!
"
"    is
"
"        -- 변수의 선언부 
"
"        V_employee_id  number(5);  -- 자리수를 사용한다. 
"
"        V_ename        varchar2(50); -- 자리수를 사용한다.
"
"        V_gender      Nvarchar2(1);
"
"        V_monthsal     Varchar2(10);    
"
"    begin
"
"        -- 실행부
"
"
"
"        select employee_id
"
"             , first_name || ' ' ||last_name
"
"             , case when substr(jubun,7,1) in('1','3') then '남' else '여' end
"
"             , to_char(nvl(salary + (salary * commission_pct), salary),'9,999,999')
"
"             INTO
"
"             V_employee_id, V_ename, V_gender, V_monthsal
"
"        from employees
"
"        where employee_id = P_employee_id;
"
"
"
"        dbms_output.put_line(lpad('-',40,'-'));  -- 자바에서 sysout 한것과 같다.
"
"        dbms_output.put_line('사원번호    사원명     성별     월급');
"
"        dbms_output.put_line(lpad('-',40,'-'));  -- 자바에서 sysout 한것과 같다.
"
"        dbms_output.put_line(V_employee_id || ' ' || V_ename || ' ' || V_gender || ' ' || V_monthsal);
"
"    end pcd_empInfo;
"
*/
    
    
    -- 이렇게 타입 설정도 가능하다 
    create or replace procedure pcd_empInfo_2(P_employee_id IN employees.employee_id%type)  
    --   P_employee_id 변수의 타입은 employees 테이블에 있는 employee_id 컬럼의 데이터타입과 동일하게 쓰겠다는 말이다.
    is
        
        V_employee_id  employees.employee_id%type;  
        V_ename        varchar2(50);  -- 나머지는 함수를 사용했기 때문에 그대로 쓴다.
        V_gender      Nvarchar2(1);
        V_monthsal     Varchar2(10);    
        V_age          number(3);
    begin
        
        
        select employee_id
             , first_name || ' ' ||last_name
             , case when substr(jubun,7,1) in('1','3') then '남' else '여' end
             , to_char(nvl(salary + (salary * commission_pct), salary),'9,999,999')
             , extract(year from sysdate) - (to_number(substr(jubun,1,2))+ case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end) +1
             INTO
             V_employee_id, V_ename, V_gender, V_monthsal, V_age 
        from employees
        where employee_id = P_employee_id;
        
        dbms_output.put_line(lpad('-',40,'-')); 
        dbms_output.put_line('사원번호    사원명     성별     월급    나이');
        dbms_output.put_line(lpad('-',40,'-')); 
        dbms_output.put_line(V_employee_id || ' ' || V_ename || ' ' || V_gender || ' ' || V_monthsal || ' ' || V_age );
    end pcd_empInfo_2;
    -- Procedure PCD_EMPINFO_2이(가) 컴파일되었습니다.

    
    -- 사원번호 105번을 출력 
    execute pcd_empInfo_2(105);
    /*
        ----------------------------------------
        사원번호    사원명     성별     월급    나이
        ----------------------------------------
        105 David Austin 남      4,800 59
    */
    
    
    
    --- recode 생성등 수정해보자 
    create or replace procedure pcd_empInfo_3(P_employee_id IN employees.employee_id%type)  
    --   P_employee_id 변수의 타입은 employees 테이블에 있는 employee_id 컬럼의 데이터타입과 동일하게 쓰겠다는 말이다.
    is
        --- recode 타입 생성 ---
        type myEmpType is record    -- 이것은 행을 만드는 것이고 ()안에 구성된 컬럼을 쓴다
        (employee_id   employees.employee_id%type
        ,ename         varchar2(50)    --영문이면 varchar2, 한글이면 Nvarchar2가 편함
        ,gender        Nvarchar2(1)
        ,monthsal      varchar2(15)
        ,age           number(3)
        );
        
        V_rcd  myEmpType;
    begin
        
        select employee_id
             , first_name || ' ' ||last_name
             , case when substr(jubun,7,1) in('1','3') then '남' else '여' end
             , to_char(nvl(salary + (salary * commission_pct), salary),'9,999,999')
             , extract(year from sysdate) - (to_number(substr(jubun,1,2))+ case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end) +1
             INTO
             V_rcd
        from employees
        where employee_id = P_employee_id;
        
        dbms_output.put_line(lpad('-',40,'-')); 
        dbms_output.put_line('사원번호    사원명     성별     월급    나이');
        dbms_output.put_line(lpad('-',40,'-')); 
        dbms_output.put_line(V_rcd.employee_id || ' ' || V_rcd.ename || ' ' || V_rcd.gender || ' ' || V_rcd.monthsal || ' ' || V_rcd.age );
    end pcd_empInfo_3;
    -- Procedure PCD_EMPINFO_3이(가) 컴파일되었습니다.

    
    
    -- 사원번호 106번을 확인해 보자 
    execute pcd_empInfo_3(106);
    -- 또는
    exec pcd_empInfo_3(106);
    
    /*
        ----------------------------------------
        사원번호    사원명     성별     월급    나이
        ----------------------------------------
        106 Valli Pataballa 남      4,800 64
    */
    
    
    
    -- v_all으로 employees 테이블의 모든 컬럼을 받아주는 행타입을 설정해보자 
    create or replace procedure pcd_empInfo_4
    (p_employee_id IN employees.employee_id%type) 
    is
       v_all      employees%rowtype;  -- v_all 변수의 타입은 employees 테이블의 모든 컬럼을 받아주는 행타입이다. 
       v_result   varchar2(1000);
    begin
       select * INTO v_all 
       from employees
       where employee_id = p_employee_id;
       
       v_result := v_all.employee_id || ' ' ||    --- V_result 를 넣을때는 반드시 := 을 사용해야 한다.!!!
                   v_all.first_name || ' ' || v_all.last_name || ' ' ||
                   case when substr(v_all.jubun, 7, 1) in ('1','3') then '남' else '여' end || ' ' || 
                   to_char( nvl( v_all.salary + (v_all.salary * v_all.commission_pct), v_all.salary ), '9,999,999') || ' ' || 
                   (extract(year from sysdate) - ( case when substr(v_all.jubun, 7, 1) in ('1','2') then 1900 else 2000 end + to_number( substr(v_all.jubun, 1, 2) )  ) + 1);
       
       dbms_output.put_line( lpad('-', 40, '-') );
       dbms_output.put_line('사원번호    사원명    성별    월급    나이' );
       dbms_output.put_line( lpad('-', 40, '-') );
       
       dbms_output.put_line( v_result );
       
    end pcd_empInfo_4; 
 -- Procedure PCD_EMPINFO_4이(가) 컴파일되었습니다.
    
    
    -- 사원번호 107번 보기 
    exec pcd_empInfo_4(107);
    /*
        ----------------------------------------
        사원번호    사원명    성별    월급    나이
        ----------------------------------------
        107   Diana Lorentz 남    4,200   16

    */ 
    
    
    ----- **** 생성되어진 프로시저의 소스를 조회해봅시다. **** ------
    
    select *
    from user_source
    where type = 'PROCEDURE' and name = 'PCD_EMPINFO_4';
    -- 위에 코드와 주석까지 다 나온다.!!!
    
    
    
    
    ---------------------------------------------------------------------------------------
    ----------------------- ***** 사용자 정의 함수(Function) **** ----------------------------
    ---------------------------------------------------------------------------------------
    
    
    -- 주민번호를 입력받아서 성별을 알려주는 함수 func_gender(주민번호)을 생성해보겠습니다 --
    
    /*
        (문법) 
        create or replace function 함수명
        (파라미터변수명 IN 파라미터변수의타입)
        return  리턴되어질타입
        is
            변수선언;
        begin
            실행문;
            return 리턴되어질값;
        end 함수명;
    */
    
        -- 성별을 보고 싶을때 생성하기 
        create or replace function func_gender
        (p_jubun IN varchar2)   -- varchar(13) 와 같이 자리수를 쓰면 오류이다!!!!!!!!!!!
        return     varchar2     -- varchar(6) 와 같이 자리수를 쓰면 오류이다!!!!!!!!!!!
        is
            v_result   Nvarchar2(1);   --- 여기에는 반드시 자리수를 써야한다.
        begin
            select case when substr(p_jubun, 7, 1) in( '1','3') then '남' else '여' end
                   INTO 
                   v_result
            from dual;
            
            return v_result;
        end func_gender;
        -- Function FUNC_GENDER이(가) 컴파일되었습니다.

    
    
    -- 주민번호 를 구분해서 성별 나타내주기 
    select func_gender('9710201234567'), func_gender('9710202234567'), func_gender('0110203234567'), func_gender('0110204234567')
    from dual;
    -- 남	여	남	여
    
    
    -- 전체 출력 해보기 
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,jubun AS 주민번호 
          ,func_gender(jubun) AS 성별 
    from employees;
    -- 107개 행이 모두 나온다.
    
    
    -- 여자만 보고싶다면 
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,jubun AS 주민번호 
          ,func_gender(jubun) AS 성별 
    from employees
    where func_gender(jubun) = '여';
    -- 51개 행
    
    
    -- 남자만 보고싶다면 
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,jubun AS 주민번호 
          ,func_gender(jubun) AS 성별 
    from employees
    where func_gender(jubun) = '남';
    -- 56개 행 
    
    
    
        ---퀴즈 나이를 보고 싶다면 
        create or replace function func_age
        (p_jubun IN varchar2)   -- varchar(13) 와 같이 자리수를 쓰면 오류이다!!!!!!!!!!!
        return     number     -- varchar(6) 와 같이 자리수를 쓰면 오류이다!!!!!!!!!!!
        is
            v_result   number(3);   --- 여기에는 반드시 자리수를 써야한다.
        begin
            select extract(year from sysdate) - ( case when substr(p_jubun, 7, 1) in ('1','2') then 1900 else 2000 end + to_number( substr(p_jubun, 1, 2) )  ) + 1
                   INTO 
                   v_result
            from dual;
            
            return v_result;
        end func_age;
        -- Function FUNC_AGE이(가) 컴파일되었습니다.

        
    
    
    -- 20대 여자만 보고 싶다면 보고싶다면 
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,jubun AS 주민번호 
          ,func_gender(jubun) AS 성별 
          ,func_age(jubun) AS 나이 
    from employees
    where trunc(func_age(jubun), -1) = 20 and
          func_gender(jubun) = '여';
    
    
    
        -- 성별을 보기 위해 다른 방식의 생성 
        create or replace function func_gender_2
        (p_jubun IN varchar2)   
        return     varchar2     
        is
            v_result   Nvarchar2(1);   --- 여기에는 반드시 자리수를 써야한다.
        begin
            v_result := case when substr(p_jubun, 7, 1) in( '1','3') then '남' else '여' end;            
            return v_result;
        end func_gender_2;
        -- Function FUNC_GENDER_2이(가) 컴파일되었습니다.

    
    -- 주민번호 를 구분해서 성별 나타내주기 
    select func_gender_2('9710201234567'), func_gender_2('9710202234567'), 
           func_gender_2('0110203234567'), func_gender_2('0110204234567')
    from dual;
    -- 남	여	남	여
    
    
        -- 나이를 보고싶을때 다른 풀이 
        create or replace function func_age_2
        (p_jubun IN varchar2)   -- varchar(13) 와 같이 자리수를 쓰면 오류이다!!!!!!!!!!!
        return     number     -- varchar(6) 와 같이 자리수를 쓰면 오류이다!!!!!!!!!!!
        is
            v_result   number(3);   --- 여기에는 반드시 자리수를 써야한다.
        begin
            v_result := extract(year from sysdate) - ( case when substr(p_jubun, 7, 1) in ('1','2') then 1900 else 2000 end + to_number( substr(p_jubun, 1, 2) )  ) + 1;
            
            return v_result;
        end func_age_2;
        -- Function FUNC_AGE_2이(가) 컴파일되었습니다.
        
    
    -- 나이와 성별을 보고 싶다면 보고싶다면 
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,jubun AS 주민번호 
          ,func_gender_2(jubun) AS 성별2
          ,func_age_2(jubun) AS 나이2 
    from employees;
    --107 개 행 
    
    
    
    
    ---- ***** 청년퇴직일을 구해주는 함수 만들기 *** -----
    create or replace function func_retirement_day
    (p_jubun  IN  varchar2)
    return date
    is
        v_retirement_day date;
    begin
        
        -- 63세가 되는 년도 (last_day 는 마지막 날을 보여줌)
        --to_date()   -- 형변환 함수
        select  last_day(to_date(to_char(add_months(sysdate, (63- func_age(p_jubun))*12), 'yyyy') || 
                                 case when substr(p_jubun,3,2) between '03' and '08' then '-08-01' else '-02-01' end
                              , 'yyyy-mm-dd'))
        into v_retirement_day
        from dual;
    
        return v_retirement_day;
    end func_retirement_day;
    -- Function FUNC_RETIREMENT_DAY이(가) 컴파일되었습니다.

    
    
    -- 정년퇴직일까지 나타내어 보자 
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,jubun AS 주민번호 
          ,func_gender_2(jubun) AS 성별2
          ,func_age_2(jubun) AS 나이2 
          , func_retirement_day(jubun) AS 정년퇴직일
    from employees;
    -- 107개 행 
    -- ex) 100	Steven King	6010151234567	남	64	22/02/28
    
    
    -- --- [퀴즈] ---
    /*
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
        
    -->>>>> 첫번째 풀이 <<<< ---     
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
    
    
    
    --->>>> 함수를 사용 두번째 풀이 <<<<----
    -- 사원번호, 사원명, 주민번호, 성별, 현재나이, 월급, 입사일자, 정년퇴직일, 정년까지근무개월수, 퇴직금 을 나타내세요.
    
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,jubun AS 주민번호 
          ,func_gender_2(jubun) AS 성별
          ,func_age_2(jubun) AS 현재나이
          , nvl(salary + (salary * commission_pct), salary) AS 월급
          , hire_date AS 입사일자
          , func_retirement_day(jubun) AS 정년퇴직일
          , trunc(months_between(func_retirement_day(jubun), hire_date)) AS 정년까지금누개월수 
          , to_char(trunc(trunc(months_between(func_retirement_day(jubun), hire_date)) / 12) * nvl(salary + (salary * commission_pct), salary), '9,999,999')  AS 퇴직금
    from employees;
    -- 107개 행 
    -- ex) 100	Steven King	6010151234567	남	64	24000	03/06/17	22/02/28	224	   432,000
    
    
    
    -------- ******* 생성되어진 함수의 소스를 조회해봅시다 ******* ----------
    
    -- FUNC_AGE 조회
    select *
    from user_source
    where type = 'FUNCTION' and name = 'FUNC_AGE';
    /*
    "function func_age
"
"        (p_jubun IN varchar2)   -- varchar(13) 와 같이 자리수를 쓰면 오류이다!!!!!!!!!!!
"
"        return     number     -- varchar(6) 와 같이 자리수를 쓰면 오류이다!!!!!!!!!!!
"
"        is
"
"            v_result   number(3);   --- 여기에는 반드시 자리수를 써야한다.
"
"        begin
"
"            select extract(year from sysdate) - ( case when substr(p_jubun, 7, 1) in ('1','2') then 1900 else 2000 end + to_number( substr(p_jubun, 1, 2) )  ) + 1
"
"                   INTO 
"
"                   v_result
"
"            from dual;
"
"
"
"            return v_result;
"
        end func_age;
    */
    
    -- FUNC_RETIREMENT_DAY 조회
    select *
    from user_source
    where type = 'FUNCTION' and name = 'FUNC_RETIREMENT_DAY';
    /*
    "function func_retirement_day
"
"    (p_jubun  IN  varchar2)
"
"    return date
"
"    is
"
"        v_retirement_day date;
"
"    begin
"
"
"
"        -- 63세가 되는 년도 (last_day 는 마지막 날을 보여줌)
"
"        --to_date()   -- 형변환 함수
"
"        select  last_day(to_date(to_char(add_months(sysdate, (63- func_age(p_jubun))*12), 'yyyy') || 
"
"                                 case when substr(p_jubun,3,2) between '03' and '08' then '-08-01' else '-02-01' end
"
"                              , 'yyyy-mm-dd'))
"
"        into v_retirement_day
"
"        from dual;
"
"
"
"        return v_retirement_day;
"
    end func_retirement_day;
    */
    
    
    
    
    
    -----[퀴즈] 아래와 같이 나오도록 프로시저(pcd_employees_info) 를 생성하세요
    --         성별과 나이는 위에서 만든 함수를 사용하세요
    
    exec pcd_employees_info(101);   -- 여기서 숫자 101은 사원번호이다.
    /*
        결과물
        ----------------------------------------------------------------
        사원번호   부서명   사원명   입사일자   성별   나이
        ----------------------------------------------------------------
         101      ...     ...     ...     ...    ...
         
         
         ---------------------------------------    ---------------------
        사원번호  사원명   입사일자   성별   나이             부서명 
         ---------------------------------------    ---------------------
                     employees 테이블                  departments 테이블
    */
    
    -- 과정 1
    WITH
    E AS
    (
        select employee_id
               ,first_name || ' ' || last_name AS ENAME
               ,hire_date
               ,func_gender(jubun) AS GENDER
               ,func_age(jubun) AS AGE
               ,department_id
        from employees
        where employee_id = 101   --- 101만 보여줘라
    )
    select E.employee_id, nvl(D.department_name, ' '), E.ENAME, E.hire_date, E.GENDER, E.AGE
    from E LEFT JOIN departments D   --NULL 값도 나오게 하기 위해 LEFT
    ON E.department_id = D.department_id;
    -- 101	Executive	Neena Kochhar	05/09/21	남	39
    
    
    -- 과정을 통한 결과물 
    create or replace procedure pcd_employees_info
    (p_employee_id IN employees.employee_id%type)
    is
       v_employee_id       employees.employee_id%type;
       v_department_name   departments.department_name%type;
       v_ENAME             varchar2(30); 
       v_hire_date         varchar2(10); 
       v_GENDER            Nvarchar2(1);
       v_AGE               number(3); 
       
    begin
        WITH
        E AS
        (
            select employee_id
                   ,first_name || ' ' || last_name AS ENAME
                   ,hire_date
                   ,func_gender(jubun) AS GENDER
                   ,func_age(jubun) AS AGE
                   ,department_id
            from employees
            where employee_id = p_employee_id   --- 101만 보여줘라
        )
        select E.employee_id, nvl(D.department_name, '대기발령'), E.ENAME, to_char(E.hire_date, 'yyyy-mm-dd'), E.GENDER, E.AGE
               INTO
               v_employee_id, v_department_name, v_ENAME, v_hire_date, v_GENDER, v_AGE
        from E LEFT JOIN departments D   --NULL 값도 나오게 하기 위해 LEFT
        ON E.department_id = D.department_id;
        
        
        dbms_output.put_line( lpad('-', 50, '-'));
        dbms_output.put_line('사원번호   부서명   사원명   입사일자   성별   나이');
        dbms_output.put_line( lpad('-', 50, '-'));
        
        dbms_output.put_line( v_employee_id || ' ' || 
                              v_department_name || ' ' ||
                              v_ENAME || ' ' ||
                              v_hire_date || ' ' ||
                              v_GENDER || ' ' ||
                              v_AGE);
    end pcd_employees_info;
    -- Procedure PCD_EMPLOYEES_INFO이(가) 컴파일되었습니다.
    

    exec pcd_employees_info(101);   -- 여기서 숫자 101은 사원번호이다.
    /*
        --------------------------------------------------
        사원번호  부서명   사원명   입사일자  성별   나이
        --------------------------------------------------
        101 Executive Neena Kochhar 2005-09-21 남 39
    */
    
    exec pcd_employees_info(178);   -- 여기서 숫자 178은 사원번호이다.
    /*
        --------------------------------------------------
        사원번호  부서명   사원명   입사일자  성별   나이
        --------------------------------------------------
        178 대기발령 Kimberely Grant 2007-05-24 여 26
    */
    
    exec pcd_employees_info(337);   -- 여기서 숫자 337은 존재하지 않는 사원번호이다.
    /*
        오류 보고 - 
        ORA-01403: 데이터를 찾을 수 없습니다. ==> 프로시저에서 데이터(행)가 없으면 오류가 발생한다.
    */
    
    
    
    
    -- (데이터(행)가 없을 경우 해결책) --
    ---> 예외절(exceptction)처리를 해주면 된다
            
    create or replace procedure pcd_employees_info
   (p_employee_id  IN  employees.employee_id%type)
   is
      v_employee_id       employees.employee_id%type;
      v_department_name   departments.department_name%type;
      v_ename             varchar2(30);
      v_hire_date         varchar2(10);
      v_gender            Nvarchar2(1);
      v_age               number(3);
   
   begin
       WITH 
       E AS
       (
          select employee_id
               , first_name || ' ' || last_name AS ENAME
               , hire_date
               , func_gender(jubun) AS GENDER
               , func_age(jubun) AS AGE
               , department_id
          from employees
          where employee_id = p_employee_id
       )
       select E.employee_id, nvl(D.department_name, '대기발령') , E.ename, to_char(E.hire_date, 'yyyy-mm-dd'), E.gender, E.age
              INTO 
              v_employee_id, v_department_name, v_ename, v_hire_date, v_gender, v_age 
       from E LEFT JOIN departments D
       on E.department_id = D.department_id;
       
       dbms_output.put_line( lpad('-', 50, '-') );
       dbms_output.put_line( '사원번호  부서명   사원명   입사일자  성별   나이' );
       dbms_output.put_line( lpad('-', 50, '-') );
   
       dbms_output.put_line(v_employee_id || ' ' || 
                            v_department_name || ' ' || 
                            v_ename || ' ' || 
                            v_hire_date || ' ' || 
                            v_gender || ' ' || 
                            v_age);
   
       -- 예외절 처리 추가부분 
       EXCEPTION -- 대소문자 구분 X (데이터 없는 오류 처리해주기)
          WHEN   no_data_found  THEN  --- no_data_found 은 오라클에서 데이터가 존재하지 않을 경우에 발생하는 오류임.
          dbms_output.put_line('>> 사원번호 ' || p_employee_id || '은 존재하지 않습니다. <<');
   
   
   end pcd_employees_info;
    -- Procedure PCD_EMPLOYEES_INFO이(가) 컴파일되었습니다.


    -- 사원번호 101을 다시 한번 불러보자 
    exec pcd_employees_info(101);   -- 여기서 숫자 101은 사원번호이다.
    /*
        --------------------------------------------------
        사원번호  부서명   사원명   입사일자  성별   나이
        --------------------------------------------------
        101 Executive Neena Kochhar 2005-09-21 남 39
    */
    
    
    -- 다시한번 337 사원번호를 해보자 
    exec pcd_employees_info(337);   -- 여기서 숫자 337은 존재하지 않는 사원번호이다.
    -->> 사원번호 337은 존재하지 않습니다. <<

    
    
    
    
    
    
    ---------------- ===== **** 제어문 (if문) ***** ==== -----------------------
    /*
        ※ 형식
        
        if     조건1    then    실행문장1;
        elsif  조건2    then    실행문장2;
        elsif  조건3    then    실행문장3;            --- e 가 존재하지 않음 
        else                   실행문장4;
        end if;
    */
    
    
    -- 오류 번호 확인해보기 --
    delete from departments;
    /*
        오류 보고 -
        ORA-02292: 무결성 제약조건(HR.EMP_DEPT_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다
        -02292 이 오류 번호 이다.
    */
    
    update employees set employee_id = 101
    where employee_id = 102;
    /*
        오류 보고 -
        ORA-00001: 무결성 제약 조건(HR.EMP_EMP_ID_PK)에 위배됩니다
        -- 00001 각각 오류 번호가 다르다. 
    */
    
    
    
    -- 성별을 구하는 함수 다르게 해보기 
    create or replace function func_age_3
    (p_jubun IN varchar2) 
    return number
    is
        v_year        number(4);
        v_genderNum   varchar2(1) := substr(p_jubun,7,1);  
        -- v_genderNum 에는 '1' 또는 '2' 또는 '3' 또는 '4'가 들어올 것이다.  
        
        v_age   number(3);
        
        error_jubun_length     EXCEPTION; -- 오류 잡기위해 EXCEPTION은 소문자도 상관 X
        -- error_jubun_length 은 사용자가 정의하는 예외절(Exception)임을 선언한다.
        
        error_jubun_gender     EXCEPTION;
        
    begin
        if length(p_jubun) != 13 then RAISE error_jubun_length;   -- 길이가 13자가 아니라면은 오류를 띄우겠다!
        elsif  v_genderNum in ('1','2') then v_year := 1900;
        elsif  v_genderNum in ('3','4') then v_year := 2000; 
        else   RAISE  error_jubun_gender;
        end if;         -- 꼭 필요하다 if문을 닫기 위해서 
    
    
        v_age := extract( year from sysdate) - (v_year + to_number(substr(p_jubun,1,2))) + 1;
        
        return v_age;
        
        EXCEPTION 
            WHEN  error_jubun_length  THEN 
                  RAISE_APPLICATION_ERROR(-20001, '>> 주민번호의 길이가 13자리가 아닙니다. <<');
                  -- -20001 은 오류번호로써, 사용자가 정의해주는 EXCEPTION에 대해서는 오류 번호를 -20001부터 -20999 까지만 사용하도록 오라클에서 비워두웠다.
                  -- 사용자가 정의하는 오류번호는 -20001 에서 -20999 까지 할 수 있다. 
            WHEN  error_jubun_gender  THEN 
                  RAISE_APPLICATION_ERROR(-20002, '>> 주민번호의 7번째 값은 1,2,3,4 중에 하나이여야 합니다. <<');       
    end func_age_3;
    -- Function FUNC_AGE_3이(가) 컴파일되었습니다.

    
    
    
    
    -- 정상일때 
    select func_age_3('9010201234567'), func_age_3('0010204234567')
    from dual;
    -- 34	24
    
    
    -- 오류일때  (13자리가 아닐때)
    select func_age_3('901020123456')
    from dual;
    -- ORA-20001: >> 주민번호의 길이가 13자리가 아닙니다. <<
    -- ORA-06512: "HR.FUNC_AGE_3",  30행
    
    
    -- 오류일때 ( 주민번호 성별 시작 부분이 1,2,3,4 가 아닐때 )
    select func_age_3('9010207234567')
    from dual;
    -- ORA-20002: >> 주민번호의 7번째 값은 1,2,3,4 중에 하나이여야 합니다. <<
    -- ORA-06512: "HR.FUNC_AGE_3",  34행
    
    
    -- 데이터가 올바르게 들어갔는지 확인해보자 
    select employee_id AS 사원번호
          ,first_name || ' ' || last_name AS 사원명
          ,jubun AS 주민번호 
          ,func_age_3(jubun) AS 현재나이
    from employees;
    -- 107개 행 전부 나온다.
    
    
    
    
    
    
    --------------- ======= ***** 반복문 ****** ======= --------------------------
    /*
        반복문에는 종류가 3가지가 있다.
        
        1. 기본 LOOP 문
        2. for LOOP 문
        3. WHILE LOOP 문
    */
    
    
    --------------- ======= ***** 1. 기본 LOOP 문 ****** ======= --------------------------
    /*
        [문법]
        LOOP 
            반복해야할 실행문장;
        EXIT WHEN 탈출조건;    --- 탈출조건이 참 이라면 LOOP 를 탈출한다
        END LOOP;
    */
    
    -- 테이블 생성 
    create table tbl_looptest_1
    (bunho     number
    ,name      Nvarchar2(10)
    );
    -- Table TBL_LOOPTEST_1이(가) 생성되었습니다.


    ----- *** tbl_looptest_1 테이블에 행을 20000 개를 insert 해보겠습니다.
    create or replace procedure pcd_tbl_looptest_1_insert
    (p_name IN tbl_looptest_1.name%type
    ,p_count IN number )    --p_count 에 20000을 넣을 것이다
    is
        v_bunho tbl_looptest_1.bunho%type := 0;   --tbl_looptest_1테이블의 hunho 컬럼의 모든 타입을 쓰겠다/
                                                   -- 변수의 초기화!!!(변수에 값을 처음부터 넣어주기)
    begin
         LOOP 
            v_bunho := v_bunho +1;    --v_bunho 은 반복할 때 마다 1씩 증가한다.
            
        EXIT WHEN v_bunho > p_count;    --- 탈출조건이 참(20001 > 20000) 이라면 LOOP 를 탈출한다
        
          insert into tbl_looptest_1(bunho, name) values(v_bunho, p_name || v_bunho);
        
        END LOOP;
        
    end pcd_tbl_looptest_1_insert;
    --Procedure PCD_TBL_LOOPTEST_1_INSERT이(가) 컴파일되었습니다.

    
    
    exec pcd_tbl_looptest_1_insert ('홍길동', 20000);
    --PL/SQL 프로시저가 성공적으로 완료되었습니다.

    
    -- 20000이 나오는지 확인해보기 
    select *
    from tbl_looptest_1
    order by bunho asc;
    
    -- 한방에 한번 보기
    select count(*)
    from tbl_looptest_1; 
    --- 20000
    
    -- 취소하기 
    rollback;
    -- 롤백 완료 
    
    -- 값이 없는것을 확인할 수 있다.
    select *
    from tbl_looptest_1
    order by bunho asc;
    
    
    exec pcd_tbl_looptest_1_insert ('엄정화', 500);
    --PL/SQL 프로시저가 성공적으로 완료되었습니다.

    
    -- 엄정화가 500번이 나오는지 확인해보기 
    select *
    from tbl_looptest_1
    order by bunho asc;
    
    -- 취소하기 
    rollback;
    -- 롤백 완료
    
    
    
    
    
    ----- ***** 이름이 없는 익명 프로시저 (Anonymous Procedure) 로 tbl_looptest_1 테이블에 행을 20000개를 insert 해보겠습니다 ****-----
    
    declare
        v_bunho tbl_looptest_1.bunho%type := 0;   --tbl_looptest_1테이블의 hunho 컬럼의 모든 타입을 쓰겠다/
                                                   -- 변수의 초기화!!!(변수에 값을 처음부터 넣어주기)
        p_count    number := 20000; -- 변수의 초기화!!!
        p_name     Nvarchar2(3) := '이해리';
    begin
        LOOP 
            v_bunho := v_bunho +1;    --v_bunho 은 반복할 때 마다 1씩 증가한다.
            
        EXIT WHEN v_bunho > p_count;    --- 탈출조건이 참(20001 > 20000) 이라면 LOOP 를 탈출한다
        
          insert into tbl_looptest_1(bunho, name) values(v_bunho, p_name || v_bunho);
        
        END LOOP;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.


    -- 이해리 20000까지 반복되어 나온다.
    select *
    from tbl_looptest_1
    order by bunho asc;
    
    
    -- 한방에 한번 보기
    select count(*)
    from tbl_looptest_1; 
    --- 20000
    
    rollback;
    -- 롤백 완료
    
    
    
    
    
    --------------- ======= ***** 2. FOR LOOP 문 ****** ======= --------------------------
    /*
        [문법]
        
        FOR 변수 IN REVERSE 시작값..마지막값 LOOP      --REVERSE 는 생략 가능 
            반복해야할 실행문장;
        END LOOP;
    */

    
    select count(*)
    from tbl_looptest_1; 
    -- 0
    
    
    declare
        v_name Nvarchar2(3) := '강감찬';  -- 변수의 선언 및 초기화
    begin
        
        for i in 1..20000 loop --변수 i 에는 맨처음 1이 들어가고, 매번 1씩 증가된 값이 i에 들어가는데 20000까지 i에 들어간다. 
          insert into tbl_looptest_1(bunho, name) values(i, v_name||i); --즉, 20000번 반복하는 것이다.
        
        END LOOP;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    
    
    -- 강감찬 20000까지 반복되어 나온다.
    select *
    from tbl_looptest_1
    order by bunho asc;
    
    
    -- 한방에 한번 보기
    select count(*)
    from tbl_looptest_1; 
    --- 20000
    
    rollback;
    -- 롤백 완료
    
    
    -- 반대로 REVERSE 를 넣어주어 실행해보자
     declare
        v_name     Nvarchar2(3) := '유관순';   -- 변수의 선언 및 초기화
    begin
        
        for i in REVERSE 1..500 loop --변수 i 에는 맨처음 500이 들어가고, 매번 1씩 감소된 값이 i에 들어가는데 1까지 i에 들어간다. 
          insert into tbl_looptest_1(bunho, name) values(i, v_name || i); --즉, 500번 반복하는 것이다.
        
        END LOOP;
    end;
    
    
    -- 유관순 1까지 500번 반복되어 나온다.
    select *
    from tbl_looptest_1;
    
    
    -- 한방에 한번 보기
    select count(*)
    from tbl_looptest_1; 
    --- 500
    
    rollback;
    -- 롤백 완료
    
    
    
    --------------- ======= ***** 3. WHILE LOOP 문 ****** ======= --------------------------
    /*
        [문법]
        
        WHILE 조건 LOOP 
            반복해야할 실행문장;   -- 조건이 참이라면 실행함. 조건이 거짓이되어지면 반복문을 빠져나간다.
        END LOOP;
        
        WHILE NOT 조건 LOOP 
            반복해야할 실행문장;   -- 조건이 참이라면 반복문을 빠져나간다.
        END LOOP;
    */
    
    declare
        v_name     Nvarchar2(3) := '이순신';   -- 변수의 선언 및 초기화
        v_cnt      number :=1;                -- 변수의 선언 및 초기화
    begin
        while not( v_cnt > 20000) loop       --(탈출조건) 탈출조건이 참이라면 전체가 거짓이 되어지므로while 반복문을 빠져나간다.
           insert into tbl_looptest_1(bunho, name) values(v_cnt, v_name || v_cnt); 
           v_cnt := v_cnt +1;
        end loop;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.

      -- 이순신 20000까지 반복되어 나온다.
    select *
    from tbl_looptest_1
    order by bunho asc;
    
    
    -- 한방에 한번 보기
    select count(*)
    from tbl_looptest_1; 
    --- 20000
    
    rollback;
    -- 롤백 완료
    
    
    
    -------------------------------------------------------------------------------
    -- 퀴즈 전 
    -- 테이블 생성
    create table tbl_member_test_01
    (userid         varchar2(20)
    ,passwd         varchar2(20)   not null
    ,name           Nvarchar2(10)  not null
    ,constraint     PK_tbl_member_test_01_userid primary key(userid)
    );
    -- Table TBL_MEMBER_TEST_01이(가) 생성되었습니다.

     -----------------------------------[퀴즈]---------------------------------------
     --[퀴즈] TBL_MEMBER_TEST_01 테이블에 insert 해주는 pcd_tbl_member_test_01_insert 라는 프로시저를 작성하세요
     
    ------------------------------------------------------------------------------------------------------
     --내가 푼 풀이
    ------------------------------------------------------------------------------------------------------
    create or replace procedure pcd_tbl_member_test_01_insert
    (v_userid  IN  tbl_member_test_01.userid%type
    ,v_passwd  IN  tbl_member_test_01.passwd%type
    ,v_name    IN  tbl_member_test_01.name%type
    )
    is
    
        passwd_check   number := 1;
        passwd_check_sp   number := 1;
        passwd_length number := length(v_passwd);
        
        error_passwd_length_noword     EXCEPTION;
        
    begin
       
        for i IN 1..passwd_length  loop       -- 조건이 참이라면 실행함. 조건이 거짓이되어지면 반복문을 빠져나간다.
            if ascii(substr(v_passwd,i, 1)) between 48 and 57 then passwd_check := 0;
            elsif ascii(substr(v_passwd,i, 1)) between 97 and 122 then passwd_check := 0;
            elsif ascii(substr(v_passwd,i, 1)) between 65 and 90 then passwd_check := 0;
            else
            passwd_check_sp := 0;
            end if;
        END LOOP;
        if passwd_length between 5 and 10 
        then if (passwd_check = 0 and passwd_check_sp = 0)
            then insert into tbl_member_test_01(userid, passwd, name) values(v_userid, v_passwd, v_name); 
            else RAISE error_passwd_length_noword;
            end if;
        else RAISE error_passwd_length_noword;
        end if;
        
         EXCEPTION 
            WHEN  error_passwd_length_noword  THEN 
                  RAISE_APPLICATION_ERROR(-20003, '>> 암호는 최소 5들자 이상 10글자 이하이면서 영문자, 숫자, 특수기호가 혼합되어져야만 합니다. <<');
                  -- -20001 은 오류번호로써, 사용자가 정의해주는 EXCEPTION에 대해서는 오류 번호를 -20001부터 -20999 까지만 사용하도록 오라클에서 비워두웠다.
                  -- 사용자가 정의하는 오류번호는 -20001 에서 -20999 까지 할 수 있다. 
                  
    end pcd_tbl_member_test_01_insert;
     -- Procedure PCD_TBL_MEMBER_TEST_01_INSERT이(가) 컴파일되었습니다.

    ------------------------------------------------------------------------------------------------------
     --강사님이 푼 풀이
    ------------------------------------------------------------------------------------------------------
    create or replace procedure pcd_tbl_member_test_01_insert
    (p_userid   IN   tbl_member_test_01.userid%type
    ,p_passwd  IN  tbl_member_test_01.passwd%type
    ,p_name    IN  tbl_member_test_01.name%type
    )
    is 
        v_length    number(2);
        v_ch        varchar2(1);
        v_flag_alphabet   number(1) := 0;
        v_flag_number   number(1) := 0;
        v_flag_special   number(1) := 0;
        error_passwd   exception;  
    begin
        v_length := length(p_passwd);
        
        if(v_length < 5 or v_length > 10) then raise error_passwd;
        else
            for i in 1..v_length loop
                v_ch := substr(p_passwd,i,1);
                
                if( (v_ch between 'A' and 'Z') OR (v_ch between 'a' and 'z'))  then     -- 영문자 이라면
                     v_flag_alphabet := 1;
                elsif(v_ch between '0' and '9') then    -- 숫자이라면
                     v_flag_number := 1;
                else v_flag_special := 1;      -- 특수문자이라면 
                end if;
            end loop;
            
            if(v_flag_alphabet * v_flag_number * v_flag_special = 1) then
                 insert into tbl_member_test_01(userid, passwd, name) values(p_userid, p_passwd, p_name); 
            else
                raise error_passwd;
            end if;
        end if;
        
        EXCEPTION 
            when error_passwd then 
                RAISE_APPLICATION_ERROR(-20003, '>> 암호는 최소 5들자 이상 10글자 이하이면서 영문자, 숫자, 특수기호가 혼합되어져야만 합니다. <<');
    end pcd_tbl_member_test_01_insert;
    -- Procedure PCD_TBL_MEMBER_TEST_01_INSERT이(가) 컴파일되었습니다.


    -- insert 가 되는지 확인해보기
    exec pcd_tbl_member_test_01_insert('hongkd', 'qwer1234$', '홍길동'); --> 정상적으로 insert 되어진다. 
    exec pcd_tbl_member_test_01_insert('eomjh', 'a3$', '엄정화');       ---> 오류메시지 -20003 '암호는 최소 5들자 이상 10글자 이하이면서 영문자, 숫자, 특수기호가 혼합되어져야만 합니다.' 이것이 뜬다 그러므로 insert가 안되어진다.
    exec pcd_tbl_member_test_01_insert('eomjh', 'abcd1234', '엄정화');  ---> 오류메시지 -20003 '암호는 최소 5들자 이상 10글자 이하이면서 영문자, 숫자, 특수기호가 혼합되어져야만 합니다.' 이것이 뜬다 그러므로 insert가 안되어진다.
    
    
    -- 출력이 잘 되는지 확인해보기  
    select *
    from tbl_member_test_01;
    -- hongkd	qwer1234$	홍길동 
     
     -- 롤백 
     rollback;
     
     
     -- 테이블 삭제하는법 (한번 검사하고 다시 똑같은 거 검색하려면 삭제하고 다시 해야함 )
     drop table tbl_member_test_01 purge;
     
    
    
    -------------------------------------------------------------------------------------------------------
    -------------- **** 사용자 정의 예외절(EXCEPTION) **** ------------------------
    /*
        예외절 = 오류절
        
        ※ 형식
        
        exception 
            when 익셉션이름1 [OR 익셉션이름2]  then      -- []는 생략 가능
                 실행문장_A;
                 실행문장_A2;   --- 여러개 사용가능, 1개도 가능 
                 
            when 익셉션이름3 [OR 익셉션이름4]  then
                 실행문장_B;
                 
            when others  then  
                 실행문장_C;
    */
   
   
/*
         [퀴즈] 
          === tbl_member_test01 테이블에 insert 할 수 있는 요일명과 시간을 제한해 두겠습니다. ===
        
          tbl_member_test01 테이블에 insert 할 수 있는 요일명은 월,화,수,목,금 만 가능하며
          또한 월,화,수,목,금 중에 오전 11시 부터 오후 5시 이전까지만(오후 5시 정각은 안돼요) insert 가 가능하도록 하고자 한다.
          만약에 insert 가 불가한 요일명(토,일)이거나 불가한 시간대에 insert 를 시도하면 
          '영업시간(월~금 11:00 ~ 16:59:59 까지) 아니므로 입력불가함!!' 이라는 오류메시지가 뜨도록 한다. 
*/ 

     -- 개념을 잡을때 해보는게 좋을듯 
    select to_char(sysdate, 'd') in ('1', '7')
    from dual;
    
    select to_char(sysdate, 'hh24:mi:ss') not between '11:00:00' and '16:59:59'
    from dual


    -- 나만의 정답 코드
    create or replace procedure pcd_tbl_member_test_01_insert
    (v_userid  IN  tbl_member_test_01.userid%type
    ,v_passwd  IN  tbl_member_test_01.passwd%type
    ,v_name    IN  tbl_member_test_01.name%type
    )
    is
    
        passwd_check   number := 1;
        passwd_check_sp   number := 1;
        passwd_length number := length(v_passwd);
        
        error_passwd_length_noword     EXCEPTION;
        error_runtime                  EXCEPTION;
        
    begin
       
        if(to_char(sysdate, 'd') in('1','7')) OR (to_char(sysdate, 'hh24:mi:ss') NOT between '14:00:00' and '16:59:59') then raise error_runtime; 
        else

            for i IN 1..passwd_length  loop       -- 조건이 참이라면 실행함. 조건이 거짓이되어지면 반복문을 빠져나간다.
                if ascii(substr(v_passwd,i, 1)) between 48 and 57 then passwd_check := 0;
                elsif ascii(substr(v_passwd,i, 1)) between 97 and 122 then passwd_check := 0;
                elsif ascii(substr(v_passwd,i, 1)) between 65 and 90 then passwd_check := 0;
                else
                passwd_check_sp := 0;
                end if;
            END LOOP;
            if passwd_length between 5 and 10 
            then if (passwd_check = 0 and passwd_check_sp = 0)
                then insert into tbl_member_test_01(userid, passwd, name) values(v_userid, v_passwd, v_name); 
                else RAISE error_passwd_length_noword;
                end if;
            else RAISE error_passwd_length_noword;
            end if;
        end if;
        
         EXCEPTION 
            WHEN  error_passwd_length_noword  THEN 
                  RAISE_APPLICATION_ERROR(-20003, '>> 암호는 최소 5들자 이상 10글자 이하이면서 영문자, 숫자, 특수기호가 혼합되어져야만 합니다. <<');
                  -- -20001 은 오류번호로써, 사용자가 정의해주는 EXCEPTION에 대해서는 오류 번호를 -20001부터 -20999 까지만 사용하도록 오라클에서 비워두웠다.
                  -- 사용자가 정의하는 오류번호는 -20001 에서 -20999 까지 할 수 있다. 
            WHEN  error_runtime THEN
                 RAISE_APPLICATION_ERROR(-20004, '영업시간(월~금 11:00 ~ 16:59:59 까지) 아니므로 입력불가함!!' );
                  
    end pcd_tbl_member_test_01_insert;
    -- Procedure PCD_TBL_MEMBER_TEST_01_INSERT이(가) 컴파일되었습니다.


    ------------------------------------------------------------------------------------------------------
     --강사님이 푼 풀이
    ------------------------------------------------------------------------------------------------------
    create or replace procedure pcd_tbl_member_test_01_insert
    (p_userid   IN   tbl_member_test_01.userid%type
    ,p_passwd  IN  tbl_member_test_01.passwd%type
    ,p_name    IN  tbl_member_test_01.name%type
    )
    is 
        v_length    number(2);
        v_ch        varchar2(1);
        v_flag_alphabet   number(1) := 0;
        v_flag_number   number(1) := 0;
        v_flag_special   number(1) := 0;
        error_daytime  exception;
        error_passwd   exception;  
    begin
        
        -- 입력(insert)이 불가한 요일명과 시간대를 알아봅니다. --
        if(to_char(sysdate, 'd') in('1','7') OR  -- to_char(sysdate, 'd') ==> '1'(일) '2'(월) '3'(화) '4'(수) '5'(목) '6'(금) '7'(토)
           to_char(sysdate, 'hh24') < '11' OR to_char(sysdate, 'hh24') > '16' )  then
           raise error_daytime;
        else   -- 암호를 검사하겠다.
            
            v_length := length(p_passwd);
            
            if(v_length < 5 or v_length > 10) then raise error_passwd;
            else
                for i in 1..v_length loop
                    v_ch := substr(p_passwd,i,1);
                    
                    if( (v_ch between 'A' and 'Z') OR (v_ch between 'a' and 'z'))  then     -- 영문자 이라면
                         v_flag_alphabet := 1;
                    elsif(v_ch between '0' and '9') then    -- 숫자이라면
                         v_flag_number := 1;
                    else v_flag_special := 1;      -- 특수문자이라면 
                    end if;
                end loop;
                
                if(v_flag_alphabet * v_flag_number * v_flag_special = 1) then
                     insert into tbl_member_test_01(userid, passwd, name) values(p_userid, p_passwd, p_name); 
                else
                    raise error_passwd;
                end if;
            end if;
        end if;
        EXCEPTION 
            when error_passwd then 
                RAISE_APPLICATION_ERROR(-20003, '>> 암호는 최소 5들자 이상 10글자 이하이면서 영문자, 숫자, 특수기호가 혼합되어져야만 합니다. <<');
            WHEN  error_daytime THEN
                 RAISE_APPLICATION_ERROR(-20004, '영업시간(월~금 11:00 ~ 16:59:59 까지) 아니므로 입력불가함!!' );
    end pcd_tbl_member_test_01_insert;
    -- Procedure PCD_TBL_MEMBER_TEST_01_INSERT이(가) 컴파일되었습니다.



    -- 확인을 해보자 
    exec pcd_tbl_member_test_01_insert('lee22ssds', 'qwer!!11', '이순신');
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.


    select * FROM tbl_member_test_01;
    -- 영업시간이 맞지 않기 때문에 아무것도 나오지 않음 
    -- 11시일때는 lee22ssds	qwer!!11	이순신
    
    -- 롤백완료 
    rollback;
    
    
    
    ---- ==== *** 오라클에서는 배열이 없습니다만 배열처럼 사용되어지는 table 타입 변수가 있습니다 *** ====  -------
    --            그래서 table 타입 변수를 사용하여 자바의 배열처럼 사용합니다.  --
    
    
    -- 틀린 풀이
    create or replace procedure pcd_employees_info_deptid
    (p_department_id IN employees.department_id%type)
    is
       v_department_id     employees.department_id%type;
       v_employee_id       employees.employee_id%type;
       v_department_name   departments.department_name%type;
       v_ENAME             varchar2(30); 
       v_hire_date         varchar2(10); 
       v_GENDER            Nvarchar2(1);
       v_AGE               number(3); 
       
    begin
        
        WITH
        E AS
        (
            select employee_id
                   ,first_name || ' ' || last_name AS ENAME
                   ,hire_date
                   ,func_gender(jubun) AS GENDER
                   ,func_age(jubun) AS AGE
                   ,department_id
            from employees
            where department_id = p_department_id   
            --where department_id is NULL;  --> NULL인 킴벨리를 출력할 때 사용한다.
        )
        select E.department_id, nvl(D.department_name, '대기발령'), E.employee_id, E.ENAME, to_char(E.hire_date, 'yyyy-mm-dd'), E.GENDER, E.AGE
               INTO
               v_department_id, v_department_name, v_employee_id, v_ENAME, v_hire_date, v_GENDER, v_AGE
        from E LEFT JOIN departments D   --NULL 값도 나오게 하기 위해 LEFT
        ON E.department_id = D.department_id;
        
        
        dbms_output.put_line( lpad('-', 50, '-'));
        dbms_output.put_line('부서번호  부서명  사원번호  사원명   입사일자   성별   나이');
        dbms_output.put_line( lpad('-', 50, '-'));
        
        dbms_output.put_line( v_department_id || ' ' ||
                              v_department_name || ' ' ||
                              v_employee_id || ' ' || 
                              v_ENAME || ' ' ||
                              v_hire_date || ' ' ||
                              v_GENDER || ' ' ||
                              v_AGE);
                              
        -- 예외절 처리 추가부분 
       EXCEPTION -- 대소문자 구분 X (데이터 없는 오류 처리해주기)
          WHEN   no_data_found  THEN  --- no_data_found 은 오라클에서 데이터가 존재하지 않을 경우에 발생하는 오류임.
          dbms_output.put_line('>> 부서번호 ' || p_department_id || '은 존재하지 않습니다. <<');
    end pcd_employees_info_deptid;
    -- Procedure PCD_EMPLOYEES_INFO_DEPTID이(가) 컴파일되었습니다.

    exec pcd_employees_info_deptid(10);
    /*
        --------------------------------------------------
        부서번호  부서명  사원번호  사원명          입사일자   성별   나이
        --------------------------------------------------
        10 Administration 200 Jennifer Whalen 2003-09-17 여 46
    */
    
    exec pcd_employees_info_deptid(888);
    -- >> 부서번호 888은 존재하지 않습니다. <<

    exec pcd_employees_info_deptid(30);
    -- 오류 보고 - ORA-01422: 실제 인출은 요구된 것보다 많은 수의 행을 추출합니다
    /*
        이유 30번 부서에 근무하는 직원수는 6명 이다.
        결과물에는 6개의 행이 나와야 하는데 프로시저에서 select 되어진 컬럼의 값을 담을 변수(v_department_id, v_department_name, v_employee_id, v_ENAME, v_hire_date, v_GENDER, v_AGE)는
        데이터 값을 1개 밖에 담지 못하므로 위와 같은 오류가 발생한다.
    */
    
                        ---->>>>>>>>>>> NULL 처리 하려면 <<<<<<<<<<<<------
                        /*
                            시간남을때 NULL 처리해보고 싶으신분은 참고하세용
                            변수에 임의의 NUMBER 변수 만들고
                            BEGIN에
                            if p_department_id is null 변수 := -999;
                                    else 변수 := p_department_id;
                            end if; 으로 NULL 값일때 -999 아니면 파라미터 입력값 넣어준 후
                            
                            WHERE절에
                            where nvl(department_id, -999) =  변수
                            이렇게 넣어주면 파라미터에 NULL 입력했을때 출력이 되네요
                        */
    
    
    -- 원래 나와야 하는 결과 
    select employee_id
    from employees
    where department_id = 30;
    /*
        -------------
         EMPLOYEE_ID
        -------------
         |   114   |
        -------------    
         |   115   |
        -------------
         |   116   |
        -------------    
         |   117   |
        -------------    
         |   118   |
        -------------    
         |   119   |
        -------------
        
        위의 모양은 자바에서 사용되던 배열의 모양을 90도 회전한 것과 같다.
        그래서 오라클에서는 자바의 1차원 배열처럼 컬럼을 1개만 가지는 table 타입 변수를 사용하여 쓴다.
        
    */
    
    -- 정답 풀이 (이것은 잘 사용하지는 않는다) --> CURSOR를 많이 사용한다.
    
    -- ***( 위에서 만든 pcd_employees_info_deptid 을 올바르게 작동하도록 해결하기) *** --
    create or replace procedure pcd_employees_info_deptid
   (p_department_id  IN  employees.department_id%type)
   is
      type  department_id_type
      is table of employees.department_id%type index by binary_integer; -- index y binary_integer 꼭써야한다.
      
      type  department_name_type
      is table of departments.department_name%type index by binary_integer;  -- index y binary_integer 꼭써야한다.
      
      type  employee_id_type
      is table of employees.employee_id%type index by binary_integer;  -- index y binary_integer 꼭써야한다.
      
      type  ename_type
      is table of varchar2(30) index by binary_integer;  -- index y binary_integer 꼭써야한다.
      
      type  hire_date_type
      is table of varchar2(10) index by binary_integer;  -- index y binary_integer 꼭써야한다.
      
      type  gender_type
      is table of Nvarchar2(1) index by binary_integer;  -- index y binary_integer 꼭써야한다.
      
      type  age_type
      is table of number(3) index by binary_integer;  -- index y binary_integer 꼭써야한다.
      
      v_department_id     department_id_type;
      v_department_name   department_name_type;
      v_employee_id       employee_id_type;
      v_ename             ename_type;
      v_hire_date         hire_date_type;
      v_gender            gender_type;
      v_age               age_type;
      
      i  binary_integer  := 0;   
      /*
         i 가 마치 배열의 방번호 용도 처럼 쓰인다.
         그런데 자바에서 배열의 시작은 0 번 부터 시작하지만
         오라클은 1 번 시작한다.
      */
      
   begin
      
      FOR v_rcd IN ( WITH 
                     E AS
                     (
                       select employee_id
                            , first_name || ' ' || last_name AS ENAME
                            , hire_date
                            , func_gender(jubun) AS GENDER
                            , func_age(jubun) AS AGE
                            , department_id
                       from employees
                       where department_id = p_department_id 
                     )
                     select E.department_id
                          , nvl(D.department_name, '대기발령') AS department_name 
                          , E.employee_id, E.ename
                          , to_char(E.hire_date, 'yyyy-mm-dd') AS hire_date
                          , E.gender, E.age
                     from E LEFT JOIN departments D
                     on E.department_id = D.department_id ) LOOP
      
             i := i+1; 
      
             v_department_id(i) := v_rcd.department_id;
             v_department_name(i) := v_rcd.department_name;
             v_employee_id(i) := v_rcd.employee_id;
             v_ename(i) := v_rcd.ename;
             v_hire_date(i) := v_rcd.hire_date;
             v_gender(i) := v_rcd.gender;
             v_age(i) := v_rcd.age;
      
      END LOOP;
        
        -- select 된것이 6개이 때문에 i는 6이 나올것이다
        dbms_output.put_line('>> 확인용 i ' || i );
        
        if(i = 0) then 
            raise no_data_found;    --- 값이 없다는 오류를 띄우자 
        else
            dbms_output.put_line( lpad('-', 50, '-'));
            dbms_output.put_line('부서번호  부서명  사원번호  사원명   입사일자   성별   나이');
            dbms_output.put_line( lpad('-', 50, '-'));
            
            for k in 1..i loop
                dbms_output.put_line( v_department_id(k) || ' ' ||
                                      v_department_name(k) || ' ' ||
                                      v_employee_id(i) || ' ' ||
                                      v_ename(i) || ' ' ||
                                      v_hire_date(i) || ' ' ||
                                      v_gender(i) || ' ' ||
                                      v_age(i) 
                                     );
            end loop;
            
        end if;
        
        exception
            when no_data_found then  -- no_data_found 은 오라클에서 데이터가 존재하지 않을 경우 발생하는 오류임.
                dbms_output.put_line('>> 부서번호 ' || p_department_id || '은 존재하지 않습니다. <<');
   end pcd_employees_info_deptid;
   --Procedure PCD_EMPLOYEES_INFO_DEPTID이(가) 컴파일되었습니다.



    -- 확인하기 
    exec pcd_employees_info_deptid(888);
    -- >> 확인용 i 0
    -- >> 부서번호 888은 존재하지 않습니다. <<
    
    -- 부서번호 30번 해보기 
    exec pcd_employees_info_deptid(30);
    /*
        >> 확인용 i 6
        --------------------------------------------------
        부서번호  부서명  사원번호  사원명   입사일자   성별   나이
        --------------------------------------------------
        30 Purchasing 119 Karen Colmenares 2007-08-10 남 45
        30 Purchasing 119 Karen Colmenares 2007-08-10 남 45
        30 Purchasing 119 Karen Colmenares 2007-08-10 남 45
        30 Purchasing 119 Karen Colmenares 2007-08-10 남 45
        30 Purchasing 119 Karen Colmenares 2007-08-10 남 45
        30 Purchasing 119 Karen Colmenares 2007-08-10 남 45

    */
    
    
    
    --------------------------------------------------------------------------------------------
    -------------------  ==== **** CURSOR *** ==== --------------------------------
    --!!!!!!!!!!!!!!!!!!!!!!!! 중요! 가장 많이 사용함 !!!!!!!!!!!-------------------------------
    
    /*
        PL/SQL 에서 SELECT 되어져 나오는 행의 개수가 2개 이상인 경우에는 
        위에서 한 것 처럼 table 타입의 변수를 사용하여 나타낼 수 있고,
        또는 CURSOR 를 사용하여 나타낼 수 있다.
        table 타입의 변수를 사용하는 것 보다 CURSOR를 사용하는 것이 더 편하므로 
        대부분 CURSOR를 많이 사용한다.
    */
    
    
    
                    ------ ***** 명시적 CURSOR 만들기 *****-----
    /*
        ※ 형식
        
        1 단계 ==> CURSOR 의 선언(정의)
        
           CURSOR 커서명
           IS
           SELECT 문;
           
        2 단계 ==> CURSOR 의 OPEN 
           OPEN 커서명;
           
        3 단계 ==> CURSOR 의 FETCH
                  (FETCH 란? SELECT 되어진 결과물을 끄집어 내는 작업을 말한다.) 한행, 한행 끄집어 내자 
        
          FETCH 커서명 INTO 변수;
        
        4단계 ==> CURSOR 의 CLOSE 
        
          CLOSE 커서명;
    */
    
    /*
        ※ ==== 커서의 속성변수 ==== ※

         1. 커서명%ISOPEN   ==> 커서가 OPEN 되어진 상태인가를 체크하는 것.
                               만약에 커서가 OPEN 되어진 상태이라면 TRUE.
        
         2. 커서명%FOUND    ==> FETCH 된 레코드(행)이 있는지 체크하는 것.
                               만약에 FETCH 된 레코드(행)이 있으면 TRUE.
        
         3. 커서명%NOTFOUND ==> FETCH 된 레코드(행)이 없는지 체크하는 것.
                               만약에 FETCH 된 레코드(행)이 없으면 TRUE.
        
         4. 커서명%ROWCOUNT ==> 현재까지 FETCH 된 레코드(행)의 갯수를 반환해줌.
    
    */
        
    -- 정답 풀이 ==> CURSOR를 사용
    
    -- ***( 이제는 CURSOR 를 사용하여 프로시저를 만들어 보겠습니다.) *** --
    create or replace procedure pcd_employees_info_deptid_cursor
   (p_department_id  IN  employees.department_id%type)
   is
      --1 단계 ==> CURSOR 의 선언(정의)
      CURSOR cur_empinfo
      IS
          WITH 
          E AS
          (
              select employee_id
            , first_name || ' ' || last_name AS ENAME
            , hire_date
            , func_gender(jubun) AS GENDER
            , func_age(jubun) AS AGE
            , department_id
            from employees
            where department_id = p_department_id 
            )
            select E.department_id
                 , nvl(D.department_name, '대기발령') AS department_name 
                 , E.employee_id, E.ename
                 , to_char(E.hire_date, 'yyyy-mm-dd') AS hire_date
                 , E.gender, E.age
                 from E LEFT JOIN departments D
                 on E.department_id = D.department_id;
      
      v_department_id         employees.department_id%type;
      v_department_name       departments.department_name%type;      
      v_employee_id           employees.employee_id%type;
      v_ename                 varchar2(30);
      v_hire_date             varchar2(10);
      v_gender                Nvarchar2(1);
      v_age                   number(3);
      v_cnt                   number := 0;
      
   begin
      
      --2 단계 ==> CURSOR 의 OPEN 
      OPEN cur_empinfo;
      
      -- 3 단계 ==> CURSOR 의 FETCH
                 --(FETCH 란? SELECT 되어진 결과물을 끄집어 내는 작업을 말한다.)
        
      LOOP
    
          FETCH cur_empinfo   --패치를 받아온다
          INTO v_department_id, v_department_name, v_employee_id, v_ename, v_hire_date, v_gender, v_age;
      
          v_cnt := cur_empinfo%ROWCOUNT; -- fetch 되어진 행의 개수 
      
          EXIT WHEN cur_empinfo%NOTFOUND ; -- 더 이상 SELECT 되어진 행이 없다라면 반복문을 빠져나간다.
                                           -- 부서번호가 존재하지 않는 경우 
            
            
          if(v_cnt = 1) then  -- 맨처음만 반복  --> 패치 할때마다 올라감
          dbms_output.put_line( lpad('-', 50, '-'));
          dbms_output.put_line('부서번호  부서명  사원번호  사원명   입사일자   성별   나이');
          dbms_output.put_line( lpad('-', 50, '-'));  
          end if;
            
          dbms_output.put_line(v_department_id || ' ' || 
                               v_department_name || ' ' ||
                               v_employee_id || ' ' ||
                               v_ename || ' ' ||
                               v_hire_date || ' ' ||
                               v_gender || ' ' ||
                               v_age);
          
      END LOOP;
      
      -- 4 단계 -- CURSOR의 CLOSE
      CLOSE cur_empinfo;
      
     -- 존재하지 않는다 
     if(v_cnt = 0) then
          dbms_output.put_line('>> 부서번호 ' || p_department_id || '은 존재하지 않습니다. <<');
     
     -- 조회된 행의 개수 6개 
     else
        dbms_output.put_line(' ');
        dbms_output.put_line('>> 조회된 행의 개수 :  ' || v_cnt || '개 <<');
     end if;
      
      
      
   end pcd_employees_info_deptid_cursor;
   --Procedure PCD_EMPLOYEES_INFO_DEPTID_CURSOR이(가) 컴파일되었습니다.    
        
     
     -- 부서번호 10번 확인하기 
     exec pcd_employees_info_deptid_cursor(10);
     /*
        --------------------------------------------------
        부서번호  부서명  사원번호  사원명   입사일자   성별   나이
        --------------------------------------------------
        10 Administration 200 Jennifer Whalen 2003-09-17 여 46
         
        >> 조회된 행의 개수 :  1개 <<
     */
     
     -- 확인하기 
    exec pcd_employees_info_deptid_cursor(888);
    -- >> 부서번호 888은 존재하지 않습니다. <<
    
        
      -- 부서번호 30번 확인해보기 
    exec pcd_employees_info_deptid_cursor(30);
    /*
        --------------------------------------------------
        부서번호  부서명  사원번호  사원명   입사일자   성별   나이
        --------------------------------------------------
        30 Purchasing 114 Den Raphaely 2002-12-07 여 57
        30 Purchasing 115 Alexander Khoo 2003-05-18 남 63
        30 Purchasing 116 Shelli Baida 2005-12-24 남 64
        30 Purchasing 117 Sigal Tobias 2005-07-24 여 63
        30 Purchasing 118 Guy Himuro 2006-11-15 남 46
        30 Purchasing 119 Karen Colmenares 2007-08-10 남 45
         
        >> 조회된 행의 개수 :  6개 <<
    */   
        
        
                 /*
                    커서하면서 알게 된건데 CURSOR를 선언하기전에 IS에서 변수를 선언하면 그걸 커서에서 SELECT문 작성하는 중에 사용이 가능하네요
                    반대로 CURSOR 선언을 먼저하고 변수를 뒤에 선언하면 사용이 불가능합니다. 변수 선언 순서대로 시작할때 작동하는 것 같습니다.
                    
                    저는 그래서 (변수) NUMBER := NVL(p_department_id, -999);를 CURSOR 선언 전에 만들어서
                    커서내의 셀렉문에서 where nvl(department_id, -999) =  (변수) 이렇게 해서 NULL처리 해봤어요
                    
                    덧붙이면 위와 같은 개념인데 is에서 변수를 선언할때 먼저 선언한 변수를 이용한 연산이 가능한 것 같네요
                    제일 먼저 number 타입으로 a라는 변수를 10으로 만들었다면
                    그 다음줄에 b number := a*10 이렇게 입력하면 b에는 100이 들어가더라고요
                    들어온 파라미터가 제일 먼저 올라오고 변수를 선언하면서 그 이전에 만들어진 변수나 들어온 파라미터는 연산에 사용 가능한 것 같습니다. 자주는 안쓸것 같아요
                 */
        
     
                    ------ ***** FOR LOOP CURSOR 만들기 ***** -----
                           --(명시적 CURSOR보다 조금더 쉬움)

    /*
        FOR LOOP CURSOR 문을 사용하면 
        커서의 OPEN, 커서의 FETCH, 커서의 CLOSE 가 자동적으로 발생되어지기 때문에 
        우리는 커서의 OPEN, 커서의 FETCH, 커서의 CLOSE 문장을 기술할 필요가 없다
    */
                    
    /*
        ※ 형식
        
        FOR 변수명(select 되어진 행의 정보가 담기는 변수) IN 커서명 LOOP
            실행문장;
        END LOOP;
    */
    
    
    -- 정답 풀이 ==> FOR LOOP CURSOR를 사용
    
    -- ***( 이제는 FOR LOOP CURSOR 를 사용하여 프로시저를 만들어 보겠습니다.) *** --
    create or replace procedure pcd_employees_info_deptid_forcursor
   (p_department_id  IN  employees.department_id%type)
   is
      --1 단계 ==> CURSOR 의 선언(정의)
      CURSOR cur_empinfo
      IS
          WITH 
          E AS
          (
              select employee_id
            , first_name || ' ' || last_name AS ENAME
            , hire_date
            , func_gender(jubun) AS GENDER
            , func_age(jubun) AS AGE
            , department_id
            from employees
            where department_id = p_department_id 
            )
            select E.department_id
                 , nvl(D.department_name, '대기발령') AS department_name 
                 , E.employee_id, E.ename
                 , to_char(E.hire_date, 'yyyy-mm-dd') AS hire_date
                 , E.gender, E.age
                 from E LEFT JOIN departments D
                 on E.department_id = D.department_id;
      
      v_department_id         employees.department_id%type;
      v_department_name       departments.department_name%type;      
      v_employee_id           employees.employee_id%type;
      v_ename                 varchar2(30);
      v_hire_date             varchar2(10);
      v_gender                Nvarchar2(1);
      v_age                   number(3);
      v_cnt                   number := 0;
      
   begin
      
      --> 2단계  
      /*
          FOR 변수명(select 되어진 행의 정보가 담기는 변수) IN cur_empinfo LOOP
              실행문장;
          END LOOP;
      */
      FOR v_rcd IN cur_empinfo LOOP  -- cur_empinfo 자체가 select이므로 select 만큼(행) 반복한다.
          v_cnt := cur_empinfo%ROWCOUNT;  -- 읽어온 행의 개수가 얼마인가?
          
          -- 맨 처음에만 타이틀을 찍어주자 
          if(v_cnt = 1)  then
              dbms_output.put_line( lpad('-', 50, '-'));
              dbms_output.put_line('부서번호  부서명  사원번호  사원명   입사일자   성별   나이');
              dbms_output.put_line( lpad('-', 50, '-')); 
          end if;
          
          dbms_output.put_line( v_rcd.department_id || ' ' || 
                                v_rcd.department_name || ' ' ||
                                v_rcd.employee_id || ' ' ||
                                v_rcd.ename || ' ' ||
                                v_rcd.hire_date || ' ' ||
                                v_rcd.gender || ' ' ||
                                v_rcd.age);
          --> select 되어진 개수만큼 반복해라 
      END LOOP;
      
      
     -- 존재하지 않는다 
     if(v_cnt = 0) then
          dbms_output.put_line('>> 부서번호 ' || p_department_id || '은 존재하지 않습니다. <<');
     
     -- 조회된 행의 개수 몇개?? 
     else
        dbms_output.put_line(' ');
        dbms_output.put_line('>> 조회된 행의 개수 :  ' || v_cnt || '개 <<');
     end if;
      
   end pcd_employees_info_deptid_forcursor;
   --Procedure PCD_EMPLOYEES_INFO_DEPTID_FORCURSOR이(가) 컴파일되었습니다.

    
    -- 부서번호 10번 확인하기 
     exec pcd_employees_info_deptid_forcursor(10);
     /*
        --------------------------------------------------
        부서번호  부서명  사원번호  사원명   입사일자   성별   나이
        --------------------------------------------------
        10 Administration 200 Jennifer Whalen 2003-09-17 여 46
         
        >> 조회된 행의 개수 :  1개 <<
     */
     
     -- 확인하기 
    exec pcd_employees_info_deptid_forcursor(888);
    -- >> 부서번호 888은 존재하지 않습니다. <<
    
        
      -- 부서번호 30번 확인해보기 
    exec pcd_employees_info_deptid_forcursor(30);
    /*
        --------------------------------------------------
        부서번호  부서명  사원번호  사원명   입사일자   성별   나이
        --------------------------------------------------
        30 Purchasing 114 Den Raphaely 2002-12-07 여 57
        30 Purchasing 115 Alexander Khoo 2003-05-18 남 63
        30 Purchasing 116 Shelli Baida 2005-12-24 남 64
        30 Purchasing 117 Sigal Tobias 2005-07-24 여 63
        30 Purchasing 118 Guy Himuro 2006-11-15 남 46
        30 Purchasing 119 Karen Colmenares 2007-08-10 남 45
         
        >> 조회된 행의 개수 :  6개 <<
    */   
    
    
    --- 속도를 위해서는 그냥 SQL 보단 procedure 을 사용한다.!!!! ----
    
    
    
    
            ---------- ****** PACKAGE(패키지) ****** ----------------
    
---> PACKAGE(패키지)란? 여러개의 procedure 와 여러개의 Function 들의 묶음
    
---- 1. PACKAGE(패키지)의 선언하기 
create or replace package employee_pack
is
    -- employee_pack 패키지에 들어올 프로시저 또는 함수를 선언해준다.
    procedure pcd_emp_info(p_deptno IN employees.department_id%type);
    procedure pcd_dept_info(p_deptno IN departments.department_id%type);
    function func_age(p_jubun IN employees.jubun%type) return number;

end employee_pack;
-- Package EMPLOYEE_PACK이(가) 컴파일되었습니다.



---- 2. PACKAGE(패키지)의 Body(본문) 생성하기
 create or replace package body employee_pack
 is

    procedure pcd_emp_info(p_deptno IN employees.department_id%type)
    is
      cursor cur_empinfo 
      is
      WITH 
      E AS
      (
        select employee_id
             , first_name || ' ' || last_name AS ENAME
             , hire_date
             , func_gender(jubun) AS GENDER
             , func_age(jubun) AS AGE
             , department_id
        from employees
        where department_id = p_deptno 
      )
      select E.department_id
           , nvl(D.department_name, '대기발령') AS department_name 
           , E.employee_id, E.ename
           , to_char(E.hire_date, 'yyyy-mm-dd') AS hire_date
           , E.gender, E.age
      from E LEFT JOIN departments D
      on E.department_id = D.department_id;
      
      v_cnt  number := 0;
    
    begin
      FOR v_rcd IN cur_empinfo LOOP
          v_cnt := cur_empinfo%ROWCOUNT; -- 읽어온 행의 개수는 몇개인가?
          
          if(v_cnt = 1) then
              dbms_output.put_line( lpad('-', 60, '-') );
              dbms_output.put_line( '부서번호  부서명   사원번호   사원명   입사일자  성별   나이' );
              dbms_output.put_line( lpad('-', 60, '-') );
          end if;
          
          dbms_output.put_line( v_rcd.department_id || ' ' ||
                                v_rcd.department_name || ' ' ||
                                v_rcd.employee_id || ' ' ||
                                v_rcd.ename || ' ' ||
                                v_rcd.hire_date || ' ' ||
                                v_rcd.gender || ' ' ||
                                v_rcd.age );
      END LOOP;
      
      if (v_cnt = 0) then
          dbms_output.put_line('>> 부서번호 ' || p_deptno || '은 존재하지 않습니다. <<');
      else 
          dbms_output.put_line(' ');
          dbms_output.put_line('>> 조회된 행의 개수 : ' || v_cnt || '개 <<');
      end if; 
    end pcd_emp_info;
    
    
    procedure pcd_dept_info(p_deptno IN departments.department_id%type)
    is
        v_department_id    departments.department_id%type;
        v_department_name  departments.department_name%type;
        v_manager_id       departments.manager_id%type;
        v_mgrname          varchar2(40);
    begin
         select D.department_id, D.department_name, D.manager_id
              , E.first_name || ' ' || E.last_name AS MGRNAME
              INTO
              v_department_id, v_department_name, v_manager_id, v_mgrname
         from 
         (
           select department_id, department_name, manager_id
           from departments
           where department_id = p_deptno
         ) D JOIN employees E
         ON D.manager_id = E.employee_id;
         
         dbms_output.put_line( lpad('-',50,'-') );
         dbms_output.put_line('부서번호  부서명  부서장사원번호  부서장성명');
         dbms_output.put_line( lpad('-',50,'-') );
         
         dbms_output.put_line( v_department_id || ' ' || 
                               v_department_name || ' ' ||
                               v_manager_id || ' ' ||
                               v_mgrname );
         
         exception 
             when no_data_found then 
                  dbms_output.put_line('>> 부서번호 ' || p_deptno || '은 존재하지 않습니다. <<');
         
    end pcd_dept_info;
    
    function func_age(p_jubun IN employees.jubun%type) 
    return number
    is
        v_year       number(4);
        v_genderNum  varchar2(1) := substr(p_jubun, 7, 1); 
        v_age  number(3);
        error_jubun_length   EXCEPTION;  
        error_jubun_gender   EXCEPTION;
    begin
       if     length(p_jubun) != 13 then RAISE error_jubun_length;  
       elsif  v_genderNum in ('1','2') then v_year := 1900;
       elsif  v_genderNum in ('3','4') then v_year := 2000;
       else   RAISE  error_jubun_gender;
       end if;
       
       v_age :=  extract(year from sysdate) - ( v_year + to_number(substr(p_jubun, 1, 2)) ) + 1;
       
       return v_age;
       
       EXCEPTION
           WHEN error_jubun_length  THEN
                RAISE_APPLICATION_ERROR(-20001, '>> 주민번호의 길이가 13자리가 아닙니다. <<');
           WHEN error_jubun_gender  THEN
                RAISE_APPLICATION_ERROR(-20002, '>> 주민번호의 7번째 값은 1,2,3,4 중에 하나이어야 합니다. <<');
 
    end func_age;
    
 end employee_pack;
 -- Package Body EMPLOYEE_PACK이(가) 컴파일되었습니다.


-- 출력해줌   (1번째 프로시저)
begin
    employee_pack.pcd_emp_info(30);
end;
/*
    ------------------------------------------------------------
    부서번호  부서명   사원번호   사원명   입사일자  성별   나이
    ------------------------------------------------------------
    30 Purchasing 114 Den Raphaely 2002-12-07 여 57
    30 Purchasing 115 Alexander Khoo 2003-05-18 남 63
    30 Purchasing 116 Shelli Baida 2005-12-24 남 64
    30 Purchasing 117 Sigal Tobias 2005-07-24 여 63
    30 Purchasing 118 Guy Himuro 2006-11-15 남 46
    30 Purchasing 119 Karen Colmenares 2007-08-10 남 45
     
    >> 조회된 행의 개수 : 6개 <<
*/


--- 888 보기   (1번째 프로시저)
begin
    employee_pack.pcd_emp_info(888);
end;
-- >> 부서번호 888은 존재하지 않습니다. <<



-- 30번 부서 보기  (2번째 프로시저)
begin
    employee_pack.pcd_dept_info(30);
end;
/*
    --------------------------------------------------
    부서번호  부서명  부서장사원번호  부서장성명
    --------------------------------------------------
    30 Purchasing 114 Den Raphaely

*/
    
-- 부서번호 888 보기 (2번째 프로시저)
begin
    employee_pack.pcd_dept_info(30);
end; 
/*
    --------------------------------------------------
    부서번호  부서명  부서장사원번호  부서장성명
    --------------------------------------------------
    30 Purchasing 114 Den Raphaely
*/

-- 나이
select employee_pack.func_age('9010201234567')
     , employee_pack.func_age('0110204234567')
from dual;
-- 34	23


    ------ **** 패키지 소스 보기 **** -------
   select line, text
   from user_source
   where type = 'PACKAGE' and name = 'EMPLOYEE_PACK';
/*
1	"package employee_pack
"
2	"is
"
3	"    -- employee_pack 패키지에 들어올 프로시저 또는 함수를 선언해준다.
"
4	"    procedure pcd_emp_info(p_deptno IN employees.department_id%type);
"
5	"    procedure pcd_dept_info(p_deptno IN departments.department_id%type);
"
6	"    function func_age(p_jubun IN employees.jubun%type) return number;
"
7	"
"
8	end employee_pack;        
*/
   
   ------ **** 패키지 BODY(본문) 소스 보기 **** -------
   select line, text
   from user_source
   where type = 'PACKAGE BODY' and name = 'EMPLOYEE_PACK';
   -- 119 개 행 