SELECT e.EMP_NAME AS '이름', e.JOB_CODE AS '직급코드', e.DEPT_CODE AS '부서코드', e.SALARY AS '급여'
FROM EMPLOYEE e
         JOIN (SELECT DEPT_CODE, MAX(SALARY) AS '최고급여'
               FROM EMPLOYEE
               GROUP BY DEPT_CODE
) AS MAX_TABLE
              ON e.DEPT_CODE = MAX_TABLE.DEPT_CODE
                  AND e.SALARY = MAX_TABLE.최고급여;