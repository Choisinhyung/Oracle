--질의문(Query작성)
SELECT 'HELLO Oracle' FROM DUAL;

/*
 * 사용자(user)가 local에 구성한 사람은 system 계정을 사용중. - DBMS 관리자 계정
 * 일반 사용자 계정을 새로 만들어 관리자 계정과 분리.
 */

-- 계정과 패스워드 생성하는 방법
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