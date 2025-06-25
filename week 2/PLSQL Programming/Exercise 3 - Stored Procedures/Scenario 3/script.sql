CREATE TABLE accounts(
    id INT,
    name varchar2(20),
    balance NUMBER
);

INSERT INTO accounts VALUES
    (1, 'bablu', 10000),
    (2, 'pinku', 12000),
    (3, 'baburao', 15000),
    (4, 'dholu', 20000),
    (5, 'indumati', 10000000);

Select * from accounts;

CREATE OR REPLACE PROCEDURE transfer(
    senderId IN INT,
    receiverID IN INT,
    amount IN NUMBER
) AS
    senderBalance NUMBER;
BEGIN
    SELECT balance INTO senderBalance FROM accounts WHERE id = senderId;

    IF senderBalance >= amount THEN
        UPDATE accounts 
        SET balance = balance - amount
        WHERE id = senderId;

        UPDATE accounts 
        SET balance = balance + amount
        WHERE id = receiverId;
    ELSE 
        RAISE_APPLICATION_ERROR(-20001, 'INSUFFICIENT FUNDS');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Sender or receiver not found.');
    WHEN OTHERS THEN
        RAISE;
END;

BEGIN
    transfer(1, 2, 1000);
END;

SELECT * FROM accounts;