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


