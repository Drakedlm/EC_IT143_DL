/*****************************************************************************************************************
NAME:    
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/27/2022   DLisboa       1. Built this script for EC IT440


RUNTIME: 
0s

NOTES: 
User-Defined Functions...
 
******************************************************************************************************************/


-- Step 1: Start with a question.

-- Question: How do I extract the first name from the contact name?

-- Step 2: Begin creating an answer.

-- Answer: I need to write a function that takes a full name as input and returns the first name.

-- Step 3: Create an ad hoc SQL query.

SELECT SUBSTRING(contactname, 1, CHARINDEX(' ', contactname) - 1) AS first_name
FROM dbo.v_w3_schools_customers;

-- Step 4
-- google search:How do I extract the first name from the contact name from a combined TSQL?
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

SELECT 
Contactname,
 LEFT([Contactname],CHARINDEX(' ',Contactname)-1)  AS FIRST_NAME
FROM dbo.t_w3_schools_customers AS T

-- Step 5

/*****************************************************************************************************************
NAME:    dbo.fn_GetFirstName.
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/27/2024   DLISBOA       1. Built this script for EC IT143


RUNTIME: 
0s

NOTES: 
Adapted from the following....
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name.

******************************************************************************************************************/

CREATE FUNCTION dbo.fn_GetFirstName (@FullName NVARCHAR(100))
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN SUBSTRING(@FullName, 1, CHARINDEX(' ', @FullName) - 1);
END;