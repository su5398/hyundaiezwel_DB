-- EMPLOYEE 테이블에서 현재 근무하는
-- 여성 사원의 사번, 사원명, 직급코드를 조회
-- ENT_YN : 현재 근무 여부 파악하는 컬럼(퇴사여부)
-- WHERE 절에서도 함수 사용 가능.

SELECT EMP_ID 사번, EMP_NAME 사원명, JOB_CODE 직급코드, ENT_YN 퇴사여부
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1)='2' AND ENT_YN = 'N'; 

-- 각 항마다 반복적으로 적용되고 실행되는 함수를 단일 행 함수(SINGLE ROW FUNCTION)





-- 그룹 함수(GROUP FUNCTION)
-- 하나 이상의 행을 그룹으로 묶어 연산 후 하나의 컬럼으로 변환
-- SUM(), AVG(), COUNT(), MAX(), MIN() 
SELECT sum(SALARY)
FROM EMPLOYEE;

SELECT SUBSTR(EMP_NO,1,8)
FROM EMPLOYEE;

--AVG() : 해당 컬럼들의 평균
SELECT AVG(SALARY)
FROM EMPLOYEE;

-- MAX(), MIN() : 해당 컬럼들의 값 중 최대값, 최소값
SELECT MAX(SALARY)
FROM EMPLOYEE;
SELECT MIN(SALARY)
FROM EMPLOYEE;

-- EMPLOYEE에서 DEPT_CODE가 'D5'인 사원의
-- 평균 급여, 가장 높은 급여, 가장 낮은 급여, 급여합계 조회
SELECT AVG(SALARY), MAX(SALARY), MIN(SALARY), SUM(SALARY) 
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';












