-- 1. 부서코드가 노옹철 사원과 같은 소속의 직원 명단 조회하세요.
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = (
    SELECT DEPT_CODE
    FROM EMPLOYEE
    WHERE EMP_NAME = '노옹철'
);