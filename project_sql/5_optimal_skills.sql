/*
Question: What are the most optimal skills to learn (aka it's in high demand and a high paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrate on remote positions with specified salaries
- Why? Targets skills that offer job security(High demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
*/

WITH skills_demand AS(
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
    skills_dim.skill_id

    
    ), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND (AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    --  AND job_work_from_home = TRUE
    GROUP BY
    skills_job_dim.skill_id
  
     
)  


SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE 
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
    
LIMIT 25;

/*
1. The Foundational Powerhouses (High Demand, Standard Salary)
These skills are the "entry tickets" to the industry. They appear in the bottom-right of our scatter plot.

SQL (398 postings): By far the most demanded skill, but it has the lowest average salary ($96.4k) in this specific "optimal" group. This is because SQL is a base requirement for almost all roles, from entry-level to senior.

Python (236 postings) & Tableau (230 postings): These are the next most critical tools. Python commands a slightly higher "premium" ($101.5k) than Tableau ($97.9k).

2. The Specialized "Sweet Spot" (Moderate Demand, High Salary)
If you are looking to maximize your ROI (Return on Investment) for learning time, these skills offer a high salary with decent job availability:

Snowflake ($111.5k): A standout performer. It has higher demand than other niche tools (37 postings) and sits near the top for salary.

Looker ($103.8k): With 49 postings, it is the most in-demand "high-paying" visualization tool, outperforming Tableau and Power BI in terms of average salary.

Cloud Platforms (AWS & Azure): Both sit comfortably above the $105k mark with consistent demand (32–34 postings).

3. The Niche High-Payers (Low Demand, Maximum Salary)
These skills are found in the top-left of the analysis. They represent specialized technical niches like Big Data and Project Management:

Confluence ($114.1k): Surprisingly leads the list, likely reflecting senior analyst or "Lead" roles that require documentation and project management expertise.

Spark ($113k) & Hadoop ($110.8k): These "Big Data" skills command a high premium because the talent pool is smaller and the technical barrier to entry is higher.
*/
