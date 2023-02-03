--                     �� ��,�ҹ��� ���� 

show user;
--USER��(��) "HR"�Դϴ�.

select * from dba_users;
-- ����Ŭ ������ �����Ǿ��� ������ ������ ��ȸ���ִ� �� 

/*
dba_users �� �����ڸ� ��ȸ�� �� �ִ� ������ �Ϲ� ������� HR�� �����ڰ� �ƴϹǷ� ��ȸ�� �Ұ��ϴٴ� ���̴�.

ORA-00942: ���̺� �Ǵ� �䰡 �������� �ʽ��ϴ�
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
4��, 15������ ���� �߻�
*/



-- *** ORACLE �� ������ �����ͺ��̽� ���� �ý���(Relation DataBase Management System) �̴�. ***
--     RDBMS(Relation DataBase Management System)
--     ������ �����ͺ��̽��� �����͸� ��(Column, Field) �� ��(Row, Record, tuple) ���� �̷���� ���̺�(Table, entity, ��ü) ���·� �����Ѵ�. 




--** ���� ����Ŭ ������ ���ӵǾ��� ����� (������ "HR")�� ���� (HR�� ������) ���̺�(table) ����� ��ȸ�ϰڴ�. **--
select * from tab;
/*
TNAME(���̺��̸�)    TABTYNE

COUNTRIES(��������)	TABLE
DEPARTMENTS	        TABLE
EMPLOYEES	        TABLE
EMP_DETAILS_VIEW	VIEW  (VIEW �� ���̺��� �ƴ����� SELECT �Ǿ��� ������� ��ġ ���̺� ó�� ���� ��)
JOBS	            TABLE
JOB_HISTORY	        TABLE
LOCATIONS	        TABLE
REGIONS(���)        TABLE
*/

select * 
from DEPARTMENTS;   -- �μ� ���̺��� �����ִ� ���̴�.
                             -- sql ��ɾ�� ��, �ҹ��ڸ� �������� �ʽ��ϴ�.
                             
SELECT * 
FROM departments;   -- �μ� ���̺��� �����ִ� ���̴�.
                             -- sql ��ɾ�� ��, �ҹ��ڸ� �������� �ʽ��ϴ�.                            

SeleCT * 
FRom DepaRtmEnts;   -- sql ��ɾ�� ��, �ҹ��ڸ� �������� �ʽ��ϴ�. 

SELECT * 
FROM departments;   -- �÷���� ���̺�� ��,�ҹ��ڸ� �������� �ʽ��ϴ�.

SeleCT *            -- * �� �� ���̺� �ִ� ��� �÷����� ��Ÿ�� 
FRom DepaRtmEnts;   -- ���� ���� �۵��� 

select DEPARTMENT_id, DEPARTMENT_name, Manager_id, location_id
from DEPARTMENTS;  

select DEPARTMENT_id, DEPARTMENT_name, Manager_id, location_id
from DEPARTMENTS; 


-- ����Ǿ��� ������ �� ��ŭ�� �ݵ�� ��, �ҹ��ڸ� �����մϴ� 
select *
from departments
where department_name = 'IT';   --���ڿ��� '' �̴�. ����Ǿ��� ������ �� ��ŭ�� �ݵ�� ��, �ҹ��ڸ� �����մϴ� 

select *
from departments
where department_name = 'it';   --���ڿ��� '' �̴�.  ��� �ȳ���  ����Ǿ��� ������ �� ��ŭ�� �ݵ�� ��, �ҹ��ڸ� �����մϴ� 

select *
from departments
where department_name = 'It';   --���ڿ��� '' �̴�.  ����Ǿ��� ������ �� ��ŭ�� �ݵ�� ��, �ҹ��ڸ� �����մϴ� 

select *
from departments
where department_name = 'Sales';   --���ڿ��� '' �̴�.  ����Ǿ��� ������ �� ��ŭ�� �ݵ�� ��, �ҹ��ڸ� �����մϴ� 

select *
from departments
where department_name = 'SAles';   --���ڿ��� '' �̴�.  ��� �ȳ���  ����Ǿ��� ������ �� ��ŭ�� �ݵ�� ��, �ҹ��ڸ� �����մϴ� 

------------------------------------------------------------------------------------

select *
from departments; -- "�μ�" ���̺� 

describe departments;   -- describe ���̺� �� 
-- �Ǵ�
desc departments;   -- departments�� ���̺��� �÷�(column) �� ������ �˷��ִ� ���̴�.

