-- 함수 : 특정 결과 데이터를 얻기 위해 데이터를 입력할수 있는 특수명령어를 의미
-- 함수에는 내장 함수와 사용자 정의 함수가 있음 
-- 내장 함수에는 단일행 함수와 다중행 함수(집계함수) 로 나누어짐 
-- 단일행 함수 : 데이터가 한행씩 입력되고 결과가 한 행씩 나오는 함수
-- 다중행 함수 : 여러 행이 입력 되어서 하나의 행으로 결과가 반환되는 것 
-- 숫자함수 : 수학 계산식을 처리하기 위한 함수 
select -10, abs(-10) FROM dual;
-- round(숫자, 반올림할 위치) : 반올림 결과를 반환하는 함수
select ROUND(1234.5678) AS ROUND, -- 소수점 첫째자리에서 반올림해서 결과를 반환
ROUND(1234.5678, 0) AS ROUND_0,
ROUND(1234.5678,1) AS ROUND_1, -- 소수점 두번째 자리에서 반올림해서 소수점 1자리 표시
ROUND(1234.5678,2) AS ROUND_2, -- 소수점 3번째 자리에서 반올림해서 소수점 2자리 표시
ROUND(1234.5678, -1 )AS ROUND_MINUS1, -- 정수 첫번째 자리를 반올림
ROUND(1234.5678, -2 )AS ROUND_MINUS1 -- 정수 두번째 자리를 반올림
from dual;

--TRUNC : 버림을 한 결과를 반환하는 함수,자릿수 지정자근ㅇ
SELECT TRUNC(1234.5678) AS TRUNC,
     TRUNC(1234.5678, 0) AS TRUNC_0,
     TRUNC(1234.5678, 1) AS TRUNC_1,
     TRUNC(1234.5678, 2) AS TRUNC_2,
     TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
     TRUNC(1234.5678, -2) AS TRUNC_MINUS2
 FROM DUAL;
 
 SELECT MOD(21, 5) FROM dual;
 
 SELECT CEIL(12.345) FROM dual;
 
 SELECT FLOOR(12.999) FROM dual;
 
 SELECT POWER(3,4) FROM dual;
 
 -- SELECT 20*30 FROM emp; 
SELECT 20*30 FROM dual;

SELECT 20*30 FROM dual;

SELECT MOD(5,4) FROM dual;

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

SELECT *
    FROM emp
WHERE UPPER(ename) = UPPER('james');

SELECT UPPER('sam') FROM dual;
SELECT UPPER(ename) FROM emp;

SELECT *
    FROM emp
WHERE UPPER(ename) LIKE UPPER('%james%');

SELECT LOWER(ename) FROM emp;
SELECT LOWER(ename) FROM dual;

SELECT INITCAP('yoo young yoo') FROM dual;

SELECT ENAME, LENGTH(ENAME)
    FROM emp;
    
    SELECT ENAME, LENGTH(ENAME)
    FROM emp
WHERE LENGTH(ENAME) >= 5;

SELECT ENAME, LENGTH(ENAME)
    FROM emp
WHERE LENGTH(ENAME) >= 5;

-- 문자열 길이를 구하는 LENGTH 함수, LENCTHB함수
-- LENGTH : 문자열 길이를 반환
-- LENCTHB : 문자열의 바이트를 반환 
select LENGTH(ename), LENGHB(ename)  --영어는 한바이트를 차지하기 떄문에 길이와 바이트 수가 동일 
from emp;

select LENGTH('하니'),LENGTHB('하니')from dual; -- 오라클 XE에서 한글은 3바이트 차지

-- 직책 이름의 길이가 6글자 이상이고, comm있는 사원의 모든 정보 출력 

SELECT LENGTH('한글'), LENGTHB('한글')
    FROM DUAL;
    
SELECT *
    FROM EMP
    WHERE LENGTH(JOB) >= 6 AND COMM IS NOT NULL AND COMM != 0;
    
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;

-- SUBSTR / SUBSTRB :  시작 위치로 부터 선택 개수만큼의 문자를 반환하는 함수, 인덱스는 1부터 시작 
select job, substr(job,1,2), substr(job,3,2),substr(job,5)
from emp;

-- substr 함수와 다른 함수 함께 사용 
SELECT JOB, 
 SUBSTR(JOB, -LENGTH(JOB)), 
 SUBSTR(JOB, -LENGTH(JOB), 2),
 SUBSTR(JOB, -3)
