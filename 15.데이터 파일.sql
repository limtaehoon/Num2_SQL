--������
--������ CHAR �� VARCHAR
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
--char�� �������� ������Ÿ�� VARCHAR2�� �������� ������ Ÿ��

--������ ������ Ÿ�� number
--number(p,s):p�� ��ȿ�ڸ���1~30,s�� �Ҽ��� ��ȿ�ڸ���


--������ Ÿ��
SELECT hire_date, TO_char(hire_date,'YYYY-MM-DD')"��¥=>���ں�ȯ"
    
FROM employees;

SELECT *
FROM employees
WHERE hire_date <'2002-03-03'
--����Ŭ�� �ڵ����� ������ ���ڸ� ���� ������ ��¥���� �°� ����ȯ�Ͽ� ��





















