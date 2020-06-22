--그룹함수
SELECT COUNT(*)--데이터 총개수 107개
FROM employees;

SELECT salary
FROM employees
ORDER BY salary DESC;

--MAX MIN
SELECT MAX(salary), MIN(salarY)--107개의 셀러리확인해서 최대,최소값 가져옴
FROM employees;
--문자열에 적용
SELECT MAX(first_name), MIN(last_name)-- 첫알파벳 Z~A순으로 해서 출력(MAX =Z,MIN =A)
FROM employees;
--날짜에 적용
SELECT MAX(hire_date), MIN(hire_date)--MAX 가장최근고용된사람 MIN: 오래된사람
FROM employees;

--SUM,AVG:합계와 통계(숫자)
SELECT SUM(salary),AVG(salary)
FROM employees;

--COUNT:갯수
SELECT COUNT(*)--직원전체 행의 개수
FROM employees;

SELECT COUNT(commission_pct)--NULL값을 제외한 행의 개수 107-35=NULL값
FROM employees;

SELECT COUNT(NVL(commission_pct,0))--NULL값포함
FROM employees;
--DEPARTMENTS_id 개
SELECT COUNT(department_id)수
FROM employees;
--부서의 개수 
SELECT COUNT(DISTINCT department_id)
FROM employees;
--90번 부서의 직원의 숫자
SELECT COUNT(employee_id)
FROM employees
WHERE department_id=90;

--평균값 구하기 
SELECT AVG(commission_pct)--NULL값은 제외
FROM employees;

--GROUP BY로 나눠서 집계함수 사용
SELECT department_id, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id;--어느 그룸에서 

SELECT department_id 부서번호,
    ROUND(AVG(salary)) 평균급여,--평균
    SUM(salary)총급여합계,--sum=합계
    COUNT(*) 부서인원수--COUNT(*)수
FROM employees 
GROUP BY department_id;--어느 그룸에서

SELECT department_id 부서번호,job_id 직업,
    ROUND(AVG(salary)) 평균급여,
    SUM(salary)총급여합계,
    COUNT(*) 부서별_직업별_인원수
FROM employees 
GROUP BY department_id,job_id; --부서, 부서안에서 직업

--예제 부서별 사원수,최대급여,최소급여 ,급여합계,평균급를 급여합계
--큰순으로 조회
SELECT department_id 부서명,
     COUNT(*) 사원수,
     MAX(salary)최고급여,MIN(salary)최소급여,
     SUM(salary)급여합계,
     ROUND( AVG(salary))평균급여
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;
--예제2 부서별 직업별(JOB_ID),상사번호(MANAGER_ID)별 그롭을 지어 SALARY 합계와 
--그룹별 직원 숫자를 출력
SELECT 
    department_id 부서번호,
    job_id 직업,
    manager_id 상사번호,
    SUM(salary)월급합계,
    COUNT(*)사원수     
FROM employees
GROUP BY department_id, job_id,manager_id
ORDER BY 부서번호; 

--예제3 부서별 최고월급뽑아서 평균내고 최저월금또한 평균내라
SELECT ROUND(AVG(MAX(salary))), AVG(MIN(salary))
FROM employees
GROUP BY department_id;

--HAVING 절
SELECT department_id 부서명,sum(salary)급여합계
FROM employees
GROUP BY department_id
HAVING SUM(salary)>100000
ORDER BY department_id;

--예제 아래예제는 직종별 평균월급이 $10000을 최과 하는 직종에 대해서 job_id와 월
--급여 합계를 조회하는 예이다.단 어카운드 메니저(AC_MGR)을 제외하고 월급여 합계로 
--내림차순 정렬하라
SELECT job_id 부서번호, SUM(salary)월급여합
FROM employees
WHERE job_id !='AC_MGR'--일반조건    제외는 where절에서 !나 not으로
GROUP BY job_id
HAVING AVG(salary) >10000
ORDER BY 월급여합 DESC;
--예제2 부서번호 40을 제외한 부서별급여가 7000이하인 부서들의 평균급여를 출력하라
SELECT department_id 부서번호, AVG(salary) 평균급여
FROM employees
WHERE department_id !=40
GROUP BY department_id
HAVING AVG(salary)<=7000;

--예제3 직종별로 월급의 합계가 13000이상인 직종을 출력하라 급여총액으로 
--내림차순으로 정렬하고 직종(JOB_ID) 에 'REP'가 들어있는 직종은 제외한다.
SELECT job_id 직종, SUM(salary) 급여합계
FROM employees
WHERE job_id NOT LIKE '%REP%'--REP 있는 직종 제외 NOT LIKE
GROUP BY job_id
HAVING SUM (salary)>=13000
ORDER BY 급여합계 DESC;
