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
