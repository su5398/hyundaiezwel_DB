SELECT * FROM TABS;

-- SELECT 문
-- 특정 테이블의 데이터를 조회하는 명령어
-- SELECT 컬럼명 FROM 테이블명

-- 모든 행과( WHERE 없음 ) 모든 컬럼( * ) 조회
SELECT *
FROM EMPLOYEE;
--실행 : CTRL + ENTER

-- 사원의 ID와 사원명, 전화번호 조회
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE;

-- WHERE 구문
-- 테이블에서 조건을 만족하는 값을 가진 행(ROW)을
-- 선택하여 조회하는 조건 절
-- 조건은 여러개의 조건도 가능 -> AND, OR 명령어와 함께 사용

-- 부서 코드(DEPT_CODE)가 'D6'인 사원의 정보를 조회.
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6';

--직급이(JOB_CODE) 'J1'인 사원의 사번(EMP_ID),사원명(EMP_NAME),직급코드(JOB_CODE),부서코드(DEPT_CODE) 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, DEPT_CODE 
FROM EMPLOYEE
WHERE JOB_CODE = 'J1';

-- Employee 테이블에서 급여(SALARY)가 300만원 이상인
-- 사원의 사번, 사원명, 직급코드, 급여 정보를 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3000000;

-- 부서코드가 'D6'이면서, 이름이 '유재식'인
-- 사원의 모든 정보 조회
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' EMP_NAME = '유재식';

--조건이 2개 이상 붙었을 경우 (AND, OR)
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR JOB_CODE = 'J3';

-- 컬럼에 별칭 달기
-- AS(ALIAS) 표현
SELECT EMP_ID AS "사원번호", EMP_NAME AS 사원명
FROM EMPLOYEE;

-- AS 생략
SELECT EMP_ID 사원번호, EMP_NAME "사원명"
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 사원번호가
-- 205번인 사원의
-- 사원명, 이메일, 급여, 입사일자를 조회
-- 단, 조회하는 컬럼에 별칭 부여

SELECT EMP_NAME AS 사원명, EMAIL AS 이메일, SALARY AS 급여, HIRE_DATE AS 입사일자
FROM EMPLOYEE
WHERE EMP_ID = 205;

-- 컬럼값을 사용하여 계산식을 적용
-- 연봉조회
SELECT EMP_NAME "사원명", (SALARY*12) "연봉", BONUS 보너스, (SALARY+(SALARY*BONUS))*12 "연봉총합"
FROM EMPLOYEE;

-- 컬럼값이 NULL이라면 어떠한 연산을 처리해도 결과는 NULL

-- NVL() : 값이 null일 경우 별도로 설정한 값으로 변경
-- NVL(컬럼, 값)
SELECT EMP_NAME "사원명", (SALARY*12) "연봉", BONUS 보너스, (SALARY*NVL(BONUS,0))*12 "연봉총합"
FROM EMPLOYEE;

-- DISTINCT
-- 조회하려는 컬럼에 같은 값이 여러개일 경우
-- 중복을 제거하고 한개만 조회(NULL포함)
SELECT  DEPT_CODE
FROM EMPLOYEE;

SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

-- DEPARTMENT 테이블에서
-- 부서가 '해외영업2부'인 부서의 부서코드를 찾고,
-- EMPLOYEE 테이블에서 해당 부서의 사원들 중 급여를 200만원보다 많이 받는 직원의
-- 사번, 사원명, 급여를 조회

/* 내 코드(틀림)
SELECT EMP_NO AS 사번, EMP_NAME AS 사원명, SALARY AS 급여
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_TITLE = '해외영업2부' AND SALARY > 2000000;
*/
-- 1.'해외영업2부'의 부서코드 찾기 (메모 D6)
SELECT * FROM DEPARTMENT WHERE DEPT_TITLE = '해외영업2부';
-- 2.조회한 부서코드를 사용하여 EMPLOYEE 조회
SELECT EMP_ID 사번, EMP_NAME 사원명, SALARY 급여
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' AND SALARY > 2000000;

-- 연산자
-- 연결 연산자
-- '||'
-- 여러 컬럼의 결과나 값을 하나의 컬럼으로 묶을때 사용하는 연산자

SELECT EMP_ID || EMP_NAME || '사원'
FROM EMPLOYEE;

-- 비교 연산자
-- <, >, <=, >= : 크기를 비교하는 부등호
-- = : 같다
-- != : 같지않다

