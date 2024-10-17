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




