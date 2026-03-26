/*
Question: What are the top paying data analyst jobs?
- Identify the top 10 highest paying Data Analyst jobs that are available remotely.
- Focus on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying oportunities for Data Analysts, offering insights into employment 
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date