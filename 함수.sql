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