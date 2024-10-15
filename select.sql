-- EMP 정보 확인
desc emp;

-- select 와 from 절 
-- select 문은 데이터 베이스에 보관되어 있는 데이터 조회할때 사용
-- select 절은 from 절에 명시한 테이블에서 조회할 열을 지정할수 있음
-- select [조회할 열], [조회할 열]from 테이블 이름;
select * from emp; -- * 모든 열 또는 모든 컬럼을 의미한다. 
--from 다음에 오는 것이 테이블 이름, sql 수행문은 ;(세미콜론으로 끝나야함)

-- 특정 컬럼만 선택해서 조회
select empno , ename , deptno from emp;
-- 사원번호와 부서번호만 나오도록 SQL작성 (empno, deptno)
select empno, deptno from emp;
-- 한눈에 보기 좋게 별칭 부여하기
select ename, sal,comm, sal*12 + comm
from emp;

select ename "이름", sal as "급여", comm as "성과급", sal*12 "연봉"
from emp;

-- 중복 재고 하는 distinct , 데이터를 조회할 때 중복되는 행이 여러행이 될 때,
-- 중복된 행을 한개 씩만 선택

select distinct deptno 
from EMP
order by deptno;

-- 컬럼값을 계산하는 산술 연산자(+,-,*/)
select ename, sal, sal * 12 "연간 급여", sal * 12 + comm "총연봉"
from EMP;

-- 연습문제 : 직책(job)을 중복 제거하고 출력하기
select distinct job, empno from emp;

-- where 구문 (조건문)
-- 데이터 조회할때 사용자 원하는 조건에 맞는 데이터만 조회할 때

select * from EMP -- 먼저 테이블 선택되고, where 절에서 행을 제한하고 , 출력할 열을 결정 
where deptno = 10;

-- 사원번호가 7369인 사원의 모든 정보를 보여줘
select * from emp
where empno = 7369; -- 데이터베이스에서 비교는 =(같다)라는 의미로 사용됨

-- 급여가 2500 초과인 사원번호, 이름 , 직책, 급여 출력
-- emp 테이블에서 급여가 2500 초관인 행을 선택하고, 사원번호, 사원이름, 직책 , 급여에 컬럼을 선택해 출력
select empno, ename,job, sal
from emp
where sal > 2500;

-- where 절에 기본 연산자 사용
select e.ename, d.deptno
from emp e join dept d
on e.deptno = d.deptno;

-- where 절에 기본 연산자 사용
select * from emp
where sal *12 = 36000;
-- where 절에 사용하는 비교 연산자 : >,>=,<,<=
-- 성과급이 500 초과인 사람의 모든 정보 출력
select * from emp 
where comm > 500;

-- 입사일이 81년 1월 1일 이전 사람의 모든 정보 출력하기
select * from emp
where hiredate < '90-01-01'; -- 데이터 베이스의 문자열 비교시 '', 
-- DATE타입은 날짜의 형식에 맞으면 가능 

-- 같지 않음을 표현하는 여러가지 방법 <>, !=, ^=, NOT 컬럼명 =
select * from emp 
-- where deptno <> 30;
-- where deptno != 30;
-- where deptno ^= 30;
where not deptno =30;

-- 논리 연산자 : AND, OR, NOT
-- 급여가 3000이상이고 부서가 20번 사원의 모든 정보 출력 하기
select * from emp
where sal >= 3000 and deptno =20;
-- 논리 연산자 : AND, OR, NOT
-- 급여가 3000이상이거나 부서가 20번 사원의 모든 정보 출력 하기
select * from emp
where sal >= 3000 or deptno =20;
-- 논리 연산자 : AND, OR, NOT
-- 급여가 3000이상이고 부서가 20번 사원이고, 입사일이 82년 1월1일 이전 인 사원의 모든 정보 출력 하기
select * from emp
where sal >= 3000 and deptno =20 and hiredate < '82/01/01';
-- 논리 연산자 : AND, OR, NOT
-- 급여가 3000이상이고 부서가 20번이거나 입사일이 82년 1월1일 이전인 사원의 모든 정보 출력 하기
select * from emp
where sal >= 3000 or (deptno =20 and hiredate < '82/01/01');
--급여가 2500 이상이고 직책이 MANGER인 사원의 모든 정보 출력
select * from emp
where sal >= 2500 and job = 'MANAGER';

