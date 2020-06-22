--서브쿼리

--Avel 직원보다 급여를 더 많이 받는 직원들은?
--Abel의 급여 확인
SELECT salary
    
FROM employees
WHERE last_name ='Abel';

--서브쿼리 사용
--단일행 연산자(-,<,>,<=,>=.<>,!,=) 단일행 사용 가능한 연산자
SELECT employee_id,last_name, salary
FROM employees
WHERE salary> ( SELECT salary
                FROM employees
                WHERE last_name ='Abel');
--단일행에서 에러가 나는경우 
SELECT employee_id,last_name, salary
FROM employees
WHERE salary> ( SELECT salary
                FROM employees
                WHERE department_id =30);--서브쿼리만 보고 싶다면 괄호안만 실행  
            --결과가 단일행에서는 리턴값이 하나만 있어야됨--
            
--그룹함수를 서브쿼리로 이용
--그룹함수 예: MAX는 가장높은 급여를 받는 사람을 알수없음
SELECT *
FROM employees
WHERE salary =(SELECT MAX(SALARY) FROM employees);
             --가장높은값은 나오되, 그사람이 누군지는 모름--
        

--예제2 'Bull'란 last_name을 가진 사원의 부서에서 Bull보다 높은 급여
--를 받는 사원들을 출력하라 
SELECT employee_id 직원번호, last_name 이름,
        department_id 부서번호, salary 급여
FROM employees
WHERE salary  >  (SELECT salary 
                  FROM employees 
                  where last_name='Bull') 
AND department_id = (SELECT department_id  
                    FROM employees 
                    WHERE  last_name ='Bull');

--예제3 'Russell'이란 last_name의 직원번호를 manager_id 로 가지는 직원들의 
--last_name salary manager_id를 출력하라 
SELECT last_name 이름 ,salary 급여, manager_id
FROM employees 
WHERE manager_id=  (SELECT employee_id 
                    FROM employees 
                    WHERE last_name ='Russell');

--예제4 job 테이블에 job_title이 'Stock Manager'의 job_id를 가진 직원들이 정보를
--Enployees 테이블에서 찾아서 출력하라
SELECT *
FROM employees
where job_id= (SELECT job_id 
                FROM  jobs 
                WHERE job_title = 'Stock Manager');    
                
--다중행 서브쿼리
--연산자는 (in any all)
SELECT salary FROM employees WHERE department_id =90;

--in 
SELECT employee_id ,first_name, last_name,salary
FROM employees
WHERE salary IN (SELECT salary 
                 FROM employees
                 WHERE department_id =90);
                --IN을 쓰면 OR 연산자 안써도됨-- 

--ANY :하나의 조건만 만족해도 됨
SELECT employee_id ,first_name, last_name,salary
FROM employees
WHERE salary >= ANY (SELECT salary 
                     FROM employees
                     WHERE department_id =90);
            --ANY는 비교라서 연산자를 꼭써야됨(비교연산자 필수)--

--ALL:모든 조건을 만족해야됨
SELECT employee_id ,first_name, last_name,salary
FROM employees
WHERE salary >= ALL (SELECT salary 
                     FROM employees
                     WHERE department_id =90);
            --ALL도 비교연산자 필요--
            
--예제1 부서번호(depatment_id)가 20번인 직원들의 메니저아이디(manager_id)와
--같은 메니저를 가지는 직원들을 출력하라(단,20번 부서의 직원은 제외)
SELECT employee_id ,first_name, last_name,salary
FROM employees
WHERE manager_id IN(SELECT manager_id 
                       FROM employees
                       WHERE department_id =20)
AND department_id <>20;


--예제2 job_id가'ST_MAN'인 직원들중 어느 한직원보다도 급여가 작은 직원들을 출력하라
SELECT employee_id ,last_name, job_id,salary
FROM employees
WHERE salary <=ANY(SELECT salary
                   FROM employees
                   WHERE job_id='ST_MAN');

--예제2 직책이 'IT_PROG'인 직원들 보다 급여가 작은 직원들을 출력하라
SELECT employee_id ,last_name, job_id,salary
FROM employees
WHERE salary < ALL(SELECT salary
                     FROM employees
                     WHERE job_id ='IT_PROG'); 
                     
--다중열 서브쿼리
--열의 이름이 여러개   --WHERE절 값과 WHERE 뒤 SEL 값이 순서도 같아야됨 연산자는 IN
SELECT employee_id ,first_name, job_id,salary, manager_id
FROM employees
WHERE (manager_id, job_id)in(SELECT manager_id, job_id
                             FROM employees
                             WHERE first_name ='Bruce')
AND first_name <> 'Bruce';
--부서별로 최소급열르 받는 사원의 부서번호, 사원번호, 이름 급여 
--정보출력
SELECT department_id 부서번호, employee_id 사원번호, first_name 이름,salary 급여
FROM employees
WHERE (department_id, salary) in (SELECT department_id, MIN(salary)
                                    FROM employees
                                    GROUP BY department_id)
ORDER BY department_id;
--예제 employees 테이블에서 job_id별로 가장낮은 salary가 얼마인지 찾아보고 
--찾아낸 job_id별 salary에 해당하는 직원의 first_name,job_id,salary,department_id를 
--출력하시오(salary 내림차순 정렬)

SELECT first_name,job_id,salary,department_id
    
FROM employees
WHERE (job_id,salary)in(SELECT job_id, min(salary)
                         FROM employees
                         GROUP by  job_id)
ORDER BY salary desc;







