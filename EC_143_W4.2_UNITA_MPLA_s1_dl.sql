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

--Description: This script retrieves the information about Angola elections and other factores over the years.

-- Q1: How many times did each presidential candidate appear in the elections between 1992 and 2022?
-- This question aims to count the number of times each presidential candidate,
-- from both MPLA and UNITA appeared in the elections over the specified years

-- A1: Lets ask SQL Server and find out...

-- 1) Reload data

SELECT [President_MPLA], COUNT([President_MPLA]) AS TimesAppearedMPLA,
       [President_UNITA], COUNT([President_UNITA]) AS TimesAppearedUNITA
FROM dbo.UNITA_VS_MPLA
GROUP BY [President_MPLA], [President_UNITA];
