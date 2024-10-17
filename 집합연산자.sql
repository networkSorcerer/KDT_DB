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