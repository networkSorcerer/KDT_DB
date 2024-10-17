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