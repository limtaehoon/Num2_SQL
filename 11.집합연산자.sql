--���տ�����(UNION,INTERSECT,MINUS)
--UNION :�ߺ����� ������
SELECT employee_id,job_id    
FROM employees
UNION
SELECT employee_id,job_id
FROM job_history;--115

--UNIONALL �ߺ����� ������
SELECT employee_id,job_id    
FROM employees
UNION ALL
SELECT employee_id,job_id
FROM job_history;--117

--INTERSECT �����հ���
SELECT employee_id,job_id    
FROM employees
INTERSECT
SELECT employee_id,job_id
FROM job_history;--2

--MINUS ������
SELECT employee_id,job_id    
FROM employees
MINUS
SELECT employee_id,job_id
FROM job_history;--105

--����1 employee ���̺��� department_id���հ� departments ���̺��� 
--department_id ������ UNION�����ڸ� �̿��� ���ĺ����� 
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;

--����2 employee ���̺��� department_id���հ� departments ���̺��� 
--department_id ������ UNION ALL�����ڸ� �̿��� ���ĺ�����
SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

--����3 employee ���̺��� department_id���հ� departments ���̺��� 
--department_id ������ �������� INTERSECT�����ڸ� �̿��� ����� ������
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

--����4 departments ���̺��� department_id���տ��� employees ���̺��� 
--department_id ������ MINUS�����ڸ� �̿��� ��������
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;

