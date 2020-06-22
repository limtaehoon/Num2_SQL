--DML �۾�

--INSERT :�� ���� �Է��ϱ�
--1.������ ���� ���������� Ȯ��(DESC+���̺�)
DESC departments;--�������� NOT NULL :NULL���� �� �Է��ؾߵȴ�

--��ü ���� ���Է��ϴ� ��� 1
INSERT INTO departments(department_id,
department_name, manager_id , location_id)
VALUES (71, '���ߺ�1',100,1700);

SELECT * FROM departments;
COMMIT;--�Է� ����

--���� �̸��� ���°�� ��ü���� ���Է��ؾߵ�
INSERT INTO departments
VALUES (72,'���ߺ�2',100,1700);
ROLLBACK;--�ǵ��� commit ���� ����Ǹ� �������� �ϰų� �����ߵ�

INSERT INTO departments
VALUES (72,'���ߺ�2',100,1700);
COMMIT;

--���� ������ �ٲܰ�� (departments �� �ǵڷ�) 
INSERT INTO departments(
department_name, manager_id , location_id,department_id)
VALUES ('���ߺ�3',100,1700,73);
COMMIT;

--�ڵ����� �ΰ� �Է�
INSERT INTO departments(department_id,
department_name)
VALUES (74, '���ߺ�4');
COMMIT;
DESC departments;

--SYSDATE  ���糯¥ �Է�  �⺻Ű��� �ߺ��Ǹ� �ȵ�
INSERT INTO employees(employee_id, first_name,
                        last_name, email, hire_date, job_id)
VALUES(1,'ȫ','�浿','hong@naver.com',sysdate,'IT_PROG');
COMMIT;
DESC employees;

--��¥�Է��ϱ�
INSERT INTO employees(employee_id, first_name,
                        last_name, email, hire_date, job_id)
VALUES(2,'��','�浿','Kang@naver.com',TO_DATE('2020-04-05','YYYY-MM-DD'), 'IT_PROG');
COMMIT;

--����ڷκ��� �Է¹ޱ� 
INSERT INTO departments(department_id,
department_name)
VALUES (&id, '&name'); --75,���ߺ�5(������ �Է��Ҷ� ���)
COMMIT;

--���̺� ����� 
CREATE TABLE XX_EMP(
    ENPNO NUMBER,
    ENAME VARCHAR2(100),
    SAL number
    );
--���̺� ��ü�� ī�ǿ��� �Է��ϴ� ���
INSERT INTO XX_EMP(ENPNO,ENAME,SAL)  --XX_EMP�� employ �� ��( id,name,salary ������ߵ�
SELECT employee_id,first_name,salary --���� ����,����,Ÿ��(���� ����)����
FROM employees;

--insert�� �����߿� ������ ���°��
--1 �⺻Ű�� �̹� �ִ�(�ߺ���)���� �Է��Ѱ��
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (10, '���ߺ�10',100,1700);--10�� �ߺ����� ������ 

--2 FX(�ܷ�Ű�� �������� ���� ���� �Է�
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (5, '���ߺ�5',100,1);--�ܷ�Ű�� �����ϰų� NULL�� ���� :���̺� ���� �ܷ�Ű�� ��ã�Ƽ� ����
--3 �������� ������ Ʋ���� 
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (5,'���ߺ� 5',100,'D1');--���� �ڸ��� ���ڰ� ���� ������ �����ڸ��� ���� ������ 
                                           
                                --����Ŭ�� �ڵ��� ���������� �����ԷµǱ⵵��
--4 ������ ����� ���������� 
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (5, '���ߺ�5','���ߺ�5','���ߺ�5','���ߺ�5','���ߺ�5','���ߺ�5',100,'D1');
DESC departments;

--���̺� ����鼭 ī���ϱ�
CREATE TABLE COPY_DEPT --���̺� ����� ���ÿ� 
AS
SELECT * FROM departments;--���Ⲩ�� ī���ؿ�

--����1 departments ���̺� ������ ���� ������ department_id,
--department_name,manager_id 200,location_id�� 1700�� ���� 3�� �Է��ϼ���
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (271,'simple DEPT 1',200,1700);
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (272,'simple DEPT 2',200,1700);
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (273,'simple DEPT 3',200,1700);

--����2 �Ʒ��� ���� ���̺��� ������ select ���� �̿��Ͽ� department ���̺� ����
--�� ���� �Է��Ͻÿ�
CREATE TABLE copy_departments(department_id  number(4,0),
                                department_name varchar2(30 byte),
                                manager_id number(6,0),
                                location_id number(4,0));

INSERT INTO copy_departments
SELECT * FROM departments;