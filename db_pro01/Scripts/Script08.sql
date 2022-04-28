/*
 * 모든 컬럼명은 한글로 별칭을 부여하여 조회한다.
 * FIRST_NAME과 LAST_NAME을 하나의 컬럼(이름)으로 만들어서 조회되도록 한다.
 * PHONE_NUMBER에서 사용한 구분자 .은 -로 변경하여 조회되도록 한다.
 * EMAIL주소는 @example.com 을 추가로 덧붙여서 조회되도록 한다. (소문자만 나오게 한다.)
 * HORE_DATE는 YYYY년 MM월 DD일 형식으로 조회되도록 하며, 
 * 추가로 입사일부터 현재일까지의 근년일수가 계산되어 조회되도록 한다.
 * SALARY는 원화 단위로 변환시켜 조회하며, COMMISSION_PCT가 있는 경우 이를 계산한 SALARY 금액이 나오게 한다.
 * 추가 100원 단위는 절사한다.
 * 입사일을 기준으로 오름차순 정렬하여 조회하도록 한다.
 */

SELECT FIRST_NAME || ' ' || LAST_NAME AS "성명"
     , REPLACE(PHONE_NUMBER,'.', '-')AS "핸드폰 번호"
     , LOWER(EMAIL) || '@example.com' AS "이메일 주소"
     , TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일"') AS "고용일"
     , TRUNC(MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(HIRE_DATE, 3)) / 12) || '년' AS "근속년수"
     , TRUNC(SALARY * 1260 * (1 + NVL(COMMISSION_PCT, 0)), -3) || '￦' AS "급여"
  FROM EMPLOYEES
 ORDER BY 4;

/*
 * 전화번호 회선을 집계하기 위한 조회 쿼리를 만드시오.
 * 전화번호 회선은 515, 590, 650, 011, 603 별로 구분하여 얼마나 사용되고 있는지 조회하도록 한다.
 * 번호별 회선 수에 추가로 전체 회선 수가 조회될 수 있도록 한다.
 */

SELECT NVL(SUBSTR(PHONE_NUMBER, 1, 3), '총 합') AS "회선 별"
     , COUNT(SUBSTR(PHONE_NUMBER, 1, 3)) AS "사용 회선"
  FROM EMPLOYEES
 GROUP BY ROLLUP(SUBSTR(PHONE_NUMBER, 1, 3))
 ORDER BY 1;

/*
 * MANAGER_ID는 해당 EMPLOYEE_ID르 관리하는 관리자 정보가 연결되어 있는 정보이다.
 * 한 명의 관리자가 얼마나 많은 직원을 관리하고 있는지를 알 수 있도록 조회 쿼리를 작성한다.
 * MANAGER_ID가 NULL인 경우는 제외하여 조회하도록 한다.
 */

SELECT MANAGER_ID AS "관리자ID"
     , COUNT(*) AS "인원수"
  FROM EMPLOYEES
 WHERE MANAGER_ID IS NOT NULL
 GROUP BY ROLLUP(MANAGER_ID);
