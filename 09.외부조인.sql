--외부조인  

--LEFT OUTER JOIN
SELECT e.last_name 직원, d.department_id 부서번호 ,
            d.department_name 부서명
FROM employees e
LEFT OUTER JOIN departments d
        ON e.department_id = d.department_id;
-- RIGHT OUTER JOIN       
SELECT e.last_name 직원, d.department_id 부서번호 ,
            d.department_name 부서명
FROM employees e
RIGHT OUTER JOIN departments d
        ON e.department_id = d.department_id;
-- FULL OUTER JOIN      
SELECT e.last_name 직원, d.department_id 부서번호 ,
            d.department_name 부서명
FROM employees e
FULL OUTER JOIN departments d
        ON e.department_id = d.department_id;

--예제 COUNTRIES,LOCATION 테이블을 조인하여 출력하라
--(지역번호로 DESC 정렬)
SELECT c.country_name 국가 , l.country_id 국가번호,
       l.location_id 지역번호, l.city 도시        
FROM COUNTRIES c
LEFT  OUTER JOIN LOCATIONS l
     ON c.country_id =l.country_id
order by 3 desc;

--교차 조인(cross join)
--예제 countries ,regions 테이블을 크로스 조인하여 아래와 같이 각각의 테이블의 
--25행x4행 =>100행의 결과가 나오도록 하세요
SELECT c.country_name 국가, r.region_name 지역이름
FROM countries c
CROSS JOIN regions r ; 

--리뷰
--1 department 테이블에 있은 manager_id와 employees테이블의 employees_id를 이용하여
--조인하여 부서명,메니저번호,메니저이름,전화번호를 나타내어라
SELECT d.department_name 부서명,
       d.manager_id 메니저번호,
       e.last_name||' '||e.first_name 풀이름,
       e.phone_number
FROM departments d
JOIN employees e
        on d.manager_id = e.employee_id;

--2 조인을 이용하여 사원들의 직원번호(employee_id),고용일자(hire_date),직종
--(job_id),직책(job_title)을 출력하라
SELECT  e.employee_id 직원번호, e.hire_date 고용일자,
        j.job_id 직종, j.job_title 직책
FROM employees e
join jobs j
        on e.job_id= j.job_id;
  
--3 직책(job_title)이 'Sales Manager'인 사원들의 입사년도 그룹별 평균급여를 출력하라
--입사년도를 기준으로 오름차순 정렬
--(job테이블과 join , job_id를 이용,입사년도 TO_CHAR(e.hire date,'YYYY')
SELECT TO_CHAR(e.hire_date, 'yyyy') 입사년도,
        ROUND(AVG(e.salary)) 평균급여
FROM employees e
JOIN  jobs j
    ON e.job_id =j.job_id
WHERE j.job_title ='Sales Manager'
GROUP by TO_CHAR(e.hire_date, 'yyyy')
ORDER BY 1;

--4 각각의 도시에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다 
--평군급여가 가장 낮은 도시부터 도시명(CITY)과 평균연봉 해당도시의 직원수를 출력하시요 
--단, 도시에 근무하는 직원이 10명 이상인 곳은 제외하고 조회하시오
--(Tip: 테이블 관계도를 보고 우선 어떤테이블들을 조인해야 할지 결정한후
-- SESLET*에 테이블들을 조인해서 문제가 없는지 확인한후 group by절과 SELECT 절 작성)
SELECT l.city 도시명, ROUND(AVG(e.salary)) 평균연봉,COUNT(*)  
        
FROM locations l
JOIN departments d 
    ON l.location_id= d.location_id
JOIN employees e   
    ON d.department_id = e.department_id
GROUP BY l.city
HAVING COUNT(*) <10
ORDER BY 2;
--5 자신의 매니저보다 급여를 많이 받는 직원들의 성,급여 와 매니저의 이름,급여를 출력하라
SELECT e.employee_id 직원번호,e.last_name 직원이름,e.salary 직원월급, 
       m.last_name 메니저이름, m.salary 메니저월급
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
where e.salary >m.salary;
       
