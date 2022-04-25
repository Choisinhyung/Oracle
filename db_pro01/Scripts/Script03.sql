-- DEPARTMENTS ���̺��� DEPARTMENT_NAME�� Marketing �� ������ ��ȸ
SELECT * FROM DEPARTMENTS
 WHERE DEPARTMENT_NAME LIKE 'Marketing';

-- DEPARTMENTS ���̺��� DEPARTMENT_NAME�� IT�� ���Ե� ������ ��ȸ
SELECT * FROM DEPARTMENTS
 WHERE DEPARTMENT_NAME LIKE '%IT%';

-- LOCATIONS ���̺��� COUNTRY_ID�� US�� ������ ��ȸ�� ��, STREET_ADDRESS, POSTAL_CODE, CITY �÷��� ��ȸ�Ѵ�
SELECT STREET_ADDRESS
	 , POSTAL_CODE
	 , CITY 
  FROM LOCATIONS
 WHERE COUNTRY_ID LIKE 'US';

-- LOCATIONS ���̺��� POSTAL_CODE �� 5�ڸ��� ������ ��ȸ
SELECT * FROM LOCATIONS
 WHERE POSTAL_CODE LIKE '_____';

-- EMPLOYEES ���̺��� MANAGER_ID�� 100�̰� DEPARTMENT_ID�� 50�� ������ ��ȸ
SELECT * FROM EMPLOYEES
 WHERE MANAGER_ID = '100'
 	 AND DEPARTMENT_ID = '50';
 	
-- EMPLOYEES ���̺��� COMMISSION_PCT�� NULL�� �ƴϸ鼭 SALARY�� 10000 �̻���
-- �����͸� ��ȸ�� �� COMMISSION_PCT�� ���Ե� �޿��� ��ȸ
-- SALARY, COMMISSION_PCT, TOTAL_SALARY �÷������� ����� ������ �Ѵ�
 	-- TOTAL_SALARY�� SALARY * (1 + COMMISION_PCT) ��� ����� ������ �Ѵ�.
SELECT SALARY
	 , COMMISSION_PCT
	 , SALARY * (1 + COMMISSION_PCT) || '$' "TOTAL_SALARY"
	 FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL
  	AND SALARY >= 10000;
  
-- EMPLOYEES ���̺��� MANAGER_ID�� 100,101,102,200,201,202 �� ������ ��ȸ
-- FIRST_NAME, LAST_NAME�� �ϳ��� �÷�(EMP_NAME)���� ��ȸ�ǵ��� �Ѵ�.
SELECT FIRST_NAME
	 , LAST_NAME
	 , FIRST_NAME || ' ' || LAST_NAME "EMP_NAME" 
  FROM EMPLOYEES
 WHERE MANAGER_ID BETWEEN 101 AND 102
   OR MANAGER_ID BETWEEN 200 AND 202; 
   
--EMPLOYEES ���̺��� EMAIL �÷��� ��ȸ�� �� EMAIL@JOB_ID.employee.com �������� ��ȸ �ǵ��� �Ѵ�
--�� ) EMPLOYEE_ID �� 100�� ����� EMAIL�� SKING, JOB_ID�� AD_PRES�̴�. 
--�̸� �������� �����ϴ� �������� ��ȸ�ϸ� SKING@AD_PRES.employee.com���� ��ȸ�� �ȴ�
SELECT EMPLOYEE_ID || '@' || JOB_ID || '.employee.com' "EMAIL" 
 FROM EMPLOYEES;