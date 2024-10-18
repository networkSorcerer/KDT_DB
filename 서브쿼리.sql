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

-- 직책이 'MANAGER'인 사원보다 많은 급여 받는 사원이 사원번호, 이름, 급여, 부서 이름 출력하기
select e.empno, e.ename, e.sal, d.dname
from emp e join dept d 
on e.deptno = d.deptno
where sal > all (
select sal 
from emp
where job = 'MANAGER');

-- EXISTS : 서브쿼리의 결과 값이 하나 이상 존재하면 true 
select *
from emp
where exists (
select dname 
from dept d
where deptno = 40
);

-- 다중열 서브쿼리 : 서브쿼리의 결과가 2개 이상의 컬럼으로 반환 되어메인 쿼리에 전달하는 쿼리
select empno, ename, sal, deptno
from emp 
where (deptno, sal) in (
select deptno, sal
from emp 
where deptno = 30
);

select *
from emp
where (deptno, sal) in (
select deptno, max(sal)
from emp
group by deptno
);

-- FROM 절에 사용하는 서브쿼리 : 인라인뷰라고 하기도 함
-- 테이블 내 데이터 규모가 너무 크거나 현재 작업에 
-- 불필요한 열이 너무 많아 일부 행과 열만 사용하고자 할 때 유용
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
from (
    select *
    from emp
    where deptno = 10 )  e10
    join dept d
    on e10.deptno = d.deptno;
    
-- 먼저 정렬하고 해당 갯수만 가져오기 : 급여가 많은 5명에 대한 정보 보여줘
select rownum, ename, sal
from (
    select *
    from emp
    order by sal desc
)
where rownum <= 5;

-- select 절에 사용하는 서브쿼리 : 단일행 서브쿼리를 스칼라 서브쿼리라고 함
-- select 절에 명시하는 서브쿼리는 반드시 하나의 결과만 반환하도록 작성해야함 
select empno, ename, job, sal,
(
select grade 
from salgrade
where e.sal between losal and hisal
) as "급여 등급" ,
deptno as "부서 번호",
(
    select dname
    from dept d
    where e.deptno = d.deptno
) as "부서이름"
from emp e
order by "급여 등급";

--조인 문으로 변경 하기
select e.empno, e.ename, e.job, e.sal,s.grade as "급여등급",d.deptno, d.dname
from emp e 
join salgrade s 
on e.sal between s.losal and s.hisal
join dept d 
on e.deptno = d.deptno 
order by "급여등급";

-- 부서 위치가 NEW YORK인 경우에는 본사, 그 외는 분점으로 반환하도록 만들기 
select empno, ename, 
case 
when deptno = (
 select deptno
 from dept
 where loc = 'NEW YORK') then '본사'
else '분점'
end as "소속"
from emp 
order by "소속";

select * from salgrade;
select * from emp;

-- 연습 문제 1번 
-- 전체 사원 중 ALLEN과 같은 직책(JOB)인  사원들의 사원 정보, 부서 정보를 
-- 다음과 같이 출력하는 sql문을 작성하세요. (직책, 사원번호, 사원이름, 급여, 부서번호, 부서 이름)
select e.job, e.empno, e.ename, e.sal, d.deptno, d.dname
from emp e join dept d 
on e.deptno = d.deptno
where job = (
select job
from emp
where ename = 'ALLEN');


-- 연습 문제 2번 
-- 전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 사원들의 사원 정보, 부서 정보, 급여 등급 정보를 출력하는
-- SQL문을 작성하세요(단 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는 
-- 사원 번호를 기준으로 오름차순으로 정렬하세요).
-- (사원 번호, 이름, 입사일, 급여, 급여 등급, 부서이름, 부서위치)
select e.empno, e.ename, e.hiredate, e.sal, s.grade, d.dname, d.loc
from emp e join salgrade s
on e.sal between s.losal and s.hisal
join dept d
on e.deptno = d.deptno
where sal > (
select avg(sal)
from emp)
order by e.sal desc , e.empno;

select *from dept;
-- 연습 문제 3번
-- 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 사원 정보, 
-- 부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
-- (사원번호, 사원이름, 직책, 부서번호, 부서이름, 부서위치) 

select e.empno, e.ename , e.job , d.deptno, d.dname, d.loc
from emp e join dept d
on e.deptno = d.deptno
where e.deptno =10 and e.job NOT IN (
select e.job 
from emp e join dept d
on e.deptno = d.deptno
where d.deptno =30);
-- 연습 문제 4번
-- 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원 정보, 
-- 급여 등급 정보를 다음과 같이 출력하는 SQL문을 작성하세요
-- (단 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 
-- 사원 번호를 기준으로 오름차순으로 정렬하세요).
select e.empno, e.ename, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal
where sal > (select MAX(sal) from emp where job = 'SALESMAN')
order by empno;

select e.empno, e.ename, s.grade
from emp e 
join salgrade s on e.sal between s.losal and s.hisal
join (select MAX(sal) as max_sal from emp where job = 'SALESMAN') salesman_max 
on e.sal > salesman_max.max_sal
order by e.empno;
