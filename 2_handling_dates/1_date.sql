SELECT 
    job_posted_date::DATE AS date
FROM
    job_postings_fact
LIMIT 5