SELECT 
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date 
FROM
    job_postings_fact
LIMIT 5