-- 1. Create the Customers table
BEGIN
  EXECUTE IMMEDIATE '
    CREATE TABLE Customers (
      CustomerID NUMBER PRIMARY KEY,
      Name VARCHAR2(100),
      Balance NUMBER(10, 2),
      IsVIP VARCHAR2(5) DEFAULT ''FALSE''
    )';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -955 THEN 
      RAISE;
    END IF;
END;
/

-- 2. Insert initial data
BEGIN
  INSERT INTO Customers (CustomerID, Name, Balance)
  VALUES (1, 'Alice', 5000);

  INSERT INTO Customers (CustomerID, Name, Balance)
  VALUES (2, 'Bob', 15000);

  INSERT INTO Customers (CustomerID, Name, Balance)
  VALUES (3, 'Charlie', 25000);

  INSERT INTO Customers (CustomerID, Name, Balance)
  VALUES (4, 'Diana', 8000);

  COMMIT;
END;
/

-- 3. PL/SQL block to set IsVIP = 'TRUE' for customers with balance > 10,000
BEGIN
  FOR rec IN (SELECT CustomerID FROM Customers WHERE Balance > 10000) LOOP
    UPDATE Customers
    SET IsVIP = 'TRUE'
    WHERE CustomerID = rec.CustomerID;
  END LOOP;

  COMMIT;
END;
/

SELECT * FROM Customers;
