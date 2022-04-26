/*
 * 함수(FUNCTION) - 기본으로 제공
 *  1. 단일 행 함수 : 각 행마다 반복적으로 적용되어 입력 받은 행의 개수만큼 결과 반환
 *  2. 그룹 함수 : 특정 행들의 집합으로 그룹이 형성되어 적용. 그룹 당 1개의 결과 반환 (ex. GROUP BY)
*/

-- LENGTH() : 길이
SELECT FIRST_NAME
     , LENGTH(FIRST_NAME) AS "길이" 
  FROM EMPLOYEES;

-- DUAL테이블은 테스트용(더미)
SELECT 'Hello Oracle'
	 , LENGTH('Hello Oracle')
	 , LENGTH('오라클 안녕')
  FROM DUAL;
 
--LENGTHB : byte
 SELECT 'Hello Oracle'
	 , LENGTHB('Hello Oracle')
	 , LENGTHB('오라클 안녕')
  FROM DUAL;

-- INSTR : 위치값 찾기 (앞에 있는 @는 1, 뒤에 있는 @는 -1) , -1다음은 반복횟수(뒤에서 두번째에 있는 @의 위치를 찾아라)
SELECT INSTR('sample@example.com', '@', 1)
	 , INSTR('sample@example.com', '@', -1)
	 , INSTR('sample@example.com', '@', -1, 2)
  FROM DUAL;

-- Left Padding / Right Padding : 여백(공백 갯수, 여백을 대체할 문자입력)
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

-- Legt Trim / Right Trim / Trim : 제거
SELECT RTRIM('userId@example.com', '@example.com')
     , LTRIM('010-1234-5678', '010')
     , LTRIM(RTRIM('    PASSWORD INPUT    '))
     , TRIM('    PASSWORD INPUT    ')
     , TRIM('A' FROM 'AAAAHelloAAAA')
     , TRIM(LEADING 'A' FROM 'AAAAHelloAAAA')
     , TRIM(TRAILING 'A' FROM 'AAAAHelloAAAA')
     , TRIM(BOTH'A' FROM 'AAAAHelloAAAA')
  FROM DUAL;

--SubString(시작 위치값 ~ 어디까지 출력할건지 위치값)
SELECT SUBSTR('userId@example.com', 1, 6)
	 , SUBSTR('userId@example.com', 8, 7)
	 , SUBSTR('userId@example.com', 8)
	 , SUBSTR('userId@example.com', -3)
FROM DUAL;

-- LOWER / UPPER : 대소문자 변환
-- INITCAP : 단어별 첫 번째 글자에 대해 CAP
SELECT LOWER('userId@example.com')
     , UPPER('userId@example.com')
     , INITCAP('userId@example.com')
  FROM DUAL;
 
-- CONCAT : 문자열 결합 // OR이나 CONCAT사용하면 됨
SELECT CONCAT('Hello', ' World')
  FROM DUAL;
 
-- REPLACE : 문자열 변경(원본, 찾을 문자열, 변경할 문자열)
SELECT REPLACE('userId@example.com', '@example.com', '@example.co.kr') 
  FROM DUAL;

-- ABS : 숫자처리(음수값을 양수로 변경)
SELECT ABS(10)
  	 , ABS(-10)
  	 , ABS(-10.12)
  FROM DUAL;
  
-- MOD : 나머지 구하는 함수
SELECT MOD(10, 3)
  	 , MOD(-10, 3)
  	 , MOD(10.5, 3)
  	 , MOD(-10.5, 3)
  FROM DUAL;

-- ROUND : 반올림(숫자지정, 원하는 자릿수)
SELECT ROUND(10.4)
     , ROUND(10.5)
     , ROUND(10.45, 1)
     , ROUND(18.456, -1)
  FROM DUAL;
  
-- FLOOR / CEIL : 소수점 자리 버림
SELECT FLOOR(10.34)
     , FLOOR(-10.34)
     , CEIL(10.34)
     , CEIL(-10.34)
  FROM DUAL;

-- TRUNC : 버림(절사)
SELECT TRUNC(10.34, 1)
     , TRUNC(10.36, 1)
     , TRUNC(10.3456, 2)
     , TRUNC(1234, -1)
  FROM DUAL;
 
-- SYSDATE : 현재 날짜 / 형식은 Tool마다 다름(SQL Developer, Visual Studio Code ...)
-- ADD_MONTHS(SYSDATE, 숫자) : 현재 월에 +하거나 -
-- LAST_DAY : 현재 월의 마지막 날
-- NEXT_DAY(SYSDATE, 요일) : 현재 날짜에서 가장 가까운 요일
-- NEXT_DAY(SYSDATE, 숫자) : 1-일요일 ~ 7-토요일

--ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_LANGUAGE = KOREAN;

SELECT * FROM V$NLS_PARAMETERS WHERE PARAMETER LIKE '%LANG%'

SELECT SYSDATE
     , ADD_MONTHS(SYSDATE, 3)
     , ADD_MONTHS(SYSDATE, -3) 
     , LAST_DAY(SYSDATE)
     , NEXT_DAY(SYSDATE, 'FRI')
   --, NEXT_DAY(SYSDATE, '금요일')
   --, NEXT_DAY(SYSDATE, '금')
     , NEXT_DAY(SYSDATE, 6)
  FROM DUAL;
   
--EXTRACT : (YEAR/MONTH/DAY FROM SYSDATE) - 년 월 일 / 세계표준시
SELECT EXTRACT(YEAR FROM SYSDATE)
     , EXTRACT(MONTH FROM SYSDATE)
     , EXTRACT(DAY FROM SYSDATE)
     , EXTRACT(HOUR FROM SYSTIMESTAMP)
     , EXTRACT(MINUTE FROM SYSTIMESTAMP)
     , EXTRACT(SECOND FROM SYSTIMESTAMP)
     , SYSTIMESTAMP
  FROM DUAL;
  
--MONTHS_BETWEEN : 두 날짜의 차이
SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE, 3))
     , MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 3), SYSDATE)
  FROM DUAL;

-- 날짜 추가
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

-- 타임스탬프 날짜 추가
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
  
-- TO_CHAR : 문자 반환 (숫자는 1,000와 같은 형식으로 표기됨)
SELECT TO_CHAR(1234)
     , TO_CHAR(SYSDATE, 'YYYY/MM/DD')
     , TO_CHAR(SYSDATE, 'YYYY"년"MM"월"DD"일"')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
     , TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD AM HH24:MI:SS.FF3')
     , TO_CHAR(1000000, '999,999,999')
     , TO_CHAR(1000000, '999,999,999L')
     , TO_CHAR(1000000, '000,000,000')
  FROM DUAL;

-- 통화 단위의 심볼 변경이 필요한 경우 다음의 ALTER문을 사용 
ALTER SESSION SET NLS_CURRENCY = '￦';
SELECT * FROM V$NLS_PARAMETERS WHERE PARAMETER LIKE 'NLS_CURRENCY'

-- TO_DATE : 날짜 반환
SELECT TO_DATE('20220425', 'YYYYMMDD')
     , TO_DATE('20220425')
  FROM DUAL;
 
-- TO_NUMBER : 숫자 변환
SELECT TO_NUMBER('20220425')
     , TO_NUMBER('20,220,425', '999,999,999')
     , TO_NUMBER('FFFF', 'XXXX') -- 16진수 변환
  FROM DUAL;

-- 날짜를 문자로 변환 후 숫자로 변환
SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYYMMDD'))
  FROM DUAL;