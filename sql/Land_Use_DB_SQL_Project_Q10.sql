/* Q. 10 Determine how many times each category accounted for Official, Imputed, or Estimated values,
       and compute the total value count for each category in each year.
*/
SELECT 
    d.Category,
    '2012' AS Year,
    CASE
        WHEN f.2012 = 'A' THEN 'Official_Figure'
        WHEN f.2012 = 'I' THEN 'Imputed_Value'
        WHEN f.2012 = 'E' THEN 'Estimated_Value'
        WHEN f.2012 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2012 = 'B' THEN 'Time_Series_Break'
    END AS Flag_Descriptions,
    COUNT(*) AS Count
FROM
    Flag f
    INNER JOIN Domain d ON f.Country_code = d.Country_code
GROUP BY 
    d.Category,
    CASE
        WHEN f.2012 = 'A' THEN 'Official_Figure'
        WHEN f.2012 = 'I' THEN 'Imputed_Value'
        WHEN f.2012 = 'E' THEN 'Estimated_Value'
        WHEN f.2012 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2012 = 'B' THEN 'Time_Series_Break'
    END

UNION ALL

SELECT 
    d.Category,
    '2013' AS Year,
    CASE
        WHEN f.2013 = 'A' THEN 'Official_Figure'
        WHEN f.2013 = 'I' THEN 'Imputed_Value'
        WHEN f.2013 = 'E' THEN 'Estimated_Value'
        WHEN f.2013 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2013 = 'B' THEN 'Time_Series_Break'
    END AS Flag_Descriptions,
    COUNT(*) AS Count
FROM
    Flag f
    INNER JOIN Domain d ON f.Country_code = d.Country_code
GROUP BY 
    d.Category,
    CASE
        WHEN f.2013 = 'A' THEN 'Official_Figure'
        WHEN f.2013 = 'I' THEN 'Imputed_Value'
        WHEN f.2013 = 'E' THEN 'Estimated_Value'
        WHEN f.2013 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2013 = 'B' THEN 'Time_Series_Break'
    END
    
    UNION ALL

SELECT 
    d.Category,
    '2014' AS Year,
    CASE
        WHEN f.2014 = 'A' THEN 'Official_Figure'
        WHEN f.2014 = 'I' THEN 'Imputed_Value'
        WHEN f.2014 = 'E' THEN 'Estimated_Value'
        WHEN f.2014 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2014 = 'B' THEN 'Time_Series_Break'
    END AS Flag_Descriptions,
    COUNT(*) AS Count
FROM
    Flag f
    INNER JOIN Domain d ON f.Country_code = d.Country_code
GROUP BY 
    d.Category,
    CASE
        WHEN f.2014 = 'A' THEN 'Official_Figure'
        WHEN f.2014 = 'I' THEN 'Imputed_Value'
        WHEN f.2014 = 'E' THEN 'Estimated_Value'
        WHEN f.2014 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2014 = 'B' THEN 'Time_Series_Break'
    END 
    
    UNION ALL
    
    SELECT 
    d.Category,
    '2015' AS Year,
    CASE
        WHEN f.2015 = 'A' THEN 'Official_Figure'
        WHEN f.2015 = 'I' THEN 'Imputed_Value'
        WHEN f.2015 = 'E' THEN 'Estimated_Value'
        WHEN f.2015 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2015 = 'B' THEN 'Time_Series_Break'
    END AS Flag_Descriptions,
    COUNT(*) AS Count
FROM
    Flag f
    INNER JOIN Domain d ON f.Country_code = d.Country_code
GROUP BY 
    d.Category,
    CASE
        WHEN f.2015 = 'A' THEN 'Official_Figure'
        WHEN f.2015 = 'I' THEN 'Imputed_Value'
        WHEN f.2015 = 'E' THEN 'Estimated_Value'
        WHEN f.2015 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2015 = 'B' THEN 'Time_Series_Break'
    END
    UNION ALL

SELECT 
    d.Category,
    '2016' AS Year,
    CASE
        WHEN f.2016 = 'A' THEN 'Official_Figure'
        WHEN f.2016 = 'I' THEN 'Imputed_Value'
        WHEN f.2016 = 'E' THEN 'Estimated_Value'
        WHEN f.2016 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2016 = 'B' THEN 'Time_Series_Break'
    END AS Flag_Descriptions,
    COUNT(*) AS Count
FROM
    Flag f
    INNER JOIN Domain d ON f.Country_code = d.Country_code
GROUP BY 
    d.Category,
    CASE
        WHEN f.2016 = 'A' THEN 'Official_Figure'
        WHEN f.2016 = 'I' THEN 'Imputed_Value'
        WHEN f.2016 = 'E' THEN 'Estimated_Value'
        WHEN f.2016 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2016 = 'B' THEN 'Time_Series_Break'
    END

    UNION ALL

SELECT 
    d.Category,
    '2017' AS Year,
    CASE
        WHEN f.2017 = 'A' THEN 'Official_Figure'
        WHEN f.2017 = 'I' THEN 'Imputed_Value'
        WHEN f.2017 = 'E' THEN 'Estimated_Value'
        WHEN f.2017 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2017 = 'B' THEN 'Time_Series_Break'
    END AS Flag_Descriptions,
    COUNT(*) AS Count
