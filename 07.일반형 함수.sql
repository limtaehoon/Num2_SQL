--NULL 관련함수
--NVL:널값을 다른값으로 바꿀때 사용
SELECT last_name, manager_id, NVL(manager_id,0)메니저
FROM employees
WHERE last_name ='King';

--NVL2(ex,ex1,ex2):ex값이 NULL 값이 아니면 ex1 NULL 값이면 ex2
SELECT last_name, NVL2(manager_id,1,0)메니저
FROM employees
WHERE last_name ='King';

--NULL IF(ex1,ex2):ex1과 ex2값이 동일하면 NULL
--동일하지 않으면 ex1으로 출력
SELECT NULLIF(1,1),NULLIF(1,2)
FROM DUAL;

--CIALESCE(ex1,ex2,ex3,....)
--ex1이 널값이면 ex2반환,ex2도 널값이면 ex3반환 ....
SELECT last_name 이름 ,salary 월급,commission_pct 커미션,
COALESCE ((salary +(commission_pct*salary)),salary+2000)월급인상
FROM employees
ORDER BY 3;

--예제 employees테이블에서 아래와 같이 이름 월급 커미선을 nvl함수 사용 연봉은
--(월급*12)+(월급*12*커미션)이다
SELECT last_name 이름, salary 월급,
        NVL(commission_pct, 0)커미션,
       salary *12 + salary*12*NVL(commission_pct,0)연봉
FROM employees
ORDER BY 연봉 DESC;

--예제2 위의 예제에 더하여 연봉계산은 NVL2함수를 사용하여 커미션이 있을때와
--없을때 계산방법을 나타냅니다
SELECT last_name 이름, salary 월급,
        NVL(commission_pct,0) 커미션,
       salary *12+salary*12*NVL(commission_pct,0)연봉,
       NVL2(commission_pct,'SAL+COMM','SAL') 연봉계산
FROM employees
ORDER BY 연봉 DESC;
--예제3 employees테이블에서 first_name과 last_name 의 길이 LENGTH를 비교해서 
--같으면 NULL 값을 아니면 LENGTH(first_name)값을 출력하라
SELECT  first_name, LENGTH('first_name')글자수1,
        LAST_NAME, LENGTH('LAST_NAME')글자수2,
        NULLIF(LENGTH('first_name'),LENGTH('LAST_NAME'))결과
     FROM employees;
 
--DECODE 함수
SELECT last_name 이름,job_id, salary,
    DECODE(job_id,  'IT_PROG',  salary*1.10,
                    'ST_CLERK', salary*1.15,
                    'SA_REP',   salary*1.20,
                                salary) "수정월급"
FROM employees;

--예제 employees테이블에서 DECODE함수를 이용해서 월급에 따른 세율을 나타내세요
SELECT last_name 이름,job_id 직무, salary 월급,
    DECODE(TRUNC(salary/2000),   0,0,
                                 1,0.09,
                                 2,0.20,
                                 3,0.30,
                                 4,0.40,
                                 5,0.42,
                                 6,0.44,
                                    0.45) "세율"
FROM employees;
--예제 employees테이블에서 job_id가 IT_PROG라면 
--employees_id, first_name, last_name,salary를 출력하되 
--salary가 9000 이상이면 "상위급여 
--6000과 8999사이면 "중위급여 
--그외는 "하위급여라고 출력 하세요

SELECT employee_id, first_name,last_name,
    CASE  WHEN salary>=9000 THEN '상위급여'
          WHEN salary>=6000 THEN '중위급여'
          ELSE                   '하위급여'     
    END 급여등급
FROM employees
WHERE job_id='IT_PROG';
