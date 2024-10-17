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

--ANSI ����
select empno, ename, job, sal, e.deptno
from emp e join dept d
on e.deptno = d.deptno
order by empno;

--DEPT���̺�� emp ���̺��� 1: N���踦 ���� (�μ����̺��� �μ���ȣ���� �������� ����� �ö��)
-- ���ο��� ��� ���� ���� �ϱ�
SELECT empno, ename, sal, d.deptno, dname, loc
FROM emp e JOIN dept d 
ON e.deptno = d.deptno
WHERE sal >= 3000;


-- EMP ���̺� ��Ī�� E��, DEPT ���̺� ��Ī�� D�� �Ͽ� ������ ����
-- � ������ ���� �� �޿��� 2500 �����̰�,
-- ��� ��ȣ�� 9999 ������ ����� ������ ��µǵ��� �ۼ�
-- ����Ŭ �����̳� ANSI���� �ƹ��ų� ���

SELECT * 
FROM EMP e JOIN DEPT d 
ON e.DEPTNO = d.DEPTNO 
WHERE e.sal <= 2500 AND e.empno <= 9999
ORDER BY e.empno;



-- �� ���� : ������ �÷��� �������� �ʴ� ��� �����Ҷ� ���, �Ϲ����� ����� �ƴ�
select * from salgrade; -- �� �޿��� ���� ��� ǥ��
select ename, sal, grade
from emp e JOIN salgrade s
on sal between s.losal and s.hisal; -- �޿��� losal ~ hisal �� ���� 

-- ��ü ����(self join) : �ڱ� �ڽ��� ���̺�� �����ϴ� ���� ����(���� ���̺��� �ι� ���)
select e1.empno, e1.ename, e1.mgr,
e2.empno as ��������ȣ,
e2.ename as �Ŵ����̸�
from emp e1 join emp e2
on e1.mgr =e2.empno;

-- �ܺ� ���� (outer join) : Left, Right, Full
select e.ename, e.deptno, d.dname
from emp e join dept d 
on e.deptno = d.deptno
order by e.deptno;




