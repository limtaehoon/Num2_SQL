--�׷��Լ�
SELECT COUNT(*)--������ �Ѱ��� 107��
FROM employees;

SELECT salary
FROM employees
ORDER BY salary DESC;

--MAX MIN
SELECT MAX(salary), MIN(salarY)--107���� ������Ȯ���ؼ� �ִ�,�ּҰ� ������
FROM employees;
--���ڿ��� ����
SELECT MAX(first_name), MIN(last_name)-- ù���ĺ� Z~A������ �ؼ� ���(MAX =Z,MIN =A)
FROM employees;
--��¥�� ����
SELECT MAX(hire_date), MIN(hire_date)--MAX �����ֱٰ��Ȼ�� MIN: �����Ȼ��
FROM employees;

--SUM,AVG:�հ�� ���(����)
SELECT SUM(salary),AVG(salary)
FROM employees;

--COUNT:����
SELECT COUNT(*)--������ü ���� ����
FROM employees;

SELECT COUNT(commission_pct)--NULL���� ������ ���� ���� 107-35=NULL��
FROM employees;

SELECT COUNT(NVL(commission_pct,0))--NULL������
FROM employees;
--DEPARTMENTS_id ��
SELECT COUNT(department_id)��
FROM employees;
--�μ��� ���� 
SELECT COUNT(DISTINCT department_id)
FROM employees;
--90�� �μ��� ������ ����
SELECT COUNT(employee_id)
FROM employees
WHERE department_id=90;

--��հ� ���ϱ� 
SELECT AVG(commission_pct)--NULL���� ����
FROM employees;

--GROUP BY�� ������ �����Լ� ���
SELECT department_id, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id;--��� �׷뿡�� 

SELECT department_id �μ���ȣ,
    ROUND(AVG(salary)) ��ձ޿�,--���
    SUM(salary)�ѱ޿��հ�,--sum=�հ�
    COUNT(*) �μ��ο���--COUNT(*)��
FROM employees 
GROUP BY department_id;--��� �׷뿡��

SELECT department_id �μ���ȣ,job_id ����,
    ROUND(AVG(salary)) ��ձ޿�,
    SUM(salary)�ѱ޿��հ�,
    COUNT(*) �μ���_������_�ο���
FROM employees 
GROUP BY department_id,job_id; --�μ�, �μ��ȿ��� ����

--���� �μ��� �����,�ִ�޿�,�ּұ޿� ,�޿��հ�,��ձ޸� �޿��հ�
--ū������ ��ȸ
SELECT department_id �μ���,
     COUNT(*) �����,
     MAX(salary)�ְ�޿�,MIN(salary)�ּұ޿�,
     SUM(salary)�޿��հ�,
     ROUND( AVG(salary))��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY �޿��հ� DESC;
--����2 �μ��� ������(JOB_ID),����ȣ(MANAGER_ID)�� �׷��� ���� SALARY �հ�� 
--�׷캰 ���� ���ڸ� ���
SELECT 
    department_id �μ���ȣ,
    job_id ����,
    manager_id ����ȣ,
    SUM(salary)�����հ�,
    COUNT(*)�����     
FROM employees
GROUP BY department_id, job_id,manager_id
ORDER BY �μ���ȣ; 

--����3 �μ��� �ְ���޻̾Ƽ� ��ճ��� �������ݶ��� ��ճ���
SELECT ROUND(AVG(MAX(salary))), AVG(MIN(salary))
FROM employees
GROUP BY department_id;

--HAVING ��
SELECT department_id �μ���,sum(salary)�޿��հ�
FROM employees
GROUP BY department_id
HAVING SUM(salary)>100000
ORDER BY department_id;

--���� �Ʒ������� ������ ��տ����� $10000�� �ְ� �ϴ� ������ ���ؼ� job_id�� ��
--�޿� �հ踦 ��ȸ�ϴ� ���̴�.�� ��ī��� �޴���(AC_MGR)�� �����ϰ� ���޿� �հ�� 
--�������� �����϶�
SELECT job_id �μ���ȣ, SUM(salary)���޿���
FROM employees
WHERE job_id !='AC_MGR'--�Ϲ�����    ���ܴ� where������ !�� not����
GROUP BY job_id
HAVING AVG(salary) >10000
ORDER BY ���޿��� DESC;
--����2 �μ���ȣ 40�� ������ �μ����޿��� 7000������ �μ����� ��ձ޿��� ����϶�
SELECT department_id �μ���ȣ, AVG(salary) ��ձ޿�
FROM employees
WHERE department_id !=40
GROUP BY department_id
HAVING AVG(salary)<=7000;

--����3 �������� ������ �հ谡 13000�̻��� ������ ����϶� �޿��Ѿ����� 
--������������ �����ϰ� ����(JOB_ID) �� 'REP'�� ����ִ� ������ �����Ѵ�.
SELECT job_id ����, SUM(salary) �޿��հ�
FROM employees
WHERE job_id NOT LIKE '%REP%'--REP �ִ� ���� ���� NOT LIKE
GROUP BY job_id
HAVING SUM (salary)>=13000
ORDER BY �޿��հ� DESC;
