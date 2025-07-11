SELECT 
    EXTRACT(month FROM job_posted_date)  AS month
FROM
    job_postings_fact
LIMIT 5



-- let's see count of data analyst jobs posted by month

SELECT 
    COUNT(job_id),
    EXTRACT(month FROM job_posted_date)  AS month
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    month 