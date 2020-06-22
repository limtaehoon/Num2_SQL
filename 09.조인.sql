--조인(join) 
--동등조인 (Equi join)
SELECT e.employee_id , e.department_id, d.department_name 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
--명시적 방법 JOIN과 ON절 사용해서 연결(최근방법)

--네츄럴조인(NATURAL JOIN)=ON절 생략(동일한열에 있으면 JOIN하기 때문에)
SELECT employee_id, first_name,
    job_id, job_title
FROM employees
NATURAL JOIN jobs ;
--기본 동등조인
SELECT e.employee_id, j.job_id,j.job_title    
FROM employees e
JOIN jobs j
    ON e.job_id = j.job_id;
--WHERE절 추가 
SELECT e.employee_id , e.department_id, d.department_name 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id=50;

--3개 테이블 조인
SELECT e.employee_id, e.department_id ,lo.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations lo  ON d.location_id = lo.location_id;

--예제 부서명 (department_name),시티명(city),국가명(country_name)을 나타내는 테이블을 
--출력합니다.테이블은 countries와 departmemts와 locations를 조인 합니다.조건은 
--시티가 'Seattle',혹은 London 이어야 하고 국가면은 앞쪽에 'United' 가 들어가야합니다.

SELECT d.department_name 부서명, l.city 도시명, c.country_name 국가명
FROM departments d
JOIN locations l ON d.location_id =l.location_id
JOIN countries c ON l.country_id =c.country_id
WHERE (l.city = 'Seattle' OR l.city ='London')
   AND c.country_name LIKE 'United%'
ORDER BY 2;

--자체조인 
SELECT  e.last_name 직원,  e.employee_id 직원번호, 
        m.last_name 메니저,m.employee_id 직원번호2
FROM employees e
JOIN employees m
 ON e.manager_id = m.employee_id;
--자체조인(직원 검색)
SELECT employee_id,last_name, manager_id
FROM employees
WHERE last_name ='Kumar'

    