-- 9. '하'가 이름에 포함된 직원의 이름, 주민번호, 부서코드를 조회
SELECT EMP_NAME, EMP_NO, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%';