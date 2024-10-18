-- 서브쿼ㅣ : 다른 SQL 쿼리문 내에 포함되는 쿼리문을 말함 
-- 주로 데이터를 필터링 하거나 데이터 집계에 사용
-- 서브쿼리 select, insert , update, delete문에 모두 사용가능
-- 단일행 서브쿼리(단 하나의 행으로 결과가 반환) 와 다중행 서브쿼리 (여러행의 결과가 반환)가 있음 

select dname as 부서이름
from dept
where deptno = (
select deptno
from emp
where ename = 'KING'
);

-- 서브쿼리로 'jones'의 급여보다 높은 급여를 받는 사원 정보 출력
select *
from emp
where sal > (
select sal 
from emp 
where ename = 'JONES'
);


-- 서브쿼리는 연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓이며 괄호()로 묶어서 표현
-- 특정한 경우를 제외하고는 order by 절을 사용할수 없음 
-- 서브쿼리의 select절에 명시한 열은 메인 쿼리비교 대상과 같은 자료형과 같은 개수로 지정해야 함

-- 문제 : EMP테이블의 사원정보중에서 사원 이름이 ALLEN인 사원의 추가 수장 보다 많은 사원 정보출력
select * from emp
where comm > (
select comm 
from emp
where ename = 'ALLEN'
and comm is not null
);

-- 문제 : james보다 먼저 입사한 사원들의 정보 출력 
select * from emp
where hiredate < (
select hiredate
from emp
where ename = 'JAMES'
);

-- 문제 : 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 정보와 소속부서 조회
select e.empno, e.ename, e.sal , e.deptno, d.dname, d.loc
from emp e join dept d
on e.deptno = d.deptno
where e.deptno = 20 and e.sal > (
select avg(sal)
from emp);

-- 실행 결과가 여러개인 다중행 서브쿼리
-- IN : 메인 쿼리의 데이터가 서브쿼리의 결과중 하나라도 일치하는 데이터가 있다면 true
-- any, some : 메인 쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
-- all : 메인 퀄의 조건식을 서브퀄의 결과 모두 만족하면 true
-- exists : 서브쿼리의 결과가 존재하면 (즉 , 한개 이상의 행이 결과를 만족하면) true

--메인 쿼리에 급여가 서브 쿼리에서 각 부서의 최대 급여가 같은 사원의 모든 정보가 출력
select * 
from emp
where sal in (
select max(sal)
from emp
group by deptno
);

select empno, ename, sal
from emp
where sal > any(
select sal from emp
where job = 'SALESMAN');

-- 30번 부서 사원들의 급여보다 적은 급여를 받는 사원 정보 출력
select *
from emp
where sal < all(select sal
from emp
where deptno = 30);





