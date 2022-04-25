/*
 * �Լ�(FUNCTION) - �⺻���� ����
 *  1. ���� �� �Լ� : �� �ึ�� �ݺ������� ����Ǿ� �Է� ���� ���� ������ŭ ��� ��ȯ
 *  2. �׷� �Լ� : Ư�� ����� �������� �׷��� �����Ǿ� ����. �׷� �� 1���� ��� ��ȯ (ex. GROUP BY)
*/

-- LENGTH() : ����
SELECT FIRST_NAME
     , LENGTH(FIRST_NAME) AS "����" 
  FROM EMPLOYEES;

-- DUAL���̺��� �׽�Ʈ��(����)
SELECT 'Hello Oracle'
	 , LENGTH('Hello Oracle')
	 , LENGTH('����Ŭ �ȳ�')
  FROM DUAL;
 
--LENGTHB : byte
 SELECT 'Hello Oracle'
	 , LENGTHB('Hello Oracle')
	 , LENGTHB('����Ŭ �ȳ�')
  FROM DUAL;

-- INSTR : ��ġ�� ã�� (�տ� �ִ� @�� 1, �ڿ� �ִ� @�� -1) , -1������ �ݺ�Ƚ��(�ڿ��� �ι�°�� �ִ� @�� ��ġ�� ã�ƶ�)
SELECT INSTR('sample@example.com', '@', 1)
	 , INSTR('sample@example.com', '@', -1)
	 , INSTR('sample@example.com', '@', -1, 2)
  FROM DUAL;

-- Left Padding / Right Padding : ����(���� ����, ������ ��ü�� �����Է�)
SELECT '!' || LPAD('A', 4)
	 , '!' || LPAD('AB', 4)
	 , '!' || LPAD('ABC', 4)
	 , '!' || LPAD('ABCDE', 4)
	 , '!' || LPAD('A', 4, '_')
  	 , RPAD('A', 4) || '!'
	 , RPAD('AB', 4) || '!'
	 , RPAD('ABC', 4) || '!'
	 , RPAD('ABCDE', 4) || '!'
	 , RPAD('A', 4, '_') || '!'
  FROM DUAL;

-- Legt Trim / Right Trim / Trim : ����
SELECT RTRIM('userId@example.com', '@example.com')
     , LTRIM('010-1234-5678', '010')
     , LTRIM(RTRIM('    PASSWORD INPUT    '))
     , TRIM('    PASSWORD INPUT    ')
     , TRIM('A' FROM 'AAAAHelloAAAA')
     , TRIM(LEADING 'A' FROM 'AAAAHelloAAAA')
     , TRIM(TRAILING 'A' FROM 'AAAAHelloAAAA')
     , TRIM(BOTH'A' FROM 'AAAAHelloAAAA')
  FROM DUAL;

--SubString(���� ��ġ�� ~ ������ ����Ұ��� ��ġ��)
SELECT SUBSTR('userId@example.com', 1, 6)
	 , SUBSTR('userId@example.com', 8, 7)
	 , SUBSTR('userId@example.com', 8)
	 , SUBSTR('userId@example.com', -3)
FROM DUAL;

-- LOWER / UPPER : ��ҹ��� ��ȯ
-- INITCAP : �ܾ ù ��° ���ڿ� ���� CAP
SELECT LOWER('userId@example.com')
     , UPPER('userId@example.com')
     , INITCAP('userId@example.com')
  FROM DUAL;
 
-- CONCAT : ���ڿ� ���� // OR�̳� CONCAT����ϸ� ��
SELECT CONCAT('Hello', ' World')
  FROM DUAL;
 
-- REPLACE : ���ڿ� ����(����, ã�� ���ڿ�, ������ ���ڿ�)
SELECT REPLACE('userId@example.com', '@example.com', '@example.co.kr') 
  FROM DUAL;

-- ABS : ����ó��(�������� ����� ����)
SELECT ABS(10)
  	 , ABS(-10)
  	 , ABS(-10.12)
  FROM DUAL;
  
-- MOD : ������ ���ϴ� �Լ�
SELECT MOD(10, 3)
  	 , MOD(-10, 3)
  	 , MOD(10.5, 3)
  	 , MOD(-10.5, 3)
  FROM DUAL;

-- ROUND : �ݿø�(��������, ���ϴ� �ڸ���)
SELECT ROUND(10.4)
     , ROUND(10.5)
     , ROUND(10.45, 1)
     , ROUND(18.456, -1)
  FROM DUAL;
  
-- FLOOR / CEIL : �Ҽ��� �ڸ� ����
SELECT FLOOR(10.34)
     , FLOOR(-10.34)
     , CEIL(10.34)
     , CEIL(-10.34)
  FROM DUAL;

