--집합연산자(UNION,INTERSECT,MINUS)
--UNION :중복제외 합집함
SELECT employee_id,job_id    
FROM employees
UNION
SELECT employee_id,job_id
FROM job_history;--115

--UNIONALL 중복포함 합집합
SELECT employee_id,job_id    
FROM employees
UNION ALL
SELECT employee_id,job_id
FROM job_history;--117

--INTERSECT 교집합값만
SELECT employee_id,job_id    
FROM employees
INTERSECT
SELECT employee_id,job_id
FROM job_history;--2

--MINUS 차집합
SELECT employee_id,job_id    
FROM employees
MINUS
SELECT employee_id,job_id
FROM job_history;--105

--예제1 employee 테이블의 department_id집합과 departments 테이블의 
--department_id 집합을 UNION연산자를 이용해 합쳐보세요 
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;

--예제2 employee 테이블의 department_id집합과 departments 테이블의 
--department_id 집합을 UNION ALL연산자를 이용해 합쳐보세요
SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

--예제3 employee 테이블의 department_id집합과 departments 테이블의 
--department_id 집합의 교집합을 INTERSECT연산자를 이용해 출력해 보세요
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

--예제4 departments 테이블의 department_id집합에서 employees 테이블의 
--department_id 집합을 MINUS연산자를 이용해 빼보세요
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;

