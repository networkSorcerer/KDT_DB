--조인 : 여러 테이블을 하나의 테이블 처럼 사용하는 것
-- 이때 필요한 것 PK와 테이블간 공통 값인 FK를 사용
--JOIN의 종류
-- INNER JOIN(동등 조인) : 두 테이블에서 일치하는 데이터만 선택
-- Left Join : 왼쪽 테이블의 모든 데이터와 일치하는 데이터 선택
-- Right Join : 오른쪽 테이블의 모든 데이터와 일치하는 데이터 선택
-- full outer Join : 두 테이블의 모든 데이터를 선택

-- 카테시안의 곱
select *
from emp,dept
order by empno;

-- 등가 조인
select empno, ename,job,sal, e.deptno
from emp e, dept d
where e.deptno = d.deptno
order by empno;

--ANSI 조인
select empno, ename, job, sal, e.deptno
from emp e join dept d
on e.deptno = d.deptno
order by empno;

--DEPT테이블과 emp 테이블은 1: N관계를 가짐 (부서테이블의 부서번호에는 여러명의 사원이 올라옴)
-- 조인에서 출력 범위 설정 하기
SELECT empno, ename, sal, d.deptno, dname, loc
FROM emp e JOIN dept d 
ON e.deptno = d.deptno
WHERE sal >= 3000;


-- EMP 테이블 별칭을 E로, DEPT 테이블 별칭은 D로 하여 다음과 같이
-- 등가 조인을 했을 때 급여가 2500 이하이고,
-- 사원 번호가 9999 이하인 사원의 정보가 출력되도록 작성
-- 오라클 조인이나 ANSI조인 아무거나 사용

SELECT * 
FROM EMP e JOIN DEPT d 
ON e.DEPTNO = d.DEPTNO 
WHERE e.sal <= 2500 AND e.empno <= 9999
ORDER BY e.empno;



-- 비등가 조인 : 동일한 컬럼이 존재하지 않는 경우 조인할때 사용, 일반적인 방식은 아님
select * from salgrade; -- 각 급여에 대한 등급 표시
select ename, sal, grade
from emp e JOIN salgrade s
on sal between s.losal and s.hisal; -- 급여와 losal ~ hisal 비등가 조인 

-- 자체 조인(self join) : 자기 자신의 테이블과 조인하는 것을 말함(같은 테이블을 두번 사용)
select e1.empno, e1.ename, e1.mgr,
e2.empno as 상관사원번호,
e2.ename as 매니저이름
from emp e1 join emp e2
on e1.mgr =e2.empno;

-- 외부 조인 (outer join) : Left, Right, Full
select e.ename, e.deptno, d.dname
from emp e join dept d 
on e.deptno = d.deptno
order by e.deptno;

select e.ename, d.deptno, d.dname
from emp e right outer join dept d 
on e.deptno = d.deptno
order by e.deptno;

-- natural join : 등가 조인과 비슷하지만 where 조건절 없이 사용 
-- (두테이블의 동일한 이름이 있는 열을 자동으로 찾아서 조인 해줌
select empno, ename, deptno, dname
from emp natural join dept;

-- join ~ using : 등가 조인을 대신하는 조인 방식
select e.empno, e.ename, e.job, deptno, d.dname, d.loc
from emp e join dept d 
using(deptno)
order by e.empno;


-- Q1. 급여가 2000초과인 사원들의 정보 출력 (부서 번호, 부서이름, 사원 번호, 사원이름, 급여)
-- join on , natural join, join using
select d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e join dept d
on e.deptno = d.deptno;

-- Q2. 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수 출력
-- (부서번호, 부서이름,평균 급여, 최대 급여, 최소 급여, 사원수)
-- 제공하신 SQL 쿼리는 대체로 잘 작성되었지만, group by에 d.dname을 포함하지 않으면 오류가 발생할 수 있습니다. 
-- 이유는 GROUP BY 절에 포함되지 않은 열(d.dname)을 SELECT에서 직접 사용할 수 없기 때문입니다.
select e.deptno, d.dname, round(avg(e.sal)),max(e.sal),min(e.sal),count(empno)
from emp e join dept d 
on e.deptno = d.deptno
group by e.deptno, d.dname;

-- Q3. 모든 부서정보와 사원 정보 출력 (부서 번호와 부서 이름 순으로 정렬), 모든 부서가 나와야 함 
select * from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno, d.dname;