FROM EMP;

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
 INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
 INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM DUAL;
    
-- INSTR : 문자열 데이터 안에 특정 문자나 문자여이 어디에 포함되어있는지를 알고자 할 때 사용 
select INSTR('HELLO, ORACLE','L' )as INSTR_1,
INSTR('HELLO, ORACLE', 'L',5)as INSTR_2,
INSTR('HELLO, ORACLE', 'L',2,2) AS INSTR_3 
from emp;

SELECT *
FROM EMP 
WHERE INSTR(ENAME, 'S') > 0; -- s라는 문자가 포함된 행 출력

SELECT *
FROM EMP 
WHERE ENAME LIKE '%S%';

-- replace : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체 할 때 사용
-- 대체할 문자를 지정하지 않으면 삭제
select '010-5006-4146' as "변경이전",
REPLACE('010-5006-4146','-','/') as "변경 이후 1",
REPLACE('010-5006-4146','-') as "변경 이후2"
from dual;

-- LPAD /RPAD : 기준 공간 칸수를 지정하고 빈칸 만큼을 특정 문자로 채우는 함수
select LPAD('ORACLE',10,'+')from dual;
select RPAD('ORACLE',10,'+')from dual;

select RPAD('01022-',14,'*') as RPAD_JUMIN,
RPAD('010-5006-',13,'*') AS RPAD_PHONE
from dual;

-- 두 문자열을 합치는 concat 함수
select concat(empno,ename ) AS "사원정보",
concat(empno,concat(' : ', ename)) AS "사원정보 :"
from emp
where ename = 'JAMES';

-- TRIM / LTRIM / RTRIM : 문자열 데이터에서 특정 문자들 지우기 위해 사용
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
 '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
 '[' || LTRIM('<_Oracle_>', '<_') || ']' AS LTRIM_2,
 '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
 '[' || RTRIM('<_Oracle_>', '_>') || ']' AS RTRIM_2
 FROM DUAL;
 
 -- 날짜 데이터를 다루는 함수 
 -- 날짜 데이터 + 숫자 : 가능, 날짜에서 숫자 만큼의 이 후 날짜
 -- 날짜 데이터 - 숫자 : 가능, 날짜에서 숫자 만큼의 이 전 날짜
 -- 날짜 데이테 - 날짜 데이터 : 가능 , 두 날짜간의 일수 차이
 -- 날짜 데이터 + 날짜 데이터 : 연산 불가
 -- SYSDATE : 운영체제로 부터 시간을 가져오는 함수
 select sysdate from dual;

select sysdate as "현재시간",
sysdate -1 as "어제",
sysdate +1 as "내일"
from dual;

-- 몇개월 이후 날짜를 구하는 ADD_MONTH 함수 : 특정 날짜에 지정한 개월 수 이후 날짜 데이터를 반환
select sysdate,
add_months(sysdate, 3) AS "3개월 이후 날짜 데이터"
from dual;

-- 입사 10주년이 되는 사원들의 데이터 출력하기(입사일로 부터 10년이 경과한 날짜 데이터 반환)
select empno, ename, hiredate as "입사일",add_months(hiredate, 120) as "10주년"
from emp;

-- 두 날짜간의 개월수 차이를 구하는 MONTHS_BETWEEN 함수
select empno, ename, hiredate, sysdate,
MONTHS_BETWEEN(hiredate, sysdate)as "-재직 기간",
MONTHS_BETWEEN(sysdate, hiredate) as "재직 기간",
trunc(MONTHS_BETWEEN(sysdate, hiredate)) as "재직 기간2"
from emp;

-- 돌아오는 요일(NEXT_DAY), 달의 마지막 날짜(LAST_DAY)
select sysdate,
next_day(sysdate, '월요일'),
LAST_DAY(sysdate)
from dual;

select last_day('24/8/28') from dual;

-- 날짜 정보 추출하는 함수 : extract
select extract (year from date '2024-10-16')
from dual;

select * from emp
where extract(month from hiredate) =12;


-- 자료형을 변환하는 형 변환 함수
select empno , ename, empno + '500'
from emp
where ename = 'FORD';

-- 날짜 , 숫자를 문자로 변환하는 TO_CHAR 함수 : 자바의 SimpleDateFormat 유사
select sysdate as "기본 시간 형태", to_char(sysdate, 'yyyy/mm/dd HH24:MI:SS')as "현재날짜"
from dual;

