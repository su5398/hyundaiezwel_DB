-- CREATE : 데이터 베이스의 객체를 생성하는 DDL

-- 제약조건
-- UNIQUE : 중복 허용X
-- NOT NULL : NULL 받을 수 없다.
-- CHECK : 특정 범위 값만 허용
-- PRIMARY KEY : UNIQUE + NOT NULL
--					한 개의 테이블에 하나만 존재.
-- FOREIGN KEY : 다른 테이블의 값을 참조.
--					기본키, 유니크 제약조건이 걸려있는 컬럼만 참조 가능.



-- DML(데이터 조작언어) --
-- INSERT, UPDATE, DELETE, SELECT(DQL) --
-- [CURD] --
-- C(CREATE) : INSERT / 데이터 추가
-- R(READ)   : SELECT / 데이터 조회
-- U(UPDATE) : UPDATE / 데이터 수정
-- D(DELETE) : DELETE / 데이터 삭제


-- INSERT : 새로운 행을 특정 테이블에 추가하는 명령어
-- 			실행 후에는 테입블의 ROW(행)가 증가 한다.

-- INSERT INTO 테이블명[(컬럼명, 컬럼명, ...)] VALUES(값, 값,...);

-- 컬럼을 명시하여 데이터 추가
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, 
					 SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_DATE, ENT_YN)
VALUES(500,'권장현','970311-1234567','su539@naver.com','01012345678','D1','J7','S4',3100000,0.1,'200',
		CURRENT_DATE, NULL, DEFAULT);

SELECT * FROM EMPLOYEE
WHERE EMP_ID = 500;

-- 컬럼을 명시하지 않고 데이터 추가(모든 컬럼에 값을 추가)
INSERT INTO EMPLOYEE
VALUES(900,'권장형','660101-2345678','ASDF@or.kr','01033335555','D1','J7','S3','4300000',0.2,'200', CURRENT_DATE, NULL, DEFAULT);

SELECT * FROM EMPLOYEE
WHERE EMP_ID IN(500,900);

-- INSERT + SUBQUERY
-- VALUES 대신 SUBQUERY로 값을 지정하여 추가
CREATE TABLE EMP_01 (
	EMP_ID NUMBER,
	EMP_NAME VARCHAR2(20),
	DEPT_TITLE VARCHAR2(40)
);


SELECT * FROM EMP_01;

INSERT INTO EMP_01(
	SELECT EMP_ID, EMP_NAME, DEPT_TITLE
	FROM EMPLOYEE
	LEFT JOIN DEPARTMENT ON(DEPT_CODE=DEPT_ID)
);


-- UPDATE : 해당 테이블의 데이터를 수정하는 명령어
-- UPDATE 테이블명 SET 컬럼명 = 수정할 값, 컬럼명=수정할 값,...
-- [WHERE 조건]

-- UPDATE 실행 후 데이터의 수는(ROW의 개수) 변하지 않는다.

CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;

-- D9 부서를 총무부 -> 전략기획부
UPDATE DEPT_COPY
SET DEPT_TITLE='전략기획부'
























