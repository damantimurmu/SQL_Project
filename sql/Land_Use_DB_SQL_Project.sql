/*USE LAND_USE_DB;

-- SQL Project - Land Use: Data Integration and Analysis

/* Comprehensive list of SQL clauses, functions, and queries categorized into easy, moderate, and hard groups
based on their level of difficulty:*/

/*                    I. EASY
+--------------------------------------------------------------------------------+
|    o	Clauses:                                                                 |
+-------------------------+------------------------------------------------------+
|      SELECT             |   Retrieves data from a database table.              |
|      FROM	          |   Specifies the source table(s).                     |
|      WHERE	          |   Filters rows based on conditions.                  |
|      ORDER BY	          |   Sorts results.                                     |
|      AND, OR, NOT       |   Logical operators for filtering data.              |
|      DISTINCT           |   Filter unique values from result set of a query.   |
|      LIMIT              |   Limits the number of rows returned.                |
|      DESC               |   Sorts the query result in descending order         |
+-------------------------+------------------------------------------------------+
|    o  Aggregate Functions:                                                     |
+-------------------------+------------------------------------------------------+
|      COUNT	          |   Counts the number of rows.                         |
|      SUM                |   Calculates the sum of a column.                    | 
|      AVG	          |   Calculates the average of a column.                |
|      MIN, MAX           |   Returns the maximum or minimum value of a column.  |
+--------------------------------------------------------------------------------+
|   o  Alias:                                                                    |
+--------------------------------------------------------------------------------+
|      AS: Renames the column and table temporarily for the query output.        |
+--------------------------------------------------------------------------------+
*/

/* 1. (i)  Show data from table 'Domain'.
      (ii) Count the values from the following columns.
           (a)  Country
           (b)  Element and category
*/

-- (i)
SELECT 
    *
FROM
    DOMAIN;

-- (ii)(a) --
SELECT 
    COUNT(Country) AS Country_Count
FROM
    DOMAIN;
    
-- (ii)(b) --
SELECT 
    COUNT(Element) AS Element_Count,
    COUNT(Category) AS Category_Count
FROM
    DOMAIN;
    
/* 2. (i) Calculate the total agricultural land from India.
      (ii) Calculate the Average value of Cropland Use.
   */

-- (i)
SELECT 
    SUM(Value_Ha) AS Total_Agriculture_Land
FROM
    AREA
WHERE
    Country = 'India'
        AND Category = 'Agriculture';

-- (ii)
SELECT 
    AVG(Value_Ha) AS Average_Cropland_Use
FROM
    AREA
WHERE
    Category = 'Cropland';
        
/*  3.  Find out;
(i)  Top Countries with the largest area of more than 10000 hectares used for 'Planted Forest' in 2022.
(ii) Top six countries in terms of area of 'Inland waters' or 'Coastal waters' for 2022. 
*/

--(i)
SELECT DISTINCT
    (Country) AS Top_Country_with_Planted_Forest_Use, Value_Ha
FROM
    AREA
WHERE
    Category = 'Planted Forest'
        AND Value_Ha > 10000
        AND Year = 2022
ORDER BY Value_Ha DESC;

-- (ii)
SELECT DISTINCT
    (Country) AS Topmost_Country_with_Water_LandUse,
    Value_Ha,
    Category
FROM
    AREA
WHERE
    (Category = 'Inland waters'
        OR Category = 'Coastal waters')
        AND Year = 2022
ORDER BY Value_Ha DESC
LIMIT 6;

/* 4. What is the maximum and minimum area value recorded in 2022?
*/
SELECT 
    MAX(Value_Ha) AS Max_LandUse_Area,
    MIN(Value_Ha) AS Min_LandUse_Area
FROM
    AREA
WHERE
    Year = 2022;
    
