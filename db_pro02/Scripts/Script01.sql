/*
 * DDL : 데이터 정의어
 * 	- Data Definition Language
 *  - 객체를 정의하기 위한 CREATE(생성), ALTER(수정,변경), DROP(삭제) 구문이 있다.
 *  - 오라클에서 말하는 객체는 대표적으로 TABLE, VIEW, SEQUENCE, FUNCTION, PROCEDUAL, USER ... 등이 있다.
 */

/*
 * 제약조건(CONSTRANT)
 *  - 테이블에 데이터를 저장할 떄 저장되는 데이터를 제한하기 위해 사용하는 조건.
 *  - 이는 데이터의 무결성 보장을 목적으로 한다.
 *  - 입력되는 데이터의 오류 확인도 할 수 있다.
 *  - NOT NULL : NULL 데이터는 있을 수 없다. 
 *  - UNIQUE : 중복값을 허용하지 않는다.
 *  - PRIMARY KEY : NOT NULL + UNIQUE 결합된 제약조건 / 유일한 고유값을 사용하기 위해 쓰인다 - 기본키(PK)
 *  - FOREIGN KEY : 다른 테이블의 값을 참조하기 위한 용도로 사용 / 참조값이 있는 경우에만 저장할 수 있게 제약 /
 *  				참조 되는 데이터가 있는 경우 수정, 삭제를 임의로 하지 못하게 제약하기 위한 용도 - 외래키(FK), 참조키(값)이라고 한다.
 *  - CHECK : 미리 설정한 값만 저장할 수 있도록 검사를 하여 제약
 * 
 * 컬럼레벨 : 컬럼에 직접 명시하여 작성
 * 테이블레벨 : 컬럼 외로 명시하여 작성(CONSTRAINT (FOREIGN KEY REFERENCES)) / 주로 복합 키 설정이 필요한 경우 사용(두개의 외래키 ...) - 컬럼레벨보다 보기에 깔끔하다.
 */

CREATE 테이블명 (
      컬럼명 자료형(크기지정) [제약조건]
     , ...
);

CHAR : 고정 길이 문자열
VARCHAR : 가변 길이 문자열, 최대 길이만 정하고 실제 저장되는 데이터의 크기에 맞추어 공간을 할당한다. 최대 2000Byte
VARCHAR2 : 최대 4000Byte 문자를 저장 할 수 있다.
NUMBER : 숫자 타입
NUMBER(n) : 숫자 타입, 정수 자릿수 크기 지정
NUMBER(n,m) : 숫자 타입, 소수점 자릿수 크기 지정
DATE : 날짜
TIMESTAMP : 타임스탬프, 날짜
LOB : LARGE OBJECT Byte DATA
	  BEFILE, BLOB, CLOB
	  
-- NOT NULL, UNIQUE

CREATE TABLE sample_t (
       u_id     NUMBER       --PRIMARY KEY-- 컬럼 레벨 
     , jumin    CHAR(13)     --UNIQUE
	 , name     VARCHAR2(50) NOT NULL
	 , age      NUMBER(3)    DEFAULT(0)
	 , gender   CHAR(1)      CHECK(GENDER IN ('M', 'F'))
     , birthday DATE         DEFAULT(SYSDATE)
     , ref_col  NUMBER       --REFERENCES ref_t(r_id)
     , CONSTRAINT PK_U_ID     PRIMARY KEY(u_id)
     , CONSTRAINT UK_JUMIN    UNIQUE(jumin)
     , CONSTRAINT FK_REF_T_R_ID FOREIGN KEY(ref_col) REFERENCES ref_t(r_id)
);
-- 외래키 참조 확인하기위해 참조테이블 생성
CREATE TABLE ref_t (
       r_id NUMBER PRIMARY KEY
     , note VARCHAR2(100)
);

DROP TABLE ref_t;
DROP TABLE sample_t;

-- SAMPLE_T의 테이블을 검색
SELECT * FROM USER_ALL_TABLES WHERE TABLE_NAME = 'SAMPLE_T';
-- SAMPLE_T테이블의 컬럼을 검색
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'SAMPLE_T';
-- 제약조건에 대한 이름을 부여 (안해도 되지만 관리목적 ~ )
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'SAMPLE_T';

