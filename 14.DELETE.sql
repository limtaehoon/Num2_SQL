--DELETE

--71~75번 부서번호 삭제
DELETE FROM departments
WHERE department_id BETWEEN 71 AND 75;
COMMIT;

DELETE FROM departments
WHERE department_id = 5;
COMMIT;

--EMPLOYEES 테이블 ID 1,2 삭제
DELETE FROM employees
WHERE employee_id IN(1,2);

--테이블 전체 삭제 DELETE :(ROLLBLAK 가능)
DELETE FROM copy_departments;
ROLLBACK;

--테이블 전체삭제 TRUVCATE TABLE:(ROLLBACK 불가) 
TRUNCATE TABLE copy_departments;
ROLLBACK;
--DROP 테이블 :테이블 전체 삭제 
DROP TABLE COPY_departments;
DROP TABLE COPY_DEPT;
DROP TABLE XX_EMP;

--세이브 포인트 
SELECT * FROM copy_emp
WHERE employee_id = 100; --salary =12018

UPDATE copy_emp
set salary=salary +10
WHERE employee_id =100;
--salary 값이 12018
--세이브 포인트 A만들기
SAVEPOINT A;

UPDATE copy_emp
set salary=salary +20
WHERE employee_id =100;-- salary=12028

--savepoint 로 롤백

ROLLBACK TO SAVEPOINT A;--salary 값이 12018로 돌아옴

--롤백
ROLLBACK;
COMMIT;

