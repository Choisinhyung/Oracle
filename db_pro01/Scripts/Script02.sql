/*
 * 데이터 잘 들어갔는지 확인 하는 테이블 - HR정보 확인
 */

-- 직원 테이블
SELECT * FROM EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID > 100;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID != 100;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID <> 100;

-- 부서 테이블
SELECT * FROM DEPARTMENTS;
SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPARTMENTS;
-- 직급 테이블
SELECT * FROM JOBS;

-- 나라 테이블
SELECT * FROM COUNTRIES;

-- 지역 테이블(해당 국가)
SELECT * FROM LOCATIONS;

-- 대륙 정보 테이블(아프리카, 아시아 ... )
SELECT * FROM REGIONS;




--컬럼명에 별칭 부여(AS, "" 생략 가능, 별칭에 띄어쓰기가 있는경우에는 "" 꼭 붙여야 함)
SELECT EMPLOYEE_ID AS "사번" 
	 , FIRST_NAME "이름"
	 , LAST_NAME 성
	 , EMAIL "이메일 주소"
	FROM EMPLOYEES;

-- 컬럼과의 연산(문자열 결합은 ||연산자)
SELECT EMPLOYEE_ID "사번"
	 , LAST_NAME || ' ' || FIRST_NAME AS "성명"
	 -- 수치값에 대한 연산
	 , SALARY * 12 || '$' "연봉" 
  FROM EMPLOYEES;

-- 조건절 WHERE 별칭명에 사번이라는 이름을 정의해도 조건은 원래 테이블에 있는 컬럼명을 사용한다.
 -- 실행순서 : FROM > WHERE > SELECT
SELECT EMPLOYEE_ID "사번"
	 , FIRST_NAME
	 , LAST_NAME
	 , EMAIL
	 , PHONE_NUMBER
	 , HIRE_DATE
	 , JOB_ID SALARY
	 , COMMISSION_PCT 
	 , MANAGER_ID
	 , DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID > 200;

/*
 *  조건절에서 사용하는 연산자
 * AND, OR, IN, NOT, NOT IN, BETWEEN ... AND
 * LIKE, IS NULL, IS NOT NULL
 * 우선순위 : NOT > AND > OR
 */

SELECT * FROM EMPLOYEES
 WHERE EMPLOYEE_ID > 200
   AND SALARY >= 1000;

SELECT * FROM EMPLOYEES
 WHERE EMPLOYEE_ID > 200
   OR SALARY >= 1000;

SELECT * FROM EMPLOYEES
 WHERE NOT EMPLOYEE_ID > 200;

-- 소괄호를 붙여서 연산의 우선순위 지정 가능
SELECT * FROM EMPLOYEES
 WHERE (NOT EMPLOYEE_ID > 200)
   AND SALARY >= 1000;

-- 해당 값 지정
SELECT * FROM EMPLOYEES
 WHERE EMPLOYEE_ID IN (200, 201, 202, 203);

SELECT * FROM EMPLOYEES
 WHERE EMPLOYEE_ID NOT IN (200, 201, 202, 203);

-- 연속된 범위의 수치 지정시 BETWEEN A AND B 사용
SELECT * FROM EMPLOYEES
 WHERE EMPLOYEE_ID BETWEEN 200 AND 203;

SELECT * FROM EMPLOYEES
 WHERE EMPLOYEE_ID NOT BETWEEN 200 AND 203;

--문자열 관련 검색시 LIKE %
SELECT * FROM EMPLOYEES
 WHERE JOB_ID LIKE 'AD%';

SELECT * FROM EMPLOYEES
 WHERE JOB_ID LIKE '%VP';

SELECT * FROM EMPLOYEES
 WHERE JOB_ID LIKE '%A%';

-- 자릿수 지정시 LIKE _ 사용 (특정 형식으로 구성되는 문자열 나타내기)
SELECT * FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '___.127.____';

SELECT * FROM EMPLOYEES
 WHERE JOB_ID LIKE '%#____' ESCAPE '#';

SELECT * FROM EMPLOYEES
 WHERE JOB_ID LIKE '%\____' ESCAPE '\';

SELECT * FROM EMPLOYEES
 WHERE JOB_ID LIKE '%$____' ESCAPE '$';

-- NULL값 조회(비교연산 사용 불가 : >,<,=,!=)
SELECT EMPLOYEE_ID
	 , FIRST_NAME
	 , LAST_NAME
	 , COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NULL;

-- IS NOT NULL
SELECT EMPLOYEE_ID
	 , FIRST_NAME
	 , LAST_NAME
	 , COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;

-- 별칭 부여시 "" / 문자열 리터럴 사용시 ''



 