-- DESC SAMPLE_T;

-- 어떤 데이터가 저장되어야 하는지 알 수 있는 주석
COMMENT ON COLUMN sample_t.name IS '이름';
COMMENT ON COLUMN sample_t.age IS '나이';
COMMENT ON COLUMN sample_t.gender IS '성별(M:남자, F:여자)';
COMMENT ON COLUMN sample_t.birthday IS '생년월일';

SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME = 'SAMPLE_T';

-- 테이블 삭제
DROP TABLE sample_t;
DROP TABLE MY_TEST;
DROP TABLE ALT_T;

CREATE TABLE ALT_T(
	   u_id NUMBER
	 , name VARCHAR(10)
	 , g_type CHAR(1)
	 , now_date DATE
	 , remark VARCHAR(100)	 
);

CREATE TABLE MY_TEST_REF(
       ref_id NUMBER PRIMARY KEY
     , ref_text VARCHAR(100)
);

/*
 * ★테이블 정보를 수정할 때 기존 데이터 유무와 다른 테이블과의 관계에 대한 사항을 고려하여 작성해야 한다.★
 */

-- 테이블 이름 변경 : 비추천! 참조되어 있는 테이블이 있을 경우 더 이상 참조할 수 없기 때문에 비추
ALTER TABLE ALT_T RENAME TO MY_TEST;

-- 컬럼 이름 변경 : 이것도 비추 ~ 
ALTER TABLE MY_TEST RENAME COLUMN now_date TO birth_date;

-- 새로운 컬럼 추가 : DEFAULT는 필수로 작성하는게 좋음. 안하면 NULL이니까!
ALTER TABLE MY_TEST ADD age NUMBER(3) NOT NULL;
ALTER TABLE MY_TEST ADD ref_col NUMBER;

-- MODIFY : 이미 있는 컬럼에 대해서 타입을 지정 / 백업하고 새로 만드는게 좋대..ㅜ
ALTER TABLE MY_TEST MODIFY name VARCHAR(20);
ALTER TABLE MY_TEST MODIFY age NUMBER(3) DEFAULT(0);

--데이터의 크기를 늘리는 방향으로 사용하는 것을 추천.
ALTER TABLE MY_TEST MODIFY name VARCHAR(50);

--컬럼 지우기 : 비추!
ALTER TABLE MY_TEST DROP COLUMN REMARK;

--제약조건 추가(PRIMARY KEY)
ALTER TABLE MY_TEST MODIFY u_id NUMBER CONSTRAINT PK_MY_TEST_U_ID PRIMARY KEY; -- 컬럼 레벨로 컬럼 수정하면서 추가
ALTER TABLE MY_TEST ADD CONSTRAINT PK_MY_TEST_U_ID  PRIMARY KEY(u_id); -- 테이블레벨로추가

ALTER TABLE MY_TEST MODIFY u_id NUMBER;

ALTER TABLE MY_TEST MODIFY name VARCHAR(50) UNIQUE;
ALTER TABLE MY_TEST ADD UNIQUE(name);
ALTER TABLE MY_TEST MODIFY ref_col NUMBER REFERENCES MY_TEST_REF(ref_id);
ALTER TABLE MY_TEST ADD FOREIGN KEY(ref_col) REFERENCES MY_TEST_REF(ref_id);

ALTER TABLE MY_TEST MODIFY g_type NOT NULL;
ALTER TABLE MY_TEST MODIFY age CHECK(AGE BETWEEN 0 AND 150);
--제거
ALTER TABLE MY_TEST DROP CONSTRAINT SYS_C008015;

ALTER TABLE MY_TEST_REF DROP COLUMN ref_id CASCADE CONSTRAINT; -- 비추..
DROP TABLE MY_TEST_REF CASCADE CONSTRAINT; -- 비추..

--테이블 유무 확인
SELECT * FROM USER_ALL_TABLES WHERE TABLE_NAME = 'MY_TEST';
-- 컬럼 확인
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'MY_TEST';
-- 조건 확인
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MY_TEST';