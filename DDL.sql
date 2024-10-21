select * from dept_temp;

-- DDL(Data Definition Language)  : �����ͺ��̽��� �����͸� �����ϱ� ����,
-- �����Ǵ� ����, ����, ���� ���� ����� ����
-- craete : ���ο� ������ ���̽� ��ü�� ���� - ���̺�, �� , �ε���
-- alter : ���� �����ͺ��̽��� ��ü�� ����
-- drop : ������ ���̽� ��ü(Entity)�� ����
-- truncate : ��� �����͸� ���������� ���̺� ������ ��� ��
--table�̶� ? : ������ ���̽��� �⺻ ������ ���� ������ ���̺��� ����� ���� ������ 
-- �����͸� �����ϸ� ���ڵ� (��)�� �÷�(��)���� ����
-- ���̺�� ���̺��� ���踦 ǥ���ϴµ� �ܷ�Ű�� ���
create table emp_ddl(
empno number(4),  -- ������ ������ Ÿ��, 4�ڸ��� ����, �ִ� ũ��� 38�ڸ������� ���� ���� ���� 
ename varchar2(10), -- ���� ���� ������ Ÿ��, 
job varchar2(9),
mgr number(4),
hiredate date,
sal number(7,2),
comm number(7,2),
deptno number(2)
);
select * from emp_ddl;
-- ���� ���̺��� �� ������ �����͸� �����Ͽ� �� ���̺� �����ϱ�
create table dept_ddl
as select * from dept;

select * from dept_ddl;

create table emp_alter
as select*from emp;
select*from emp_alter;

-- �� �̸��� �߰��ϴ� add : ���� ���̺� ���ο� �÷��� �߰��ϴ� ���, �÷����� null�� �Է�
alter table emp_alter
add hp varchar2(20);


-- �� �̸��� �����ϴ� rename 
alter table emp_alter
rename column hp to tel;

-- ���� �ڷ����� �����ϴ� modify
-- �ڷ��� ���� �� �����Ͱ� �̹� �����ϴ� ��� ũ�⸦ ũ�� �ϴ� ���� ������ ���� ������
-- ũ�⸦ ���̴� ��� ����Ǿ��ִ� ������ ũ�⿡ ���� ������� ������ ���� 
alter table emp_alter
modify empno number(5);

-- Ư�� ���� �����ϴ� drop
alter table emp_alter
drop column tel;

select * from emp_alter;

-- ���̺� �̸��� �����ϴ� rename
rename emp_alter to emp_rename;
select*from emp_rename;

-- ���̺��� �����͸� �����ϴ� truncate : ���̺��� ��� ������ ����, ���̺� ������ ������ ���� ����
-- ddl ��ɾ� �̱� ������ rollback �Ұ� 
delete from emp_rename;

-- ���̺��� �����ϴ� drop
drop table emp_rename;


