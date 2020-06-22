--UPDATE :데이터 수정하기

--업데이트 사용시 where 절에 항상 기본키를 활용한다.
CREATE TABLE COPY_EMP
AS
SELECT * FROM employees;

UPDATE COPY_EMP
SET salary = 24100
WHERE employee_id = 100;
COMMIT;

--의도치 않게 이름이 같은 사람들이 업데이트됨
UPDATE COPY_EMP
SET salary = 24100
WHERE first_name = 'Steven';--2개행이 업데이트됨 (2명)
COMMIT;

--where절을 안썼을때 
UPDATE COPY_EMP
SET phone_number = '123-456-789';
 --where 절 안쓰면 109행 전부 수정됨--

ROLLBACK;--잘못수정시 되돌릴때 사양 commit 하지말고 ROLLBACK실행

--예제1 copy_departments 테이블의 개발부 4,5 부서의 메니저와 location_id를
-- 업데이트 하라
UPDATE copy_departments
SET manager_id =100,location_id=1800,
WHERE department_id = 75;

--예제2 copy_departments 테이블에서 department_id 150부터 200까지 부터번호의 
--manager_id를 100으로 수정하라
UPDATE copy_departments
set manager_id = 100
WHERE department_id between 150 and 200;
