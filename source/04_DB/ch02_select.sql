-- [II] SELECT 문 
-- 1. SELECT문 작성법
show user;
-- 현재 계정 (실행: CTRL+ENTER)
SELECT * FROM TAB; -- 현계정이 가지고 있는 테이블들
SELECT * FROM EMP; --EMP 테이블의 모든 열, 모든 행
SELECT * FROM DEPT; --DEPT의 테이블의 모든 열, 모든 행

--2. 특정열만 출력
DESC EMP;
    -- EMP 테이블구조를 나타내는 ORACLE 명령
SELECT EMPNO ,ENAME, SAL, JOB FROM EMP; -- EMPNO, ENAME, SAL, JOB 열만 모든 행 검색
SELECT EMPNO AS "사 번", ENAME AS "이름", SAL AS "급여" , JOB AS "직책" FROM EMP;
SELECT EMPNO  "사 번", ENAME  "이름", SAL  "급여" , JOB  "직책" FROM EMP;
SELECT EMPNO  "사 번", ENAME AS 이름, SAL AS 급여 , JOB AS 직책 FROM EMP;

--3. 특정 행 출력: WHERE(조건절) -비교연산자: 같다(=), 다르다(!=, ^=, <>),/>,>=,
SELECT EMPNO NO, ENAME, SAL FROM EMP WHERE SAL=3000;
SELECT EMPNO NO, ENAME, SAL FROM EMP WHERE SAL^=3000;
SELECT EMPNO NO, ENAME, SAL FROM EMP WHERE SAL<>3000;
SELECT EMPNO NO, ENAME, SAL FROM EMP WHERE SAL!=3000;
    -- 비교연산자는 숫자, 문자, 날짜형 모두 가능
    -- EX1) 사원이름(ENAME)이 'A','B','C'로 시작하는 사원의 모든 필드(열)
    -- 'A' < 'AA' < 'AAA' < 'AAAA' < 'B' < 'C' < 'D'
    SELECT * FROM EMP WHERE ENAME < 'D';
    --  EX2) 82년도 이전에 입사한 사원의 모든 필드
    SELECT * FROM EMP WHERE HIREDATE < '82/01/01';
--4. 특정 행 출력: WHEREWJF(조건절) - 논리연산자: AND, OR, NOT
    -- EX1, 급여(SAL)가 2000이상 3000이하인 직원의 모든 필드
    SELECT *FROM EMP WHERE 2000<=SAL AND SAL<=3000;
    --EX2, 82년도에 입사한 사원의 모든 필드
    SELECT *FROM EMP WHERE HIREDATE >= '82/01/01' AND HIREDATE <='82/12/31';
    -- 날짜 표기법 세팅(현재 : YY/MM/DD 또는  RR/MM/DD)
    ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
    SELECT * FROM EMP;
    SELECT TO_CHAR(HIREDATE, 'YY/MM/DD') FROM EMP;
    -- 날짜 셋팅을 고려한 82년도 입사한 사원의 모든 필드
    SELECT * FROM EMP 
        WHERE TO_CHAR(HIREDATE, 'YY/MM/DD') >= '82/01/01' AND 
            TO_CHAR(HIREDATE, 'YY/MM/DD')<='82/12/31';
 -- EX3. 연봉이 2400이상인 직원의 ENAME, SAL, 연봉(SAL*12)을 출력
    SELECT ENAME, SAL, SAL*12 ANNUALSAL -- (3)
        FROM EMP            -- (1)
        WHERE SAL*12>=2400;  -- (2) WHERE절에는 필드의 별칭 사용 불가
    -- EX4. 연봉이 3000이상인 직원의 ENAME, SAL, 연봉을 연봉순으로 출력
    SELECT ENAME, SAL, SAL*12 연봉 -- (3)
        FROM EMP              -- (1) 
        WHERE SAL*12>=3000    -- (2)WHERE절에는 필드의 별칭 사용 불가
        ORDER BY 연봉;   -- (4) ORDER BY절에는 필드의 별칭 사용 가능
    -- EX5 JOB이 MANAGER이거나 10번 부서(DEPTNO) 외의 직원 모든 필드
    SELECT * FROM EMP WHERE JOB='MANAGER' OR DEPTNO!=10;
        
