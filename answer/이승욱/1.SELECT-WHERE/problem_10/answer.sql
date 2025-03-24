-- 10. 전화번호 국번이 9로 시작하는 직원의 사번, 이름, 전화번호를 조회
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '___9%';