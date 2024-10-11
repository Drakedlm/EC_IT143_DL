/*****************************************************************************************************************
NAME:    EC_143_W4.2_Christian_Beliefs_s1_dl.sql
PURPOSE: My script purpose is to find the diferent denominations that believe in the Trinity...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.1     11/10/2024   DLisboa       1. Built this script for EC IT143


RUNTIME: 1s
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- Q1: what are the diferent denominations that believe in the trinity?
-- A1: We need to find out which of the denominations listed in the table believe in the trinity...
-- We can achieve this by looking at the 'Trinity' row in the table.
-- identify the denominations that have a 'Believe' value in their corresponding columns.

--1) Reload data
SELECT 
    Church_of_the_Later_Days_Saints,
    Roman_Catholic,
    Baptist,
    Assembly_of_God,
    Jeova_witness
FROM
    dbo.Christian_Beliefs
WHERE
    Fundamental_Doctrines = 'Trinity';

	--1) Results

	-- Retrieve all records from the  Fundamental_Doctrines table 
SELECT * FROM Christian_Beliefs

-- Retrieve the doctrines where LDS Saints believe 
SELECT Fundamental_Doctrines
FROM dbo.Christian_Beliefs
WHERE Church_of_the_Later_Days_Saints = 'Believe';

-- Retrieve all records from the Church_of_the_Latter_Day_Saints
SELECT Church_of_the_Later_Days_Saints
FROM Christian_Beliefs;