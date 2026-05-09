\*\*Schema (MySQL v5.7)\*\*



&#x20;   -- Create Department table

&#x20;   CREATE TABLE Department (

&#x20;       department\_id INT PRIMARY KEY,

&#x20;       name VARCHAR(50) NOT NULL

&#x20;   );

&#x20;   

&#x20;   -- Create Employee table

&#x20;   CREATE TABLE Employee (

&#x20;       emp\_id INT PRIMARY KEY,

&#x20;       name VARCHAR(100) NOT NULL,

&#x20;       age INT,

&#x20;       salary DECIMAL(10, 2),

&#x20;       department\_id INT,

&#x20;       hire\_date DATE,

&#x20;       FOREIGN KEY (department\_id) REFERENCES Department(department\_id)

&#x20;   );

&#x20;   

&#x20;   -- Create Project table

&#x20;   CREATE TABLE Project (

&#x20;       project\_id INT PRIMARY KEY,

&#x20;       name VARCHAR(100) NOT NULL,

&#x20;       department\_id INT,

&#x20;       FOREIGN KEY (department\_id) REFERENCES Department(department\_id)

&#x20;   );

&#x20;   

&#x20;   -- Insert data into Department table

&#x20;   INSERT INTO Department (department\_id, name) VALUES

&#x20;   (1, 'IT'),

&#x20;   (2, 'HR'),

&#x20;   (3, 'Finance'),

&#x20;   (4, 'Marketing');

&#x20;   

&#x20;   -- Insert data into Employee table

&#x20;   INSERT INTO Employee (emp\_id, name, age, salary, department\_id, hire\_date) VALUES

&#x20;   (1, 'John Doe', 28, 50000.00, 1, '2020-01-15'),

&#x20;   (2, 'Jane Smith', 34, 60000.00, 2, '2019-07-23'),

&#x20;   (3, 'Bob Brown', 45, 80000.00, 1, '2018-02-12'),

&#x20;   (4, 'Alice Blue', 25, 45000.00, 3, '2021-03-22'),

&#x20;   (5, 'Charlie P.', 29, 50000.00, 2, '2019-12-01'),

&#x20;   (6, 'David Green', 38, 70000.00, 4, '2022-05-18'),

&#x20;   (7, 'Eve Black', 40, 55000.00, 3, '2021-08-30');

&#x20;   

&#x20;   -- Insert data into Project table

&#x20;   INSERT INTO Project (project\_id, name, department\_id) VALUES

&#x20;   (1, 'Project Alpha', 1),

&#x20;   (2, 'Project Beta', 2),

&#x20;   (3, 'Project Gamma', 1),

&#x20;   (4, 'Project Delta', 3),

&#x20;   (5, 'Project Epsilon', 4),

&#x20;   (6, 'Project Zeta', 4),

&#x20;   (7, 'Project Eta', 3);

&#x20;   

&#x20;   

&#x20;   -- Insert additional data into Department table (if needed)

&#x20;   -- No additional departments needed for this data set

&#x20;   

&#x20;   -- Insert additional data into Employee table to test edge cases for joins and nested queries

&#x20;   INSERT INTO Employee (emp\_id, name, age, salary, department\_id, hire\_date) VALUES

&#x20;   (8, 'Frank White', 32, 48000.00, NULL, '2021-07-10'),  -- Employee without a department

&#x20;   (9, 'Grace Kelly', 27, 65000.00, 1, '2018-11-13'),

&#x20;   (10, 'Hannah Lee', 30, 53000.00, 4, '2020-02-25');

&#x20;   

&#x20;   -- Insert additional data into Project table to test edge cases for joins

&#x20;   INSERT INTO Project (project\_id, name, department\_id) VALUES

&#x20;   (8, 'Project Theta', 1),

&#x20;   (9, 'Project Iota', NULL);  -- Project without a department



\---



\*\*Query #1\*\*



&#x20;   SELECT \* FROM Employee;



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |

| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |

| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |



