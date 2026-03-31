# Introduction
In this project, i dive into the job market, mainly focusing on data analyst roles.
This project explores 💰 top-paying jobs, 🔥 in-demand skills, and where 📈 high demand meets high salary in data analytics.

🕵️SQL queries? Check them out here: [project_sql](/project_sql/)

# Background
The project idea comes from a desire, as an upcoming data analyst, to be able to 🛣️navigate through the data science job market more effectively, to be able to pinpoint high-paying jobs and job skills related to data analysis that are the most demanded by employers.

The project itself can also serve as a ⚒️tool for other fellow 📊data science nerds who want to know which skills,jobs they should focus on.

The data is sourced from my mentor/teacher's Youtube SQL course [Luke Barousse's SQL Course](https://lukebarousse.com/sql)

### The questions that are answered by my queries are
1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysis?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools used
During this SQL data exploration and analysis, I used the following tools:

- **SQL**: This is the most essential and fundamental tool and language that i used to query the database , to get insights and trends from the data 
- **PostgreSQL**: This is the database management system chosen to set-up and manage the database, ideal for handling the job posting data used in the analysis.
- **Visual Studio Code**: The tol used for database mnagement, executing queries.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
# Analysis
Each query in this project is aimed at ilooking into specific aspects of the data analyst job market. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying oppotunities in the field.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    company_dim.name AS company_name,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```

Here's the breakdown of the top paying data analyst jobs in 2023:
- **Wide Salary Range** Top paying data analyst roles span from $184,000 to $650,000, indicating that ther is a significant salary potential in the field of data analysis
- **Diverse Employers** Companies like SMartAsset, Meta and AT&T are among the companies offering high salaries, showing a broad interest across different industries.
- **Job Title Variety** There's a lot of diversity in job titles related to data analysis, from simply Data Analyst to Director of Analytics, indicating varied roles and specializations.

![Top paying Roles](assets/1_top_paying_data_roles.png) 
*Bar Graph visualizing the salary for the top 10 salaries for data analysts; ChatGPT generated this graph from the SQL query results*
# What I learned
- **Basic to Complex Query Crafting** I went from zero to hero in the query crafting department, learning the basics of queries(`SELECT,FROM,WHERE`) all the way up to the the complex `CTE, SUBQUERY,UNION` combo

- **Data Agregation** I became familiar with utilizing `GROUP BY, HAVNG` as well as aggregate functions such as `COUNT() AVG() MAX() MIN()`

- **Analytical Prowess** Through querying, asking questions and investigating the dataset , i was able to level up and improve my data analysis skills.
# Coclusions

### Insights 
1. **Top-paying Data Analyst Jobs**
2. **Skills for Top-Paying Jobs**
3. **Most In-demand Skills**
4. **Skills with Higher Salaries**
5. **Optimal Skills for Job Market Value**
