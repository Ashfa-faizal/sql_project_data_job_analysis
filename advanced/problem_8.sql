/*
find job postings from the first quarter that have a salary greater than 70k
- Combine job posting tables from the first quarter of 2023 (Jan-Mar)
- Gets job postings with an average yearly salary > $70,000 
- Filter for Data Analyst Jobs and order by salary
*/


SELECT 
    first_quarter_jobs.job_title_short,
    first_quarter_jobs.salary_year_avg,
    first_quarter_jobs.job_location
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM feb_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS first_quarter_jobs
WHERE 
    first_quarter_jobs.salary_year_avg > 70000 AND 
    first_quarter_jobs.job_title_short = 'Data Analyst'
ORDER BY 
    first_quarter_jobs.salary_year_avg DESC;