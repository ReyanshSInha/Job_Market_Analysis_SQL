/*
Question: What are the top-paying data analyst jobs?

- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT 
    company_dim.name AS company_name,
    job_postings_fact.job_title AS role,
    job_postings_fact.salary_year_avg AS salary_per_anum,
    job_postings_fact.job_work_from_home AS remote_work
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE salary_year_avg IS NOT NULL AND job_postings_fact.job_title_short = 'Data Analyst' AND job_postings_fact.job_work_from_home = TRUE
ORDER BY job_postings_fact.salary_year_avg DESC
LIMIT 10;