\---

\*\*Query #2\*\*



&#x20;   SELECT name, salary FROM Employee;



| name        | salary  |

| ----------- | ------- |

| John Doe    | 50000.0 |

| Jane Smith  | 60000.0 |

| Bob Brown   | 80000.0 |

| Alice Blue  | 45000.0 |

| Charlie P.  | 50000.0 |

| David Green | 70000.0 |

| Eve Black   | 55000.0 |

| Frank White | 48000.0 |

| Grace Kelly | 65000.0 |

| Hannah Lee  | 53000.0 |



\---

\*\*Query #3\*\*



&#x20;   SELECT \* FROM Employee WHERE age > 30;



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |



\---

\*\*Query #4\*\*



&#x20;   SELECT name FROM Department;



| name      |

| --------- |

| IT        |

| HR        |

| Finance   |

| Marketing |



\---

\*\*Query #5\*\*



&#x20;   SELECT \* FROM Employee WHERE department\_id = (SELECT department\_id FROM Department WHERE name = 'IT');



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |



\---

\*\*Query #6\*\*



&#x20;   SELECT \* FROM Employee WHERE name LIKE 'j%';



| emp\_id | name       | age | salary  | department\_id | hire\_date  |

| ------ | ---------- | --- | ------- | ------------- | ---------- |

| 1      | John Doe   | 28  | 50000.0 | 1             | 2020-01-15 |

| 2      | Jane Smith | 34  | 60000.0 | 2             | 2019-07-23 |



\---

\*\*Query #7\*\*



&#x20;   SELECT \* FROM Employee WHERE name LIKE '%e';



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |

| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |

| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |



\---

\*\*Query #8\*\*



&#x20;   SELECT \* FROM Employee WHERE name LIKE '%a%';



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |

| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |

| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |



\---

\*\*Query #9\*\*



&#x20;   SELECT \* FROM Employee WHERE CHAR\_LENGTH(name) = 9;



| emp\_id | name      | age | salary  | department\_id | hire\_date  |

| ------ | --------- | --- | ------- | ------------- | ---------- |

| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |

| 7      | Eve Black | 40  | 55000.0 | 3             | 2021-08-30 |



\---

\*\*Query #10\*\*



&#x20;   SELECT \* FROM Employee WHERE name LIKE '\_o%';



| emp\_id | name      | age | salary  | department\_id | hire\_date  |

| ------ | --------- | --- | ------- | ------------- | ---------- |

| 1      | John Doe  | 28  | 50000.0 | 1             | 2020-01-15 |

| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |



\---

\*\*Query #11\*\*



&#x20;   SELECT \* FROM Employee WHERE hire\_date BETWEEN '2020-01-01' AND '2020-12-31';



| emp\_id | name       | age | salary  | department\_id | hire\_date  |

| ------ | ---------- | --- | ------- | ------------- | ---------- |

| 1      | John Doe   | 28  | 50000.0 | 1             | 2020-01-15 |

| 10     | Hannah Lee | 30  | 53000.0 | 4             | 2020-02-25 |



\---

\*\*Query #12\*\*



&#x20;   SELECT \* FROM Employee WHERE MONTH(hire\_date) = 1;



| emp\_id | name     | age | salary  | department\_id | hire\_date  |

| ------ | -------- | --- | ------- | ------------- | ---------- |

| 1      | John Doe | 28  | 50000.0 | 1             | 2020-01-15 |



\---

\*\*Query #13\*\*



&#x20;   SELECT \* FROM Employee WHERE hire\_date < '2019-01-01';



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |



\---

\*\*Query #14\*\*



&#x20;   SELECT \* FROM Employee WHERE hire\_date = '2021-03-01';



There are no results to be displayed.



\---

\*\*Query #15\*\*



&#x20;   SELECT \* FROM Employee WHERE hire\_date >= DATE\_SUB(CURDATE(), INTERVAL 2 YEAR);



There are no results to be displayed.



\---

\*\*Query #16\*\*



