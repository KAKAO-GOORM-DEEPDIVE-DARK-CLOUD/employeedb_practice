select EMP_NAME, SALARY, JOB_CODE
from employee
where JOB_CODE in ('J2', 'J7') and SALARY >= 2000000;