--��ȯ�� �Լ�
--to char

--���ڸ� ���ڷ� ����

--�޸�(,)
SELECT to_char(12345678,'999,999,999')�޸�
FROM DUAL;
--�Ҽ���(.)]
SELECT to_char(123.45678,'999,999,999.99')�Ҽ���
FROM DUAL;
--$ǥ��
SELECT to_char(12345678,'$999,999,999')�޷�ǥ��
FROM DUAL;
--Lǥ��
SELECT to_char(12345678,'L999,999,999')������ȭ--�� ���� ��ȭ�� ���� �Ϻ��̸� ��ȭ
FROM DUAL;
--���ʿ� 0�� ����
SELECT to_char(123,'09999')����ǥ��--���°����� 0�� ����
FROM DUAL;

--��¥�� ���ڷ� ��ȯ

--��,��,��,��,��,��
SELECT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')���糯¥ -- SYSDATE���� ���Ĵ�� ��¥ ǥ��
FROM DUAL;
--365���� ������ ����?
SELECT to_char(sysdate, 'DDD') ��¥
FROM DUAL;
--������ ��?
SELECT to_char(sysdate, 'MONTH') ���
FROM DUAL;

--���� employees ���̺��� department_id�� 100�� ������� �Ի����� �̿��Ͽ� 
--�Ʒ��� ���� ���
SELECT employee_id,TO_CHAR(hire_date,'MM/yy') �Ի���
FROM employees
WHERE department_id =100;

--����2 employees ���̺��� salary�� 1000�޷��� �Ѵ»������ �̸��� ������
--������ ���������� ��Ÿ�����
SELECT last_name AS �̸�, TO_CHAR(salary,'$999,999,999') ����
FROM employees
WHERE salary >10000
ORDER BY salary DESC;

--���ڸ� ��¥�� TO_DATE
SELECT TO_DATE('2011-01-01','YYYY-MM-DD')
FROM DUAL;

--���ڸ� ���ڷ� TO_NUMBER
SELECT to_number('0123123')+100
FROM DUAL;

--

