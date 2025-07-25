/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts,
   offering insights into employment options and location flexibility.
*/

SELECT
    job_title_short,
    job_location,
    salary_year_avg,
    company_dim.name AS company_namez,
    job_schedule_type
FROM
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_work_from_home = TRUE AND 
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst'
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