&#x20;   SELECT SUM(salary) AS Total\_Salary FROM Employee;



| Total\_Salary |

| ------------ |

| 576000.0     |



\---

\*\*Query #17\*\*



&#x20;   SELECT AVG(salary) AS Average\_Salary FROM Employee;



| Average\_Salary |

| -------------- |

| 57600.0        |



\---

\*\*Query #18\*\*



&#x20;   SELECT MIN(salary) AS Minimum\_Salary FROM Employee;



| Minimum\_Salary |

| -------------- |

| 45000.0        |



\---

\*\*Query #19\*\*



&#x20;   SELECT department\_id, COUNT(\*) AS number\_of\_employees FROM Employee GROUP BY department\_id;



| department\_id | number\_of\_employees |

| ------------- | ------------------- |

|               | 1                   |

| 1             | 3                   |

| 2             | 2                   |

| 3             | 2                   |

| 4             | 2                   |



\---

\*\*Query #20\*\*



&#x20;   SELECT department\_id, AVG(salary) AS average\_salary FROM Employee GROUP BY department\_id;



| department\_id | average\_salary |

| ------------- | -------------- |

|               | 48000.0        |

| 1             | 65000.0        |

| 2             | 55000.0        |

| 3             | 50000.0        |

| 4             | 61500.0        |



\---

\*\*Query #21\*\*



&#x20;   SELECT department\_id, SUM(salary) AS total\_salary FROM Employee GROUP BY department\_id;



| department\_id | total\_salary |

| ------------- | ------------ |

|               | 48000.0      |

| 1             | 195000.0     |

| 2             | 110000.0     |

| 3             | 100000.0     |

| 4             | 123000.0     |



\---

\*\*Query #22\*\*



&#x20;   SELECT department\_id, AVG(age) AS average\_age FROM Employee GROUP BY department\_id;



| department\_id | average\_age |

| ------------- | ----------- |

|               | 32.0        |

| 1             | 33.3333     |

| 2             | 31.5        |

| 3             | 32.5        |

| 4             | 34.0        |



\---

\*\*Query #23\*\*



&#x20;   SELECT YEAR(hire\_date) AS year, COUNT(\*) AS total FROM Employee GROUP BY YEAR(hire\_date);



| year | total |

| ---- | ----- |

| 2018 | 2     |

| 2019 | 2     |

| 2020 | 2     |

| 2021 | 3     |

| 2022 | 1     |



\---

\*\*Query #24\*\*



&#x20;   SELECT department\_id, MAX(salary) AS highest\_salary FROM Employee GROUP BY department\_id;



| department\_id | highest\_salary |

| ------------- | -------------- |

|               | 48000.0        |

| 1             | 80000.0        |

| 2             | 60000.0        |

| 3             | 55000.0        |

| 4             | 70000.0        |



\---

\*\*Query #25\*\*



&#x20;   SELECT department\_id FROM Employee GROUP BY department\_id ORDER BY AVG(salary) DESC LIMIT 1;



| department\_id |

| ------------- |

| 1             |



\---

\*\*Query #26\*\*



&#x20;   SELECT department\_id FROM Employee GROUP BY department\_id HAVING COUNT(\*) > 2;



| department\_id |

| ------------- |

| 1             |



\---

\*\*Query #27\*\*



&#x20;   SELECT department\_id FROM Employee GROUP BY department\_id HAVING AVG(salary) > 55000;



| department\_id |

| ------------- |

| 1             |

| 4             |



\---

\*\*Query #28\*\*



&#x20;   SELECT department\_id FROM Employee GROUP BY department\_id HAVING SUM(salary) < 100000;



| department\_id |

| ------------- |

|               |



\---

\*\*Query #29\*\*



&#x20;   SELECT department\_id FROM Employee GROUP BY department\_id HAVING MAX(salary) > 75000;



| department\_id |

| ------------- |

| 1             |



\---

\*\*Query #30\*\*



