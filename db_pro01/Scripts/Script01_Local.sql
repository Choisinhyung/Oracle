--질의문(Query작성)
SELECT 'HELLO Oracle' FROM DUAL;

/*
 * 일반 사용자 계정을 새로 만들어 관리자 계정과 분리.
 * 아래의 작업은 관리자 권한이 있는 계정을 사용해야 함.
 */

-- 계정과 패스워드 생성하는 방법(생성 - CREATE, 변경 - ALTER)
CREATE USER puser1 IDENTIFIED BY puser1;

/*
 * 생성한 계정에 권한 부여(즉, 제어기능을 부여)
 * RESOURCE나 CONNECT는 개별적인 권한들의 묶음으로 구성되어 있다.(ROLE 역할)
 * CONNECT는 접속만 하는 역할
 * RESOURCE는 DB자원을 사용할 수 있게 하는 역할 (CREATE SEQUENCE, CREATE TABLE, CREATE TRIGGER ...)
 */
GRANT RESOURCE, CONNECT TO puser1;
GRANT INSERT ANY TABLE, UPDATE ANY TABLE
	, DELETE ANY TABLE, CREATE VIEW
 TO puser1;

 
-- 마우스 우클릭 - 실행 - 활성화된 DB연결 설정

-- 테이블스페이스 사용 권한 부여
ALTER USER puser1 quota 10M ON USERS;
COMMIT;
 
-- 사용자 계정 목록 확인하는 법.(USERNAME = 컬럼명)
SELECT USERNAME FROM ALL_USERS;

-- 계정에 부여한 권한 확인 (관리자 계정)
SELECT PRIVILEGE FROM DBA_SYS_PRIVS WHERE GRANTEE = 'PUSER1';

-- 계정에 부여한 ROLE 권한 확인 (관리자 계정)
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'PUSER1';

COMMIT;








