-- create table
CREATE TABLE customers(
    name varchar(30),
    age INTEGER,
    interest_rate NUMBER(5,2)
);


-- populate table
CREATE OR REPLACE PROCEDURE fill_table
AS
    TYPE str_list IS TABLE OF VARCHAR(20);
    names str_list := str_list('Aman', 'Bablu', 'Baman', 'Champak', 'Dholu', 'Tinku');
    indx PLS_INTEGER;
    age INTEGER;
    interestrate NUMBER(5,2);
BEGIN
    FOR i IN 1..names.COUNT LOOP
        indx := i;
        age := TRUNC(DBMS_RANDOM.VALUE(18, 70));
        interestrate := ROUND(DBMS_RANDOM.VALUE(1.0, 20.0), 2);
        DBMS_OUTPUT.PUT_LINE('NAME :' || names(indx) || ' age : ' ||age);

        INSERT INTO customers (
            name,
            age,
            interestrate
        ) VALUES (
            names(indx),
            age, 
            interestrate
        );
    END LOOP;
END;


BEGIN
    fill_table();
END;

-- check table data
SELECT * FROM customers; 


-- Solution to the question
CREATE OR REPLACE PROCEDURE apply_discount_to_older_than_60 AS

BEGIN
    for rec in (SELECT ROWID, name, age, INTEREST_RATE FROM customers) LOOP
        if rec.age > 60 THEN
            UPDATE CUSTOMERS SET INTEREST_RATE = rec.interest_rate - 1
            WHERE ROWID = rec.ROWID;
            DBMS_OUTPUT.PUT_LINE('Updated customer with age ' || rec.age);
        END IF;
    END LOOP;
END;


BEGIN
    apply_discount_to_older_than_60();
END;

-- Check for update
SELECT * FROM customers; 