/*   	QUERIES:
   o	Simple queries (e.g., retrieving all columns or specific columns)
   o	Filtering data using 'WHERE' clause
   o	Sorting data using 'ORDER BY'
   o	Limiting result sets using 'LIMIT'
*/

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*                  II. MODERATE
+--------------------------------------------------------------------------+
|    o	Clauses:                                                           |
+-------------------------+------------------------------------------------+
|      GROUP BY           |  Groups data by one or more columns.           |
|      SUBQUERY	          |  Uses a query as a condition or data source.   |
|       HAVING	          |  Filters grouped data based on conditions.     |
|         IN	          |  Checks if a value is in a list of values.     |
| JOIN(INNER,LEFT,RIGHT)  |  Combines data from multiple tables.           |
+-------------------------+------------------------------------------------+
|    o  String Functions:                                                  |
+-------------------------+------------------------------------------------+
|       ROUND	          |  Rounds a number to a specified decimal place. |
|       CONCAT	          |  Concatenates two or more strings.             |
|     UPPER, LOWER        |  Converts strings to uppercase or lowercase.   |
|       LENGTH	          |  Returns the length of a string.               |
+--------------------------------------------------------------------------+
|   o  Other Functions:                                                    |
+-------------------------+------------------------------------------------+
|      IF NULL            |  Returns a value if a column is NULL.          |
|   IS NULL, IS NOT NULL  |  Checks if a column is NULL or NOT NULL.       |
+--------------------------------------------------------------------------+
*/


/* 5. Calculate the total Carbon Stock Density of Forest Land in the following countries:
'India', 'Brazil', 'United States of America', 'China', 'South Africa', 'Egypt', 'Nigeria'
NOTE: Total carbon stock(mt)/ Total area(Ha) = Carbon stock density(mt/Ha)
*/

SELECT 
    c.Country,
    ROUND(SUM(c.Value_mt), 2) AS Carbon_Stock_in_Living_Biomass,
    ROUND(SUM(a.Value_Ha), 2) AS Total_ForestLand_Use,
    ROUND(SUM(c.Value_mt) / SUM(a.Value_Ha), 2) AS Carbon_Stock_Density_mtHa
FROM
    Carbon_Stock c
        INNER JOIN
    Area a ON c.Country = a.Country
WHERE
    c.Country IN ('India', 'Brazil',
        'United States of America',
        'China',
        'South Africa',
        'Egypt',
        'Nigeria')
GROUP BY c.Country
ORDER BY Carbon_Stock_Density_mtHa DESC;


/* 6. Find 10 countries with a value of more than 10,000 hectares area with category combined with its respective year.
*/

SELECT 
    Country,
    CONCAT(Category, ' - ', Year) AS Category,
    ROUND(SUM(Value_Ha), 2) AS Value_Ha
FROM
    AREA
GROUP BY Country, Category, Year
HAVING Value_Ha > 10000
ORDER BY Value_Ha
LIMIT 10;	

/* 7. Calculate the top 5 major changes in the Arable land of a country from the year 2012 to 2022.
*/

WITH ArableLU_2022 AS (SELECT DISTINCT
        Country,
        Value_Ha
    FROM
        AREA
    WHERE
        Category = 'Arable land' AND Year = 2022),
        
ArableLU_2012 AS (SELECT DISTINCT
        Country,
        Value_Ha
    FROM
        AREA
    WHERE
        Category = 'Arable land' AND Year = 2012)
SELECT
    ArableLU_2022.Country AS Country_with_Arable_Land_Use,
    ArableLU_2022.Value_Ha AS Land_Use_2022,
    ArableLU_2012.Value_Ha AS Land_Use_2012,
    ROUND((ArableLU_2022.Value_Ha - ArableLU_2012.Value_Ha), 2)
    AS Change_in_Arable_Land
FROM
    ArableLU_2022
JOIN
    ArableLU_2012
ON
    ArableLU_2022.Country = ArableLU_2012.Country
ORDER BY
    Change_in_Arable_Land DESC
LIMIT 5;

