SELECT E.EMP_NAME AS '이름', E.JOB_CODE AS '직급코드', E.DEPT_CODE AS '부서코드', E.HIRE_DATE AS '입사일'
FROM EMPLOYEE E
         JOIN (SELECT DEPT_CODE, JOB_CODE
               FROM EMPLOYEE
               WHERE ENT_YN = 'Y'
                 AND EMP_NO LIKE '_______2%'
) AS AVG_TABLE
              ON E.JOB_CODE = AVG_TABLE.JOB_CODE
                  AND E.DEPT_CODE = AVG_TABLE.DEPT_CODE;