&#x20;   SELECT \* FROM Employee ORDER BY salary ASC;



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |

| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |

| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |

| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |

| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |



\---

\*\*Query #31\*\*



&#x20;   SELECT \* FROM Employee ORDER BY age DESC;



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |

| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |

| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |

| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |



\---

\*\*Query #32\*\*



&#x20;   SELECT \* FROM Employee ORDER BY hire\_date ASC;



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |

| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |

| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |

| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |

| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |



\---

\*\*Query #33\*\*



&#x20;   SELECT \* FROM Employee ORDER BY department\_id, salary;



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |

| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |

| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |

| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |

| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |



\---

\*\*Query #34\*\*



&#x20;   SELECT department\_id, SUM(salary) AS total\_salary FROM Employee GROUP BY department\_id ORDER BY total\_salary;



| department\_id | total\_salary |

| ------------- | ------------ |

|               | 48000.0      |

| 3             | 100000.0     |

| 2             | 110000.0     |

| 4             | 123000.0     |

| 1             | 195000.0     |



\---

\*\*Query #35\*\*



&#x20;   SELECT e.name, d.name AS department FROM Employee e JOIN Department d ON e.department\_id = d.department\_id;



| name        | department |

| ----------- | ---------- |

| John Doe    | IT         |

| Bob Brown   | IT         |

| Grace Kelly | IT         |

| Jane Smith  | HR         |

| Charlie P.  | HR         |

| Alice Blue  | Finance    |

| Eve Black   | Finance    |

| David Green | Marketing  |

| Hannah Lee  | Marketing  |



\---

\*\*Query #36\*\*



&#x20;   SELECT p.name, d.name AS department FROM Project p JOIN Department d ON p.department\_id = d.department\_id;



| name            | department |

| --------------- | ---------- |

| Project Alpha   | IT         |

| Project Gamma   | IT         |

| Project Theta   | IT         |

| Project Beta    | HR         |

| Project Delta   | Finance    |

| Project Eta     | Finance    |

| Project Epsilon | Marketing  |

| Project Zeta    | Marketing  |



\---

\*\*Query #37\*\*



&#x20;   SELECT e.name AS employee, p.name AS project FROM Employee e JOIN Project p ON e.department\_id = p.department\_id;



| employee    | project         |

| ----------- | --------------- |

| John Doe    | Project Alpha   |

| Bob Brown   | Project Alpha   |

| Grace Kelly | Project Alpha   |

| Jane Smith  | Project Beta    |

| Charlie P.  | Project Beta    |

| John Doe    | Project Gamma   |

| Bob Brown   | Project Gamma   |

| Grace Kelly | Project Gamma   |

| Alice Blue  | Project Delta   |

| Eve Black   | Project Delta   |

| David Green | Project Epsilon |

| Hannah Lee  | Project Epsilon |

| David Green | Project Zeta    |

| Hannah Lee  | Project Zeta    |

| Alice Blue  | Project Eta     |

| Eve Black   | Project Eta     |

| John Doe    | Project Theta   |

| Bob Brown   | Project Theta   |

| Grace Kelly | Project Theta   |



\---

\*\*Query #38\*\*



&#x20;   SELECT e.name, d.name AS department FROM Employee e LEFT JOIN Department d ON e.department\_id = d.department\_id;



| name        | department |

| ----------- | ---------- |

| John Doe    | IT         |

| Bob Brown   | IT         |

| Grace Kelly | IT         |

| Jane Smith  | HR         |

| Charlie P.  | HR         |

| Alice Blue  | Finance    |

| Eve Black   | Finance    |

| David Green | Marketing  |

| Hannah Lee  | Marketing  |

| Frank White |            |



\---

\*\*Query #39\*\*



&#x20;   SELECT d.name AS department, e.name AS employee FROM Department d LEFT JOIN Employee e ON d.department\_id = e.department\_id;



| department | employee    |

| ---------- | ----------- |

| IT         | John Doe    |

| IT         | Bob Brown   |

