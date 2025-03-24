-- 6. 관리자에 해당하는 직원에 대한 정보와 관리자가 아닌 직원의 정보를 추출하여 조회하세요.
SELECT DISTINCT E.EMP_ID, E.EMP_NAME, D.DEPT_TITLE, J.JOB_NAME, '관리자' AS 구분
FROM EMPLOYEE E
         LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
         LEFT JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE E.EMP_ID IN (SELECT DISTINCT MANAGER_ID FROM EMPLOYEE WHERE MANAGER_ID IS NOT NULL)
UNION
SELECT E.EMP_ID, E.EMP_NAME, D.DEPT_TITLE, J.JOB_NAME, '직원' AS 구분
FROM EMPLOYEE E
         LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
         LEFT JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE E.EMP_ID NOT IN (SELECT DISTINCT MANAGER_ID FROM EMPLOYEE WHERE MANAGER_ID IS NOT NULL);