/*
�̸�                                  ��?                                                                                   ����           
---------------                   --------                                                                               ------------ 
DEPARTMENT_ID   (�μ���ȣ)           NOT NULL ==> (�ݵ�� �����͸� �Է��ؾ� �Ѵٴ� ���̴�.)                                       NUMBER(4) ==> ���ڸ� ���´�. ���� Ÿ��(������ ����) -9999 ~ 9999 ���� �޾ƿ� �� �ִ�.
DEPARTMENT_NAME (�μ���)            NOT NULL                                                                               VARCHAR2(30) ==> Varchar�� ���ڿ��� ���Ѵ�.(���� ��������)  ���ڿ�Ÿ��(30byte), �ִ� 30byte ���� �Է°�����
MANAGER_ID      (�μ����� �����ȣ)             ==> ���� ���̳� null �� �������ε� �����͸� �Է��ϵ� �Է����� �ʵ� ��� ����Ѵٴ� ���̴�. NUMBER(6) ==> ���ڸ� ���´�. ���� Ÿ�� (������ ����) -999999 ~ 999999 ���� �޾ƿ� �� �ִ�.
LOCATION_ID     (�μ��ּ�ID)                                                                                               NUMBER(4) ==> ���ڸ� ���´�. ���� Ÿ�� (������ ����) -9999 ~ 9999 ���� �޾ƿ� �� �ִ�. 

�Ǽ��� ��Ÿ������ �Ҷ��� �Ʒ��� ���� �մϴ�.
�� ) NUNMER �� ���� �����̴�. ������ �ڿ� , ��� ���ڸ� ���ٸ�
    NUNMER(5, 2) ==> -999.99 ~ 999.99 �� ��Ÿ����, �� 5�� 5�� ����, 2�� �ڿ��� 2��°���� �Ҽ� �ڸ��� ���Ѵ�.
    NUMBER(3, 1) ==> -99.9 ~ 99.9
    NUNMER(1, 1) ==> -0.9 ~ 0.9

*/

select *
from EMPLOYEES; -- ==> "���" ���̺�

desc employees;
/*
�̸�                                                ��?         ����           
--------------------------------------             --------   ------------ 
EMPLOYEE_ID    (�����ȣ)                           NOT NULL    NUMBER(6)    
FIRST_NAME     (�̸�)                                          VARCHAR2(20) 
LAST_NAME      (��)                                NOT NULL    VARCHAR2(25) 
EMAIL          (�̸���)                             NOT NULL    VARCHAR2(25) 
PHONE_NUMBER   (����ó)                                         VARCHAR2(20) 
HIRE_DATE      (�Ի�����)                            NOT NULL   DATE ==> ��¥ Ÿ��        
JOB_ID         (����ID)                             NOT NULL   VARCHAR2(10) 
SALARY         (�⺻�޿�)                                       NUMBER(8,2)  
COMMISSION_PCT (Ŀ�̼�(����)�ۼ�Ƽ��)                             NUMBER(2,2)  
MANAGER_ID     (���ӻ��(���)�� �����ȣ)                         NUMBER(6)    
DEPARTMENT_ID  (�ش����� �ٹ��ϴ� �μ���ȣ)                       NUMBER(4)  
*/

-- �⺻ �޿� * Ŀ�̼�(����)�� �߰��� �޴´� 

select *
from LOCATIONS;   --�μ��� �ּ� ������ �˷��ִ� ���̺�

select *
from COUNTRIES;   -- ���������� �˷��ִ� ���̺� 

select *
from REGIONS;   -- ��������� �˷��ִ� ���̺� 

------------------------- ���ݱ��� �⺻���� �λ� ���� ���̺� -----------------------------

/*
==���־��־��־��־��־��־��־��־��־��־��־����־��־��־��־��־��־��־��־��־��� �߿�κ�======= 
!!!!!!!!!!!�ʼ� �ϱ�κ� !!!!!!!!!!!

== ��� ���̺�(�Ǵ� ��)���� ������ ������ ������ ���� ��ɾ��� select�� ó�� ���� ==

select �÷���, �÷���,...--5 �÷��� ��ſ� *(�ƽ��׸�ũ) �� ���� ��� �÷��� ���ϴ� ���̴�.
from ���̺��(�Ǵ� ���) --1
where ������           --2 !!!whrer �������� ���ϴ� ���� �ش� ���̺��(�Ǵ� ���)���� ���ǿ� �����ϴ� ��(row)�� �޸�(RAM)�� �ε�(�ø��°�) ���ִ� ���̴�.!!!!!
group by ��           --3
having �׷��Լ�������   --4
order by ��           --6 

*/

-------------------------------------------------------------------------------


---- *** Null �� ó�����ִ� �Լ� *** ----
---- NULL�� �������� �ʴ� ���̹Ƿ� 4Ģ����(+,-,*,/)�� NULL �� ���ԵǾ����� �� ����� ������ NULL �� �ȴ�.

