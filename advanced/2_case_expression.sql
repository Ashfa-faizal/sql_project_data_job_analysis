-- very common where if we want to create a column based on a condition
-- it's very similar to the if statement in programming languages
-- it can be used in SELECT/WHERE/GROUP BY 
-- it's going with logical order

/* LET'S look a condion to reclassify where  job located at */
/* anywhere job as remote
    new york as local 
    otherwise onsite
*/

SELECT 
    job_title_short,
    job_location,
    CASE
        WHEN job_location='Anywhere' THEN 'Remote'
        WHEN job_location='New York' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact;

    

/* 
 let's analyse how many jobs i can apply to above category
 */


SELECT 
    COUNT(job_id) AS job_count,
    CASE
        WHEN job_location='Anywhere' THEN 'Remote'
        WHEN job_location='New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst '
GROUP BY
    location_category