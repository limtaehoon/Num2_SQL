--UPDATE :������ �����ϱ�

--������Ʈ ���� where ���� �׻� �⺻Ű�� Ȱ���Ѵ�.
CREATE TABLE COPY_EMP
AS
SELECT * FROM employees;

UPDATE COPY_EMP
SET salary = 24100
WHERE employee_id = 100;
COMMIT;

--�ǵ�ġ �ʰ� �̸��� ���� ������� ������Ʈ��
UPDATE COPY_EMP
SET salary = 24100
WHERE first_name = 'Steven';--2������ ������Ʈ�� (2��)
COMMIT;

--where���� �Ƚ����� 
UPDATE COPY_EMP
SET phone_number = '123-456-789';
 --where �� �Ⱦ��� 109�� ���� ������--

ROLLBACK;--�߸������� �ǵ����� ��� commit �������� ROLLBACK����

--����1 copy_departments ���̺��� ���ߺ� 4,5 �μ��� �޴����� location_id��
-- ������Ʈ �϶�
UPDATE copy_departments
SET manager_id =100,location_id=1800,
WHERE department_id = 75;

--����2 copy_departments ���̺��� department_id 150���� 200���� ���͹�ȣ�� 
--manager_id�� 100���� �����϶�
UPDATE copy_departments
set manager_id = 100
WHERE department_id between 150 and 200;
