--�ܺ�����  

--LEFT OUTER JOIN
SELECT e.last_name ����, d.department_id �μ���ȣ ,
            d.department_name �μ���
FROM employees e
LEFT OUTER JOIN departments d
        ON e.department_id = d.department_id;
-- RIGHT OUTER JOIN       
SELECT e.last_name ����, d.department_id �μ���ȣ ,
            d.department_name �μ���
FROM employees e
RIGHT OUTER JOIN departments d
        ON e.department_id = d.department_id;
-- FULL OUTER JOIN      
SELECT e.last_name ����, d.department_id �μ���ȣ ,
            d.department_name �μ���
FROM employees e
FULL OUTER JOIN departments d
        ON e.department_id = d.department_id;

--���� COUNTRIES,LOCATION ���̺��� �����Ͽ� ����϶�
--(������ȣ�� DESC ����)
SELECT c.country_name ���� , l.country_id ������ȣ,
       l.location_id ������ȣ, l.city ����        
FROM COUNTRIES c
LEFT  OUTER JOIN LOCATIONS l
     ON c.country_id =l.country_id
order by 3 desc;

--���� ����(cross join)
--���� countries ,regions ���̺��� ũ�ν� �����Ͽ� �Ʒ��� ���� ������ ���̺��� 
--25��x4�� =>100���� ����� �������� �ϼ���
SELECT c.country_name ����, r.region_name �����̸�
FROM countries c
CROSS JOIN regions r ; 

--����
--1 department ���̺� ���� manager_id�� employees���̺��� employees_id�� �̿��Ͽ�
--�����Ͽ� �μ���,�޴�����ȣ,�޴����̸�,��ȭ��ȣ�� ��Ÿ�����
SELECT d.department_name �μ���,
       d.manager_id �޴�����ȣ,
       e.last_name||' '||e.first_name Ǯ�̸�,
       e.phone_number
FROM departments d
JOIN employees e
        on d.manager_id = e.employee_id;

--2 ������ �̿��Ͽ� ������� ������ȣ(employee_id),�������(hire_date),����
--(job_id),��å(job_title)�� ����϶�
SELECT  e.employee_id ������ȣ, e.hire_date �������,
        j.job_id ����, j.job_title ��å
FROM employees e
join jobs j
        on e.job_id= j.job_id;
  
--3 ��å(job_title)�� 'Sales Manager'�� ������� �Ի�⵵ �׷캰 ��ձ޿��� ����϶�
--�Ի�⵵�� �������� �������� ����
--(job���̺�� join , job_id�� �̿�,�Ի�⵵ TO_CHAR(e.hire date,'YYYY')
SELECT TO_CHAR(e.hire_date, 'yyyy') �Ի�⵵,
        ROUND(AVG(e.salary)) ��ձ޿�
FROM employees e
JOIN  jobs j
    ON e.job_id =j.job_id
WHERE j.job_title ='Sales Manager'
GROUP by TO_CHAR(e.hire_date, 'yyyy')
ORDER BY 1;

--4 ������ ���ÿ� �ִ� ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� �Ѵ� 
--�򱺱޿��� ���� ���� ���ú��� ���ø�(CITY)�� ��տ��� �ش絵���� �������� ����Ͻÿ� 
--��, ���ÿ� �ٹ��ϴ� ������ 10�� �̻��� ���� �����ϰ� ��ȸ�Ͻÿ�
--(Tip: ���̺� ���赵�� ���� �켱 ����̺���� �����ؾ� ���� ��������
-- SESLET*�� ���̺���� �����ؼ� ������ ������ Ȯ������ group by���� SELECT �� �ۼ�)
SELECT l.city ���ø�, ROUND(AVG(e.salary)) ��տ���,COUNT(*)  
        
FROM locations l
JOIN departments d 
    ON l.location_id= d.location_id
JOIN employees e   
    ON d.department_id = e.department_id
GROUP BY l.city
HAVING COUNT(*) <10
ORDER BY 2;
--5 �ڽ��� �Ŵ������� �޿��� ���� �޴� �������� ��,�޿� �� �Ŵ����� �̸�,�޿��� ����϶�
SELECT e.employee_id ������ȣ,e.last_name �����̸�,e.salary ��������, 
       m.last_name �޴����̸�, m.salary �޴�������
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
where e.salary >m.salary;
       
