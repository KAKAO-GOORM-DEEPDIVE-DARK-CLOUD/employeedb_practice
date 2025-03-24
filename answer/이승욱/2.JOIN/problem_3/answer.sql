-- 3. 이름에 '형'자가 들어가는 직원 조회
SELECT
    E.EMP_ID,
    E.EMP_NAME,
    J.JOB_NAME
FROM EMPLOYEE E
         JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE E.EMP_NAME LIKE '%형%';