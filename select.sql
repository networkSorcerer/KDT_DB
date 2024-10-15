-- EMP 정보 확인
desc emp;

-- select 와 from 절 
-- select 문은 데이터 베이스에 보관되어 있는 데이터 조회할때 사용
-- select 절은 from 절에 명시한 테이블에서 조회할 열을 지정할수 있음
-- select [조회할 열], [조회할 열]from 테이블 이름;
select * from emp; -- * 모든 열 또는 모든 컬럼을 의미한다. 
--from 다음에 오는 것이 테이블 이름, sql 수행문은 ;(세미콜론으로 끝나야함)

-- 특정 컬럼만 선택해서 조회
select empno , ename , deptno from emp;
-- 사원번호와 부서번호만 나오도록 SQL작성 (empno, deptno)
select empno, deptno from emp;
-- 한눈에 보기 좋게 별칭 부여하기
select ename, sal,comm, sal*12 + comm
from emp;

select ename "이름", sal as "급여", comm as "성과급", sal*12 "연봉"
from emp;

-- 중복 재고 하는 distinct , 데이터를 조회할 때 중복되는 행이 여러행이 될 때,
-- 중복된 행을 한개 씩만 선택

select distinct deptno 
from EMP
order by deptno;

-- 컬럼값을 계산하는 산술 연산자(+,-,*/)
select ename, sal, sal * 12 "연간 급여", sal * 12 + comm "총연봉"
from EMP;

-- 연습문제 : 직책(job)을 중복 제거하고 출력하기


