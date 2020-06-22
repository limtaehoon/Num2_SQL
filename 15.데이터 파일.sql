--문자형
--문자형 CHAR 와 VARCHAR
CREATE TABLE COMP(
    CHAR_col   CHAR(4),
    VARCHAR_col VARCHAR2(4)
    );
    INSERT INTO comp VALUES('AA','AA');
    INSERT INTO comp VALUES('AAA','AAA');
    INSERT INTO comp VALUES('AAAA','AAAA');
    COMMIT;
    
    SELECT * FROM COMP;
    
    SELECT * FROM comp
    WHERE CHAR_col =VARCHAR_col;
--char는 고정길이 데이터타입 VARCHAR2는 가변길이 데이터 타입

--숫자형 데이터 타입 number
--number(p,s):p는 유효자리수1~30,s는 소수점 유효자리수


--데이터 타입
SELECT hire_date, TO_char(hire_date,'YYYY-MM-DD')"날짜=>문자변환"
    
FROM employees;

SELECT *
FROM employees
WHERE hire_date <'2002-03-03'
--오라클이 자동으로 오른쪽 문자를 좌측 데이터 날짜형에 맞게 형변환하여 비교





















