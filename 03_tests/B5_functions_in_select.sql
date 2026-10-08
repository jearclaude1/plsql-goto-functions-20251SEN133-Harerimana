-- B1: Annual Salary in SQL
SELECT employee_id,
       first_name,
       salary AS monthly_salary,
       annual_salary(salary) AS annual_salary
FROM employees
WHERE employee_id IN (100, 101, 200);

-- B2: Years of Service in SQL
SELECT employee_id,
       first_name,
       hire_date,
       years_of_service(hire_date) AS years_of_service
FROM employees
WHERE employee_id IN (100, 101, 200);

-- B3: Tax Calculator in SQL
SELECT employee_id,
       first_name,
       salary * 13 AS annual_salary,
       calculate_tax(salary * 13) AS annual_tax
FROM employees
WHERE employee_id IN (100, 101, 200);

-- B4: Department Name in SQL
SELECT e.employee_id,
       e.first_name,
       e.department_id,
       dept_name(e.department_id) AS department_name
FROM employees e
WHERE e.employee_id IN (100, 101, 200);