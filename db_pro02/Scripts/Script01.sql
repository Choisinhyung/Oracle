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
       u_id     NUMBER       PRIMARY KEY-- 컬럼 레벨 
     , jumin    CHAR(13)     UNIQUE
	 , name     VARCHAR2(50) NOT NULL
	 , age      NUMBER(3)    DEFAULT(0)
	 , gender   CHAR(1)      CHECK(GENDER IN ('M', 'F'))
     , birthday DATE         DEFAULT(SYSDATE)
     , ref_col  NUMBER       REFERENCES ref_t(r_id)
     , CONSTRANT PK_U_ID     PRIMARY KEY(u_id)
     , CONSTRANT UK_JUMIN    UNIQUE(jumin)
     , CONSTRANT FK_REF_T_R_ID FOREIGN KEY(ref_col) REFERENCES ref_t(r_id)

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
SELECT * FROM USER_CONSTRANTS WHERE TABLE_NAME = 'SAMPLE_T';

-- DESC SAMPLE_T;

-- 어떤 데이터가 저장되어야 하는지 알 수 있는 주석
COMMENT ON COLUMN sample_t.name IS '이름';
COMMENT ON COLUMN sample_t.age IS '나이';
COMMENT ON COLUMN sample_t.gender IS '성별(M:남자, F:여자)';
COMMENT ON COLUMN sample_t.birthday IS '생년월일';

SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME = 'SAMPLE_T';

-- 테이블 삭제
DROP TABLE sample_t;

