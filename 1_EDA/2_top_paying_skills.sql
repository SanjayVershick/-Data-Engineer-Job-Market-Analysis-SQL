/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/

select 
    sd.skills,
    round(Median(jpf.salary_year_avg ),0)as median_salary,
    count(jpf.*) as skill_count
from job_postings_fact as jpf 
   inner join skills_job_dim as sjd on jpf.job_id = sjd.job_id
   inner join skills_dim as sd on sjd.skill_id = sd.skill_id
where jpf.job_title_short = 'Data Engineer' and jpf.job_work_from_home = TRUE 
group by sd.skills
having count(jpf.*) >= 100 /* for demand */
order by median_salary desc 
limit 25;


/*
┌────────────┬───────────────┬─────────────┐
│   skills   │ median_salary │ skill_count │
│  varchar   │    double     │    int64    │
├────────────┼───────────────┼─────────────┤
│ rust       │      210000.0 │         232 │
│ terraform  │      184000.0 │        3248 │
│ golang     │      184000.0 │         912 │
│ spring     │      175500.0 │         364 │
│ neo4j      │      170000.0 │         277 │
│ gdpr       │      169616.0 │         582 │
│ zoom       │      168438.0 │         127 │
│ graphql    │      167500.0 │         445 │
│ mongo      │      162250.0 │         265 │
│ fastapi    │      157500.0 │         204 │
│ bitbucket  │      155000.0 │         478 │
│ django     │      155000.0 │         265 │
│ crystal    │      154224.0 │         129 │
│ atlassian  │      151500.0 │         249 │
│ c          │      151500.0 │         444 │
│ typescript │      151000.0 │         388 │
│ kubernetes │      150500.0 │        4202 │
│ node       │      150000.0 │         179 │
│ ruby       │      150000.0 │         736 │
│ airflow    │      150000.0 │        9996 │
│ css        │      150000.0 │         262 │
│ redis      │      149000.0 │         605 │
│ vmware     │      148798.0 │         136 │
│ ansible    │      148798.0 │         475 │
│ jupyter    │      147500.0 │         400 │
└────────────┴───────────────┴─────────────┘
*/