| IT         | Grace Kelly |

| HR         | Jane Smith  |

| HR         | Charlie P.  |

| Finance    | Alice Blue  |

| Finance    | Eve Black   |

| Marketing  | David Green |

| Marketing  | Hannah Lee  |



\---

\*\*Query #40\*\*



&#x20;   SELECT e.\* FROM Employee e WHERE e.department\_id NOT IN (SELECT DISTINCT department\_id FROM Project WHERE department\_id IS NOT NULL) OR e.department\_id IS NULL;



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |



\---

\*\*Query #41\*\*



&#x20;   SELECT e.name, COUNT(p.project\_id) AS project\_count FROM Employee e LEFT JOIN Project p ON e.department\_id = p.department\_id GROUP BY e.emp\_id, e.name;



| name        | project\_count |

| ----------- | ------------- |

| John Doe    | 3             |

| Jane Smith  | 1             |

| Bob Brown   | 3             |

| Alice Blue  | 2             |

| Charlie P.  | 1             |

| David Green | 2             |

| Eve Black   | 2             |

| Frank White | 0             |

| Grace Kelly | 3             |

| Hannah Lee  | 2             |



\---

\*\*Query #42\*\*



&#x20;   SELECT d.\* FROM Department d LEFT JOIN Employee e ON d.department\_id = e.department\_id WHERE e.emp\_id IS NULL;



There are no results to be displayed.



\---

\*\*Query #43\*\*



&#x20;   SELECT \* FROM Employee WHERE department\_id IN (SELECT department\_id FROM Employee WHERE name = 'John Doe');



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |



\---

\*\*Query #44\*\*



&#x20;   SELECT d.name FROM Department d JOIN Employee e ON d.department\_id = e.department\_id GROUP BY d.department\_id, d.name ORDER BY AVG(e.salary) DESC LIMIT 1;



| name |

| ---- |

| IT   |



\---

\*\*Query #45\*\*



&#x20;   SELECT \* FROM Employee WHERE salary = (SELECT MAX(salary) FROM Employee);



| emp\_id | name      | age | salary  | department\_id | hire\_date  |

| ------ | --------- | --- | ------- | ------------- | ---------- |

| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |



\---

\*\*Query #46\*\*



&#x20;   SELECT \* FROM Employee WHERE salary > (SELECT AVG(salary) FROM Employee);



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |



\---

\*\*Query #47\*\*



&#x20;   SELECT MAX(salary) FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee);



| MAX(salary) |

| ----------- |

| 70000.0     |



\---

\*\*Query #48\*\*



&#x20;   SELECT department\_id FROM Employee GROUP BY department\_id ORDER BY COUNT(\*) DESC LIMIT 1;



| department\_id |

| ------------- |

| 1             |



\---

\*\*Query #49\*\*



&#x20;   SELECT \* FROM Employee e WHERE salary > (SELECT AVG(salary) FROM Employee WHERE department\_id = e.department\_id);



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |



\---

\*\*Query #50\*\*



&#x20;   SELECT salary FROM (SELECT DISTINCT salary FROM Employee ORDER BY salary DESC) AS temp LIMIT 1 OFFSET 2;



| salary  |

| ------- |

| 65000.0 |



\---

\*\*Query #51\*\*



&#x20;   SELECT \* FROM Employee WHERE age > ALL (SELECT age FROM Employee WHERE department\_id = (SELECT department\_id FROM Department WHERE name = 'HR') AND age IS NOT NULL);



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |



\---

\*\*Query #52\*\*



&#x20;   SELECT department\_id FROM Employee GROUP BY department\_id HAVING AVG(salary) > 55000;



| department\_id |

| ------------- |

| 1             |

| 4             |



\---

\*\*Query #53\*\*



&#x20;   SELECT \* FROM Employee WHERE department\_id IN (SELECT department\_id FROM Project WHERE department\_id IS NOT NULL GROUP BY department\_id HAVING COUNT(\*) >= 2);



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |



