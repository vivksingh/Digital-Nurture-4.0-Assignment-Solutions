--Create employee table

CREATE TABLE employees(
    id NUMBER,
    name VARCHAR2(30),
    salary NUMBER
);

--Insert data
INSERT INTO employees VALUES
(1, 'vek', 1000000),
(2, 'anvi', 1003919),
(3, 'vian', 1050000),
(4, 'iana', 1013400),
(5, 'eve', 14400);

-- check data
SELECT * FROM employees;

--procedure to update salary
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    bonus_percent IN NUMBER
) AS

BEGIN
    FOR rec IN (SELECT id, salary FROM EMPLOYEES) LOOP
        UPDATE employees
        SET salary = rec.salary + (rec.salary * (bonus_percent / 100))
        WHERE id = rec.id;
    END LOOP;
END;

--call the procedure
BEGIN
    UpdateEmployeeBonus(1);
END;

-- check result
SELECT * FROM EMPLOYEES;