CREATE OR REFRESH STREAMING TABLE lab_2_silver_db.employees_silver_lab4 -- You will have to modify this to create a streaming table in the pipeline
(
  CONSTRAINT check_country EXPECT (Country IN ('US','GR')),
  CONSTRAINT check_salary EXPECT (Salary > 0),
  CONSTRAINT check_null_id EXPECT (EmployeeID IS NOT NULL) ON VIOLATION DROP ROW
)
AS
SELECT
    EmployeeID,
    FirstName,
    upper(Country) AS Country,
    Department,
    Salary,
    HireDate,
    date_format(HireDate, 'MMMM') AS HireMonthName,
    year(HireDate) AS HireYear, 
    Operation
FROM STREAM lab_1_bronze_db.employees_bronze_lab4;   