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

-- NVL() :

