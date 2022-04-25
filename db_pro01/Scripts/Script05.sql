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

SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME || ' ' || LAST_NAME AS "�����̸�"
     , EMPLOYEE_ID AS "�����ȣ"
     , TO_CHAR(PHONE_NUMBER)
  FROM EMPLOYEES;

/*
 * EMPLOYEES ���̺��� Ŀ�̼��� �����ϴ� ������ �̸��� �޿�, ������ ��ȸ�Ѵ�.
 * 		�������� Ŀ�̼��� ���� �������� ��ȸ�Ѵ�.
 */

-- EMPLOYEES ���̺��� 2000�⵵�� ���� ������ ��ȸ�Ѵ�.

-- EMPLOYEES ���̺��� �����(HIRE_DATE)�� �������� 1999�� 12�� 31���� ������ �ٹ� �������� 60���� �̻��� ������ ��ȸ�Ѵ�. 

-- EMPLOYEES ���̺��� �����(HIRE_DATE)�� �������� 1999�� 12�� 31���� ������ �ټӳ��� 7�� �̻��� ������ ��ȸ�Ѵ�.
