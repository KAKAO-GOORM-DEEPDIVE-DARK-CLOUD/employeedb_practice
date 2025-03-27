SELECT D.DEPT_ID AS '부서코드', D.DEPT_TITLE AS '부서명', 평균급여
FROM DEPARTMENT D
         JOIN (SELECT DEPT_CODE, AVG(SALARY) AS 평균급여
               FROM EMPLOYEE
               WHERE DEPT_CODE IS NOT NULL
               GROUP BY DEPT_CODE
) AS AVG_TABLE
              ON D.DEPT_ID = AVG_TABLE.DEPT_CODE
ORDER BY 평균급여 DESC
    LIMIT 3;