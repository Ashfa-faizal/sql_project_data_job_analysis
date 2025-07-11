-- SUBQUERIES 
-- using both of these we are gonna create a temporary result set inside of our sql query
-- it's very useful for complex queries
-- it can be used in SELECT/FROM/WHERE/HAVING clauses

-- let's say we wanted to creat a tamporary table of january job;s
-- subquery is a query inside of a another query

SELECT *
FROM(
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(month FROM job_posted_date) = 1
) AS january_jobs;

/* let's get a companies that offering a job no recument for any degree */

SELECT 
    company_id,
    job_no_degree_mention
FROM
    job_postings_fact
WHERE job_no_degree_mention = 'True'


-- but in here there are only company id but company name is in another table
-- this is where subqueries so powerfull


SELECT 
    name AS company_name,
    company_id
FROM company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM
        job_postings_fact
    WHERE job_no_degree_mention = 'True'
    ORDER BY
        company_id
)




-- CTES
-- CTES - common table expressions
-- other way to create a temporary table is using CTE
-- they can use in more locations such as SELECT/INSERT/UPDATE/DELETE

WITH january_jobs AS(
     SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(month FROM job_posted_date) = 1
)
SELECT *
FROM january_jobs;


-- CTEs used similar to subqueries to create a temporary result set
-- exist only during the execution of the query

/* let's find the companies with the most job openings 
   we need to break to this into 2 parts , thats why CTS are perfect to this
   1. get the total no of job potings per company id
   2. then we need to combine with company name
*/

WITH job_counts AS (
    SELECT 
        company_id,
        COUNT(company_id) AS job_count
    FROM
        job_postings_fact
    GROUP BY company_id
)

-- maybe some comapanies don't have a job postings , so that's why we need to use LEFT JOIN
SELECT name ,
    job_counts.job_count
FROM company_dim 
LEFT JOIN job_counts ON  job_counts.company_id = company_dim.company_id 
ORDER BY job_counts.job_count DESC