-- 1. NVL

    select '�ȳ��ϼ���'
    from dual;          
    -- dual�� select ������ ������ ������ ȭ�鿡 �����ֱ� ���� �뵵�� ���̴� ���� ���̺�

    select 1+2, 1+null, 2-1, 2-null, 3*0, 0*null, 5/2, 5/null
    from dual;
    
    -- ù��° ���� null�̳İ� ���� null�� �ƴϸ� �ڽ��� ���´�, null�̸� 2��° ���� ���´�.
    select NVL(7,3), NVL(null, 3),  
           NVL('�̼���','�źϼ�'), nvl(null,'�źϼ�'),
           nvl('null','����')
    from dual;
    
    
-- 2. NVL 
    -- ù��° ���� null�̳İ� ���� null�� �ƴϸ� �ι�° �ڽ��� ���´� null�̸� 3��° �ڸ� ���� ���´�.
    select NVL2(7,3,2), NVL2(null,3,2), 
           NVL2('�̼���','�źϼ�','��������'), NVL2(null,'�źϼ�','��������')
    from dual;

-- ������� �÷����� ���ָ� ���ذ͸� ���´�.
select EMPLOYEE_ID, first_name, last_name, Job_id, Salary, commission_pct, department_id
from EMPLOYEES
where department_id = 60;
-- department_id 60���� ���´�.

select *  -- * �̹Ƿ� ��� �÷����� ����(select)�ض�� ���̴�.
from employees; -- where���� �����Ƿ� employees ���̺� ����Ǿ��� �ִ� ��� ����� �޸�(RAM)�� �ۿø���.(Loading)

select employee_id, first_name, last_name  -- employee_id, first_name, last_name �÷����� ����(select)�ض�� ���̴�.
from employees; -- where���� �����Ƿ� employees ���̺� ����Ǿ��� �ִ� ��� ����� �޸�(RAM)�� �ۿø���.(Loading)



-- ������ �⺻�޿�(Salary) + ����(Salary * commission_pct)
-- commission_pct �÷��� ���� null �̶����� ������ ���ٴ� ���̰�, 
-- commission_pct �÷��� ���� 0.3�̶� ���� �ڽ��� �⺻�޿�(Salary) * 0.3 �� ���� ����ݾ��̴�.

select employee_id, first_name, last_name, Salary, commission_pct,
       salary + (salary * commission_pct),
       nvl(salary + (salary * commission_pct), salary), 
       nvl2(commission_pct, (salary + (salary * commission_pct)), salary)
from employees;



-- �÷����� ��Ī���� �����غ��� 

select employee_id As "�����ȣ" ,   -- ����(��Ī) alias
       first_name as "�̸�", 
       last_name "��",              --����(��Ī) alias ���� AS�� ������ ������ 
       Salary "�⺻ �޿�",               --������ �ְ��� �Ҷ����� ""�� ������ �ʿ��ϴ�.
       commission_pct Ŀ�̼��ۼ�Ƽ��,          --����(��Ī) alias���� ""�� ����������, 
       salary + (salary * commission_pct) "�߸��� ����",
       nvl(salary + (salary * commission_pct), salary) ����1, 
       nvl2(commission_pct, (salary + (salary * commission_pct)), salary) ����2
from employees;


        --------- **** �� ������ **** -------------------
        /*
        
        1. ����                    =
        2. �����ʴ�                !=  <>  ^=
        3. ũ��, �۴�              >   <
        4. ���ų� ũ��, ���ų� �۴�  >=    <=
        5. null �� �������� �ʴ� ���̹Ƿ� �񱳴���� �� ���� ����
        �׷��Ƿ� �� ����( =  !=  ^=   >   <   >=   <=)�� �� ���� ����
        �׷��Ƿ� �񱳿����� �Ϸ��� NVL()�Լ�, NVL2()�Լ��� ����Ͽ� ó���Ѵ�.
        */
        
        -- !!!!����!!!! --
    -- employees ���̺��� �μ���ȣ 30���� �ٹ��ϴ� ����鸸
    -- �����ȣ, �����, ����, �μ���ȣ�� ��Ÿ������

select employee_id As "�����ȣ",
       first_name as "�̸�", 
       last_name "��",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�" 
from employees
where department_id = 30;


-- ���� �̸��� �ϳ��� ���ĺ���

select '���ѹα�', '�����', 1234, sysdate -- sysdate�� ���� ��¥ �� �ð� 
from dual;

-- ����Ŭ���� �÷����� ���϶�(�����Ҷ�)�� ���� Ÿ���̵� ���� Ÿ���̵� ��¥ Ÿ���̵� ������� || �� ���� �ȴ�. 
-- || �� �ΰ��� �÷����� ��ġ�� ���̴�.
select '���ѹα�' || '�����' || 1234 || sysdate -- sysdate�� ���� ��¥ �� �ð� 
from dual;


    -- employees ���̺��� �μ���ȣ 30���� �ٹ��ϴ� ����鸸
    -- �����ȣ, �����, ����, �μ���ȣ�� ��Ÿ������

