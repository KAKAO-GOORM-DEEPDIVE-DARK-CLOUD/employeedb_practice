-- 10. 부서별 급여 합계가 전체 급여의 총 합의 20%보다 많은 부서의 부서명과, 부서별 급여 합계를 조회하세요.
SELECT D.DEPT_TITLE, SUM(E.SALARY) AS DEPT_SALARY
FROM EMPLOYEE E
         JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
GROUP BY D.DEPT_TITLE
HAVING SUM(E.SALARY) > (
    SELECT SUM(SALARY) * 0.2
    FROM EMPLOYEE
);