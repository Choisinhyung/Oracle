/*
 * EMPLOYEES ���̺��� �����̸�, �̸���, ��ȭ��ȣ, ������� ��ȸ�Ѵ�.
 *		���� �̸��� ���� �̸��� �ϳ��� �÷����� ������ �Ѵ�.
 *		�̸��� �ڿ��� @employees.co.kr �� �ٿ��� �Ѵ�.
 *		��ȭ��ȣ�� �����ڴ� .��� -�� ���ǵ��� �Ѵ�.
 * 		������� xxxx�� xx�� xx�� �������� ��µǰ� �Ѵ�.
 */

SELECT FIRST_NAME || ' ' || LAST_NAME AS "�����̸�"
     , EMAIL || '@employees.co.kr' AS "EMAIL" 
     , REPLACE(PHONE_NUMBER, '.', '-') AS "PHONE_NUMBER"
     , TO_CHAR(SYSDATE, 'YYYY"��" MM"��" DD"��"') AS "HIRE_DATE"
 FROM EMPLOYEES;

/*
 * EMPLOYEES ���̺��� �����̸�, �޿�, ������ ��ȸ�Ѵ�.
 * 		������ �޿��� 12������ ���ϴ� ������ �Ѵ�.
 */

SELECT FIRST_NAME || ' ' || LAST_NAME AS "�����̸�"
     , SALARY
     , SALARY * 12 AS "����"
  FROM EMPLOYEES;

 -- EMPLOYEES ���̺��� ��ȭ��ȣ�� 011�� �����ϴ� ������ ��+�̸��� �����ȣ, ��ȭ��ȣ�� ��ȸ�Ѵ�.

SELECT FIRST_NAME || ' ' || LAST_NAME AS "�����̸�"
     , EMPLOYEE_ID AS "�����ȣ"
     , PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '011%';

/*
 * EMPLOYEES ���̺��� Ŀ�̼��� �����ϴ� ������ �̸��� �޿�, ������ ��ȸ�Ѵ�.
 * 		�������� Ŀ�̼��� ���� �������� ��ȸ�Ѵ�.
 */
SELECT  FIRST_NAME || ' ' || LAST_NAME AS "�����̸�"
      , SALARY AS "�޿�"
      , COMMISSION_PCT
      , SALARY * 12 + SALARY * NVL(0, COMMISSION_PCT) AS "����"
  FROM EMPLOYEES;

-- EMPLOYEES ���̺��� 2000�⵵�� ���� ������ ��ȸ�Ѵ�.
SELECT * 
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN TO_DATE('20000101') AND TO_DATE('20001231');

-- EMPLOYEES ���̺��� �����(HIRE_DATE)�� �������� 1999�� 12�� 31���� ������ �ٹ� �������� 60���� �̻��� ������ ��ȸ�Ѵ�. 
SELECT *
  FROM EMPLOYEES
 WHERE MONTHS_BETWEEN(TO_DATE('19991231'), HIRE_DATE) >= 60; 

-- EMPLOYEES ���̺��� �����(HIRE_DATE)�� �������� 1999�� 12�� 31���� ������ �ټӳ��� 7�� �̻��� ������ ��ȸ�Ѵ�.
SELECT *
  FROM EMPLOYEES
 WHERE MONTHS_BETWEEN(TO_DATE(19991231), HIRE_DATE) >= 12 * 7;
 




