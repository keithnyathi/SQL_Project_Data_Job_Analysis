/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analysts
- Focus on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve 
*/

SELECT 
    skills,
    ROUND (AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
   --  AND job_work_from_home = TRUE
GROUP BY
  skills
ORDER BY
    average_salary DESC
LIMIT 25


/*
1. 🚨 Outlier Skill: “svn” at $400K
This is way above everything else.
Likely reflects:
A very niche role, or
Low sample size skewing the average

👉 Insight: Don’t chase this blindly—it’s not representative of the market.

2. 💰 Blockchain & Niche Tech Pay Premium
Solidity ($179K) stands out strongly
Indicates demand for blockchain / Web3 skills

👉 Insight: Emerging tech = fewer experts = higher pay

3. ☁️ Cloud & Infrastructure Skills Are Big Money

Skills like:

Terraform
VMware
Kafka
Cassandra
Airflow

👉 These are data engineering / infrastructure tools, not traditional analyst tools.

Trend:

The more you move toward data engineering, the higher the pay.

4. 🤖 AI / Machine Learning Skills Are Highly Valued
PyTorch, TensorFlow, Keras, MXNet, Hugging Face
DataRobot (AutoML)

👉 Insight:
Even for “analyst” roles, companies are paying more for AI-capable analysts

5. 🧠 Programming & Advanced Analytics Still Matter
Golang, Scala, Perl, dplyr

👉 Especially:

dplyr → strong R ecosystem usage
Scala → big data (Spark)
6. ⚙️ DevOps & Workflow Tools Show Up
GitLab, Bitbucket, Atlassian, Puppet, Ansible

👉 Insight:
High-paying analysts are expected to:

Work in production environments
Collaborate like engineers
📉 Important Pattern

There’s a clear shift:

Traditional Analyst	High-Paying Analyst
Excel, SQL, Tableau	AI, Cloud, Engineering tools
Reporting	Systems + Pipelines + ML
Business focus	Technical + Business hybrid

👉 The market is rewarding “Data Analyst + Engineer + AI” hybrids
*/