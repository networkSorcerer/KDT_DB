--���� : ���� ���̺��� �ϳ��� ���̺� ó�� ����ϴ� ��
-- �̶� �ʿ��� �� PK�� ���̺� ���� ���� FK�� ���
--JOIN�� ����
-- INNER JOIN(���� ����) : �� ���̺��� ��ġ�ϴ� �����͸� ����
-- Left Join : ���� ���̺��� ��� �����Ϳ� ��ġ�ϴ� ������ ����
-- Right Join : ������ ���̺��� ��� �����Ϳ� ��ġ�ϴ� ������ ����
-- full outer Join : �� ���̺��� ��� �����͸� ����

-- ī�׽þ��� ��
select *
from emp,dept
order by empno;

-- � ����
select empno, ename,job,sal, e.deptno
from emp e, dept d
where e.deptno = d.deptno
order by empno;