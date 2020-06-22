--DML 작업

--INSERT :새 행을 입력하기
--1.실행전 열과 제약조건을 확인(DESC+테이블)
DESC departments;--제약조건 NOT NULL :NULL값을 꼭 입력해야된다

--전체 열을 다입력하는 방법 1
INSERT INTO departments(department_id,
department_name, manager_id , location_id)
VALUES (71, '개발부1',100,1700);

SELECT * FROM departments;
COMMIT;--입력 저장

--열의 이름이 없는경우 전체열을 다입력해야됨
INSERT INTO departments
VALUES (72,'개발부2',100,1700);
ROLLBACK;--되돌림 commit 으로 저장되면 수정으로 하거나 지워야됨

INSERT INTO departments
VALUES (72,'개발부2',100,1700);
COMMIT;

--열의 순서를 바꿀경우 (departments 를 맨뒤로) 
INSERT INTO departments(
department_name, manager_id , location_id,department_id)
VALUES ('개발부3',100,1700,73);
COMMIT;

--자동으로 널값 입력
INSERT INTO departments(department_id,
department_name)
VALUES (74, '개발부4');
COMMIT;
DESC departments;

--SYSDATE  현재날짜 입력  기본키경우 중복되면 안됨
INSERT INTO employees(employee_id, first_name,
                        last_name, email, hire_date, job_id)
VALUES(1,'홍','길동','hong@naver.com',sysdate,'IT_PROG');
COMMIT;
DESC employees;

--날짜입력하기
INSERT INTO employees(employee_id, first_name,
                        last_name, email, hire_date, job_id)
VALUES(2,'강','길동','Kang@naver.com',TO_DATE('2020-04-05','YYYY-MM-DD'), 'IT_PROG');
COMMIT;

--사용자로부터 입력받기 
INSERT INTO departments(department_id,
department_name)
VALUES (&id, '&name'); --75,개발부5(여러번 입력할때 사용)
COMMIT;

--테이블 만들기 
CREATE TABLE XX_EMP(
    ENPNO NUMBER,
    ENAME VARCHAR2(100),
    SAL number
    );
--테이블 전체를 카피에서 입력하는 방법
INSERT INTO XX_EMP(ENPNO,ENAME,SAL)  --XX_EMP랑 employ 랑 값( id,name,salary 맟춰줘야됨
SELECT employee_id,first_name,salary --열의 순서,갯수,타입(숫자 문자)까지
FROM employees;

--insert를 실행중에 에러가 나는경우
--1 기본키에 이미 있는(중복된)값을 입력한경우
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (10, '개발부10',100,1700);--10번 중복으로 오류남 

--2 FX(외래키에 참조되지 않은 값을 입력
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (5, '개발부5',100,1);--외래키는 참조하거나 NULL값 가능 :테이블에 없는 외래키는 못찾아서 오류
--3 데이터의 종류가 틀릴때 
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (5,'개발부 5',100,'D1');--숫자 자리에 문자가 들어가면 오류남 문자자리에 숫자 넣으면 
                                           
                                --오라클은 자동을 문자형으로 숫자입력되기도함
--4 데이터 사이즈가 맞지않을때 
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (5, '개발부5','개발부5','개발부5','개발부5','개발부5','개발부5',100,'D1');
DESC departments;

--테이블 만들면서 카피하기
CREATE TABLE COPY_DEPT --테이블 만듬과 동시에 
AS
SELECT * FROM departments;--여기꺼를 카피해옴

--예제1 departments 테이블에 다음과 같이 각각의 department_id,
--department_name,manager_id 200,location_id가 1700인 행을 3개 입력하세요
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (271,'simple DEPT 1',200,1700);
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (272,'simple DEPT 2',200,1700);
INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES (273,'simple DEPT 3',200,1700);

--예제2 아래와 같이 테이블을 만든후 select 문을 이용하여 department 테이블 내용
--을 전부 입력하시오
CREATE TABLE copy_departments(department_id  number(4,0),
                                department_name varchar2(30 byte),
                                manager_id number(6,0),
                                location_id number(4,0));

INSERT INTO copy_departments
SELECT * FROM departments;