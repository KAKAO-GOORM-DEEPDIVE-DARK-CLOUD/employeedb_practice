-- 6. 보너스를 지급받지 않는 직원의 사번, 이름, 급여, 보너스를 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;