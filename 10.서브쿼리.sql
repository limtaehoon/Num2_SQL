--��������

--Avel �������� �޿��� �� ���� �޴� ��������?
--Abel�� �޿� Ȯ��
SELECT salary
    
FROM employees
WHERE last_name ='Abel';

--�������� ���
--������ ������(-,<,>,<=,>=.<>,!,=) ������ ��� ������ ������
SELECT employee_id,last_name, salary
FROM employees
WHERE salary> ( SELECT salary
                FROM employees
                WHERE last_name ='Abel');
--�����࿡�� ������ ���°�� 
SELECT employee_id,last_name, salary
FROM employees
WHERE salary> ( SELECT salary
                FROM employees
                WHERE department_id =30);--���������� ���� �ʹٸ� ��ȣ�ȸ� ����  
            --����� �����࿡���� ���ϰ��� �ϳ��� �־�ߵ�--
            
--�׷��Լ��� ���������� �̿�
--�׷��Լ� ��: MAX�� ������� �޿��� �޴� ����� �˼�����
SELECT *
FROM employees
WHERE salary =(SELECT MAX(SALARY) FROM employees);
             --����������� ������, �׻���� �������� ��--
        

--����2 'Bull'�� last_name�� ���� ����� �μ����� Bull���� ���� �޿�
--�� �޴� ������� ����϶� 
SELECT employee_id ������ȣ, last_name �̸�,
        department_id �μ���ȣ, salary �޿�
FROM employees
WHERE salary  >  (SELECT salary 
                  FROM employees 
                  where last_name='Bull') 
AND department_id = (SELECT department_id  
                    FROM employees 
                    WHERE  last_name ='Bull');

--����3 'Russell'�̶� last_name�� ������ȣ�� manager_id �� ������ �������� 
--last_name salary manager_id�� ����϶� 
SELECT last_name �̸� ,salary �޿�, manager_id
FROM employees 
WHERE manager_id=  (SELECT employee_id 
                    FROM employees 
                    WHERE last_name ='Russell');

--����4 job ���̺� job_title�� 'Stock Manager'�� job_id�� ���� �������� ������
--Enployees ���̺��� ã�Ƽ� ����϶�
SELECT *
FROM employees
where job_id= (SELECT job_id 
                FROM  jobs 
                WHERE job_title = 'Stock Manager');    
                
--������ ��������
--�����ڴ� (in any all)
SELECT salary FROM employees WHERE department_id =90;

--in 
SELECT employee_id ,first_name, last_name,salary
FROM employees
WHERE salary IN (SELECT salary 
                 FROM employees
                 WHERE department_id =90);
                --IN�� ���� OR ������ �Ƚᵵ��-- 

--ANY :�ϳ��� ���Ǹ� �����ص� ��
SELECT employee_id ,first_name, last_name,salary
FROM employees
WHERE salary >= ANY (SELECT salary 
                     FROM employees
                     WHERE department_id =90);
            --ANY�� �񱳶� �����ڸ� ����ߵ�(�񱳿����� �ʼ�)--

--ALL:��� ������ �����ؾߵ�
SELECT employee_id ,first_name, last_name,salary
FROM employees
WHERE salary >= ALL (SELECT salary 
                     FROM employees
                     WHERE department_id =90);
            --ALL�� �񱳿����� �ʿ�--
            
--����1 �μ���ȣ(depatment_id)�� 20���� �������� �޴������̵�(manager_id)��
--���� �޴����� ������ �������� ����϶�(��,20�� �μ��� ������ ����)
SELECT employee_id ,first_name, last_name,salary
FROM employees
WHERE manager_id IN(SELECT manager_id 
                       FROM employees
                       WHERE department_id =20)
AND department_id <>20;


--����2 job_id��'ST_MAN'�� �������� ��� ���������ٵ� �޿��� ���� �������� ����϶�
SELECT employee_id ,last_name, job_id,salary
FROM employees
WHERE salary <=ANY(SELECT salary
                   FROM employees
                   WHERE job_id='ST_MAN');

--����2 ��å�� 'IT_PROG'�� ������ ���� �޿��� ���� �������� ����϶�
SELECT employee_id ,last_name, job_id,salary
FROM employees
WHERE salary < ALL(SELECT salary
                     FROM employees
                     WHERE job_id ='IT_PROG'); 
                     
--���߿� ��������
--���� �̸��� ������   --WHERE�� ���� WHERE �� SEL ���� ������ ���ƾߵ� �����ڴ� IN
SELECT employee_id ,first_name, job_id,salary, manager_id
FROM employees
WHERE (manager_id, job_id)in(SELECT manager_id, job_id
                             FROM employees
                             WHERE first_name ='Bruce')
AND first_name <> 'Bruce';
--�μ����� �ּұ޿��� �޴� ����� �μ���ȣ, �����ȣ, �̸� �޿� 
--�������
SELECT department_id �μ���ȣ, employee_id �����ȣ, first_name �̸�,salary �޿�
FROM employees
WHERE (department_id, salary) in (SELECT department_id, MIN(salary)
                                    FROM employees
                                    GROUP BY department_id)
ORDER BY department_id;
--���� employees ���̺��� job_id���� ���峷�� salary�� ������ ã�ƺ��� 
--ã�Ƴ� job_id�� salary�� �ش��ϴ� ������ first_name,job_id,salary,department_id�� 
--����Ͻÿ�(salary �������� ����)

SELECT first_name,job_id,salary,department_id
    
FROM employees
WHERE (job_id,salary)in(SELECT job_id, min(salary)
                         FROM employees
                         GROUP by  job_id)
ORDER BY salary desc;







