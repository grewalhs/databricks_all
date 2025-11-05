CREATE OR REPLACE MATERIALIZED VIEW lab_3_gold_db.employees_by_country_gold_lab4 -- You will have to modify this to create a materialized view in the pipeline
AS
SELECT 
    Country,
    count(*) AS TotalEmployees,
    sum(Salary) AS TotalSalary
FROM lab_2_silver_db.employees_silver_lab4
GROUP BY Country;


CREATE OR REPLACE MATERIALIZED VIEW lab_3_gold_db.salary_by_department_gold_lab4  -- You will have to modify this to create a materialized view in the pipeline
AS
SELECT
    Department,
    sum(Salary) AS TotalSalary
FROM lab_2_silver_db.employees_silver_lab4
GROUP BY Department;