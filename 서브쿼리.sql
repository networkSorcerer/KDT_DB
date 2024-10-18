-- �������� : �ٸ� SQL ������ ���� ���ԵǴ� �������� ���� 
-- �ַ� �����͸� ���͸� �ϰų� ������ ���迡 ���
-- �������� select, insert , update, delete���� ��� ��밡��
-- ������ ��������(�� �ϳ��� ������ ����� ��ȯ) �� ������ �������� (�������� ����� ��ȯ)�� ���� 

select dname as �μ��̸�
from dept
where deptno = (
select deptno
from emp
where ename = 'KING'
);

-- ���������� 'jones'�� �޿����� ���� �޿��� �޴� ��� ���� ���
select *
from emp
where sal > (
select sal 
from emp 
where ename = 'JONES'
);


-- ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����ʿ� ���̸� ��ȣ()�� ��� ǥ��
-- Ư���� ��츦 �����ϰ�� order by ���� ����Ҽ� ���� 
-- ���������� select���� ����� ���� ���� ������ ���� ���� �ڷ����� ���� ������ �����ؾ� ��

-- ���� : EMP���̺��� ��������߿��� ��� �̸��� ALLEN�� ����� �߰� ���� ���� ���� ��� �������
select * from emp
where comm > (
select comm 
from emp
where ename = 'ALLEN'
and comm is not null
);

-- ���� : james���� ���� �Ի��� ������� ���� ��� 
select * from emp
where hiredate < (
select hiredate
from emp
where ename = 'JAMES'
);

-- ���� : 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ������ �ҼӺμ� ��ȸ
select e.empno, e.ename, e.sal , e.deptno, d.dname, d.loc
from emp e join dept d
on e.deptno = d.deptno
where e.deptno = 20 and e.sal > (
select avg(sal)
from emp);
