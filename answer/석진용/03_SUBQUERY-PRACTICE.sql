-- 1. 부서코드가 노옹철 사원과 같은 소속의 직원 명단 조회하세요.

SELECT *
FROM employee AS e
WHERE e.`DEPT_CODE` = ( SELECT e.`DEPT_CODE`
                        FROM employee AS e
                        WHERE e.`EMP_NAME` = '노옹철');

-- 2. 전 직원의 평균 급여보다 많은 급여를 받고 있는 직원의 사번, 이름, 직급코드, 급여를 조회하세요.

SELECT e.`EMP_ID`, `EMP_NAME`, e.`JOB_CODE`, e.`SALARY`
FROM employee AS e
WHERE e.`SALARY` > ( SELECT AVG(e.`SALARY`) 
                     FROM employee AS e);


-- 3. 노옹철 사원의 급여보다 많이 받는 직원의 사번, 이름, 부서코드, 직급코드, 급여를 조회하세요.

SELECT e.`EMP_ID`, e.`EMP_NAME`, e.`DEPT_CODE`, e.`JOB_CODE` e.`SALARY`
FROM employee AS e
WHERE e.`SALARY` > ( SELECT e.`SALARY` 
                     FROM employee AS e
                     WHERE e.`EMP_NAME` = '노옹철');

-- 4. 가장 적은 급여를 받는 직원의 사번, 이름, 부서코드, 직급코드, 급여, 입사일을 조회하세요.

-- *** 서브쿼리는 SELECT, FROM, WHERE, HAVING, ORDER BY절에도 사용할 수 있다.

SELECT e.`EMP_ID`, e.`EMP_NAME`, e.`DEPT_CODE`, e.`JOB_CODE`, e.`SALARY`, e.`HIRE_DATE`
FROM employee AS e
ORDER BY e.`SALARY` ASC LIMIT 1;

-- 5. 부서별 최고 급여를 받는 직원의 이름, 직급코드, 부서코드, 급여 조회하세요.

SELECT e.`DEPT_CODE`, MAX(e.`SALARY`) AS MAX_SALARY
FROM employee AS e
WHERE e.`DEPT_CODE` IS NOT NULL
GROUP BY e.`DEPT_CODE`;

-- *** 여기서부터 난이도 극상

-- 6. 관리자에 해당하는 직원에 대한 정보와 관리자가 아닌 직원의 정보를 추출하여 조회하세요.
-- 사번, 이름, 부서명, 직급, '관리자' AS 구분 / '직원' AS 구분
-- HINT!! is not null, union(혹은 then, else), distinct

SELECT e.`EMP_ID`, e.`EMP_NAME`, d.`DEPT_TITLE`, j.`JOB_NAME`,e.`MANAGER_ID`
FROM employee AS e
    JOIN department AS d ON e.`DEPT_CODE` = d.`DEPT_ID`
    JOIN job AS j ON e.`JOB_CODE` = j.`JOB_CODE`
WHERE e.`MANAGER_ID` IS NOT NULL 
UNION
SELECT e.`EMP_ID`, e.`EMP_NAME`, d.`DEPT_TITLE`, j.`JOB_NAME`,e.`MANAGER_ID`
FROM employee AS e
    JOIN department AS d ON e.`DEPT_CODE` = d.`DEPT_ID`
    JOIN job AS j ON e.`JOB_CODE` = j.`JOB_CODE`
WHERE e.`MANAGER_ID` IS NULL;

-- 7. 자기 직급의 평균 급여를 받고 있는 직원의 사번, 이름, 직급코드, 급여를 조회하세요.
-- 단, 급여와 급여 평균은 만원단위로 계산하세요.
-- HINT!! round(컬럼명, -5)

SELECT e.`EMP_ID`, e.`EMP_NAME`, e.`JOB_CODE`, e.`SALARY`
FROM employee AS e
    JOIN (SELECT e.`JOB_CODE`, ROUND(AVG(e.`SALARY`), -5) AS AVG_SALARY
          FROM employee AS e
          GROUP BY e.`JOB_CODE`) AS sub
    ON e.`JOB_CODE` = sub.`JOB_CODE`
    AND e.`SALARY` = sub.`AVG_SALARY`;       

-- 8. 퇴사한 여직원과 같은 부서, 같은 직급에 해당하는 직원의 이름, 직급코드, 부서코드, 입사일을 조회하세요.

SELECT e.`EMP_NAME`, e.`JOB_CODE`, e.`DEPT_CODE`, e.`HIRE_DATE`
FROM employee AS e
WHERE   e.`DEPT_CODE` = (SELECT e.`DEPT_CODE` FROM employee AS e WHERE e.`ENT_YN` = 'Y')
    AND e.`JOB_CODE` = (SELECT e.`JOB_CODE` FROM employee AS e WHERE e.`ENT_YN` = 'Y');

-- 9. 급여 평균 3위 안에 드는 부서의 부서 코드와 부서명, 평균급여를 조회하세요.
-- HINT!! limit

SELECT d.`DEPT_TITLE`, ROUND(AVG(e.`SALARY`), -5) 
FROM employee AS e
    JOIN department AS d ON e.`DEPT_CODE` = d.`DEPT_ID`
GROUP BY e.`DEPT_CODE`
LIMIT 3;

-- 10. 부서별 급여 합계가 전체 급여의 총 합의 20%보다 많은 부서의 부서명과, 부서별 급여 합계를 조회하세요.

SELECT SUM(e.`SALARY`) AS SUM_SALARY, e.`DEPT_CODE`
FROM employee AS e
WHERE e.`DEPT_CODE` IS NOT NULL
    AND e.`SUM_SALARY` > (SELECT ROUND(SUM(e.`SALARY`) / 5, -5)
                      FROM employee AS e)
GROUP BY e.`DEPT_CODE`;

SELECT SUM(e.`SALARY`) AS SUM_SALARY, e.`DEPT_CODE`
FROM employee AS e
WHERE e.`DEPT_CODE` IS NOT NULL
GROUP BY e.`DEPT_CODE`
HAVING SUM_SALARY > (
    SELECT ROUND(SUM(e.`SALARY`) / 5, -5)
    FROM employee AS e
);