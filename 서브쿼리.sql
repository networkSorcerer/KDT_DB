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

-- �μ� ��ġ�� NEW YORK�� ��쿡�� ����, �� �ܴ� �������� ��ȯ�ϵ��� ����� 
select empno, ename, 
case 
when deptno = (
 select deptno
 from dept
 where loc = 'NEW YORK') then '����'
else '����'
end as "�Ҽ�"
from emp 
order by "�Ҽ�";

select * from salgrade;
select * from emp;

-- ���� ���� 1�� 
-- ��ü ��� �� ALLEN�� ���� ��å(JOB)��  ������� ��� ����, �μ� ������ 
-- ������ ���� ����ϴ� sql���� �ۼ��ϼ���. (��å, �����ȣ, ����̸�, �޿�, �μ���ȣ, �μ� �̸�)
select e.job, e.empno, e.ename, e.sal, d.deptno, d.dname
from emp e join dept d 
on e.deptno = d.deptno
where job = (
select job
from emp
where ename = 'ALLEN');


-- ���� ���� 2�� 
-- ��ü ����� ��� �޿�(SAL)���� ���� �޿��� �޴� ������� ��� ����, �μ� ����, �޿� ��� ������ ����ϴ�
-- SQL���� �ۼ��ϼ���(�� ����� �� �޿��� ���� ������ �����ϵ� �޿��� ���� ��쿡�� 
-- ��� ��ȣ�� �������� ������������ �����ϼ���).
-- (��� ��ȣ, �̸�, �Ի���, �޿�, �޿� ���, �μ��̸�, �μ���ġ)
select e.empno, e.ename, e.hiredate, e.sal, s.grade, d.dname, d.loc
from emp e join salgrade s
on e.sal between s.losal and s.hisal
join dept d
on e.deptno = d.deptno
where sal > (
select avg(sal)
from emp)
order by e.sal desc , e.empno;

select *from dept;
-- ���� ���� 3��
-- 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� ��� ����, 
-- �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��ϼ���.
-- (�����ȣ, ����̸�, ��å, �μ���ȣ, �μ��̸�, �μ���ġ) 

select e.empno, e.ename , e.job , d.deptno, d.dname, d.loc
from emp e join dept d
on e.deptno = d.deptno
where e.deptno =10 and e.job NOT IN (
select e.job 
from emp e join dept d
on e.deptno = d.deptno
where d.deptno =30);
-- ���� ���� 4��
-- ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� ��� ����, 
-- �޿� ��� ������ ������ ���� ����ϴ� SQL���� �ۼ��ϼ���
-- (�� ���������� Ȱ���� �� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� 
-- ��� ��ȣ�� �������� ������������ �����ϼ���).
select e.empno, e.ename, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal
where sal > (select MAX(sal) from emp where job = 'SALESMAN')
order by empno;

select e.empno, e.ename, s.grade
from emp e 
join salgrade s on e.sal between s.losal and s.hisal
join (select MAX(sal) as max_sal from emp where job = 'SALESMAN') salesman_max 
on e.sal > salesman_max.max_sal
order by e.empno;
