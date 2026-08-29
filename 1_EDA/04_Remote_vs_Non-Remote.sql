

/*
Question: How does remote work affect salary for Data Engineers?

- Compare remote and non-remote Data Engineer positions based on their average annual salary.
- Calculate the total number of jobs and average salary for each work arrangement.
- Focus only on Data Engineer positions with specified annual salaries.

*/


select 
    CASE 
        when job_work_from_home = True then 'Remote'
        else 'Non-Remote'
    end as remote_status,
    count(*) as job_count,
    round(avg(salary_year_avg), 2) as avg_salary
from job_postings_fact as jpf
where job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
group by
     remote_status;
/*
┌───────────────┬───────────┬────────────┐
│ remote_status │ job_count │ avg_salary │
│    varchar    │   int64   │   double   │
├───────────────┼───────────┼────────────┤
│ Non-Remote    │      8975 │  134255.33 │
│ Remote        │      1576 │  138351.09 │
└───────────────┴───────────┴────────────┘

*/