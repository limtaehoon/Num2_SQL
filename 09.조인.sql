--����(join) 
--�������� (Equi join)
SELECT e.employee_id , e.department_id, d.department_name 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
--����� ��� JOIN�� ON�� ����ؼ� ����(�ֱٹ��)

--��������(NATURAL JOIN)=ON�� ����(�����ѿ��� ������ JOIN�ϱ� ������)
SELECT employee_id, first_name,
    job_id, job_title
FROM employees
NATURAL JOIN jobs ;
--�⺻ ��������
SELECT e.employee_id, j.job_id,j.job_title    
FROM employees e
JOIN jobs j
    ON e.job_id = j.job_id;
--WHERE�� �߰� 
SELECT e.employee_id , e.department_id, d.department_name 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id=50;

--3�� ���̺� ����
SELECT e.employee_id, e.department_id ,lo.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations lo  ON d.location_id = lo.location_id;

--���� �μ��� (department_name),��Ƽ��(city),������(country_name)�� ��Ÿ���� ���̺��� 
--����մϴ�.���̺��� countries�� departmemts�� locations�� ���� �մϴ�.������ 
--��Ƽ�� 'Seattle',Ȥ�� London �̾�� �ϰ� �������� ���ʿ� 'United' �� �����մϴ�.

SELECT d.department_name �μ���, l.city ���ø�, c.country_name ������
FROM departments d
JOIN locations l ON d.location_id =l.location_id
JOIN countries c ON l.country_id =c.country_id
WHERE (l.city = 'Seattle' OR l.city ='London')
   AND c.country_name LIKE 'United%'
ORDER BY 2;

--��ü���� 
SELECT  e.last_name ����,  e.employee_id ������ȣ, 
        m.last_name �޴���,m.employee_id ������ȣ2
FROM employees e
JOIN employees m
 ON e.manager_id = m.employee_id;
--��ü����(���� �˻�)
SELECT employee_id,last_name, manager_id
FROM employees
WHERE last_name ='Kumar'

    