-- 5. 산술연산자(SELECT절, 조건절, ORDER BY절) 
    -- 모든 사원의 10% 인상된 월급과 사번(EMPNO), 이름(ENAME)을 출력
    SELECT EMPNO, ENAME, SAL*1.1 FROM EMP;
    -- 모든 사원의 이름(ENAME), 월급(SAL), 상여(COMM), 연봉(SAL*12+COMM)을 출력
    SELECT ENAME, SAL, COMM, SAL*12+COMM 연봉 FROM EMP;
    -- 산술연산의 결과는 NULL을 포함하면 결과도 NULL
    -- NVL(NULL일 수도 있는 필드명, NULL을 대체할 값)을 이용
    SELECT ENAME, SAL, COMM, NVL(COMM, 0), SAL*12+NVL(COMM, 0) 연봉 FROM EMP;
    -- 모든사원의 사번, 이름, 상사사번(상사가 없으면 'CEO'로 출력) 출력
    SELECT EMPNO, ENAME, NVL(TO_CHAR(MGR),'CEO') MGR FROM EMP;
    SELECT * FROM EMP;
    
-- 6. 연결연산자(||) : 필드값이나 문자를 연결
    SELECT ENAME || '은 ' || JOB EMPLOYEE FROM EMP;

-- 7. 중복제거(DISTINCT)
    SELECT DISTINCT JOB FROM EMP;
    SELECT DISTINCT DEPTNO FROM EMP;
    
-- 8. SQL연산자(BETWEEN, IN, LIKE, IS NULL)
  -- (1) BETWEEN A AND B : A부터 B까지(A, B포함, A<=B)
    -- EX1. SAL이1500이상 3000이하인 직원의 사번, 이름, 급여
    SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>=1500 AND SAL<=3000;
    SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 1500 AND 3000;
    SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 3000 AND 1500; -- (X)
    -- EX2. SAL이 1500미만, 3000 초과
    SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL NOT BETWEEN 1500 AND 3000;
    SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL<1500 OR SAL>3000;
    -- EX3. 이름이 'A','B','C' 로 시작하는 직원의 모든 필드
    SELECT * FROM EMP 
        WHERE ENAME BETWEEN 'A' AND 'D' AND ENAME!='D';
    -- EX4. 82년도에 입사한 직원의 모든 필드
    SELECT * FROM EMP
        WHERE TO_CHAR(HIREDATE,'RR/MM/DD') BETWEEN '82/01/01' AND '82/12/31';
        
  -- (2) 필드명 IN (값1, 값2,.. 값N)
    -- EX. 부서번호(DEPTNO)가 10, 20, 40번인 직원의 모든 필드
    SELECT * FROM EMP WHERE DEPTNO=10 OR DEPTNO=20 OR DEPTNO=40;
    SELECT * FROM EMP WHERE DEPTNO IN (10, 20, 40);
    -- EX. 직책(JOB)이 MANAGER거나 ANALYST인 사원의 모든 필드
    SELECT * FROM EMP WHERE JOB IN ('MANAGER', 'ANALYST');
    
  -- (3) 필드 LIKE 패턴 : %(0글자이상), _(한글자)를 포함한 패턴
    -- EX. 이름이 M으로 시작하는 사원의 모든 필드
    SELECT * FROM EMP WHERE ENAME LIKE 'M%';
    -- EX. 이름에 N이 들어가거나 JOB에 N이 들어가는 직원의 모든 필드
    SELECT * FROM EMP 
        WHERE ENAME LIKE '%N%' OR JOB LIKE '%N%';
    -- EX. 급여(SAL)가 5로 끝나는 사원의 모든 필드
    SELECT * FROM EMP WHERE SAL LIKE '%5';
    -- EX. 82년도에 입사한 사원의 모든 필드
    SELECT * FROM EMP WHERE HIREDATE LIKE '82/%';
    -- EX. 1월에 입사한 사원의 모든 필드
    SELECT * FROM EMP WHERE HIREDATE LIKE '%/01/__';

  -- (4) 필드 IS NULL (해당 필드가 널인지 여부) 
    -- EX. 상여금(COMM)을 받지 않는 사원의 모든 필드
    SELECT * FROM EMP WHERE COMM=0 OR COMM IS NULL;
    -- EX. 상여금을 받는 사원의 모든 필드
    SELECT * FROM EMP WHERE COMM!=0 AND COMM IS NOT NULL;
    SELECT * FROM EMP WHERE COMM!=0 AND NOT COMM IS NULL;

-- 9. 정렬(오름차순, 내림차순) : ORDER BY절
    SELECT * FROM EMP ORDER BY SAL; -- SAL 기준 오름차순 정렬
    SELECT * FROM EMP ORDER BY SAL, ENAME; -- SAL기준 오름차순 정렬(SAL이 같으면 ENAME 오름차순)
    SELECT * FROM EMP ORDER BY SAL DESC; -- SAL 기분 내림차순 정렬
    SELECT * FROM EMP ORDER BY SAL DESC, HIREDATE DESC;-- SAL기준 내림차순(SAL이 같으면 HIREDATE 내림차순)
    

    
    
    
    