select employee_id As "�����ȣ",
       first_name || ' ' || last_name "�����",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�" 
from employees
where department_id = 30;


    -- employees ���̺��� �μ���ȣ null�� �ٹ��ϴ� ����鸸
    -- �����ȣ, �����, ����, �μ���ȣ�� ��Ÿ������

select employee_id As "�����ȣ",
       first_name || ' ' || last_name "�����",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�" 
from employees
where department_id = null;
--> �����Ͱ� ��µ��� �ʴ´�.
-- �ֳ��ϸ� null�� �������� �ʴ� ���̹Ƿ� �񱳴���� �� ���� ���� �����̴�.

select employee_id As "�����ȣ",
       first_name || ' ' || last_name "�����",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�" 
       , nvl(department_id, -9999)
from employees;


select employee_id As "�����ȣ",
       first_name || ' ' || last_name "�����",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�"
from employees
where NVL(department_id, -9999) = -9999;
-- �����ȣ �����             ����     �μ���ȣ
--  178	  Kimberely Grant	8050     null	

-- �Ǵ� 
-- null �� is �����ڸ� ����Ͽ� ��Ÿ����.

select employee_id As "�����ȣ",
       first_name || ' ' || last_name "�����",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�"
from employees
where department_id is null;  -- is null �̸� department_id �÷��� ���� null �� ��鸸 �޸�(RAM)�� �� �ø��� ���̴�.
-- �����ȣ �����             ����     �μ���ȣ
--  178	  Kimberely Grant	8050     null


    -- employees ���̺��� �μ���ȣ 30���� �ƴ� ����鸸(null ����) 
    -- �����ȣ, �����, ����, �μ���ȣ�� ��Ÿ������
select employee_id As "�����ȣ",
       first_name || ' ' || last_name "�����",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�" 
from employees
where department_id != 30;

-- �Ǵ� 
-- where department_id <> 30;
-- where department_id ^= 30;


    -- employees ���̺��� �μ���ȣ 30���� �ƴ� ����鸸 
    -- �����ȣ, �����, ����, �μ���ȣ�� ��Ÿ������
select employee_id As "�����ȣ",
       first_name || ' ' || last_name "�����",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�" 
from employees
where NVL(department_id, -9999) != 30; -- <>, ^=, !=
-- null�� ���ؼ� NVL�� ����Ͽ� null�� ��� -9999 �� ����ؼ� null���� ����ش�.


-- �Ǵ� 
    -- employees ���̺��� �μ���ȣ 30���� �ƴ� ����鸸 
    -- �����ȣ, �����, ����, �μ���ȣ�� ��Ÿ������
select employee_id As "�����ȣ",
       first_name || ' ' || last_name "�����",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�" 
from employees
where NOT NVL(department_id, -9999) = 30;
 -- Not�� �ڹٿ��� '!'�� ���� ���̴�.


    -- employees ���̺��� �μ���ȣ 30���� �ƴ� ����鸸 (null �� ����)
    -- �����ȣ, �����, ����, �μ���ȣ�� ��Ÿ������
select employee_id As "�����ȣ",
       first_name || ' ' || last_name "�����",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�" 
from employees
where NOT department_id = 30;
 -- Not�� �ڹٿ��� '!'�� ���� ���̴�.
 
 
    -- employees ���̺��� �μ���ȣ null�� �ƴ� ����鸸 
    -- �����ȣ, �����, ����, �μ���ȣ�� ��Ÿ������
 select employee_id As "�����ȣ",
       first_name || ' ' || last_name "�����",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�" 
from employees
where NOT NVL(department_id, -9999) = -9999;
 -- Not�� �ڹٿ��� '!'�� ���� ���̴�.
 
 --�Ǵ� 

    -- Null�� is �����ڸ� ����Ͽ� ��Ÿ����.
 select employee_id As "�����ȣ",
       first_name || ' ' || last_name "�����",              
       nvl(salary + (salary * commission_pct), salary) ����1,
       department_id "�μ� �̸�" 
from employees
where department_id is null; 


----- *** select �Ǿ��� ���� �����͸� ����(�������� ����, �������� ����)�Ͽ� �������� **** -----

-- salary �÷��� ���� �������� �����Ͽ� ���̼��� --
select employee_id, first_name, last_name, salary, department_id
from employees
order by salary asc;        -- asc�� ���������� ���Ѵ�.

