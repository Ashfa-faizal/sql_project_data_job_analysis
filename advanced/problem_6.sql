/* creat tables for
       1. jan 2023 jobs
       2. feb 2023 jobs
       3. mar 2023 jobs
 */


-- Create a table for January 2023 job postings
    
CREATE TABLE january_jobs AS
    SELECT *
    FROM
        job_postings_fact
    WHERE 
        EXTRACT(month FROM job_posted_date) = 1;


CREATE TABLE feb_jobs AS
    SELECT *
    FROM
        job_postings_fact
    WHERE 
        EXTRACT(month FROM job_posted_date) = 2;



CREATE TABLE march_jobs AS
    SELECT *
    FROM
        job_postings_fact
    WHERE 
        EXTRACT(month FROM job_posted_date) = 3;


SELECT *
FROM feb_jobs


-- LAZY WAY
-- use sql  query assistant to creat other months by giving the one we created
