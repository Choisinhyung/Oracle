/*
 * EMPLOYEES 테이블의 직원이름, 이메일, 전화번호, 고용일을 조회한다.
 *		직원 이름은 성과 이름을 하나의 컬럼으로 만들어야 한다.
 *		이메일 뒤에는 @employees.co.kr 을 붙여야 한다.
 *		전화번호의 구분자는 .대신 -이 사용되도록 한다.
 * 		고용일은 xxxx년 xx월 xx일 형식으로 출력되게 한다.
 */

SELECT FIRST_NAME || ' ' || LAST_NAME AS "직원이름"
     , EMAIL || '@employees.co.kr' AS "EMAIL" 
     , REPLACE(PHONE_NUMBER, '.', '-') AS "PHONE_NUMBER"
     , TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일"') AS "HIRE_DATE"
 FROM EMPLOYEES;

/*
 * EMPLOYEES 테이블에서 직원이름, 급여, 연봉을 조회한다.
 * 		연봉은 급여에 12개월을 곱하는 것으로 한다.
 */

SELECT FIRST_NAME || ' ' || LAST_NAME AS "직원이름"
     , SALARY
     , SALARY * 12 AS "연봉"
  FROM EMPLOYEES;

 -- EMPLOYEES 테이블에서 전화번호가 011로 시작하는 직원의 성+이름과 사원번호, 전화번호를 조회한다.

SELECT FIRST_NAME || ' ' || LAST_NAME AS "직원이름"
     , EMPLOYEE_ID AS "사원번호"
     , PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '011%';

/*
 * EMPLOYEES 테이블에서 커미션이 존재하는 직원의 이름과 급여, 연봉을 조회한다.
 * 		연봉에는 커미션이 계산된 연봉으로 조회한다.
 */
SELECT  FIRST_NAME || ' ' || LAST_NAME AS "직원이름"
      , SALARY AS "급여"
      , COMMISSION_PCT
      , SALARY * 12 + SALARY * NVL(0, COMMISSION_PCT) AS "연봉"
  FROM EMPLOYEES;

-- EMPLOYEES 테이블에서 2000년도에 고용된 직원을 조회한다.
SELECT * 
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN TO_DATE('20000101') AND TO_DATE('20001231');

-- EMPLOYEES 테이블에서 고용일(HIRE_DATE)를 기준으로 1999년 12월 31일을 까지의 근무 개월수가 60개월 이상인 직원을 조회한다. 
SELECT *
  FROM EMPLOYEES
 WHERE MONTHS_BETWEEN(TO_DATE('19991231'), HIRE_DATE) >= 60; 

-- EMPLOYEES 테이블에서 고용일(HIRE_DATE)를 기준으로 1999년 12월 31일을 까지의 근속년이 7년 이상인 직원을 조회한다.
SELECT *
  FROM EMPLOYEES
 WHERE MONTHS_BETWEEN(TO_DATE(19991231), HIRE_DATE) >= 12 * 7;
 