select * from emp
where job = 'MANAGER' or JOB = 'SALESMAN' or JOB = 'CLERK';
-- IN 연산자 : 여러개의 열 이름을 조회할 경우 연속해서 나열할수 있음 
select * from emp
where JOB in ('MANAGER','SALESMAN','CLERK');

--IN 연산자를 사용해 20번과 30번 부서에 포함된 사원의 모든 정보조회
select * from emp
where deptno in (20, 30);

-- NOT IN 연산자를 사용해 20번과 30번 부서에 포함도니 사원 조회
select * from emp
where deptno not in (10);
-- 비교 연산자와 AND연산자를 사용하여 출력하기
select * from emp
where job != 'MANAGER' and JOB <>'SALESMAN' and job ^='CLERK';

--BETWEEN A AND B 연산자 : 일정한 범위를 조회할때 사용하는 연산자

--급여가 2000에서 3000 사이 사원의 모든 정보를 출력
select * from emp
where sal >= 200 and sal <= 3000;

-- between a and b 연산자 : 일정한 범위를 조회할 떄 사용하는 연산자 
select * from emp
where sal not between 2000 and 3000;

-- 사원번호가 7689에서 7902까지의 사원의 모든 정보 출력
select * from emp
where empno between 7689 and 7902;

-- 1980년이 아닌 해에 입산한 사원의 모든 정보 출력 
select * from emp
where hiredate not between '80/01/01' and '80/12/31';


-- LIKE, NOT LIKE 연산자 : 문자열을 검색할 때 사용 하는 연산자 
-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- _ : 문자 1개를 의미 
select empno, ename 
from emp
where ename like '%K%';
-- 앞과 뒤의 문자열 길이에 상관 없이 K라는 문자가 ename에-- 포함된 사원의 정보 출력

-- 사원의 이름의 두번째 글자가 L인 사원만 출력하기
select *from emp
where ename LIKE '_L%';

-- [실습] 사원 이름에 AM이 포함되어있는 사원 데이터만 출력 
select * from emp
where ename like '%AM%';
-- [실습] 사원 이름에 AM이 포함되어 있지 않은 사원 데이터만 출력 
select * from emp
where ename not like '%AM%';

-- 와일드 카드 문자가 데이터 일부일 경우  (%, _) escape로 지정된 '\'뒤에 오는 
-- %와일드 카드가 아니라는 의미
select * from emp
where ename like '%\%s' escape '\'; -- 사원 이름, %P로 끝나는 사원을 조회

INSERT INTO emp(empno, ename, job , mgr, hiredate, sal, comm, deptno)
values (1001, 'jame%s','MANAGER',7839,'2024/10/15',3500,450,30);

delete from emp
where empno = 1001;

select * from emp;

-- is null 연산자 : 
-- 데이터의 값에는 null 값을 가질 수 있음, 값이 정해지지 않음을 의미, 연산 불가 (계산, 비교, 할당)
select ename , sal, sal*12+comm "연봉", comm
from emp;

-- 비교연산으로 null 비교하기 -- null로 비교 안됨 
select * from emp
where comm = null;

SELECT * FROM emp
WHERE comm is NULL;

-- 직속 상관이 있는 사원 데이터 출력 하기 

SELECT * FROM emp
WHERE mgr is not NULL;

SELECT * FROM emp
WHERE mgr is NULL;

-- 정렬을 위한 order by 절 : 오름 차순 또는 내림 차순 정렬 간으 

SELECT * FROM emp
ORDER BY sal ASC;

--정렬을 위한 order by 절 : 오름 차순 또는 내림차순 정렬 가능 
select * from emp
order by sal;

-- 급여에 대한 오름 차순 정렬 
select * from emp
order by sal desc;

-- 사원 번호 기준 내림 차순 정렬 하기 
SELECT * FROM emp
ORDER BY empno;

-- 정렬 조건을 여러 컬럼을  설정하기
SELECT * FROM emp
ORDER BY sal, ename;

SELECT * FROM emp
ORDER BY deptno ASC, SAL DESC;

-- 별칭 사용과 order by
SELECT empno 사원번호, ename 사원명, sal 월급, hiredate 입사일 -- 3. 출력해야할 컬럼제한
FROM emp
where sal >= 2000
ORDER BY 월급 DESC, 사원명 ASC;

SELECT ENAME || 'S JOB IS '||JOB AS EMPLOYEE
FROM EMP;