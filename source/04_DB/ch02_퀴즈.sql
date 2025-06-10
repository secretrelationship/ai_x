--1. emp 테이블의 구조 출력

--2. emp 테이블의 모든 내용을 출력 
SELECT * FROM EMP;
--3. 현 scott 계정에서 사용가능한 테이블 출력

--4. emp 테이블에서 사번, 이름, 급여, 업무, 입사일 출력

--5. emp 테이블에서 급여가 2000미만인 사람의 사번, 이름, 급여 출력
SELECT *FROM EMP WHERE 2000>SAL
--6. 입사일이 81/02이후에 입사한 사람의 사번, 이름, 업무, 입사일 출력
SELECT * FROM EMP WHERE HIREDATE > '82/02/01';
--7. 업무가 SALESMAN인 사람들 모든 자료 출력
SELECT * FROM EMP WHERE JOB='SALESMAN'
--8. 업무가 CLERK이 아닌 사람들 모든 자료 출력

--9. 급여가 1500이상이고 3000이하인 사람의 사번, 이름, 급여 출력
SELECT *FROM EMP WHERE 1500<=SAL AND SAL<=3000;
--10. 부서코드가 10번이거나 30인 사람의 사번, 이름, 업무, 부서코드 출력

--11. 업무가 SALESMAN이거나 급여가 3000이상인 사람의 사번, 이름, 업무, 부서코드 출력

--12. 급여가 2500이상이고 업무가 MANAGER인 사람의 사번, 이름, 업무, 급여 출력

--13.“ename은 XXX 업무이고 연봉은 XX다” 스타일로 모두 출력(연봉은 SAL*12+COMM)