-- TRUNC : ����(����)
SELECT TRUNC(10.34, 1)
     , TRUNC(10.36, 1)
     , TRUNC(10.3456, 2)
     , TRUNC(1234, -1)
  FROM DUAL;
 
-- SYSDATE : ���� ��¥ / ������ Tool���� �ٸ�(SQL Developer, Visual Studio Code ...)
-- ADD_MONTHS(SYSDATE, ����) : ���� ���� +�ϰų� -
-- LAST_DAY : ���� ���� ������ ��
-- NEXT_DAY(SYSDATE, ����) : ���� ��¥���� ���� ����� ����
-- NEXT_DAY(SYSDATE, ����) : 1-�Ͽ��� ~ 7-�����

--ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_LANGUAGE = KOREAN;

SELECT * FROM V$NLS_PARAMETERS WHERE PARAMETER LIKE '%LANG%'

SELECT SYSDATE
     , ADD_MONTHS(SYSDATE, 3)
     , ADD_MONTHS(SYSDATE, -3) 
     , LAST_DAY(SYSDATE)
     , NEXT_DAY(SYSDATE, 'FRI')
   --, NEXT_DAY(SYSDATE, '�ݿ���')
   --, NEXT_DAY(SYSDATE, '��')
     , NEXT_DAY(SYSDATE, 6)
  FROM DUAL;
   
--EXTRACT : (YEAR/MONTH/DAY FROM SYSDATE) - �� �� �� / ����ǥ�ؽ�
SELECT EXTRACT(YEAR FROM SYSDATE)
     , EXTRACT(MONTH FROM SYSDATE)
     , EXTRACT(DAY FROM SYSDATE)
     , EXTRACT(HOUR FROM SYSTIMESTAMP)
     , EXTRACT(MINUTE FROM SYSTIMESTAMP)
     , EXTRACT(SECOND FROM SYSTIMESTAMP)
     , SYSTIMESTAMP
  FROM DUAL;
  
--MONTHS_BETWEEN : �� ��¥�� ����
SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE, 3))
     , MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 3), SYSDATE)
  FROM DUAL;

-- ��¥ �߰�
SELECT SYSDATE
     , SYSDATE +1
     , SYSDATE +2
     , SYSDATE -1
     , SYSDATE -2
     , SYSDATE + INTERVAL '1' DAY
     , SYSDATE + INTERVAL '1' MONTH
     , SYSDATE + INTERVAL '1' YEAR
     , SYSDATE + INTERVAL '1' HOUR
     , SYSDATE + INTERVAL '1' MINUTE
     , SYSDATE + INTERVAL '1' SECOND
  FROM DUAL;

-- Ÿ�ӽ����� ��¥ �߰�
SELECT SYSTIMESTAMP 
     , SYSTIMESTAMP + INTERVAL '3' DAY
     , SYSTIMESTAMP + INTERVAL '3' MONTH
     , SYSTIMESTAMP + INTERVAL '3' YEAR
     , SYSTIMESTAMP + INTERVAL '30' SECOND
     , SYSTIMESTAMP + INTERVAL '30' MINUTE
     , SYSTIMESTAMP + INTERVAL '3' HOUR
     , SYSTIMESTAMP - INTERVAL '30' SECOND
     , SYSTIMESTAMP - INTERVAL '30' MINUTE
     , SYSTIMESTAMP - INTERVAL '3' HOUR
  FROM DUAL;
  
-- TO_CHAR : ���� ��ȯ (���ڴ� 1,000�� ���� �������� ǥ���)
SELECT TO_CHAR(1234)
     , TO_CHAR(SYSDATE, 'YYYY/MM/DD')
     , TO_CHAR(SYSDATE, 'YYYY"��"MM"��"DD"��"')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
     , TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD AM HH24:MI:SS.FF3')
     , TO_CHAR(1000000, '999,999,999')
     , TO_CHAR(1000000, '999,999,999L')
     , TO_CHAR(1000000, '000,000,000')
  FROM DUAL;

-- ��ȭ ������ �ɺ� ������ �ʿ��� ��� ������ ALTER���� ��� 
ALTER SESSION SET NLS_CURRENCY = '��';
SELECT * FROM V$NLS_PARAMETERS WHERE PARAMETER LIKE 'NLS_CURRENCY'

-- TO_DATE : ��¥ ��ȯ
SELECT TO_DATE('20220425', 'YYYYMMDD')
     , TO_DATE('20220425')
  FROM DUAL;
 
-- TO_NUMBER : ���� ��ȯ
SELECT TO_NUMBER('20220425')
     , TO_NUMBER('20,220,425', '999,999,999')
     , TO_NUMBER('FFFF', 'XXXX') -- 16���� ��ȯ
  FROM DUAL;

-- ��¥�� ���ڷ� ��ȯ �� ���ڷ� ��ȯ
SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYYMMDD'))
  FROM DUAL;