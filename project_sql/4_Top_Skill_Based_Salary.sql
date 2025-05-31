/* Question; What are the top skills based on salary?
-Look at the average salary associated with each skills for data analyst roles
-focus on roles with specified salary regardless of location
-Why? It reveals how different skills impact salary level for data analyst, 
-and help identify the most financially rewarding skill to acquire and improve.
*/



SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS average_salary

FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id

INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT Null 
      -- AND job_work_from_home = True

GROUP BY skills

ORDER BY average_salary DESC

LIMIT 25;