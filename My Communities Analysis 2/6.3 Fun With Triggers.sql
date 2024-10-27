/*****************************************************************************************************************
NAME:    
PURPOSE: User-Defined Triggers and Functions...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/27/2022   DLisboa       1. Built this script for EC IT440


RUNTIME: 
0s

NOTES: 
User-Defined Triggers...
 
******************************************************************************************************************/

-- Step 8: The next question.

-- How do I extract the last name from the contact name?

-- Step 2: Begin creating an answer.

-- A: I need to create a trigger that updates a LastModified column whenever a record is updated.

-- Step 3: Research and test a solution.

-- Research: https://stackoverflow.com/questions/25568526/sql-server-after-update-trigger.

CREATE TRIGGER [dbo].[after_update] 
    ON dbo.t_w3_schools_customers
    AFTER UPDATE
    AS 
    BEGIN
          UPDATE dbo.t_w3_schools_customers 
          SET dbo.t_w3_schools_customers.CHANGED_ON = GETDATE(),
          CHANGED_BY=USER_NAME(USER_ID())



-- Step 4: Create an after-update trigger.

CREATE TRIGGER trg_AfterUpdate_Customers
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.t_w3_schools_customers
    SET LastModified = GETDATE()
    FROM inserted
    WHERE dbo.t_w3_schools_customers.CustomerID = inserted.CustomerID;
END;


-- Step 5: Test results to see if they are as expected.


UPDATE dbo.t_w3_schools_customers
SET ContactName = 'Test Name'
WHERE CustomerID = 1;

SELECT CustomerID, LastModied
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;