/* 8. Calculate the total land use of Countries with the category ‘Naturally regenerated forest’.
*/

WITH Area_of_NRF AS (SELECT Country AS Country_Ha, 
        ROUND(SUM(Value_Ha), 2) AS Total_Land_Use_Area
    FROM Area
    WHERE Category = 'Naturally regenerating forest'
    GROUP BY Country),
        
NRF_as_Indicators AS (
	SELECT Country AS Country_p, 
        ROUND(SUM(Value_p), 2) AS Total_Land_Use_Indicators
    FROM 
		Indicators
    WHERE 
		Category = 'Naturally regenerating forest'
    GROUP BY 
		Country)
SELECT 
    Area_of_NRF.Country_Ha AS Country,
    Total_Land_Use_Area,
    Total_Land_Use_Indicators
FROM 
	Area_of_NRF
LEFT JOIN 
	NRF_as_Indicators 
    ON Area_of_NRF.Country_Ha = NRF_as_Indicators.Country_p
WHERE 
	Total_Land_Use_Area IS NOT NULL 
    OR Total_Land_Use_Indicators IS NOT NULL
ORDER BY 
	Total_Land_Use_Area DESC, 
         Total_Land_Use_Indicators DESC LIMIT 10;
    
/* 9. What is the total carbon stock value recorded from the year 2012 to 2022 of the following countries:
‘India', 'Pakistan', 'Australia', 'Canada', 'Germany', 'Lebanon', 'Switzerland'?
*/

WITH Countries AS (SELECT Country, Year, 
      ROUND(SUM(Value_mt), 2) AS Total_Value
    FROM Carbon_Stock
    WHERE 
      Country IN ('India', 'Pakistan', 'Australia', 'Canada', 'Germany', 'Lebanon', 'Switzerland')
    GROUP BY Country, Year)
SELECT 
  c1.Year,
  c1.Total_Value AS India,
  c2.Total_Value AS Pakistan,
  c3.Total_Value AS Australia,
  c4.Total_Value AS Canada,
  c5.Total_Value AS Germany,
  c6.Total_Value AS Lebanon,
  c7.Total_Value AS Switzerland
FROM 
  Countries c1
  JOIN Countries c2 ON c1.Year = c2.Year AND c2.Country = 'Pakistan'
  JOIN Countries c3 ON c1.Year = c3.Year AND c3.Country = 'Australia'
  JOIN Countries c4 ON c1.Year = c4.Year AND c4.Country = 'Canada'
  JOIN Countries c5 ON c1.Year = c5.Year AND c5.Country = 'Germany'
  JOIN Countries c6 ON c1.Year = c6.Year AND c6.Country = 'Lebanon'
  JOIN Countries c7 ON c1.Year = c7.Year AND c7.Country = 'Switzerland'
WHERE c1.Country = 'India' ORDER BY c1.Year DESC;
    
    /*   	QUERIES:
   o	Aggregate functions with GROUP BY
   o    Filtering grouped data using HAVING
   o	Joining multiple tables
   o	Subqueries – Nested queries inside SELECT, WHERE, etc.
   o
*/

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    /*                  II. HARD
+---------------------------------------------------------------------------------------+
|    o	Clauses:                                                                        |
+----------------------------------+----------------------------------------------------+
| WINDOW FUNCTIONS: (ROW_NUMBER,   | Performs calculations over a set of rows.          |
|   (RANK, DENSE_RANK,  etc.)      |                                                    |
|    UNION / UNION ALL   	   | Combines results of multiple queries.              |
|    COMMON EXPRESSION TABLE (CTE) | Combine with with multiple tables.                 |
|    PIVOT     	                   | Rotates data from rows to columns.                 |
+----------------------------------+----------------------------------------------------+
|    o	Analytical Functions:                                                           |
+----------------------------------+----------------------------------------------------+
|      LEAD, LAG, NTILE 	   |                                                    |
+----------------------------------+----------------------------------------------------+
|    o  Other Functions:                                                                |
+----------------------------------+----------------------------------------------------+
|         CASE                     | Used to implement conditional logic within a query |
+---------------------------------------------------------------------------------------+
*/

