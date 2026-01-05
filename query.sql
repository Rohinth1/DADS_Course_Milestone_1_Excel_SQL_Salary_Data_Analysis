use world;
select count(*) from salaryanalysis;
select * from salaryanalysis;

select avg(`Annual Salary in USD`) as avg_salary, Industry, Gender
from salaryanalysis
group by Industry, Gender;

SELECT 
    SUM(`Annual Salary in USD`) AS Total_salary,
    SUM(`Additional Monetary Compensation in USD`) AS Total_bonus,
    SUM(`Annual Salary in USD` + `Additional Monetary Compensation in USD`) AS Total_compensation,
    `Job Title`
FROM salaryanalysis
GROUP BY `Job Title`;

select sum(`Annual Salary in USD`), min(`Annual Salary in USD`), max(`Annual Salary in USD`), `Highest Level of Education Completed`
from salaryanalysis
group by `Highest Level of Education Completed`;

select count(*) as Total_employee_count, Industry, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`
from salaryanalysis
group by Industry, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`;

select max(`Annual Salary in USD`) as max_salary, `Job Title`, `Country`
from  salaryanalysis
group by `Job Title`, `Country`;

SELECT Country, `Job Title`, high_avg_salary
FROM (
    SELECT Country, `Job Title`,
           AVG(`Annual Salary in USD`) AS high_avg_salary,
           RANK() OVER (PARTITION BY Country ORDER BY AVG(`Annual Salary in USD`) DESC) rnk
    FROM salaryanalysis
    GROUP BY Country, `Job Title`
) t
WHERE rnk = 1;

select avg(`Annual Salary in USD`) as avg_salary, City, Industry
from salaryanalysis
group by City, Industry;

SELECT 
    Gender,ROUND(100.0 * SUM(CASE WHEN `Additional Monetary Compensation in USD` > 0 THEN 1 ELSE 0 END) / COUNT(*),2) AS percentage_of_add_comp
FROM salaryanalysis
GROUP BY Gender;

SELECT 
    SUM(`Annual Salary in USD`) AS Total_salary,
    SUM(`Additional Monetary Compensation in USD`) AS Total_bonus,
    SUM(`Annual Salary in USD` + `Additional Monetary Compensation in USD`) AS Total_compensation,
    `Job Title`, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`

FROM salaryanalysis
GROUP BY `Job Title`, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`;

select avg(`Annual Salary in USD`) as avg_salary, Industry, Gender, `Highest Level of Education Completed`
FROM salaryanalysis
group by Industry, Gender, `Highest Level of Education Completed`;
