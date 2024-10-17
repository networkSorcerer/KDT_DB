-- ���� ������ : 2�� �̻��� ���� ����� �ϳ��� �����ϴ� ������(������ ó��)
-- �������� select ���� �ϳ��� �����ϴ� ��� 
-- ���� �����ڷ� �����ϴ� ����� �÷��� ������ Ÿ���� �����ؾ� ��
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

-- ������ : INTERSECT
-- �������� SQL���� ����� ���� �������� ��ȯ
select empno, ename, sal
from emp
where sal > 1000  -- 1001 ~
INTERSECT
select empno, ename, sal
from emp
where sal < 2000;

-- ������ : MINUS, �ߺ��࿡ ���� ����� �ϳ��� ����� ������
select empno, ename, sal
from emp
minus
select empno, ename, sal
from emp
where sal > 2000;