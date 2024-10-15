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
where sal >= 3000 or (deptno =20 and hiredate < '82/01/01');
--�޿��� 2500 �̻��̰� ��å�� MANGER�� ����� ��� ���� ���
select * from emp
where sal >= 2500 and job = 'MANAGER';

select * from emp
where job = 'MANAGER' or JOB = 'SALESMAN' or JOB = 'CLERK';
-- IN ������ : �������� �� �̸��� ��ȸ�� ��� �����ؼ� �����Ҽ� ���� 
select * from emp
where JOB in ('MANAGER','SALESMAN','CLERK');

--IN �����ڸ� ����� 20���� 30�� �μ��� ���Ե� ����� ��� ������ȸ
select * from emp
where deptno in (20, 30);

-- NOT IN �����ڸ� ����� 20���� 30�� �μ��� ���Ե��� ��� ��ȸ
select * from emp
where deptno not in (10);
-- �� �����ڿ� AND�����ڸ� ����Ͽ� ����ϱ�
select * from emp
where job != 'MANAGER' and JOB <>'SALESMAN' and job ^='CLERK';

--BETWEEN A AND B ������ : ������ ������ ��ȸ�Ҷ� ����ϴ� ������

--�޿��� 2000���� 3000 ���� ����� ��� ������ ���
select * from emp
where sal >= 200 and sal <= 3000;

-- between a and b ������ : ������ ������ ��ȸ�� �� ����ϴ� ������ 
select * from emp
where sal not between 2000 and 3000;

-- �����ȣ�� 7689���� 7902������ ����� ��� ���� ���
select * from emp
where empno between 7689 and 7902;

-- 1980���� �ƴ� �ؿ� �Ի��� ����� ��� ���� ��� 
select * from emp
where hiredate not between '80/01/01' and '80/12/31';


-- LIKE, NOT LIKE ������ : ���ڿ��� �˻��� �� ��� �ϴ� ������ 
-- % : ���̿� ������� ��� ���� �����͸� �ǹ�
-- _ : ���� 1���� �ǹ� 
select empno, ename 
from emp
where ename like '%K%';
-- �հ� ���� ���ڿ� ���̿� ��� ���� K��� ���ڰ� ename��-- ���Ե� ����� ���� ���

-- ����� �̸��� �ι�° ���ڰ� L�� ����� ����ϱ�
select *from emp
where ename LIKE '_L%';

-- [�ǽ�] ��� �̸��� AM�� ���ԵǾ��ִ� ��� �����͸� ��� 
select * from emp
where ename like '%AM%';
-- [�ǽ�] ��� �̸��� AM�� ���ԵǾ� ���� ���� ��� �����͸� ��� 
select * from emp
where ename not like '%AM%';

-- ���ϵ� ī�� ���ڰ� ������ �Ϻ��� ���  (%, _) escape�� ������ '\'�ڿ� ���� 
-- %���ϵ� ī�尡 �ƴ϶�� �ǹ�
select * from emp
where ename like '%\%s' escape '\'; -- ��� �̸�, %P�� ������ ����� ��ȸ

INSERT INTO emp(empno, ename, job , mgr, hiredate, sal, comm, deptno)
values (1001, 'jame%s','MANAGER',7839,'2024/10/15',3500,450,30);

delete from emp
where empno = 1001;

select * from emp;

-- is null ������ : 
-- �������� ������ null ���� ���� �� ����, ���� �������� ������ �ǹ�, ���� �Ұ� (���, ��, �Ҵ�)
select ename , sal, sal*12+comm "����", comm
from emp;

-- �񱳿������� null ���ϱ� -- null�� �� �ȵ� 
select * from emp
where comm = null;

SELECT * FROM emp
WHERE comm is NULL;

-- ���� ����� �ִ� ��� ������ ��� �ϱ� 

SELECT * FROM emp
WHERE mgr is not NULL;

SELECT * FROM emp
WHERE mgr is NULL;

-- ������ ���� order by �� : ���� ���� �Ǵ� ���� ���� ���� ���� 

SELECT * FROM emp
ORDER BY sal ASC;

--������ ���� order by �� : ���� ���� �Ǵ� �������� ���� ���� 
select * from emp
order by sal;

-- �޿��� ���� ���� ���� ���� 
select * from emp
order by sal desc;

-- ��� ��ȣ ���� ���� ���� ���� �ϱ� 
SELECT * FROM emp
ORDER BY empno;

