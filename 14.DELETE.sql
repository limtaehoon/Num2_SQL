--DELETE

--71~75�� �μ���ȣ ����
DELETE FROM departments
WHERE department_id BETWEEN 71 AND 75;
COMMIT;

DELETE FROM departments
WHERE department_id = 5;
COMMIT;

--EMPLOYEES ���̺� ID 1,2 ����
DELETE FROM employees
WHERE employee_id IN(1,2);

--���̺� ��ü ���� DELETE :(ROLLBLAK ����)
DELETE FROM copy_departments;
ROLLBACK;

--���̺� ��ü���� TRUVCATE TABLE:(ROLLBACK �Ұ�) 
TRUNCATE TABLE copy_departments;
ROLLBACK;
--DROP ���̺� :���̺� ��ü ���� 
DROP TABLE COPY_departments;
DROP TABLE COPY_DEPT;
DROP TABLE XX_EMP;

--���̺� ����Ʈ 
SELECT * FROM copy_emp
WHERE employee_id = 100; --salary =12018

UPDATE copy_emp
set salary=salary +10
WHERE employee_id =100;
--salary ���� 12018
--���̺� ����Ʈ A�����
SAVEPOINT A;

UPDATE copy_emp
set salary=salary +20
WHERE employee_id =100;-- salary=12028

--savepoint �� �ѹ�

ROLLBACK TO SAVEPOINT A;--salary ���� 12018�� ���ƿ�

--�ѹ�
ROLLBACK;
COMMIT;

