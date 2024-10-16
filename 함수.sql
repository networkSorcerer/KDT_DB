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