-- ���� ������ ���� �÷���  �����ϱ�
SELECT * FROM emp
ORDER BY sal, ename;

SELECT * FROM emp
ORDER BY deptno ASC, SAL DESC;

-- ��Ī ���� order by
SELECT empno �����ȣ, ename �����, sal ����, hiredate �Ի��� -- 3. ����ؾ��� �÷�����
FROM emp
where sal >= 2000
ORDER BY ���� DESC, ����� ASC;

SELECT ENAME || 'S JOB IS '||JOB AS EMPLOYEE
FROM EMP;

--[�ǽ�����1]--
select * from emp
where ename like '%S';

--[�ǽ�����2]--
select empno, ename,job,sal,deptno
from emp
where deptno =30 and job = 'SALESMAN';

--[�ǽ�����3]--
select empno, ename, sal, deptno
from emp
where deptno in (20, 30) and sal > 2000;

--[�ǽ�����4]--
select * from emp
where sal >= 2000 and sal <= 3000;

--[�ǽ�����5]--
select ename, empno, sal ,deptno
from emp
where ename like '%E%' and deptno =30 and  
sal not between 1000 and 2000;

--[�ǽ�����6]--
select * from emp
where comm is null 
and job in ('MANAGER', 'CLERK') 
and ename != '_L%'
and MGR is not null;

-- select ���� ���� -- //�� Ǯ�� --�� ��Ǭ��.
//1. **EMP���̺��� COMM �� ���� NULL�� �ƴ� ���� ��ȸ**
select * from emp
where comm is not null;
//2. **EMP���̺��� Ŀ�̼��� ���� ���ϴ� ���� ��ȸ**
select * from emp
where comm is null;
//3. **EMP���̺��� �����ڰ� ���� ���� ���� ��ȸ**
select * from emp
where mgr is null;
//4. **EMP���̺��� �޿��� ���� �޴� ���� ������ ��ȸ**
select *from emp
order by sal desc;
//5. **EMP���̺��� �޿��� ���� ��� Ŀ�̼��� �������� ���� ��ȸ**
select * from emp
order by sal, comm desc; 
//6. **EMP���̺��� �����ȣ, �����,����, �Ի��� ��ȸ (��, �Ի����� �������� ���� ó��)**
select empno , ename, job, hiredate
from emp
order by hiredate;
//7. **EMP���̺��� �����ȣ, ����� ��ȸ (�����ȣ ���� �������� ����)**
select empno, ename
from emp
order by empno desc;
//8. **EMP���̺��� ���, �Ի���, �����, �޿� ��ȸ  (�μ���ȣ�� ���� ������, ���� �μ���ȣ�� ���� �ֱ� �Ի��� ������ ó��)**
select empno, hiredate, ename, sal 
from emp
order by deptno desc, hiredate desc;
--9. **���� ��¥�� ���� ���� ��ȸ**
//10. **EMP���̺��� ���, �����, �޿� ��ȸ  (��, �޿��� 100���������� ���� ��� ó���ϰ� �޿� ���� �������� ����)**
select empno, ename, sal / 100 sal
from emp
where sal like '%__' 
order by sal;
--11. **EMP���̺��� �����ȣ�� Ȧ���� ������� ��ȸ**
select * from emp
where MOD(empno ,2) !=0;
//12. **EMP���̺��� �����, �Ի��� ��ȸ 
select ename, hiredate
from emp;
--13. **EMP���̺��� 9���� �Ի��� ������ ���� ��ȸ**
select * from emp
where EXTRACT (MONTH from hiredate) =9;
//14. **EMP���̺��� 81�⵵�� �Ի��� ���� ��ȸ**
select * from emp
where EXTRACT(YEAR FROM hiredate) =1981;
select * from emp
where hiredate like '81%';
//15. **EMP���̺��� �̸��� 'E'�� ������ ���� ��ȸ**
select * from emp
where ename like '%E';
//16. **EMP���̺��� �̸��� �� ��° ���ڰ� 'R'�� ������ ���� ��ȸ**
//- **LIKE ���**
select *from emp
where ename like '__R%';
--17. **EMP���̺��� ���, �����, �Ի���, �Ի��Ϸκ��� 40�� �Ǵ� ��¥ ��ȸ**
select empno, ename, hiredate, ADD_MONTHS(hiredate, 12*40)
from emp;
--18. **EMP���̺��� �Ի��Ϸκ��� 38�� �̻� �ٹ��� ������ ���� ��ȸ**

--19. **���� ��¥���� �⵵�� ����**

