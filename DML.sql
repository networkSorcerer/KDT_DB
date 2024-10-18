-- DML (data manipulation laguage) : insert(�Է�), update(����), delete(����)
-- ������ ���̺� �����ϱ� 
create table DEPT_TEMP
as select * from dept;

select *
from dept_temp;

-- ���̺� �����͸� �߰��ϴ� insert��
-- insert into ���̺� �� (�÷���...) values(������...)
insert into dept_temp(deptno, dname, loc) values (50,'DATABASE','SEOUL');

insert into dept_temp values (60,'BACKEND','BUSAN');

insert into dept_temp(deptno) values(70);

insert into dept_temp values (80,'frontend','inchun');
insert into dept_temp (dname, loc) values ('app','DAEGU');
insert into dept_temp values (80,'frontend','inchun');

delete from dept_temp
where deptno =70;

insert  into dept_temp values(70, '������','');

create table emp_temp 
as select * from emp
where 1 != 1;

drop table emp_temp;

select *from emp_temp;

insert into emp_temp (empno,ename, job,mgr,hiredate,sal,comm,deptno)
values (9001,'������','pd',null,'2020/01/01',9900,1000,50);

insert into emp_temp (empno,ename, job,mgr,hiredate,sal,comm,deptno)
values (9002,'������','mc',null,to_date('2021/01/02','yyyy/mm/dd'),8000,1000,60);

insert into emp_temp (empno,ename, job,mgr,hiredate,sal,comm,deptno)
values (9002,'������','mc',null,sysdate,9000,1000,70);

rollback;

select * from dept_temp;

insert into dept_temp (deptno, dname, loc) values (80,'frontend','suwon');
