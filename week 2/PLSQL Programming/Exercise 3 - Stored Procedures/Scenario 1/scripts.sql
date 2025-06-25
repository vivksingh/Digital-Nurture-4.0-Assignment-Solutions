
-- create accounts table
CREATE TABLE accounts(
    name varchar2(30),
    id NUMBER,
    balance NUMBER(10,2)
);

-- insert data
INSERT INTO accounts VALUES
('bablu', 1, 1000000),
('chintu', 2, 100190),
('pinky', 3, 10019013),
('gajjo', 4, 1238732);


--check data
SELECT * FROM accounts;

-- create stored procedure
create or replace PROCEDURE ProcessMonthlyInterest (
    rate IN NUMBER
) AS

BEGIN
    for rec in (SELECT id, balance FROM accounts) LOOP
        UPDATE accounts 
        SET balance = rec.balance + ((rec.balance * rate) / 100) 
        WHERE rec.id = id;
    END LOOP;
END;

--run procedure
BEGIN 
    ProcessMonthlyInterest(1);
END;
/


-- check data
SELECT * FROM accounts;