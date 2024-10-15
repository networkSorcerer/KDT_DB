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
where sal >= 3000 or deptno =20 and hiredate < '82/01/01';