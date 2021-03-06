-- NULL 처리 함수(NULL값은 연산을 하게되면 결과가 NULL로 나온다. 그것을 방지)
-- NVL(NULL, 지정값)
SELECT 10 * NVL(NULL, 0) AS COL1
  FROM DUAL;
  
-- DECODE(스위치문과 비슷) : 표현식, 조건1, 결과1, 조건2, 결과2 ... DEFAULT값
 
SELECT COUNTRY_ID
     , COUNTRY_NAME
     , DECODE(COUNTRY_ID, 'IT', '이태리', 'JP', '일본', 'US', '미국', 'CA', '캐나다', COUNTRY_NAME) AS COUNTRY_KOR
  FROM COUNTRIES;

-- CASE WHEN 값비교연산 AND 값비교연산 THEN 지정명
--      ELSE 비교연산값에 포함되지 않는 것의 지정명
--   END AS "??"
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , CASE WHEN SALARY >= 1000 AND SALARY < 3000 THEN '하위소득'
     		WHEN SALARY >= 3000 AND SALARY < 6000 THEN '중위소득'
     		WHEN SALARY >= 6000 AND SALARY < 10000 THEN '고소득'
     		ELSE '미분류'
     	END AS "소득분류"
  FROM EMPLOYEES;
  
-- 그룹연산
 
--SUM(SALARY) : 전체 직원의 급여 행의 값을 합침
SELECT SUM(SALARY)
     , SUM(COMMISSION_PCT)
  FROM EMPLOYEES;
  
-- AVG(SALARY) : 전체 급여 정보의 평균(소수점 조심해야 함- NULL데이터 통계오류 발생 가능)
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