/* 10. Determine how many times each category accounted for Official, Imputed, or Estimated values,
       and compute the total value count for each category in the year 2022.
*/

WITH Flag_Descriptions AS (
    SELECT
        d.Category,
        CASE WHEN f.2022 = 'A' THEN 1 ELSE 0 END AS Official_Value,
        CASE WHEN f.2022 = 'I' THEN 1 ELSE 0 END AS Imputed_Value,
        CASE WHEN f.2022 = 'E' THEN 1 ELSE 0 END AS Estimated_Value
    FROM 
		Flag f
    JOIN 
		Domain d ON f.Country_code = d.Country_code
    WHERE 
		d.Category IS NOT NULL)
SELECT 
    Category,
    SUM(Official_Value) AS Official_Value_Count,
    SUM(Imputed_Value) AS Imputed_Value_Count,
    SUM(Estimated_Value) AS Estimated_Value_Count,
    SUM(Official_Value + Imputed_Value + Estimated_Value) AS Total_Value_Count
FROM 
	Flag_Descriptions
GROUP BY 
	Category
HAVING 
    SUM(Official_Value) > 0 
	AND SUM(Imputed_Value) > 0 
    AND SUM(Estimated_Value) > 0;

-- Results for years other than 2022 are given separately in another file.

/* 11. Determine the total number of times each category accounted for values
       and ranked them based on the total value count for each category.
*/
WITH CategoryCounts AS (
     SELECT d.Category,
        SUM(
            CASE WHEN f.2012 IN ('A', 'I', 'E') THEN 1 ELSE 0 END +
            CASE WHEN f.2013 IN ('A', 'I', 'E') THEN 1 ELSE 0 END +
            CASE WHEN f.2014 IN ('A', 'I', 'E') THEN 1 ELSE 0 END +
            CASE WHEN f.2015 IN ('A', 'I', 'E') THEN 1 ELSE 0 END +
            CASE WHEN f.2016 IN ('A', 'I', 'E') THEN 1 ELSE 0 END +
            CASE WHEN f.2017 IN ('A', 'I', 'E') THEN 1 ELSE 0 END +
            CASE WHEN f.2018 IN ('A', 'I', 'E') THEN 1 ELSE 0 END +
            CASE WHEN f.2019 IN ('A', 'I', 'E') THEN 1 ELSE 0 END +
            CASE WHEN f.2020 IN ('A', 'I', 'E') THEN 1 ELSE 0 END +
            CASE WHEN f.2021 IN ('A', 'I', 'E') THEN 1 ELSE 0 END +
            CASE WHEN f.2022 IN ('A', 'I', 'E') THEN 1 ELSE 0 END 
	) AS Total_Count
    FROM 
		Flag f
	INNER JOIN 
		Domain d ON f.Country_code = d.Country_code
    GROUP BY 
		d.Category),
        
RankedCategories AS ( 
	SELECT Category, 
	       Total_Count
    FROM CategoryCounts)
    
SELECT 
	Category,
	Total_Count,
DENSE_RANK() OVER (ORDER BY Total_Count DESC) AS Ranks
FROM 
	RankedCategories
WHERE 
	Category IS NOT NULL
ORDER BY 
	Ranks, Category
LIMIT 10;

    /*   	QUERIES:
    o	Complex joins (e.g., multiple joins, subqueries in JOINs)
	o	Advanced window functions (e.g., partitioning, framing)
	o	Recursive Queries – Using Common Table Expressions (CTEs).
	o	Query Optimization – Tuning queries for performance.
    */
    
    -- ------------------------------------------------------------------------------- /* END OF SQL PROJECT */ ----------------------------------------------------------------------------------------------------------