\---

\*\*Query #54\*\*



&#x20;   SELECT \* FROM Employee WHERE hire\_date = (SELECT hire\_date FROM Employee WHERE name = 'Jane Smith');



| emp\_id | name       | age | salary  | department\_id | hire\_date  |

| ------ | ---------- | --- | ------- | ------------- | ---------- |

| 2      | Jane Smith | 34  | 60000.0 | 2             | 2019-07-23 |



\---

\*\*Query #55\*\*



&#x20;   SELECT SUM(salary) FROM Employee WHERE YEAR(hire\_date) = 2020;



| SUM(salary) |

| ----------- |

| 103000.0    |



\---

\*\*Query #56\*\*



&#x20;   SELECT department\_id, AVG(salary) AS avg\_salary FROM Employee GROUP BY department\_id ORDER BY avg\_salary DESC;



| department\_id | avg\_salary |

| ------------- | ---------- |

| 1             | 65000.0    |

| 4             | 61500.0    |

| 2             | 55000.0    |

| 3             | 50000.0    |

|               | 48000.0    |



\---

\*\*Query #57\*\*



&#x20;   SELECT department\_id FROM Employee GROUP BY department\_id HAVING COUNT(\*) > 1 AND AVG(salary) > 55000;



| department\_id |

| ------------- |

| 1             |

| 4             |



\---

\*\*Query #58\*\*



&#x20;   SELECT \* FROM Employee WHERE hire\_date >= DATE\_SUB(CURDATE(), INTERVAL 2 YEAR) ORDER BY hire\_date;



There are no results to be displayed.



\---

\*\*Query #59\*\*



&#x20;   SELECT department\_id, COUNT(\*) AS total\_employees, AVG(salary) AS avg\_salary FROM Employee GROUP BY department\_id HAVING COUNT(\*) > 2;



| department\_id | total\_employees | avg\_salary |

| ------------- | --------------- | ---------- |

| 1             | 3               | 65000.0    |



\---

\*\*Query #60\*\*



&#x20;   SELECT name, salary FROM Employee e WHERE salary > (SELECT AVG(salary) FROM Employee WHERE department\_id = e.department\_id);



| name        | salary  |

| ----------- | ------- |

| Jane Smith  | 60000.0 |

| Bob Brown   | 80000.0 |

| David Green | 70000.0 |

| Eve Black   | 55000.0 |



\---

\*\*Query #61\*\*



&#x20;   SELECT name FROM Employee WHERE hire\_date = (SELECT hire\_date FROM Employee WHERE age = (SELECT MAX(age) FROM Employee));



| name      |

| --------- |

| Bob Brown |



\---

\*\*Query #62\*\*



&#x20;   SELECT d.name, COUNT(p.project\_id) AS total\_projects FROM Department d LEFT JOIN Project p ON d.department\_id = p.department\_id GROUP BY d.department\_id, d.name ORDER BY total\_projects DESC;



| name      | total\_projects |

| --------- | -------------- |

| IT        | 3              |

| Finance   | 2              |

| Marketing | 2              |

| HR        | 1              |



\---

\*\*Query #63\*\*



&#x20;   SELECT \* FROM Employee e WHERE salary = (SELECT MAX(salary) FROM Employee WHERE department\_id = e.department\_id) AND department\_id IS NOT NULL;



| emp\_id | name        | age | salary  | department\_id | hire\_date  |

| ------ | ----------- | --- | ------- | ------------- | ---------- |

| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |

| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |



\---

\*\*Query #64\*\*



&#x20;   SELECT name, salary FROM Employee e WHERE age > (SELECT AVG(age) FROM Employee WHERE department\_id = e.department\_id);



| name        | salary  |

| ----------- | ------- |

| Jane Smith  | 60000.0 |

| Bob Brown   | 80000.0 |

| David Green | 70000.0 |

| Eve Black   | 55000.0 |



\---



\[View on DB Fiddle](https://www.db-fiddle.com/)