-- salary �÷��� ���� �������� �����Ͽ� ���̼��� --
select employee_id, first_name, last_name, salary, department_id
from employees
order by salary;        -- asc�� ���������� ���Ѵ�. (asc�� ������ �����ϴ�.)


-- salary �÷��� ���� �������� �����Ͽ� ���̼��� --
select employee_id, first_name, last_name, salary, department_id
from employees
order by salary desc;    -- desc�� ���������� ���Ѵ�. (desc�� ������ �Ұ����ϴ�, ������ ��������������)


-- ���޿� ������������ �����ؼ� ��Ÿ������
select employee_id, 
       first_name, 
       last_name,              
       nvl(salary + (salary * commission_pct), salary) As "����", 
       department_id 
from employees
--order by nvl(salary + (salary * commission_pct), salary) asc;
-- �Ǵ�
-- order by ���� asc;   -- select �ڿ� ����Ǳ� ������ ��Ī���� �ҷ��� �� �ִ�.
--order by 4 asc;        -- select�� ������ �÷��� ������ ���ڷ� ��Ÿ�� �� �ִ�. 4�� ������ ���Ѵ�.
order by 4;


-- ���޿� ������������ �����ؼ� ��Ÿ������
select employee_id, 
       first_name, 
       last_name,              
       nvl(salary + (salary * commission_pct), salary) As "����", 
       department_id 
from employees
--order by nvl(salary + (salary * commission_pct), salary) desc;
-- �Ǵ�
-- order by ���� desc;   -- select �ڿ� ����Ǳ� ������ ��Ī���� �ҷ��� �� �ִ�.
order by 4 desc;        -- select�� ������ �÷��� ������ ���ڷ� ��Ÿ�� �� �ִ�. 4�� ������ ���Ѵ�.




-- ����, �������� ����, �������������� �� �� null �� �������� �ʴ� ���̹Ƿ�
-- ����Ŭ������ null�� ���� ū  ������ ���ָ� ���ְ� ����ũ�μ���Ʈ ���� ms-SQL Server������ ���� ���� ������ �����Ѵ�.


---- department_id Į���� ���� �������� �������� �����Ͽ� ���̼��� ----
select employee_id, 
       first_name, 
       last_name,              
       salary + (salary * commission_pct),
       salary, 
       department_id 
from employees
order by department_id asc;

---- department_id Į���� ���� �������� �������� �����Ͽ� ���̼��� ----
select employee_id, 
       first_name, 
       last_name,              
       salary + (salary * commission_pct),
       salary, 
       department_id 
from employees
order by department_id desc;


---- *** 1������, 2�� ���Ŀ� ���ؼ� �˾ƺ��ϴ�. *** ----

-- employees ���̺��� �μ���ȣ�� �������� ������ �� �Ŀ� ������ �μ���ȣ �������� 
-- ������ ������������ �����Ͽ� �����ȣ, �����, ����, �μ���ȣ�� ��Ÿ������

select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       nvl(salary + (salary * commission_pct), salary) AS ����,
       department_id AS �μ���ȣ
from employees
order by 4 asc, 3 desc;
-- 1�� ����, 4��° �÷��� �μ���ȣ�� �������� ����(asc�� ���� ����) , 2�� ����, 3��° �÷��� ������ ������������ ����


select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       nvl(salary + (salary * commission_pct), salary) AS ����,
       department_id AS �μ���ȣ
from employees
order by 4, 3 desc;
-- 1�� ����, 4��° �÷��� �μ���ȣ�� �������� ����(asc�� ���� ����) , 2�� ����, 3��° �÷��� ������ ������������ ����

/*
    employees ���̺��� commission_pct �� null�� ����鸸 
    �����ȣ, �����, ����(�⺻�޿� = ����ݾ�), �μ���ȣ�� ��Ÿ����
    �μ���ȣ�� ������������ ������ �� ������ �μ���ȣ �������� ������ ������������ ��Ÿ������
*/
select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       nvl(salary + (salary * commission_pct), salary) AS ����,
       department_id AS �μ���ȣ
from employees
where commission_pct is null
order by 4, 3 desc;

/*
    employees ���̺��� commission_pct �� null�� �ƴ� ����鸸 
    �����ȣ, �����, ����(�⺻�޿� = ����ݾ�), �μ���ȣ�� ��Ÿ����
    �μ���ȣ�� ������������ ������ �� ������ �μ���ȣ �������� ������ ������������ ��Ÿ������
*/
select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       nvl(salary + (salary * commission_pct), salary) AS ����,
       department_id AS �μ���ȣ
from employees
where NOT commission_pct is null
order by 4, 3 desc;


