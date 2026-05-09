SELECT * FROM Employee;
SELECT name, salary FROM Employee;
SELECT * FROM Employee WHERE age > 30;
SELECT name FROM Department;
SELECT * FROM Employee WHERE department_id = (SELECT department_id FROM Department WHERE name = 'IT');
SELECT * FROM Employee WHERE name LIKE 'j%';
SELECT * FROM Employee WHERE name LIKE '%e';
SELECT * FROM Employee WHERE name LIKE '%a%';
SELECT * FROM Employee WHERE CHAR_LENGTH(name) = 9;
SELECT * FROM Employee WHERE name LIKE '_o%';
SELECT * FROM Employee WHERE hire_date BETWEEN '2020-01-01' AND '2020-12-31';
SELECT * FROM Employee WHERE MONTH(hire_date) = 1;
SELECT * FROM Employee WHERE hire_date < '2019-01-01';
SELECT * FROM Employee WHERE hire_date = '2021-03-01';
SELECT * FROM Employee WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

SELECT SUM(salary) AS Total_Salary FROM Employee;
SELECT AVG(salary) AS Average_Salary FROM Employee;
SELECT MIN(salary) AS Minimum_Salary FROM Employee;

SELECT department_id, COUNT(*) AS number_of_employees FROM Employee GROUP BY department_id;
SELECT department_id, AVG(salary) AS average_salary FROM Employee GROUP BY department_id;
SELECT department_id, SUM(salary) AS total_salary FROM Employee GROUP BY department_id;
SELECT department_id, AVG(age) AS average_age FROM Employee GROUP BY department_id;

SELECT YEAR(hire_date) AS year, COUNT(*) AS total FROM Employee GROUP BY YEAR(hire_date);

SELECT department_id, MAX(salary) AS highest_salary FROM Employee GROUP BY department_id;

SELECT department_id FROM Employee GROUP BY department_id ORDER BY AVG(salary) DESC LIMIT 1;

SELECT department_id FROM Employee GROUP BY department_id HAVING COUNT(*) > 2;

SELECT department_id FROM Employee GROUP BY department_id HAVING AVG(salary) > 55000;

SELECT department_id FROM Employee GROUP BY department_id HAVING SUM(salary) < 100000;

SELECT department_id FROM Employee GROUP BY department_id HAVING MAX(salary) > 75000;

SELECT * FROM Employee ORDER BY salary ASC;
SELECT * FROM Employee ORDER BY age DESC;
SELECT * FROM Employee ORDER BY hire_date ASC;
SELECT * FROM Employee ORDER BY department_id, salary;

SELECT department_id, SUM(salary) AS total_salary FROM Employee GROUP BY department_id ORDER BY total_salary;

SELECT e.name, d.name AS department FROM Employee e JOIN Department d ON e.department_id = d.department_id;

SELECT p.name, d.name AS department FROM Project p JOIN Department d ON p.department_id = d.department_id;

SELECT e.name AS employee, p.name AS project FROM Employee e JOIN Project p ON e.department_id = p.department_id;

SELECT e.name, d.name AS department FROM Employee e LEFT JOIN Department d ON e.department_id = d.department_id;

SELECT d.name AS department, e.name AS employee FROM Department d LEFT JOIN Employee e ON d.department_id = e.department_id;

SELECT e.* FROM Employee e WHERE e.department_id NOT IN (SELECT DISTINCT department_id FROM Project WHERE department_id IS NOT NULL) OR e.department_id IS NULL;

SELECT e.name, COUNT(p.project_id) AS project_count FROM Employee e LEFT JOIN Project p ON e.department_id = p.department_id GROUP BY e.emp_id, e.name;

SELECT d.* FROM Department d LEFT JOIN Employee e ON d.department_id = e.department_id WHERE e.emp_id IS NULL;

SELECT * FROM Employee WHERE department_id IN (SELECT department_id FROM Employee WHERE name = 'John Doe');

SELECT d.name FROM Department d JOIN Employee e ON d.department_id = e.department_id GROUP BY d.department_id, d.name ORDER BY AVG(e.salary) DESC LIMIT 1;

SELECT * FROM Employee WHERE salary = (SELECT MAX(salary) FROM Employee);

SELECT * FROM Employee WHERE salary > (SELECT AVG(salary) FROM Employee);

SELECT MAX(salary) FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee);

SELECT department_id FROM Employee GROUP BY department_id ORDER BY COUNT(*) DESC LIMIT 1;

SELECT * FROM Employee e WHERE salary > (SELECT AVG(salary) FROM Employee WHERE department_id = e.department_id);

SELECT salary FROM (SELECT DISTINCT salary FROM Employee ORDER BY salary DESC) AS temp LIMIT 1 OFFSET 2;

SELECT * FROM Employee WHERE age > ALL (SELECT age FROM Employee WHERE department_id = (SELECT department_id FROM Department WHERE name = 'HR') AND age IS NOT NULL);

SELECT department_id FROM Employee GROUP BY department_id HAVING AVG(salary) > 55000;

SELECT * FROM Employee WHERE department_id IN (SELECT department_id FROM Project WHERE department_id IS NOT NULL GROUP BY department_id HAVING COUNT(*) >= 2);

SELECT * FROM Employee WHERE hire_date = (SELECT hire_date FROM Employee WHERE name = 'Jane Smith');

SELECT SUM(salary) FROM Employee WHERE YEAR(hire_date) = 2020;

SELECT department_id, AVG(salary) AS avg_salary FROM Employee GROUP BY department_id ORDER BY avg_salary DESC;

SELECT department_id FROM Employee GROUP BY department_id HAVING COUNT(*) > 1 AND AVG(salary) > 55000;

SELECT * FROM Employee WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR) ORDER BY hire_date;

SELECT department_id, COUNT(*) AS total_employees, AVG(salary) AS avg_salary FROM Employee GROUP BY department_id HAVING COUNT(*) > 2;

SELECT name, salary FROM Employee e WHERE salary > (SELECT AVG(salary) FROM Employee WHERE department_id = e.department_id);

SELECT name FROM Employee WHERE hire_date = (SELECT hire_date FROM Employee WHERE age = (SELECT MAX(age) FROM Employee));

SELECT d.name, COUNT(p.project_id) AS total_projects FROM Department d LEFT JOIN Project p ON d.department_id = p.department_id GROUP BY d.department_id, d.name ORDER BY total_projects DESC;

SELECT * FROM Employee e WHERE salary = (SELECT MAX(salary) FROM Employee WHERE department_id = e.department_id) AND department_id IS NOT NULL;

SELECT name, salary FROM Employee e WHERE age > (SELECT AVG(age) FROM Employee WHERE department_id = e.department_id);