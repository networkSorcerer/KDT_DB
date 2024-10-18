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

-- ���� ����� �������� ������ ��������
-- IN : ���� ������ �����Ͱ� ���������� ����� �ϳ��� ��ġ�ϴ� �����Ͱ� �ִٸ� true
-- any, some : ���� ������ ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� true
-- all : ���� ���� ���ǽ��� �������� ��� ��� �����ϸ� true
-- exists : ���������� ����� �����ϸ� (�� , �Ѱ� �̻��� ���� ����� �����ϸ�) true

--���� ������ �޿��� ���� �������� �� �μ��� �ִ� �޿��� ���� ����� ��� ������ ���
select * 
from emp
where sal in (
select max(sal)
from emp
group by deptno
);

select empno, ename, sal
from emp
where sal > any(
select sal from emp
where job = 'SALESMAN');

-- 30�� �μ� ������� �޿����� ���� �޿��� �޴� ��� ���� ���
select *
from emp
where sal < all(select sal
from emp
where deptno = 30);

-- ��å�� 'MANAGER'�� ������� ���� �޿� �޴� ����� �����ȣ, �̸�, �޿�, �μ� �̸� ����ϱ�
select e.empno, e.ename, e.sal, d.dname
from emp e join dept d 
on e.deptno = d.deptno
where sal > all (
select sal 
from emp
where job = 'MANAGER');

-- EXISTS : ���������� ��� ���� �ϳ� �̻� �����ϸ� true 
select *
from emp
where exists (
select dname 
from dept d
where deptno = 40
);

-- ���߿� �������� : ���������� ����� 2�� �̻��� �÷����� ��ȯ �Ǿ���� ������ �����ϴ� ����
select empno, ename, sal, deptno
from emp 
where (deptno, sal) in (
select deptno, sal
from emp 
where deptno = 30
);

select *
from emp
where (deptno, sal) in (
select deptno, max(sal)
from emp
group by deptno
);

-- FROM ���� ����ϴ� �������� : �ζ��κ��� �ϱ⵵ ��
-- ���̺� �� ������ �Ը� �ʹ� ũ�ų� ���� �۾��� 
-- ���ʿ��� ���� �ʹ� ���� �Ϻ� ��� ���� ����ϰ��� �� �� ����
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
from (
    select *
    from emp
    where deptno = 10 )  e10
    join dept d
    on e10.deptno = d.deptno;
    
-- ���� �����ϰ� �ش� ������ �������� : �޿��� ���� 5�� ���� ���� ������
select rownum, ename, sal
from (
    select *
    from emp
    order by sal desc
)
where rownum <= 5;

-- select ���� ����ϴ� �������� : ������ ���������� ��Į�� ����������� ��
-- select ���� ����ϴ� ���������� �ݵ�� �ϳ��� ����� ��ȯ�ϵ��� �ۼ��ؾ��� 
select empno, ename, job, sal,
(
select grade 
from salgrade
where e.sal between losal and hisal
) as "�޿� ���" ,
deptno as "�μ� ��ȣ",
(
    select dname
    from dept d
    where e.deptno = d.deptno
) as "�μ��̸�"
from emp e
order by "�޿� ���";

--���� ������ ���� �ϱ�
select e.empno, e.ename, e.job, e.sal,s.grade as "�޿����",d.deptno, d.dname
from emp e 
join salgrade s 
on e.sal between s.losal and s.hisal
join dept d 
on e.deptno = d.deptno 
order by "�޿����";