-- 숫자 데이터 형식을 지정 하여 출력하기
select sal, 
to_char(sal, '$999,999')as sal_$, -- 9는 숫자의 한자리를 의미하고 빈자리를 채우지 않음
to_char(sal,'L999,999')AS sal_L, -- 지역 화폐 단위 출력 
to_char(sal, '999,999.00')as sal_1, -- 0은 빈자리를 0으로 채움
to_char(sal, '000,999,999.00') as sal_2 
from emp;

--TO_NUMBER : 숫자 타입의 문자열을 숫자 데이터로 변환해주는 함수
select 1300 - '1500','1300'+'1500'
from dual;

--TO_DATE : 문자열로 명시된 날짜로 변환하는 함수
select TO_DATE('24-10-24','yy/mm/dd')as "날짜타입1",
to_date('20240714','yyyy/mm/dd')as "날짜타입2"
from dual;

-- 1981년 7월 1일 이후 입사한 사원 정보 출력하기
select * from emp
where hiredate > to_date('1981/07/01','yyyy/mm/dd');


-- NULL 처리 함수 : 특정 열의 행에 데이터가 없는 경우 데이터값이 NULL이 됨 (NULL 값이 없음)
-- NULL : 값이 할당 되지 않았기 때문에 공백이나 0과는 다른의미, 연산 (계산 , 비교 등등)
-- NVL(검사할 데이터 또는 열, 앞의 데이터가 NULL인 경우 대체할 값) : 
select empno, ename, sal, comm, sal+comm, 
nvl(comm, 0),
sal*12+nvl(comm,0)as 연봉
from emp;

-- NVL2(검사할 데이터, 데이터 NULL이 아닐 때 반환 되는 값 , 데이터 NULL일때 반환 되는 값)
select empno, ename, comm, 
nvl2(comm, '0','X') as comm,
nvl2(comm, sal*12+comm, sal*12)as 연봉
from emp;

-- NULLIF : 두 값을 비교하여 동일하면 null, 동일하지 않으면 첫 번째 값을 반환 
select nullif(10,10), nullif('A','B')
from dual;

-- decode : 주어진 데이터 값이 조건 값과 일치하는 값을 출력하고 일치하는 값이 없으면 기본값출력
select empno, ename , job, sal,
decode(job, 'MANAGER', sal+1.1,
'salesman', sal*1.05,
'analyst',sal,
sal*1.03) as "연봉인상"
from emp;

-- case : sql의 표준 함수 일반적으로 select절에서 많이 사용됨
select empno, ename, job, sal,
case job
when 'MANAGE' then sal * 1.1
when 'SALESMAN' then sal*1.05
when 'ANALIST' then sal
else sal *1.03
end as "연봉인상"
from emp;

-- 열 값에 따라서 출력이 달라지는 case 문 : 기준 데이터를 저장하지 않고 사용하는 방법
select empno, ename, comm,
case 
when comm is null then '해당사항없음'
when comm = 0 then '수당없음'
when comm > 0 then '수당 : ' || comm
end as "수당 정보"
from emp;


--다중행 함수 : 여러행에 대해서 함수가 적용되어 하나의 결과를 나타내는 함수
select deptno, sum(sal)
from emp
group by deptno;
-- 다중행 함수의 종류
-- sum() : 지정한 데이터의 합을 반환
-- count() : 지정한 데이터의 개수를 반환
-- max() : 최대값 반환 
-- min() : 최소값 반환 
-- avg() : 평균값 반환 
-- 집계함수(다중행 함수) null값이 포함되어있으면 무시
select sum(distinct sal), sum(sal)
from emp;

-- 모든 사원에 대해서 급여와 추가 수당의 합을 구하기
select sum(sal), sum(comm)
from emp;

-- 각 부서의 모든 사원에 대해서 급여과 추가 수당의 합을 구하기
select sum(sal), sum(comm), deptno
from emp
group by deptno;

-- 각 직책별로 급여와 추가 수당의 합 구하기 
select job, sum(sal), sum(comm)
from emp
group by job;

-- 각 직책별로 급여와 추가 수당의 합 구하기
select job as 직책, sum(sal)as 급여,sum(comm) as 성과급
from emp
group by job;

-- 각 부서별 최대(max) 급여 출력하기
select max(sal),deptno
from emp
group by deptno;

-- group by 없이 출력하려면?
select max(sal) from emp where deptno = 10;
select max(sal) from emp where deptno = 20;
select max(sal) from emp where deptno = 30;













