-- ���� ���� : �������� ���Ἲ(��Ȯ�ϰ� �ϰ��� ��)�� �����ϱ� ���� ���̺� �����Ǵ� ��Ģ
-- not null : ������ ���� ���� �־�� ��
-- unique : ���� �����ؾ� �� , �� null ���
-- primary key(pk) : �����ؾ��ϰ� null�̸� �ȵ�
-- foreign key(fk) : �ٸ� ���̺��� ���� �����Ͽ�  �����ϴ� ���� �Է��Ҽ� ���� 
-- chek : ������ ���ǽ��� �����ϴ� �����͸� �Է� ���� 
create table table_notnull (
login_id varchar2(20) not null,
login_pwd varchar2(20) not null,
tel varchar2(20)
);

select * from table_notnull;

insert into table_notnull(login_id, login_pwd, tel)
values('�����̻�����','test','010-5006-4146');

update table_notnull
set login_pwd = 'test1234'
where login_id ='�����̻�����';

-- �̹� ������� ���̺� ���� ���� �����ϱ� 
alter table table_notnull
modify tel not null;

-- unique ���� ���� : �ߺ� ������� �ʴ� Ư��
create table table_unique (
login_id varchar2(20) unique,
login_pwd varchar2(20) not null,
tel varchar2(20) 
);

insert into table_unique(login_id, login_pwd, tel)
values('������','pwd12345','010-1234-5678');

insert into table_unique(login_id, login_pwd, tel)
values('������','pwd4567','010-4567-5678');


select * from table_unique;

-- �����ϰ� �ϳ��� �ִ� �� (primary key) : unique, not null���� ������ ��� ����
-- PK�� �����ϸ� �ڵ����� �ε����� ������� 

create table table_pk (
login_id varchar2(20) primary key,
login_pwd varchar2(20) not null,
tel varchar2(20)
);
insert into table_pk values('������','pwd12345','010-1234-5678');
insert into table_pk values('�����','pwd12345','010-1234-5678');
insert into table_pk values('�̼�','pwd12345','010-1234-5678');

select * from table_pk;


-- �ٸ� ���̺�� ���踦 �δ� foreign key
-- ���� �ٸ� ���̺� ���� ���踦 �����ϴµ� ����ϴ� ���� ���� 
-- �����ϰ� �ִ� �⺻Ű�� ������Ÿ�԰� ��ġ�ؾ� �ϸ�, �ܷ�Ű�� �����ǰ� �ִ� �⺻Ű�� ���� �Ұ�
create table dept_fk(
deptno number(2) primary key,
dname varchar2(14),
loc varchar2(13)
);

create table emp_fk(
empno number(4) primary key,
ename varchar2(10),
job  varchar2(9),
mgr number(4),
hiredate date,
sal number(7,2),
comm number(7,2),
depno number(2) references dept_fk (deptno) 
);

insert into emp_fk 
values(2001,'������','IVE',1001,'2024/09/01',9000,1000,10);

insert into dept_fk df values(10,'���̵���','seoul');
select *from dept_fk;

delete from dept_fk
where deptno = 10;

delete from dept_fk
where deptno=10;

-- ������ ���¿� ������ ���ϴ� check
-- id �� pwd ���� ���� ���� 
-- ��ȿ������ Ȯ�� � ��� 

create table table_check(
login_id varchar2(20) primary key,
login_pwd varchar2(20) check(length(login_pwd) >6),
tel varchar2(20)
);
insert into table_check values('����','1234567','010-1234-5678');

-- �⺻���� ���ϴ� default : Ư������ ������ ���� �������� �ʴ�  ��� �⺻���� ����
create table table_default(
login_id varchar2(20) primary key,
login_pwd varchar2(20) default '123456',
tel varchar2(20)
);

insert into table_default values ('����',null,'010-1234-5678');
insert into table_default(login_id,tel) values ('�����','010-1234-5678');

select * from table_default;