FROM
    Flag f
    INNER JOIN Domain d ON f.Country_code = d.Country_code
GROUP BY 
    d.Category,
    CASE
        WHEN f.2017 = 'A' THEN 'Official_Figure'
        WHEN f.2017 = 'I' THEN 'Imputed_Value'
        WHEN f.2017 = 'E' THEN 'Estimated_Value'
        WHEN f.2017 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2017 = 'B' THEN 'Time_Series_Break'
    END
    UNION ALL

SELECT 
    d.Category,
    '2018' AS Year,
    CASE
        WHEN f.2018 = 'A' THEN 'Official_Figure'
        WHEN f.2018 = 'I' THEN 'Imputed_Value'
        WHEN f.2018 = 'E' THEN 'Estimated_Value'
        WHEN f.2018 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2018 = 'B' THEN 'Time_Series_Break'
    END AS Flag_Descriptions,
    COUNT(*) AS Count
FROM
    Flag f
    INNER JOIN Domain d ON f.Country_code = d.Country_code
GROUP BY 
    d.Category,
    CASE
        WHEN f.2018 = 'A' THEN 'Official_Figure'
        WHEN f.2018 = 'I' THEN 'Imputed_Value'
        WHEN f.2018 = 'E' THEN 'Estimated_Value'
        WHEN f.2018 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2018 = 'B' THEN 'Time_Series_Break'
    END 
    UNION ALL

SELECT 
    d.Category,
    '2019' AS Year,
    CASE
        WHEN f.2019 = 'A' THEN 'Official_Figure'
        WHEN f.2019 = 'I' THEN 'Imputed_Value'
        WHEN f.2019 = 'E' THEN 'Estimated_Value'
        WHEN f.2019 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2019 = 'B' THEN 'Time_Series_Break'
    END AS Flag_Descriptions,
    COUNT(*) AS Count
FROM
    Flag f
    INNER JOIN Domain d ON f.Country_code = d.Country_code
GROUP BY 
    d.Category,
    CASE
        WHEN f.2019 = 'A' THEN 'Official_Figure'
        WHEN f.2019 = 'I' THEN 'Imputed_Value'
        WHEN f.2019 = 'E' THEN 'Estimated_Value'
        WHEN f.2019 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2019 = 'B' THEN 'Time_Series_Break'
    END
    UNION ALL

SELECT 
    d.Category,
    '2020' AS Year,
    CASE
        WHEN f.2020 = 'A' THEN 'Official_Figure'
        WHEN f.2020 = 'I' THEN 'Imputed_Value'
        WHEN f.2020 = 'E' THEN 'Estimated_Value'
        WHEN f.2020 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2020 = 'B' THEN 'Time_Series_Break'
    END AS Flag_Descriptions,
    COUNT(*) AS Count
FROM
    Flag f
    INNER JOIN Domain d ON f.Country_code = d.Country_code
GROUP BY 
    d.Category,
    CASE
        WHEN f.2020 = 'A' THEN 'Official_Figure'
        WHEN f.2020 = 'I' THEN 'Imputed_Value'
        WHEN f.2020 = 'E' THEN 'Estimated_Value'
        WHEN f.2020 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2020 = 'B' THEN 'Time_Series_Break'
    END
    UNION ALL

SELECT 
    d.Category,
    '2021' AS Year,
    CASE
        WHEN f.2021 = 'A' THEN 'Official_Figure'
        WHEN f.2021 = 'I' THEN 'Imputed_Value'
        WHEN f.2021 = 'E' THEN 'Estimated_Value'
        WHEN f.2021 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2021 = 'B' THEN 'Time_Series_Break'
    END AS Flag_Descriptions,
    COUNT(*) AS Count
FROM
    Flag f
    INNER JOIN Domain d ON f.Country_code = d.Country_code
GROUP BY 
    d.Category,
    CASE
        WHEN f.2021 = 'A' THEN 'Official_Figure'
        WHEN f.2021 = 'I' THEN 'Imputed_Value'
        WHEN f.2021 = 'E' THEN 'Estimated_Value'
        WHEN f.2021 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2021 = 'B' THEN 'Time_Series_Break'
    END

UNION ALL

SELECT 
    d.Category,
    '2022' AS Year,
    CASE
        WHEN f.2022 = 'A' THEN 'Official_Figure'
        WHEN f.2022 = 'I' THEN 'Imputed_Value'
        WHEN f.2022 = 'E' THEN 'Estimated_Value'
        WHEN f.2022 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2022 = 'B' THEN 'Time_Series_Break'
    END AS Flag_Descriptions,
    COUNT(*) AS Count
FROM
    Flag f
    INNER JOIN Domain d ON f.Country_code = d.Country_code
GROUP BY 
    d.Category,
    CASE
        WHEN f.2022 = 'A' THEN 'Official_Figure'
        WHEN f.2022 = 'I' THEN 'Imputed_Value'
        WHEN f.2022 = 'E' THEN 'Estimated_Value'
        WHEN f.2022 = 'X' THEN 'Figure_from_International_Organizations'
        WHEN f.2022 = 'B' THEN 'Time_Series_Break'
    END;
