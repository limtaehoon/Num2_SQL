--변환형 함수
--to char

--숫자를 문자로 변경

--콤마(,)
SELECT to_char(12345678,'999,999,999')콤마
FROM DUAL;
--소수점(.)]
SELECT to_char(123.45678,'999,999,999.99')소수점
FROM DUAL;
--$표시
SELECT to_char(12345678,'$999,999,999')달러표시
FROM DUAL;
--L표시
SELECT to_char(12345678,'L999,999,999')현지통화--각 나라 통화로 변경 일본이면 엔화
FROM DUAL;
--왼쪽에 0을 삽입
SELECT to_char(123,'09999')제로표시--남는공간에 0을 붙임
FROM DUAL;

--날짜를 문자로 변환

--년,월,일,시,분,초
SELECT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')현재날짜 -- SYSDATE뒤의 형식대로 날짜 표시
FROM DUAL;
--365일중 오늘이 몇일?
SELECT to_char(sysdate, 'DDD') 날짜
FROM DUAL;
--오늘의 월?
SELECT to_char(sysdate, 'MONTH') 몇월
FROM DUAL;

--예제 employees 테이블에서 department_id가 100인 사원들의 입사일을 이용하여 
--아래와 같이 출력
SELECT employee_id,TO_CHAR(hire_date,'MM/yy') 입사일
FROM employees
WHERE department_id =100;

--예제2 employees 테이블에서 salary가 1000달러가 넘는사원들의 이름과 월급을
--월급이 많은순으로 나타내어라
SELECT last_name AS 이름, TO_CHAR(salary,'$999,999,999') 월급
FROM employees
WHERE salary >10000
ORDER BY salary DESC;

--문자를 날짜로 TO_DATE
SELECT TO_DATE('2011-01-01','YYYY-MM-DD')
FROM DUAL;

--문자를 숫자로 TO_NUMBER
SELECT to_number('0123123')+100
FROM DUAL;

--

