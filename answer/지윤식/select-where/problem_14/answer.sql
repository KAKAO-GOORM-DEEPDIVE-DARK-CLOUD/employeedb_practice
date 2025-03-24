select EMP_NAME, SALARY, JOB_CODE
from employee
where (JOB_CODE = 'J2'and SALARY >= 2000000) or JOB_CODE = 'J7';