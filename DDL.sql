select * from dept_temp;

-- DDL(Data Definition Language)  : 데이터베이스에 데이터를 보관하기 위해,
-- 제공되는 생성, 변경, 삭제 관련 기능을 수해
-- craete : 새로운 데이터 베이스 개체를 생성 - 테이블, 뷰 , 인덱스
-- alter : 기존 데이터베이스의 개체를 수정
-- drop : 데이터 베이스 개체(Entity)를 삭제
-- truncate : 모든 데이터를 삭제하지만 테이블 구조는 담겨 둠
--table이란 ? : 데이터 베이스의 기본 데이터 저장 단위인 테이블은 사용자 접근 간으한 
-- 데이터를 보유하면 레코드 (행)과 컬럼(열)으로 구성
-- 테이블과 테이블의 관계를 표현하는데 외래키를 사용
create table emp_ddl(
empno number(4),  -- 숫자형 데이터 타입, 4자리로 선언, 최대 크기롤 38자리까지의 숫자 지정 가능 
ename varchar2(10), -- 가변 문자 데이터 타입, 
job varchar2(9),
mgr number(4),
hiredate date,
sal number(7,2),
comm number(7,2),
deptno number(2)
);
select * from emp_ddl;
-- 기존 테이블의 열 구조와 데이터를 복사하여 새 테이블 생성하기
create table dept_ddl
as select * from dept;

select * from dept_ddl;

create table emp_alter
as select*from emp;
select*from emp_alter;

-- 열 이름을 추가하는 add : 기존 테이블에 새로운 컬럼을 추가하는 명령, 컬럼값은 null로 입력
alter table emp_alter
add hp varchar2(20);


-- 열 이름을 변경하는 rename 
alter table emp_alter
rename column hp to tel;

-- 열의 자료형을 변경하는 modify
-- 자료형 변경 시 데이터가 이미 존재하는 경우 크기를 크게 하는 경우는 문제가 되지 않으나
-- 크기를 줄이는 경우 저장되어있는 데이터 크기에 따라서 변경되지 않을수 있음 
alter table emp_alter
modify empno number(5);

-- 특정 열을 삭제하는 drop
alter table emp_alter
drop column tel;

select * from emp_alter;

-- 테이블 이름을 변경하는 rename
rename emp_alter to emp_rename;
select*from emp_rename;

-- 테이블의 데이터를 삭제하는 truncate : 테이블의 모든 데이터 삭제, 테이블 구조에 영향을 주지 않음
-- ddl 명령어 이기 때문에 rollback 불가 
delete from emp_rename;

-- 테이블을 삭제하는 drop
drop table emp_rename;