/*
    employees ���̺��� ����(�⺻�޿� = ����ݾ�) 10000���� ū ����鸸 
    �����ȣ, �����, ����(�⺻�޿� = ����ݾ�), �μ���ȣ�� ��Ÿ����
    �μ���ȣ�� ������������ ������ �� ������ �μ���ȣ �������� ������ ������������ ��Ÿ������
*/
select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       nvl(salary + (salary * commission_pct), salary) AS ����,
       department_id AS �μ���ȣ
from employees
where nvl(salary + (salary * commission_pct), salary) > 10000
order by 4, 3 desc;

/*
    employees ���̺��� �μ���ȣ�� 50�� �μ��� �ƴ� ����鸸 (null���� ����)
    �����ȣ, �����, ����(�⺻�޿� = ����ݾ�), �μ���ȣ�� ��Ÿ����
    �μ���ȣ�� ������������ ������ �� ������ �μ���ȣ �������� ������ ������������ ��Ÿ������
*/

--null �� ���̴��� �Ⱦ��̴��� �𸣸� ���� Ȯ���غ��� ���̺� ���� �ľ� 
desc employees;

select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       nvl(salary + (salary * commission_pct), salary) AS ����,
       department_id AS �μ���ȣ
from employees
where nvl(department_id, -9999) != 50
order by 4, 3 desc;




-------------------------------------------------------------------------
------------ ****  AND    OR    IN()     NOT  ������ *** -----------------

-------------------------- AND �κ� ------------------------------
-- employees ���̺��� 80�� �μ��� �ٹ��ϴ� ������߿� �⺻�޿��� 10000�̻��� ����鸸 
-- �����ȣ, �����, �⺻�޿�, �μ���ȣ�� ��Ÿ������

select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       Salary AS ����,
       department_id AS �μ���ȣ
from employees
where department_id = 80 AND Salary >= 10000;


----------------------------OR �κ�------------------------------
-- employees ���̺��� 30,60,80�� �μ��� �ٹ��ϴ� ����鸸
-- �����ȣ, �����, �⺻�޿�, �μ���ȣ�� ��Ÿ������
select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       Salary AS ����,
       department_id AS �μ���ȣ
from employees
where department_id = 30 OR department_id = 60 OR department_id = 80 
order by �μ���ȣ;

-- �Ǵ�
--------------------------- IN() �κ� -----------------------------
-- IN()�� or�� ����.
select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       Salary AS ����,
       department_id AS �μ���ȣ
from employees
where department_id in(30,60,80)   -- where department_id = 30 OR department_id = 60 OR department_id = 80 �� ���� ��� 
order by �μ���ȣ;


-- employees ���̺��� 30,60,80�� �μ��� �ٹ����� �ʴ� ����鸸
-- �����ȣ, �����, �⺻�޿�, �μ���ȣ�� ��Ÿ������

-- �̸��̸� ���̺� Ȳ�� 
desc employees;

select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       Salary AS ����,
       department_id AS �μ���ȣ
from employees
where NVL(department_id, -9999) != 30 and
        NVL(department_id, -9999) != 60 and
        NVL(department_id, -9999) != 80 
--where NOT department_id in(30,60,80)   -- where department_id = 30 OR department_id = 60 OR department_id = 80 �� ���� ��� 
--�Ǵ� where department_id != 30 and department_id != 60 and department_id != 800
order by �μ���ȣ;



---------------------------------------- NOT ������ -----------------------------------
-- employees ���̺��� 30,60,80�� �μ��� �ٹ����� �ʴ� ����鸸
-- �����ȣ, �����, �⺻�޿�, �μ���ȣ�� ��Ÿ������

-- �̸��̸� ���̺� Ȳ�� 
desc employees;

select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       Salary AS ����,
       department_id AS �μ���ȣ
from employees
where nvl(department_id,-9999) NOT in(30,60,80)   -- where department_id = 30 OR department_id = 60 OR department_id = 80 �� ���� ��� 
--�Ǵ� where department_id != 30 and department_id != 60 and department_id != 800
order by �μ���ȣ;

-- �Ǵ� 
select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       Salary AS ����,
       department_id AS �μ���ȣ
from employees
where NOT nvl(department_id,-9999) in(30,60,80)   -- where department_id = 30 OR department_id = 60 OR department_id = 80 �� ���� ��� 
--�Ǵ� where department_id != 30 and department_id != 60 and department_id != 800
order by �μ���ȣ;


-- employees ���̺��� �μ���ȣ�� 30, 50,60�� �μ��� �ٹ��ϴ� ������߿� 
-- ����(����*12)�� 20000 �̻� 60000������ ����鸸 
-- �����ȣ, �����, ����,�μ���ȣ�� ��Ÿ����
-- �μ���ȣ�� ������������ ������ �� ������ �μ���ȣ�������� ������ ������������ ��Ÿ������ 

select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       nvl(salary + (salary * commission_pct), salary) * 12 AS ���� ,
       department_id AS �μ���ȣ
