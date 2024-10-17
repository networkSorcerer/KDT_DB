-- 집합 연산자 : 2개 이상의 쿼리 결과를 하나로 결합하는 연산자(수직적 처리)
-- 여러개의 select 문을 하나로 연결하는 기능 
-- 집합 연산자로 결합하는 결과의 컬럼은 데이터 타입이 동일해야 함
select empno, ename, sal, deptno
from emp 
where deptno =10
union
select empno, ename, sal, deptno
from emp 
where deptno =20
union
select empno, ename, sal, deptno
from emp 
where deptno =30;

-- 교집합 : INTERSECT
-- 여러개의 SQL문의 결과에 대한 교집합을 반환
select empno, ename, sal
from emp
where sal > 1000  -- 1001 ~
INTERSECT
select empno, ename, sal
from emp
where sal < 2000;

-- 차집합 : MINUS, 중복행에 대한 결과를 하나의 결과를 보여줌
select empno, ename, sal
from emp
minus
select empno, ename, sal
from emp
where sal > 2000;