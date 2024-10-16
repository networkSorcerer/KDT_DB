-- �Լ� : Ư�� ��� �����͸� ��� ���� �����͸� �Է��Ҽ� �ִ� Ư����ɾ �ǹ�
-- �Լ����� ���� �Լ��� ����� ���� �Լ��� ���� 
-- ���� �Լ����� ������ �Լ��� ������ �Լ�(�����Լ�) �� �������� 
-- ������ �Լ� : �����Ͱ� ���྿ �Էµǰ� ����� �� �྿ ������ �Լ�
-- ������ �Լ� : ���� ���� �Է� �Ǿ �ϳ��� ������ ����� ��ȯ�Ǵ� �� 
-- �����Լ� : ���� ������ ó���ϱ� ���� �Լ� 
select -10, abs(-10) FROM dual;
-- round(����, �ݿø��� ��ġ) : �ݿø� ����� ��ȯ�ϴ� �Լ�
select ROUND(1234.5678) AS ROUND, -- �Ҽ��� ù°�ڸ����� �ݿø��ؼ� ����� ��ȯ
ROUND(1234.5678, 0) AS ROUND_0,
ROUND(1234.5678,1) AS ROUND_1, -- �Ҽ��� �ι�° �ڸ����� �ݿø��ؼ� �Ҽ��� 1�ڸ� ǥ��
ROUND(1234.5678,2) AS ROUND_2, -- �Ҽ��� 3��° �ڸ����� �ݿø��ؼ� �Ҽ��� 2�ڸ� ǥ��
ROUND(1234.5678, -1 )AS ROUND_MINUS1, -- ���� ù��° �ڸ��� �ݿø�
ROUND(1234.5678, -2 )AS ROUND_MINUS1 -- ���� �ι�° �ڸ��� �ݿø�
from dual;

--TRUNC : ������ �� ����� ��ȯ�ϴ� �Լ�,�ڸ��� �����ڱ٤�
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

-- ���ڿ� ���̸� ���ϴ� LENGTH �Լ�, LENCTHB�Լ�
-- LENGTH : ���ڿ� ���̸� ��ȯ
-- LENCTHB : ���ڿ��� ����Ʈ�� ��ȯ 
select LENGTH(ename), LENGHB(ename)  --����� �ѹ���Ʈ�� �����ϱ� ������ ���̿� ����Ʈ ���� ���� 
from emp;

select LENGTH('�ϴ�'),LENGTHB('�ϴ�')from dual; -- ����Ŭ XE���� �ѱ��� 3����Ʈ ����

-- ��å �̸��� ���̰� 6���� �̻��̰�, comm�ִ� ����� ��� ���� ��� 

SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�')
    FROM DUAL;
    
SELECT *
    FROM EMP
    WHERE LENGTH(JOB) >= 6 AND COMM IS NOT NULL AND COMM != 0;
    
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;

-- SUBSTR / SUBSTRB :  ���� ��ġ�� ���� ���� ������ŭ�� ���ڸ� ��ȯ�ϴ� �Լ�, �ε����� 1���� ���� 
select job, substr(job,1,2), substr(job,3,2),substr(job,5)
from emp;

-- substr �Լ��� �ٸ� �Լ� �Բ� ��� 
SELECT JOB, 
 SUBSTR(JOB, -LENGTH(JOB)), 
 SUBSTR(JOB, -LENGTH(JOB), 2),
 SUBSTR(JOB, -3)
FROM EMP;

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
 INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
 INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM DUAL;
    
-- INSTR : ���ڿ� ������ �ȿ� Ư�� ���ڳ� ���ڿ��� ��� ���ԵǾ��ִ����� �˰��� �� �� ��� 
select INSTR('HELLO, ORACLE','L' )as INSTR_1,
INSTR('HELLO, ORACLE', 'L',5)as INSTR_2,
INSTR('HELLO, ORACLE', 'L',2,2) AS INSTR_3 
from emp;

SELECT *
FROM EMP 
WHERE INSTR(ENAME, 'S') > 0; -- s��� ���ڰ� ���Ե� �� ���

SELECT *
FROM EMP 
WHERE ENAME LIKE '%S%';

-- replace : Ư�� ���ڿ� �����Ϳ� ���Ե� ���ڸ� �ٸ� ���ڷ� ��ü �� �� ���
-- ��ü�� ���ڸ� �������� ������ ����
select '010-5006-4146' as "��������",
REPLACE('010-5006-4146','-','/') as "���� ���� 1",
REPLACE('010-5006-4146','-') as "���� ����2"
from dual;

-- LPAD /RPAD : ���� ���� ĭ���� �����ϰ� ��ĭ ��ŭ�� Ư�� ���ڷ� ä��� �Լ�
select LPAD('ORACLE',10,'+')from dual;
select RPAD('ORACLE',10,'+')from dual;

select RPAD('01022-',14,'*') as RPAD_JUMIN,
RPAD('010-5006-',13,'*') AS RPAD_PHONE
from dual;

-- �� ���ڿ��� ��ġ�� concat �Լ�
select concat(empno,ename ) AS "�������",
concat(empno,concat(' : ', ename)) AS "������� :"
from emp
where ename = 'JAMES';

-- TRIM / LTRIM / RTRIM : ���ڿ� �����Ϳ��� Ư�� ���ڵ� ����� ���� ���
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
 '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
 '[' || LTRIM('<_Oracle_>', '<_') || ']' AS LTRIM_2,
 '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
 '[' || RTRIM('<_Oracle_>', '_>') || ']' AS RTRIM_2
 FROM DUAL;
 
 -- ��¥ �����͸� �ٷ�� �Լ� 
 -- ��¥ ������ + ���� : ����, ��¥���� ���� ��ŭ�� �� �� ��¥
 -- ��¥ ������ - ���� : ����, ��¥���� ���� ��ŭ�� �� �� ��¥
 -- ��¥ ������ - ��¥ ������ : ���� , �� ��¥���� �ϼ� ����
 -- ��¥ ������ + ��¥ ������ : ���� �Ұ�
 -- SYSDATE : �ü���� ���� �ð��� �������� �Լ�
 select sysdate from dual;

select sysdate as "����ð�",
sysdate -1 as "����",
sysdate +1 as "����"
from dual;

-- ��� ���� ��¥�� ���ϴ� ADD_MONTH �Լ� : Ư�� ��¥�� ������ ���� �� ���� ��¥ �����͸� ��ȯ
select sysdate,
add_months(sysdate, 3) AS "3���� ���� ��¥ ������"
from dual;

-- �Ի� 10�ֳ��� �Ǵ� ������� ������ ����ϱ�(�Ի��Ϸ� ���� 10���� ����� ��¥ ������ ��ȯ)
select empno, ename, hiredate as "�Ի���",add_months(hiredate, 120) as "10�ֳ�"
from emp;

-- �� ��¥���� ������ ���̸� ���ϴ� MONTHS_BETWEEN �Լ�
select empno, ename, hiredate, sysdate,
MONTHS_BETWEEN(hiredate, sysdate)as "-���� �Ⱓ",
MONTHS_BETWEEN(sysdate, hiredate) as "���� �Ⱓ",
trunc(MONTHS_BETWEEN(sysdate, hiredate)) as "���� �Ⱓ2"
from emp;

-- ���ƿ��� ����, ���� ������ ��¥
