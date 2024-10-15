-- EMP ���� Ȯ��
desc emp;

-- select �� from �� 
-- select ���� ������ ���̽��� �����Ǿ� �ִ� ������ ��ȸ�Ҷ� ���
-- select ���� from ���� ����� ���̺��� ��ȸ�� ���� �����Ҽ� ����
-- select [��ȸ�� ��], [��ȸ�� ��]from ���̺� �̸�;
select * from emp; -- * ��� �� �Ǵ� ��� �÷��� �ǹ��Ѵ�. 
--from ������ ���� ���� ���̺� �̸�, sql ���๮�� ;(�����ݷ����� ��������)

-- Ư�� �÷��� �����ؼ� ��ȸ
select empno , ename , deptno from emp;
-- �����ȣ�� �μ���ȣ�� �������� SQL�ۼ� (empno, deptno)
select empno, deptno from emp;
-- �Ѵ��� ���� ���� ��Ī �ο��ϱ�
select ename, sal,comm, sal*12 + comm
from emp;

select ename "�̸�", sal as "�޿�", comm as "������", sal*12 "����"
from emp;

-- �ߺ� ��� �ϴ� distinct , �����͸� ��ȸ�� �� �ߺ��Ǵ� ���� �������� �� ��,
-- �ߺ��� ���� �Ѱ� ���� ����

select distinct deptno 
from EMP
order by deptno;

-- �÷����� ����ϴ� ��� ������(+,-,*/)
select ename, sal, sal * 12 "���� �޿�", sal * 12 + comm "�ѿ���"
from EMP;

-- �������� : ��å(job)�� �ߺ� �����ϰ� ����ϱ�
select distinct job, empno from emp;

-- where ���� (���ǹ�)
-- ������ ��ȸ�Ҷ� ����� ���ϴ� ���ǿ� �´� �����͸� ��ȸ�� ��

select * from EMP -- ���� ���̺� ���õǰ�, where ������ ���� �����ϰ� , ����� ���� ���� 
where deptno = 10;

-- �����ȣ�� 7369�� ����� ��� ������ ������
select * from emp
where empno = 7369; -- �����ͺ��̽����� �񱳴� =(����)��� �ǹ̷� ����

-- �޿��� 2500 �ʰ��� �����ȣ, �̸� , ��å, �޿� ���
-- emp ���̺��� �޿��� 2500 �ʰ��� ���� �����ϰ�, �����ȣ, ����̸�, ��å , �޿��� �÷��� ������ ���
select empno, ename,job, sal
from emp
where sal > 2500;

-- where ���� �⺻ ������ ���
select e.ename, d.deptno
from emp e join dept d
on e.deptno = d.deptno;

-- where ���� �⺻ ������ ���
select * from emp
where sal *12 = 36000;
-- where ���� ����ϴ� �� ������ : >,>=,<,<=
-- �������� 500 �ʰ��� ����� ��� ���� ���
select * from emp 
where comm > 500;

-- �Ի����� 81�� 1�� 1�� ���� ����� ��� ���� ����ϱ�
select * from emp
where hiredate < '90-01-01'; -- ������ ���̽��� ���ڿ� �񱳽� '', 
-- DATEŸ���� ��¥�� ���Ŀ� ������ ���� 

-- ���� ������ ǥ���ϴ� �������� ��� <>, !=, ^=, NOT �÷��� =
select * from emp 
-- where deptno <> 30;
-- where deptno != 30;
-- where deptno ^= 30;
where not deptno =30;

-- �� ������ : AND, OR, NOT
-- �޿��� 3000�̻��̰� �μ��� 20�� ����� ��� ���� ��� �ϱ�
select * from emp
where sal >= 3000 and deptno =20;
-- �� ������ : AND, OR, NOT
-- �޿��� 3000�̻��̰ų� �μ��� 20�� ����� ��� ���� ��� �ϱ�
select * from emp
where sal >= 3000 or deptno =20;
-- �� ������ : AND, OR, NOT
-- �޿��� 3000�̻��̰� �μ��� 20�� ����̰�, �Ի����� 82�� 1��1�� ���� �� ����� ��� ���� ��� �ϱ�
select * from emp
where sal >= 3000 and deptno =20 and hiredate < '82/01/01';
-- �� ������ : AND, OR, NOT
-- �޿��� 3000�̻��̰� �μ��� 20���̰ų� �Ի����� 82�� 1��1�� ������ ����� ��� ���� ��� �ϱ�
select * from emp
where sal >= 3000 or deptno =20 and hiredate < '82/01/01';