from employees
where department_id = 30 OR department_id = 50 OR department_id = 60 AND
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, ���� desc;      
-- �̰��� Ʋ�� Ǯ���̴�!!!!! ----


------ *** AND�� OR�� ȥ��Ǿ����� �켱������ AND�� ���� ����ȴ�. **** -------
--         �����ڿ��� �־ ���� �ֿ켱�� ��ȣ()�� ���� �켱�� �ȴ�.

select 2 + 5 * 3, (2+5)*3
from dual;

select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       nvl(salary + (salary * commission_pct), salary) * 12 AS ���� ,
       department_id AS �μ���ȣ
from employees
where (department_id = 30 OR department_id = 50 OR department_id = 60) AND
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, ���� desc;      
-- ()�� ���� �����̹Ƿ� ������ �ȴ� !!!!!

-- �Ǵ� 
select employee_id AS �����ȣ ,
       first_name || ' ' || last_name AS �����,
       nvl(salary + (salary * commission_pct), salary) * 12 AS ���� ,
       department_id AS �μ���ȣ
from employees
where department_id in(30,50,60) AND
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, ���� desc;    
-- �ùٸ� Ǯ���̴� in()�� ��ȣ�� �ִ� OR�̴�


            ------ ****  ==== ���� ������ ====  **** ----------
--     >    <   >=   <= , between A and B (A���� B���� )
-- ���� �����ڿ� ���Ǵ� �����ʹ� ���� �Ӹ� �ƴ϶� ����, ��¥���� ��� ���ȴ�.
  
   --- *** ���� �ð��� �˷��ִ� �� *** ===

select sysdate, current_date, localtimestamp, current_timestamp, systimestamp
from dual;

/*
    ��¥ Ÿ���� date �̴�.
    dateŸ���� �⺻���� ǥ������� 'RR/MM/DD' �̰����� ��Ÿ��������.
    
    RR �� ������ 2�ڸ��� ��Ÿ���� �ִµ� 50 ~ 99 �� 1950 ~ 1999 �� ���ϴ� ���̴�.
    RR �� ������ 2�ڸ��� ��Ÿ���� �ִµ� 00 ~ 49 �� 2000 ~ 2049 �� ���ϴ� ���̴�. 
    MM �� ���̰� DD�� ���̴�.
*/

select sysdate
    , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')  -- mi�� ���̴�.
    , to_char(sysdate, 'yyyy-mm-dd am hh:mi:ss')  -- 12�ð�ü��� �������� �������� �� ��� am,�Ǵ�pm�� ���δ�.
    , to_char(sysdate, 'yyyy-mm-dd pm hh:mi:ss')
    -- 23/02/03	2023-02-03 16:05:17    	2023-02-03 ���� 04:05:17   	2023-02-03 ���� 04:05:17
from dual;


desc employees;        -- HIRE_DATE   DATE(��¥)

select employee_id AS �����ȣ
    , first_name || ' ' || last_name AS �����
    , hire_date AS �Ի�����
    , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss')
from employees;
-- 154	Nanette Cambrault	06/12/09	2006-12-09 00:00:00

--update �غ��� 
update employees set hire_date = to_date('2006-12-31 09:00:00', 'yyyy-mm-dd hh24:mi:ss')  
-- to_date�� ��¥Ÿ������ �����Ѵ�. ���� = �� �����ϴ°��� ���� 
where employee_id = 154;
-- 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

commit;
-- Ŀ�� �Ϸ�.

select employee_id AS �����ȣ
    , first_name || ' ' || last_name AS �����
    , hire_date AS �Ի�����
    , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss')
from employees;
-- 154	Nanette Cambrault	06/12/31	2006-12-31 09:00:00  �ٲ����.


-- ;�� �������� �� ���� �ұ�  �翬�ϴ�/

select *
from departments;

select employee_id AS �����ȣ
,  first_name || ' ' || last_name As �����
from employees;

--employees ���̺��� �Ի����ڰ� 2005�� 1�� 1�Ϻ��� 2006�� 12�� 31�� ���� �Ի��� ����鸸 
-- �����ȣ, �����, �Ի����ڸ� ��Ÿ������

select employee_id AS �����ȣ,
       first_name || ' ' || last_name AS �����,
       hire_date AS �Ի�����
       , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss')
from employees
where '05/01/01' <= hire_date AND hire_date <= '06/12/31'
order by 3;
-- �̰��� Ʋ�� Ǯ���̴�.!!!!

---- !!!!!!!!!!!!�߿�!!!!!!!!!!!!------
-- ��¥�� ��Ÿ�� �� ��,��,�ʰ� ���� ��,��,�� �� ��Ÿ�����ָ� �ڵ������� ��,��,�ʴ� 0��0��0�ʰ� �ȴ�.
-- �� ����(�׳��� ����)�� ���Ѵ�.

