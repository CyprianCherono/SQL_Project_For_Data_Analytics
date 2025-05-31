/* Question: What skills are required for the top paying data analyst jobs?
-Use the top 10 highest_paid data analyst roles from the first query
-Add the specific skills required for this job
-Why? It provides a detailed look at which high paying jobs demand certain skills,
 helpig job seekers to understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS(
    SELECT

        job_id,
        job_title_short,
        salary_year_avg,
        name AS company_name

    FROM 
        job_postings_fact

    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

    WHERE

        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT Null

    ORDER BY salary_year_avg DESC

    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills

FROM top_paying_jobs

INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id

INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

ORDER BY salary_year_avg DESC

/* Here's a breakdown of the most in demand skills for data analysts in 2023 based on job postings;
SQL is leading with a bold countof 8
Python follows closely with a bold count of 7
Tableau is also highly sought after with a count of 6
Other skills like R, Panda, Snowflake and excel show varying degreesof demand.