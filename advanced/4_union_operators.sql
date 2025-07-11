-- UNION
-- this is very important for combining tables
-- combining result sets of 2/ more SELECT statements into a single result set
-- UNION - remove duplicate rows

/* each SELECT statements within the UNION must have the same number of columns
   in the result sets with similar data types
*/

-- to combine jan,feb and march tables(created in previous files) by row wise we can use UNION operator


SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION 

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    feb_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;


-- UNION ALL - includes all duplicate rows
-- combine the result sets of 2/ more SELECT statements 
-- they need to have the same amount of columns and similar data types


SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    feb_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;