select employee_id AS �����ȣ,
       first_name || ' ' || last_name AS �����,
       hire_date AS �Ի�����
       , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss')

from employees
where '05/01/01' <= hire_date AND hire_date < '07/01/01'
order by 3; 
---> �̰��� �ùٸ� Ǯ�� !!!

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



-- employee ���̺��� first_nae �÷��� ���� 'EIJ' ����'I' ������ �����͸� ������ ����鸸 dirst_name �� ����ϼ���.

select first_name
from employees
where 'EIJ' <= first_name AND first_name <= 'I'
order by 1;
-- 'EIJ' 'EIJa' 'EIjast' ~~~~~~~~ 'HAsdfa' 'HbHW' 'I'   ~~~~~~ 'Hasdfsd' 'Hsdas'  / 'I' 'IA'
-- ============================================================================  /
                                    ����                                              ������
                                    
-- �Ǵ� !!!!!!!!!!!!!!!!!!!!!between����ϱ�!!!!!!!!!!!!!!!!!!!!!!!!!!
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

-- � ���̺� �����ϴ� ���� �÷��� ���� �����Ϸ��� �� ���� update ��ɾ ����ؼ� �������ش�.

select *
from employees
where employee_id = 100;
--- Steven King

update employees set first_name = '��', last_name = '����'
where employee_id = 100;
-- 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

select *
from employees
where employee_id = 100;
-- 100	��	����	SKING	515.123.4567	03/06/17	AD_PRES	24000			90


-- �޸� ����ϱ� 
rollback;   --> �޸�(RAM) �󿡼� ����Ǿ��� ������(��   ����)�� ������ �ִ� ���̴�.
            --> ��, ������ ������ update ����� �� ����� ����ϰڴٴ� ���̴�.
-- �ѹ� �Ϸ�.

select *
from employees
where employee_id = 100;
-- 100	Steven	King

update employees set first_name = '��', last_name = '����'
where employee_id = 100;
-- 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

commit;    --> �޸�(RAM) �󿡼� ����Ǿ��� ���� ���� ��ũ(DISK) ���Ͽ� ��������ִ� ���̴�.
-- Ŀ�� �Ϸ�.

select *
from employees
where employee_id = 100;
-- 100	��	����

-- �޸� ����ϱ� 
rollback;   --> �޸�(RAM) �󿡼� ����Ǿ��� ������(��   ����)�� ������ �ִ� ���̴�.
            --> ��, ������ ������ update ����� �� ����� ����ϰڴٴ� ���̴�.
-- �ѹ� �Ϸ�.

select *
from employees
where employee_id = 100;
-- 100	��	����
--> Ŀ���� �ϸ� rollback �� �ص� ����� �̸��� ������� �ʴ´�.


update employees set first_name = 'Steven', last_name = 'King'
where employee_id = 100;
-- 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- (�޸� �󿡼� ����Ȱ�) ��ũ���� ���� �ȵ� 
select *
from employees
where employee_id = 100;
-- 100	Steven	King

commit;

select *
from employees
where employee_id = 100;
-- 100	Steven	King


    ---- *** employees ���̺� jubun(�ֹι�ȣ) �̶�� �÷��� �߰��� ���ô� *** -----
    select '01098765432', 01098765432
    from dual;
    -- 01098765432	1098765432  ���ڿ��� �տ� 0�� ����, ���ڴ� �տ� 0�� ���� 
    --(������� ���� ������ ����, ������ ������ ����)
/*
    jubun(�ֹι�ȣ) �÷��� ���� �Է��Ҷ��� '-'�� ���� ���ڷθ� �Է��� ���Դϴ�.
    jubun(�ֹι�ȣ) �÷��� ���� �Է��Ҷ��� �� ó�� ù�ڸ��� 0�� ���� �� �ְ� ������ 
    number Ÿ���� �ƴ϶� varchar2 Ÿ������ �ؾ� �Ѵ�.
    �ֳ��ϸ� number Ÿ������ ���ָ� �� �տ� �Է��� ���� 0 �ϴ�� 0�� �����Ǿ����� �����̴�.
    �� ���� 0�� ������ �Ϸ��� �÷��� ������ Ÿ���� varchar2 �� �Ǿ�� �Ѵ�.
*/


    -------------- �÷� �߰��ϱ� ------------------
    -- employees ���̺��� �����Ѵ�.
    alter table employees
    -- �ֹ��� �߰��Ѵ�.
    add jubun varchar2(13);
    -- Table EMPLOYEES��(��) ����Ǿ����ϴ�.
    
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