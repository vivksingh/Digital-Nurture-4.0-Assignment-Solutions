BEGIN
  EXECUTE IMMEDIATE '
    CREATE TABLE Loans (
      LoanID NUMBER PRIMARY KEY,
      CustomerID NUMBER,
      Amount NUMBER(10, 2),
      DueDate DATE,
      CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    )';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -955 THEN
      RAISE;
    END IF;
END;
/

BEGIN
  -- Loan due in 10 days
  INSERT INTO Loans (LoanID, CustomerID, Amount, DueDate)
  VALUES (101, 1, 2000.00, SYSDATE + 10);

  -- Loan due in 5 days
  INSERT INTO Loans (LoanID, CustomerID, Amount, DueDate)
  VALUES (102, 2, 3500.00, SYSDATE + 5);

  -- Loan due in 40 days (should not be picked up by reminder query)
  INSERT INTO Loans (LoanID, CustomerID, Amount, DueDate)
  VALUES (103, 3, 1500.00, SYSDATE + 40);

  -- Loan already overdue
  INSERT INTO Loans (LoanID, CustomerID, Amount, DueDate)
  VALUES (104, 4, 1800.00, SYSDATE - 3);

  COMMIT;
END;
/

SELECT * FROM Loans;


DECLARE
  CURSOR loan_cursor IS
    SELECT l.LoanID, l.CustomerID, c.Name, l.DueDate
    FROM Loans l
    JOIN Customers c ON l.CustomerID = c.CustomerID
    WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30;

BEGIN
  FOR loan_rec IN loan_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan #' || loan_rec.LoanID ||
                         ' for customer ' || loan_rec.Name ||
                         ' is due on ' || TO_CHAR(loan_rec.DueDate, 'DD-MON-YYYY') || '.');
  END LOOP;
END;
/