-- EMPLOYEE 테이블에서 부서 코드가 'D9'이 아닌 직원들의 모든 정보 조회
SELECT * FROM EMPLOYEE
--WHERE DEPT_CODE != 'D9';
--WHERE DEPT_CODE ^= 'D9';
WHERE DEPT_CODE <> 'D9';

-- LIKE : 입력한 숫자, 문자가 포함된 정보를 조회할 때 사용하는 연산자
-- '_' : 임의의 한 문자
-- '%' : 몇자리 문자든 관계없이

-- EMPLOYEE에서
-- 사원 이름에 가운데가 '중'이 들어가는 사원 정보 조회
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_중_';


-- EMPLOYEE에서
-- 주민등록번호(EMP_NO) 기준 여성인 사원의 정보 조회(LIKE 사용)
SELECT *
FROM EMPLOYEE
WHERE EMP_NO LIKE '______-2%';

-- 사원 중 이메일 아이디가 5글자를 초과하는 사원의
-- 사원명 사번 이메일 정보 조회
SELECT EMP_NAME 사원명, EMP_ID 사번, EMAIL 이메일
FROM EMPLOYEE
WHERE EMAIL LIKE '______%@%';

SELECT EMP_NAME 사원명, EMP_ID 사번, EMAIL 이메일
FROM EMPLOYEE
WHERE EMAIL LIKE '___#_%@%' ESCAPE '#';
--4번째 자리가 '_'
-- ESCAPE 문자를 선언하여 뒤에 오는 문자를 특수문자가 아닌 일반 문자로 선언해 사용 할 수 있다.

-- IN 연산자
-- IN(값1, 값2, 값3, ...)
-- 괄호안에 있는 값 중 하나라도 일치 하는 경우
-- 해당하는 행을 조회하는 연산자

-- 부서코드가 D1이거나 D6인 부서 직원 정보 조회
SELECT *
FROM EMPLOYEE
-- WHERE DEPT_CODE = 'D1' OR DEPT_CODE = 'D6';
WHERE DEPT_CODE IN ('D1','D6');

-- 부서 코드가 D1도 D6도 아닌 부서의 직원 조회

SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE NOT IN ('D1','D6');


SELECT *
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 5500000;

-- BETWEEN A AND B
SELECT *
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 5500000;

SELECT *
FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 3500000 AND 5500000;




-- 함수(FUNCTION) --
-- LENGTH() / LENGTHB()
-- 문자열의 길이를 계산하는 함수

-- DUAL : 임시테이블(가상의 테이블)
--		SELECT 문에서 리터럴을 활용한 테스트를 진행 하고자 할때 사용하는 임시 테이블

SELECT LENGTH ('Hello'), LENGTHB('Hello'), LENGTH ('권장현'), LENGTHB('권장현') 
FROM DUAL;
-- LENGTHB() => 바이트크기 확인
-- 오라클에서 영어 이외의 타른 언어는 3BYTE
-- 10버전 이전에는 2BYTE, 그 이후에는 3BYTE

SELECT LENGTH(EMAIL), EMAIL
FROM EMPLOYEE;


-- INSTR() : 주어진 값에서 원하는 문자가 몇번째인지 찾아 반환하는 함수
SELECT INSTR('ABCDE','A'), INSTR('ABCDE','C'), INSTR('ABCDE','BC'),INSTR('ABCDE','Z')
FROM DUAL;

-- SUBSTR() : 주어진 값에서 특정 부분만 꺼내오는 함수
SELECT 'Hello World', SUBSTR('Hello World',1,5), SUBSTR('Hello World',4) -- 1부터 5개, 4부터
FROM DUAL;

--  LAPD() / PRAD()
-- 빈칸을 지정한 문자로 채우는 함수
SELECT LPAD(EMAIL, 30, '#')
FROM EMPLOYEE;

SELECT LPAD(EMAIL, 20, '-')
FROM EMPLOYEE;

SELECT LPAD(EMAIL, LENGTH(EMAIL)+1, '*')
FROM EMPLOYEE;

-- LTRIM/RTRIM
-- (컬럼|값, [,'찾을 문자'])
-- 특정 컬럼값, 값으로 부터 특정 문자를 찾아 지워주는 함수

-- 찾을 문자를 지정하지 않은 경우 공백(빈칸)을 지운다.
SELECT '     Hello', LTRIM('     Hello'), RTRIM('Hello      ')
FROM DUAL;


-- 찾을 문자를 지정 했을 경우
SELECT LTRIM('012345','0'), LTRIM('111112345','1'), LTRIM('0111345','1')
FROM DUAL;

