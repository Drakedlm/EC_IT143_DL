/*****************************************************************************************************************
NAME:    My Communities data sets
PURPOSE: findng answers to key question and transform into SQL statements?...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     15/10/2024   DLISBOA       1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
I will create answers to the questions me and other students built as part of Final Project: My Communities Analysis—Create Questions....
 
******************************************************************************************************************/

-- Q1: How do I translate My Communities data set questions into SQL statements?
-- A1: Lets SQL find out...

-- CHRISTIAN_BELIEFS Dataset Script

-- About Dataset
--CHRISTIAN BELIEFS
--This dataset offers a detailed overview about diferent denominations and doctrines belifes.
--The dataset contains, churches names, types of doctrine, biblical view historical view and percentage of christian who agrees with it.
--⚡️ Key Features:
--Doctrine of salvation, damnation, Trinity, Scripture Authority, the fall of men, etc. 
--doctrine comparison
--Christian overview about each doctrine
--The biblical view.

-- Questions from me: 

-- Q1: Which fundamental doctrines are believed by the majority of the listed Christian groups?
-- A1: 
SELECT
    Fundamental_Doctrines,
    COUNT(CASE WHEN Church_of_the_Later_Days_Saints = 'Believe' THEN 1 END) +
    COUNT(CASE WHEN Roman_Catholic = 'Believe' THEN 1 END) +
    COUNT(CASE WHEN Baptist = 'Believe' THEN 1 END) +
    COUNT(CASE WHEN Assembly_of_God = 'Believe' THEN 1 END) +
    COUNT(CASE WHEN Jehova_witness = 'Believe' THEN 1 END) AS BelieversCount,
    (CAST(BelieversCount AS FLOAT) / 5) * 100 AS BeliefPercentage
FROM
    ChristianBeliefs
GROUP BY
    Fundamental_Doctrines
HAVING
    BeliefPercentage > 50;
	

-- Q2:  What is the most common biblical view among the listed Christian groups?
-- A2: 

SELECT
    Biblical_View,
    COUNT(*) AS BeliefCount
FROM
    ChristianBeliefs
GROUP BY
    Biblical_View
ORDER BY
    BeliefCount DESC
LIMIT 1;

-- Q3: How does the belief in "Salvation by Faith alone" vary among the different Christian groups?
-- A3: 
SELECT
    Church_of_the_Later_Days_Saints,
    Roman_Catholic,
    Baptist,
    Assembly_of_God,
    Jehova_witness,
    Biblical_View,
    World_Christian_View_Percentage
FROM
    ChristianBeliefs
WHERE
    Fundamental_Doctrines = 'Salvation by Faith alone';
	
-- Question from another student: Bath-Scheba Joseph

-- Q4: Which Christian groups have a consistently high belief percentage across all fundamental doctrines?
-- A4:
SELECT
    Church_of_the_Later_Days_Saints,
    Roman_Catholic,
    Baptist,
    Assembly_of_God,
    Jehova_witness
FROM
    ChristianBeliefs
GROUP BY
    Church_of_the_Later_Days_Saints,
    Roman_Catholic,
    Baptist,
    Assembly_of_God,
    Jehova_witness
HAVING
    AVG(World_Christian_View_Percentage) > 50;





-- UNITA_VS_MPLA Dataset Script...


-- About Dataset
-- This dataset offers a detailed overview of how Angola rulling part MPLA has govern since 1975. 
-- We will compare the election over the years with UNITA the oposing rulling part.
-- The dataset contains economic view, social challenges, and political context.
--⚡Key Features:
-- Detailed election results since 1975
-- Social comparison over several decades in education
-- Economics analysis visualization in Inflation rate in percent.
-- Political context.
-- Angola’s economic fortunes have been tied to global demand for oil.
-- which has led to volatile growth and left the country with high levels of poverty and inequality. 
-- Currency depreciation and rising gasoline prices have fueled inflationary pressures since mid-2023. 
-- Annual inflation reached 24% in February 2024, compared with 11.5% in February 2023, driven mainly by food prices. 
-- In response, the National Bank of Angola raised its key interest rate by 100 basis points to 18% in November and then to 19% in March. 
-- Since around 80% of public debt is denominated in foreign currency. 
-- The exchange rate depreciation has pushed the debt-to-GDP ratio up from 69% in 2022 to 87% in 2023.

-- The economy is not generating enough jobs to keep up with the growth of Angola’s working-age population.
-- Diversification remains elusive.
-- while oil production is in structural decline and global decarbonisation looms in the medium term. 
-- Angola needs to urgently invest in removing barriers to private sector investment. 
-- To achieve economic diversification and support growth, job creation and poverty reduction.
-- The Popular Movement for the Liberation of Angola (MPLA) has been in power since the country’s independence in 1975. 
-- And 90% of the country’s decline is attributed to corruption and the inability of the ruling party to govern.




-- Questions from me:
 
-- Q1: What is the overall trend of the MPLA's vote share over the years?
-- A1:
SELECT 
    ElectionYear,
    MPLA_Percentage
FROM 
    ElectionResults;
	
-- Q2:  How have the MPLA and UNITA performed in terms of winning presidential elections?
-- A2:
SELECT 
    PresidentName,
    COUNT(*) AS NumWins
FROM 
    ElectionResults
WHERE 
    MPLA_Percentage > UNITA_Percentage
GROUP BY 
    PresidentName;
	
-- Questions from other students: (Bath-Scheba Joseph)

-- Q3:  How many transactions were made each year?
-- A3:
SELECT YEAR(Date) as TransactionYear, COUNT(*) as TransactionCount
FROM [Simpsons].[dbo].[FBS_Viza_Costmo]
GROUP BY YEAR(Date)
ORDER BY TransactionYear

-- Questions from other students: (Wisdom Etta)

-- Q4:  How have the MPLA Afected the country growth?
-- A4: 
SELECT
    Year,
    Election_Results_MPLA,
    Economic_Growth
FROM
    dbo.UNITA_VS_MPLA;