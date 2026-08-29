
/*
Question: Which companies offer the highest average salaries for Data Engineers?

- Identify the top 10 companies based on their average annual salary for Data Engineer positions.
- Calculate the average salary and number of Data Engineer job postings for each company.
- Focus only on positions with specified annual salaries.
- Include only companies with at least 5 Data Engineer job postings to avoid results being distorted by companies with very few listings.
*/

select 
    cd.name as company_name,
    round(avg(jpf.salary_year_avg), 2) as avg_salary,
    count(*) as job_count
from job_postings_fact as jpf
inner join company_dim as cd on jpf.company_id = cd.company_id
where jpf.job_title_short = 'Data Engineer' and jpf.salary_year_avg is not null
group by cd.name
having job_count >=5
order by avg_salary desc
limit 10;


/*
┌────────────────────┬────────────┬───────────┐
│    company_name    │ avg_salary │ job_count │
│      varchar       │   double   │   int64   │
├────────────────────┼────────────┼───────────┤
│ Netflix            │   430600.0 │        25 │
│ Durlston Partners  │   367500.0 │         6 │
│ Eleven Recruiting  │   350000.0 │        19 │
│ Edge & Node        │   264000.0 │         6 │
│ Snowflake          │  220781.25 │         6 │
│ Selby Jennings     │  219807.69 │        13 │
│ Hinge              │   219100.0 │         5 │
│ Signify Technology │  205714.29 │         7 │
│ Babylist           │   204698.4 │         5 │
│ Ripple             │  203206.25 │         8 │
└────────────────────┴────────────┴───────────┘
*/