-- TRIM()
-- 양끝을 기준으로 특정 문자를 찾아 지워주는 함수

-- 기본 형태
SELECT TRIM(LEADING '0' FROM '0001203000')
FROM DUAL;
SELECT TRIM(TRAILING'0' FROM '0001203000')
FROM DUAL;
SELECT TRIM(BOTH'0' FROM '0001203000')
FROM DUAL;

-- LOWER() / UPPER() / INITCAP()
-- 주어진 문자열을 소문자, 대문자로, 앞글자만 대문자로
-- 변경해주는 함수

SELECT LOWER('NICE TO MEET YOU'), UPPER('nice to meet you'), INITCAP('nice to meet you')
FROM DUAL;


-- CONTACT : 하나의 문자열로 합치는 함수
-- CONCAT(앞 문자열, 뒤 문자열)
SELECT CONCAT('오라클',' 너무 재밌다')
FROM DUAL;

SELECT CONCAT(EMP_NAME,'님') 이름 
FROM EMPLOYEE;

-- REPLACE()
-- 특정 문자열을 찾아 변경
SELECT REPLACE('HELLO WORLD', 'HELLO', 'BYE')
FROM DUAL;

-- EMPLOYEE 테이블에서 사원의 주민번호(EMP_NO)를 확인하여 생년 월일을 각각 조회하시오
-- 이름 | 생년 | 생월 | 생일
SELECT EMP_NAME AS 이름, SUBSTR(EMP_NO,1,2)||'년' AS 생년, CONCAT(SUBSTR(EMP_NO,3,2),'월') AS 생월, CONCAT(SUBSTR(EMP_NO,5,2),'일') AS 생일
FROM EMPLOYEE;




-- [실습 1]
--  직급이 'J2'이면서 200만원 이상 받는 직원 이거나,
--  직급이 'J7' 인 사원의 사번, 사원명, 직급코드, 급여
--  정보 조회하기

SELECT EMP_ID AS 사번, EMP_NAME AS 사원명, JOB_CODE AS 직급코드, SALARY AS 급여
FROM EMPLOYEE
WHERE (JOB_CODE = 'J2' AND SALARY > 2000000) OR JOB_CODE = 'J7';


-- [실습 2]
--  직급이 'J7' 이거나 'J2'이면서 급여를 200만원 이상
--  받는 직원의 사번, 사원명, 직급코드, 급여, 연봉을
--  조회하시오.

SELECT EMP_ID AS 사번, EMP_NAME AS 사원명, JOB_CODE AS 직급코드, SALARY AS 급여, (SALARY*12) AS 연봉
FROM EMPLOYEE
WHERE JOB_CODE IN ('J7','J2') AND SALARY >= 2000000;


-- [실습 3]
-- Employee 테이블에서
-- 사원들의 이름과, 이메일 주소를 조회하되,
-- 이메일은 아이디 부분만 조회하기
-- 조회 결과 --
-- 홍길동  hong_gd

-- 1. 이름과 이메일 조회
-- 2. @ 위치 찾기
-- 3. SUBSTR 활용하기

SELECT EMP_NAME AS 이름, SUBSTR(EMAIL,1,INSTR(EMAIL ,'@')-1) AS 이메일
FROM EMPLOYEE;

-- [실습 4]
-- EMPLOYEE 테이블에서
-- 모든 사원의 사번, 사원명, 이메일, 주민번호를
-- 조회하여 사원 목록표를 만들고자 한다.
-- 이 때, 이메일은 '@' 전 까지, 
-- 주민번호는 7번째 자리 이후 '*' 처리를 하여
-- 조회 하시오.

SELECT EMP_ID AS 사번, EMP_NAME AS 사원명, SUBSTR(EMAIL,1,INSTR(EMAIL ,'@')-1) AS 이메일, CONCAT(SUBSTR(EMP_NO,1,7),'*******')  AS 주민번호 --RPAD(SUBSTR(EMP_NO,1,7),14,'*')
FROM EMPLOYEE;


--------------------------
DROP TABLE MVCBOARD;

CREATE TABLE MVCBOARD(
	SEQ NUMBER PRIMARY KEY,
	WRITER VARCHAR2(100) NOT NULL,
	TITLE VARCHAR2(1000) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	REGRATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_MVCBOARD
NOCACHE;

INSERT INTO MVCBOARD
VALUES(SEQ_MVCBOARD.NEXTVAL, '관리자','테스트 중','테스트 1234 ABCD','20/02/22');

SELECT * FROM MVCBOARD;





