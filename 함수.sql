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

-- ���ƿ��� ����(NEXT_DAY), ���� ������ ��¥(LAST_DAY)
select sysdate,
next_day(sysdate, '������'),
LAST_DAY(sysdate)
from dual;

select last_day('24/8/28') from dual;

-- ��¥ ���� �����ϴ� �Լ� : extract
select extract (year from date '2024-10-16')
from dual;

select * from emp
where extract(month from hiredate) =12;


-- �ڷ����� ��ȯ�ϴ� �� ��ȯ �Լ�
select empno , ename, empno + '500'
from emp
where ename = 'FORD';

-- ��¥ , ���ڸ� ���ڷ� ��ȯ�ϴ� TO_CHAR �Լ� : �ڹ��� SimpleDateFormat ����
select sysdate as "�⺻ �ð� ����", to_char(sysdate, 'yyyy/mm/dd HH24:MI:SS')as "���糯¥"
from dual;

-- ���� ������ ������ ���� �Ͽ� ����ϱ�
select sal, 
to_char(sal, '$999,999')as sal_$, -- 9�� ������ ���ڸ��� �ǹ��ϰ� ���ڸ��� ä���� ����
to_char(sal,'L999,999')AS sal_L, -- ���� ȭ�� ���� ��� 
to_char(sal, '999,999.00')as sal_1, -- 0�� ���ڸ��� 0���� ä��
to_char(sal, '000,999,999.00') as sal_2 
from emp;

--TO_NUMBER : ���� Ÿ���� ���ڿ��� ���� �����ͷ� ��ȯ���ִ� �Լ�
select 1300 - '1500','1300'+'1500'
from dual;

--TO_DATE : ���ڿ��� ��õ� ��¥�� ��ȯ�ϴ� �Լ�
select TO_DATE('24-10-24','yy/mm/dd')as "��¥Ÿ��1",
to_date('20240714','yyyy/mm/dd')as "��¥Ÿ��2"
from dual;

-- 1981�� 7�� 1�� ���� �Ի��� ��� ���� ����ϱ�
select * from emp
where hiredate > to_date('1981/07/01','yyyy/mm/dd');


-- NULL ó�� �Լ� : Ư�� ���� �࿡ �����Ͱ� ���� ��� �����Ͱ��� NULL�� �� (NULL ���� ����)
-- NULL : ���� �Ҵ� ���� �ʾұ� ������ �����̳� 0���� �ٸ��ǹ�, ���� (��� , �� ���)
-- NVL(�˻��� ������ �Ǵ� ��, ���� �����Ͱ� NULL�� ��� ��ü�� ��) : 
select empno, ename, sal, comm, sal+comm, 
nvl(comm, 0),
sal*12+nvl(comm,0)as ����
from emp;

-- NVL2(�˻��� ������, ������ NULL�� �ƴ� �� ��ȯ �Ǵ� �� , ������ NULL�϶� ��ȯ �Ǵ� ��)
select empno, ename, comm, 
nvl2(comm, '0','X') as comm,
nvl2(comm, sal*12+comm, sal*12)as ����
from emp;

-- NULLIF : �� ���� ���Ͽ� �����ϸ� null, �������� ������ ù ��° ���� ��ȯ 
select nullif(10,10), nullif('A','B')
from dual;

-- decode : �־��� ������ ���� ���� ���� ��ġ�ϴ� ���� ����ϰ� ��ġ�ϴ� ���� ������ �⺻�����
select empno, ename , job, sal,
decode(job, 'MANAGER', sal+1.1,
'salesman', sal*1.05,
'analyst',sal,
sal*1.03) as "�����λ�"
from emp;

-- case : sql�� ǥ�� �Լ� �Ϲ������� select������ ���� ����
select empno, ename, job, sal,
case job
when 'MANAGE' then sal * 1.1
when 'SALESMAN' then sal*1.05
when 'ANALIST' then sal
else sal *1.03
end as "�����λ�"
from emp;

-- �� ���� ���� ����� �޶����� case �� : ���� �����͸� �������� �ʰ� ����ϴ� ���
select empno, ename, comm,
case 
when comm is null then '�ش���׾���'
when comm = 0 then '�������'
when comm > 0 then '���� : ' || comm
end as "���� ����"
from emp;


--������ �Լ� : �����࿡ ���ؼ� �Լ��� ����Ǿ� �ϳ��� ����� ��Ÿ���� �Լ�
select deptno, sum(sal)
from emp
group by deptno;
-- ������ �Լ��� ����
-- sum() : ������ �������� ���� ��ȯ
-- count() : ������ �������� ������ ��ȯ
-- max() : �ִ밪 ��ȯ 
-- min() : �ּҰ� ��ȯ 
-- avg() : ��հ� ��ȯ 
-- �����Լ�(������ �Լ�) null���� ���ԵǾ������� ����
select sum(distinct sal), sum(sal)
from emp;

-- ��� ����� ���ؼ� �޿��� �߰� ������ ���� ���ϱ�
select sum(sal), sum(comm)
from emp;

-- �� �μ��� ��� ����� ���ؼ� �޿��� �߰� ������ ���� ���ϱ�
select sum(sal), sum(comm), deptno
from emp
group by deptno;

-- �� ��å���� �޿��� �߰� ������ �� ���ϱ� 
select job, sum(sal), sum(comm)
from emp
group by job;

-- �� ��å���� �޿��� �߰� ������ �� ���ϱ�
select job as ��å, sum(sal)as �޿�,sum(comm) as ������
from emp
group by job;

-- �� �μ��� �ִ�(max) �޿� ����ϱ�
select max(sal),deptno
from emp
group by deptno;

-- group by ���� ����Ϸ���?
select max(sal) from emp where deptno = 10;
select max(sal) from emp where deptno = 20;
select max(sal) from emp where deptno = 30;













