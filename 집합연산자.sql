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