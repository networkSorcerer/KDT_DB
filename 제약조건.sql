-- 제약 조건 : 데이터의 무결성(정확하고 일관된 값)을 보장하기 위해 테이블에 설정되는 규칙
-- not null : 지정한 열에 값이 있어야 함
-- unique : 값이 유일해야 함 , 단 null 허용
-- primary key(pk) : 유일해야하고 null이면 안됨
-- foreign key(fk) : 다른 테이블의 열을 참조하여  존재하는 값만 입력할수 있음 
-- chek : 설정한 조건식을 만족하는 데이터만 입력 가능 
create table table_notnull (
login_id varchar2(20) not null,
login_pwd varchar2(20) not null,
tel varchar2(20)
);

select * from table_notnull;

insert into table_notnull(login_id, login_pwd, tel)
values('곰돌이사육사','test','010-5006-4146');

update table_notnull
set login_pwd = 'test1234'
where login_id ='곰돌이사육사';

-- 이미 만들어진 테이블에 제약 조건 지정하기 
alter table table_notnull
modify tel not null;

-- unique 제약 조건 : 중복 허용하지 않는 특성
create table table_unique (
login_id varchar2(20) unique,
login_pwd varchar2(20) not null,
tel varchar2(20) 
);

insert into table_unique(login_id, login_pwd, tel)
values('안유진','pwd12345','010-1234-5678');

insert into table_unique(login_id, login_pwd, tel)
values('안유진','pwd4567','010-4567-5678');


select * from table_unique;

-- 유일하게 하나만 있는 값 (primary key) : unique, not null제약 조건을 모두 가짐
-- PK로 지정하면 자동으로 인덱스가 만들어짐 

create table table_pk (
login_id varchar2(20) primary key,
login_pwd varchar2(20) not null,
tel varchar2(20)
);
insert into table_pk values('안유진','pwd12345','010-1234-5678');
insert into table_pk values('장원영','pwd12345','010-1234-5678');
insert into table_pk values('이서','pwd12345','010-1234-5678');

select * from table_pk;


-- 다른 테이블과 관계를 맺는 foreign key
-- 서로 다른 테이블 간의 관계를 정의하는데 사용하는 제약 조건 
-- 참조하고 있는 기본키의 데이터타입과 일치해야 하며, 외래키에 참조되고 있는 기본키는 삭제 불가
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
values(2001,'안유진','IVE',1001,'2024/09/01',9000,1000,10);

insert into dept_fk df values(10,'아이돌팀','seoul');
select *from dept_fk;

delete from dept_fk
where deptno = 10;

delete from dept_fk
where deptno=10;

-- 데이터 형태와 범위를 정하는 check
-- id 및 pwd 등의 길이 제한 
-- 유효범위값 확인 등에 사용 

create table table_check(
login_id varchar2(20) primary key,
login_pwd varchar2(20) check(length(login_pwd) >6),
tel varchar2(20)
);
insert into table_check values('민지','1234567','010-1234-5678');

-- 기본값을 정하는 default : 특정열에 저장할 값을 지정하지 않는  경우 기본값을 지정
create table table_default(
login_id varchar2(20) primary key,
login_pwd varchar2(20) default '123456',
tel varchar2(20)
);

insert into table_default values ('민지',null,'010-1234-5678');
insert into table_default(login_id,tel) values ('장원영','010-1234-5678');

select * from table_default;