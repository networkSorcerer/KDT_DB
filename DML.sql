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
