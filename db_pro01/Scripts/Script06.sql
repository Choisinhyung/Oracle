-- NULL ó�� �Լ�(NULL���� ������ �ϰԵǸ� ����� NULL�� ���´�. �װ��� ����)
-- NVL(NULL, ������)
SELECT 10 * NVL(NULL, 0) AS COL1
  FROM DUAL;
  
-- DECODE(����ġ���� ���) : ǥ����, ����1, ���1, ����2, ���2 ... DEFAULT��
 
SELECT COUNTRY_ID
     , COUNTRY_NAME
     , DECODE(COUNTRY_ID, 'IT', '���¸�', 'JP', '�Ϻ�', 'US', '�̱�', 'CA', 'ĳ����', COUNTRY_NAME) AS COUNTRY_KOR
  FROM COUNTRIES;

-- CASE WHEN ���񱳿��� AND ���񱳿��� THEN ������
--      ELSE �񱳿��갪�� ���Ե��� �ʴ� ���� ������
--   END AS "??"
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , CASE WHEN SALARY >= 1000 AND SALARY < 3000 THEN '�����ҵ�'
     		WHEN SALARY >= 3000 AND SALARY < 6000 THEN '�����ҵ�'
     		WHEN SALARY >= 6000 AND SALARY < 10000 THEN '��ҵ�'
     		ELSE '�̺з�'
     	END AS "�ҵ�з�"
  FROM EMPLOYEES;
  
-- �׷쿬��
 
--SUM(SALARY) : ��ü ������ �޿� ���� ���� ��ħ
SELECT SUM(SALARY)
     , SUM(COMMISSION_PCT)
  FROM EMPLOYEES;
  
-- AVG(SALARY) : ��ü �޿� ������ ���(�Ҽ��� �����ؾ� ��- NULL������ ������ �߻� ����)
SELECT AVG(SALARY)
  FROM EMPLOYEES;

SELECT AVG(COMMISSION_PCT)
  FROM EMPLOYEES;
 WHERE COMMISSION_PCT IS NOT NULL;

-- MIN / MAX
SELECT MIN(COMMISSION_PCT)
     , MIN(HIRE_DATE)
     , MIN(FIRST_NAME)
     , MAX(COMMISSION_PCT)
     , MAX(HIRE_DATE)
     , MAX(LAST_NAME)
  FROM EMPLOYEES;

-- COUNT
SELECT COUNT(*)
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NULL;