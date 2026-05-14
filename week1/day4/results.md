\*\*Schema (MySQL v5.7)\*\*



&#x20;   

&#x20;   -- =====================================================

&#x20;   -- COLLEGE MANAGEMENT SYSTEM (CMS)

&#x20;   -- COMPLETE PRACTICE DATABASE

&#x20;   -- =====================================================

&#x20;   

&#x20;   DROP TABLE IF EXISTS Mark;

&#x20;   DROP TABLE IF EXISTS Subject;

&#x20;   DROP TABLE IF EXISTS Student;

&#x20;   DROP TABLE IF EXISTS Staff;

&#x20;   DROP TABLE IF EXISTS Department;

&#x20;   

&#x20;   CREATE TABLE Department (

&#x20;       department\_id INT PRIMARY KEY,

&#x20;       department\_name VARCHAR(50),

&#x20;       department\_block\_number INT,

&#x20;       yearly\_budget DECIMAL(12,2)

&#x20;   );

&#x20;   

&#x20;   CREATE TABLE Staff (

&#x20;       staff\_id INT PRIMARY KEY,

&#x20;       staff\_name VARCHAR(50),

&#x20;       designation VARCHAR(30),

&#x20;       salary DECIMAL(10,2),

&#x20;       hire\_date DATE,

&#x20;       department\_id INT,

&#x20;       FOREIGN KEY (department\_id) REFERENCES Department(department\_id)

&#x20;   );

&#x20;   

&#x20;   CREATE TABLE Student (

&#x20;       student\_id INT PRIMARY KEY,

&#x20;       student\_name VARCHAR(50),

&#x20;       gender VARCHAR(10),

&#x20;       city VARCHAR(50),

&#x20;       admission\_year INT,

&#x20;       department\_id INT,

&#x20;       cgpa DECIMAL(3,2),

&#x20;       FOREIGN KEY (department\_id) REFERENCES Department(department\_id)

&#x20;   );

&#x20;   

&#x20;   CREATE TABLE Subject (

&#x20;       subject\_id INT PRIMARY KEY,

&#x20;       subject\_name VARCHAR(50),

&#x20;       subject\_code VARCHAR(20),

&#x20;       semester INT,

&#x20;       credits INT,

&#x20;       staff\_id INT,

&#x20;       FOREIGN KEY (staff\_id) REFERENCES Staff(staff\_id)

&#x20;   );

&#x20;   

&#x20;   CREATE TABLE Mark (

&#x20;       student\_id INT,

&#x20;       subject\_id INT,

&#x20;       exam\_type VARCHAR(20),

&#x20;       marks INT,

&#x20;       exam\_date DATE,

&#x20;       PRIMARY KEY(student\_id, subject\_id, exam\_type),

&#x20;       FOREIGN KEY (student\_id) REFERENCES Student(student\_id),

&#x20;       FOREIGN KEY (subject\_id) REFERENCES Subject(subject\_id)

&#x20;   );

&#x20;   

&#x20;   -- =====================================================

&#x20;   -- INSERT DEPARTMENTS

&#x20;   -- =====================================================

&#x20;   

&#x20;   INSERT INTO Department VALUES

&#x20;   (1,'Computer Science',101,800000),

&#x20;   (2,'Mechanical',102,600000),

&#x20;   (3,'Electronics',103,550000),

&#x20;   (4,'Civil',104,450000),

&#x20;   (5,'Mathematics',105,300000),

&#x20;   (6,NULL,106,200000),

&#x20;   (7,'Biotechnology',NULL,NULL);

&#x20;   

&#x20;   -- =====================================================

&#x20;   -- INSERT STAFF

&#x20;   -- =====================================================

&#x20;   

&#x20;   INSERT INTO Staff VALUES

&#x20;   (1,'Alice Johnson','Professor',95000,'2015-06-12',1),

&#x20;   (2,'Bob Smith','Associate Professor',82000,'2017-09-01',1),

&#x20;   (3,'Charlie Brown','Professor',91000,'2014-03-21',2),

&#x20;   (4,'David Lee','Lecturer',55000,'2020-07-15',2),

&#x20;   (5,'Eva Green','Professor',99000,'2013-11-05',3),

&#x20;   (6,'Frank Hall','Lecturer',NULL,'2021-01-12',3),

&#x20;   (7,'Grace Miller','HOD',120000,'2010-02-28',4),

&#x20;   (8,NULL,'Lecturer',50000,'2022-08-18',NULL),

&#x20;   (9,'Henry Ford','Assistant Professor',65000,NULL,5),

&#x20;   (10,'Ivy Clark','Professor',98000,'2012-04-17',NULL);

&#x20;   

&#x20;   -- =====================================================

&#x20;   -- INSERT STUDENTS

&#x20;   -- =====================================================

&#x20;   

&#x20;   INSERT INTO Student VALUES

&#x20;   (101,'John Doe','Male','New York',2021,1,8.7),

&#x20;   (102,'Mary Jane','Female','Chicago',2020,1,9.1),

&#x20;   (103,'Steve Rogers','Male','Dallas',2022,2,7.5),

&#x20;   (104,'Natasha Romanoff','Female','Boston',2021,2,8.0),

&#x20;   (105,'Bruce Wayne','Male','Gotham',2019,3,9.5),

&#x20;   (106,'Clark Kent','Male','Metropolis',2020,3,6.9),

&#x20;   (107,'Diana Prince','Female','Washington',2022,4,8.4),

&#x20;   (108,'Peter Parker','Male','Queens',2021,4,NULL),

&#x20;   (109,'Tony Stark','Male','Malibu',2019,1,9.8),

&#x20;   (110,'Wanda Maximoff','Female','Chicago',2022,5,7.2),

&#x20;   (111,'Barry Allen','Male',NULL,2023,5,6.5),

&#x20;   (112,NULL,'Female','Seattle',2023,NULL,NULL),

&#x20;   (113,'Scott Lang','Male','San Francisco',2021,NULL,5.8),

&#x20;   (114,'Jean Grey','Female','New York',2020,6,8.8),

&#x20;   (115,'Logan Howlett','Male','Denver',2022,7,7.7);

&#x20;   

&#x20;   -- =====================================================

&#x20;   -- INSERT SUBJECTS

&#x20;   -- =====================================================

&#x20;   

&#x20;   INSERT INTO Subject VALUES

&#x20;   (201,'Database Systems','CS301',3,4,1),

&#x20;   (202,'Operating Systems','CS302',3,4,2),

&#x20;   (203,'Machine Design','ME201',4,3,3),

&#x20;   (204,'Thermodynamics','ME202',4,4,4),

&#x20;   (205,'Digital Electronics','EC301',5,4,5),

&#x20;   (206,'Signals and Systems','EC302',5,3,6),

&#x20;   (207,'Structural Engineering','CV401',6,4,7),

&#x20;   (208,'Linear Algebra','MA101',1,3,9),

&#x20;   (209,NULL,'GEN999',2,2,NULL),

&#x20;   (210,'Artificial Intelligence','CS401',6,5,1);

&#x20;   

&#x20;   -- =====================================================

&#x20;   -- INSERT MARKS

&#x20;   -- =====================================================

&#x20;   

&#x20;   INSERT INTO Mark VALUES

&#x20;   (101,201,'Mid',88,'2024-03-10'),

&#x20;   (101,201,'Final',91,'2024-05-10'),

&#x20;   (101,202,'Mid',75,'2024-03-11'),

&#x20;   (102,201,'Mid',95,'2024-03-10'),

&#x20;   (102,202,'Final',89,'2024-05-11'),

&#x20;   (103,203,'Mid',66,'2024-03-09'),

&#x20;   (103,204,'Final',72,'2024-05-12'),

&#x20;   (104,203,'Final',81,'2024-05-12'),

&#x20;   (105,205,'Mid',98,'2024-03-14'),

&#x20;   (105,206,'Final',94,'2024-05-14'),

&#x20;   (106,205,'Mid',54,'2024-03-14'),

&#x20;   (106,206,'Final',61,'2024-05-14'),

&#x20;   (107,207,'Mid',87,'2024-03-16'),

&#x20;   (108,207,'Final',NULL,'2024-05-16'),

&#x20;   (109,201,'Final',99,'2024-05-10'),

&#x20;   (109,210,'Mid',97,'2024-03-20'),

&#x20;   (110,208,'Mid',71,'2024-03-18'),

&#x20;   (111,208,'Final',65,'2024-05-18'),

&#x20;   (112,209,'Mid',NULL,'2024-03-21'),

&#x20;   (113,210,'Final',44,'2024-05-20'),

&#x20;   (114,208,'Mid',90,'2024-03-18'),

&#x20;   (115,209,'Final',73,'2024-05-22');

&#x20;   



\---



\*\*Query #1\*\*



&#x20;   SELECT s.student\_name,d.department\_name FROM Student s LEFT JOIN Department d ON s.department\_id=d.department\_id;



| student\_name     | department\_name  |

| ---------------- | ---------------- |

| John Doe         | Computer Science |

| Mary Jane        | Computer Science |

| Steve Rogers     | Mechanical       |

| Natasha Romanoff | Mechanical       |

| Bruce Wayne      | Electronics      |

| Clark Kent       | Electronics      |

| Diana Prince     | Civil            |

| Peter Parker     | Civil            |

| Tony Stark       | Computer Science |

| Wanda Maximoff   | Mathematics      |

| Barry Allen      | Mathematics      |

|                  |                  |

| Scott Lang       |                  |

| Jean Grey        |                  |

| Logan Howlett    | Biotechnology    |



\---

\*\*Query #2\*\*



&#x20;   SELECT s.staff\_name,d.department\_name FROM Staff s LEFT JOIN Department d ON s.department\_id=d.department\_id;



| staff\_name    | department\_name  |

| ------------- | ---------------- |

| Alice Johnson | Computer Science |

| Bob Smith     | Computer Science |

| Charlie Brown | Mechanical       |

| David Lee     | Mechanical       |

| Eva Green     | Electronics      |

| Frank Hall    | Electronics      |

| Grace Miller  | Civil            |

|               |                  |

| Henry Ford    | Mathematics      |

| Ivy Clark     |                  |



\---

\*\*Query #3\*\*



&#x20;   SELECT d.department\_name FROM Department d LEFT JOIN Student s ON d.department\_id=s.department\_id WHERE s.student\_id IS NULL;



There are no results to be displayed.



\---

\*\*Query #4\*\*



&#x20;   SELECT s.student\_name FROM Student s LEFT JOIN Mark m ON s.student\_id=m.student\_id WHERE m.student\_id IS NULL;



There are no results to be displayed.



\---

\*\*Query #5\*\*



&#x20;   SELECT subject\_name FROM Subject WHERE staff\_id IS NULL;



| subject\_name |

| ------------ |

|              |



\---

\*\*Query #6\*\*



&#x20;   SELECT d.department\_name,AVG(s.cgpa) FROM Student s JOIN Department d ON s.department\_id=d.department\_id GROUP BY d.department\_name;



| department\_name  | AVG(s.cgpa) |

| ---------------- | ----------- |

|                  | 8.8         |

| Biotechnology    | 7.7         |

| Civil            | 8.4         |

| Computer Science | 9.2         |

| Electronics      | 8.2         |

| Mathematics      | 6.85        |

| Mechanical       | 7.75        |



\---

\*\*Query #7\*\*



&#x20;   SELECT d.department\_name,AVG(s.cgpa) FROM Student s JOIN Department d ON s.department\_id=d.department\_id GROUP BY d.department\_name HAVING AVG(s.cgpa)>8;



| department\_name  | AVG(s.cgpa) |

| ---------------- | ----------- |

|                  | 8.8         |

| Civil            | 8.4         |

| Computer Science | 9.2         |

| Electronics      | 8.2         |



\---

\*\*Query #8\*\*



&#x20;   SELECT d.department\_name,COUNT(s.student\_id) FROM Department d LEFT JOIN Student s ON d.department\_id=s.department\_id GROUP BY d.department\_name;



| department\_name  | COUNT(s.student\_id) |

| ---------------- | ------------------- |

|                  | 1                   |

| Biotechnology    | 1                   |

| Civil            | 2                   |

| Computer Science | 3                   |

| Electronics      | 2                   |

| Mathematics      | 2                   |

| Mechanical       | 2                   |



\---

\*\*Query #9\*\*



&#x20;   SELECT sub.subject\_name,MAX(m.marks),MIN(m.marks) FROM Subject sub JOIN Mark m ON sub.subject\_id=m.subject\_id GROUP BY sub.subject\_name;



| subject\_name            | MAX(m.marks) | MIN(m.marks) |

| ----------------------- | ------------ | ------------ |

|                         | 73           | 73           |

| Artificial Intelligence | 97           | 44           |

| Database Systems        | 99           | 88           |

| Digital Electronics     | 98           | 54           |

| Linear Algebra          | 90           | 65           |

| Machine Design          | 81           | 66           |

| Operating Systems       | 89           | 75           |

| Signals and Systems     | 94           | 61           |

| Structural Engineering  | 87           | 87           |

| Thermodynamics          | 72           | 72           |



\---

\*\*Query #10\*\*



&#x20;   SELECT DISTINCT s.student\_name FROM Student s JOIN Mark m ON s.student\_id=m.student\_id WHERE m.marks>90;



| student\_name |

| ------------ |

| John Doe     |

| Mary Jane    |

| Bruce Wayne  |

| Tony Stark   |



\---

\*\*Query #11\*\*



&#x20;   SELECT s.student\_name FROM Student s JOIN Department d ON s.department\_id=d.department\_id WHERE d.department\_name='Computer Science';



| student\_name |

| ------------ |

| John Doe     |

| Mary Jane    |

| Tony Stark   |



\---

\*\*Query #12\*\*



&#x20;   SELECT st.staff\_name,COUNT(sub.subject\_id) FROM Staff st LEFT JOIN Subject sub ON st.staff\_id=sub.staff\_id GROUP BY st.staff\_name;



| staff\_name    | COUNT(sub.subject\_id) |

| ------------- | --------------------- |

|               | 0                     |

| Alice Johnson | 2                     |

| Bob Smith     | 1                     |

| Charlie Brown | 1                     |

| David Lee     | 1                     |

| Eva Green     | 1                     |

| Frank Hall    | 1                     |

| Grace Miller  | 1                     |

| Henry Ford    | 1                     |

| Ivy Clark     | 0                     |



\---

\*\*Query #13\*\*



&#x20;   SELECT s.student\_name,SUM(m.marks) FROM Student s LEFT JOIN Mark m ON s.student\_id=m.student\_id GROUP BY s.student\_name;



| student\_name     | SUM(m.marks) |

| ---------------- | ------------ |

|                  |              |

| Barry Allen      | 65           |

| Bruce Wayne      | 192          |

| Clark Kent       | 115          |

| Diana Prince     | 87           |

| Jean Grey        | 90           |

| John Doe         | 254          |

| Logan Howlett    | 73           |

| Mary Jane        | 184          |

| Natasha Romanoff | 81           |

| Peter Parker     |              |

| Scott Lang       | 44           |

| Steve Rogers     | 138          |

| Tony Stark       | 196          |

| Wanda Maximoff   | 71           |



\---

\*\*Query #14\*\*



&#x20;   SELECT d.department\_name,COUNT(st.staff\_id) FROM Department d JOIN Staff st ON d.department\_id=st.department\_id GROUP BY d.department\_name HAVING COUNT(st.staff\_id)>2;



There are no results to be displayed.



\---

\*\*Query #15\*\*



&#x20;   SELECT student\_name FROM Student WHERE cgpa>(SELECT AVG(cgpa) FROM Student);



| student\_name     |

| ---------------- |

| John Doe         |

| Mary Jane        |

| Natasha Romanoff |

| Bruce Wayne      |

| Diana Prince     |

| Tony Stark       |

| Jean Grey        |



\---

\*\*Query #16\*\*



&#x20;   SELECT staff\_name FROM Staff s WHERE salary>(SELECT AVG(salary) FROM Staff WHERE department\_id=s.department\_id);



| staff\_name    |

| ------------- |

| Alice Johnson |

| Charlie Brown |



\---

\*\*Query #17\*\*



&#x20;   SELECT DISTINCT salary FROM Staff ORDER BY salary DESC LIMIT 1,1;



| salary  |

| ------- |

| 99000.0 |



\---

\*\*Query #18\*\*



&#x20;   SELECT s.student\_name,sub.subject\_name,m.marks FROM Student s JOIN Mark m ON s.student\_id=m.student\_id JOIN Subject sub ON m.subject\_id=sub.subject\_id WHERE (m.subject\_id,m.marks) IN (SELECT subject\_id,MAX(marks) FROM Mark GROUP BY subject\_id);



| student\_name     | subject\_name            | marks |

| ---------------- | ----------------------- | ----- |

| Mary Jane        | Operating Systems       | 89    |

| Steve Rogers     | Thermodynamics          | 72    |

| Natasha Romanoff | Machine Design          | 81    |

| Bruce Wayne      | Digital Electronics     | 98    |

| Bruce Wayne      | Signals and Systems     | 94    |

| Diana Prince     | Structural Engineering  | 87    |

| Tony Stark       | Database Systems        | 99    |

| Tony Stark       | Artificial Intelligence | 97    |

| Jean Grey        | Linear Algebra          | 90    |

| Logan Howlett    |                         | 73    |



\---

\*\*Query #19\*\*



&#x20;   SELECT s.student\_name,m.marks FROM Student s LEFT JOIN Mark m ON s.student\_id=m.student\_id;



| student\_name     | marks |

| ---------------- | ----- |

| John Doe         | 91    |

| John Doe         | 88    |

| John Doe         | 75    |

| Mary Jane        | 95    |

| Mary Jane        | 89    |

| Steve Rogers     | 66    |

| Steve Rogers     | 72    |

| Natasha Romanoff | 81    |

| Bruce Wayne      | 98    |

| Bruce Wayne      | 94    |

| Clark Kent       | 54    |

| Clark Kent       | 61    |

| Diana Prince     | 87    |

| Peter Parker     |       |

| Tony Stark       | 99    |

| Tony Stark       | 97    |

| Wanda Maximoff   | 71    |

| Barry Allen      | 65    |

|                  |       |

| Scott Lang       | 44    |

| Jean Grey        | 90    |

| Logan Howlett    | 73    |



\---

\*\*Query #20\*\*



&#x20;   SELECT sub.subject\_name,AVG(m.marks) FROM Subject sub JOIN Mark m ON sub.subject\_id=m.subject\_id GROUP BY sub.subject\_name HAVING AVG(m.marks)<70;



There are no results to be displayed.



\---

\*\*Query #21\*\*



&#x20;   SELECT \* FROM Student ORDER BY cgpa DESC;



| student\_id | student\_name     | gender | city          | admission\_year | department\_id | cgpa |

| ---------- | ---------------- | ------ | ------------- | -------------- | ------------- | ---- |

| 109        | Tony Stark       | Male   | Malibu        | 2019           | 1             | 9.8  |

| 105        | Bruce Wayne      | Male   | Gotham        | 2019           | 3             | 9.5  |

| 102        | Mary Jane        | Female | Chicago       | 2020           | 1             | 9.1  |

| 114        | Jean Grey        | Female | New York      | 2020           | 6             | 8.8  |

| 101        | John Doe         | Male   | New York      | 2021           | 1             | 8.7  |

| 107        | Diana Prince     | Female | Washington    | 2022           | 4             | 8.4  |

| 104        | Natasha Romanoff | Female | Boston        | 2021           | 2             | 8.0  |

| 115        | Logan Howlett    | Male   | Denver        | 2022           | 7             | 7.7  |

| 103        | Steve Rogers     | Male   | Dallas        | 2022           | 2             | 7.5  |

| 110        | Wanda Maximoff   | Female | Chicago       | 2022           | 5             | 7.2  |

| 106        | Clark Kent       | Male   | Metropolis    | 2020           | 3             | 6.9  |

| 111        | Barry Allen      | Male   |               | 2023           | 5             | 6.5  |

| 113        | Scott Lang       | Male   | San Francisco | 2021           |               | 5.8  |

| 108        | Peter Parker     | Male   | Queens        | 2021           | 4             |      |

| 112        |                  | Female | Seattle       | 2023           |               |      |



\---

\*\*Query #22\*\*



&#x20;   SELECT d.department\_name,SUM(s.salary) FROM Department d JOIN Staff s ON d.department\_id=s.department\_id GROUP BY d.department\_name;



| department\_name  | SUM(s.salary) |

| ---------------- | ------------- |

| Civil            | 120000.0      |

| Computer Science | 177000.0      |

| Electronics      | 99000.0       |

| Mathematics      | 65000.0       |

| Mechanical       | 146000.0      |



\---

\*\*Query #23\*\*



&#x20;   SELECT d.department\_name,SUM(s.salary) FROM Department d JOIN Staff s ON d.department\_id=s.department\_id GROUP BY d.department\_name HAVING SUM(s.salary)>200000;



There are no results to be displayed.



\---

\*\*Query #24\*\*



&#x20;   SELECT student\_name FROM Student WHERE admission\_year>2021 AND cgpa>7.5;



| student\_name  |

| ------------- |

| Diana Prince  |

| Logan Howlett |



\---

\*\*Query #25\*\*



&#x20;   SELECT admission\_year,COUNT(\*) FROM Student GROUP BY admission\_year;



| admission\_year | COUNT(\*) |

| -------------- | -------- |

| 2019           | 2        |

| 2020           | 3        |

| 2021           | 4        |

| 2022           | 4        |

| 2023           | 2        |



\---

\*\*Query #26\*\*



&#x20;   SELECT city,COUNT(\*) FROM Student GROUP BY city ORDER BY COUNT(\*) DESC LIMIT 1;



| city    | COUNT(\*) |

| ------- | -------- |

| Chicago | 2        |



\---

\*\*Query #27\*\*



&#x20;   SELECT d.department\_name,COUNT(s.staff\_id) FROM Department d LEFT JOIN Staff s ON d.department\_id=s.department\_id GROUP BY d.department\_name;



| department\_name  | COUNT(s.staff\_id) |

| ---------------- | ----------------- |

|                  | 0                 |

| Biotechnology    | 0                 |

| Civil            | 1                 |

| Computer Science | 2                 |

| Electronics      | 2                 |

| Mathematics      | 1                 |

| Mechanical       | 2                 |



\---

\*\*Query #28\*\*



&#x20;   SELECT DISTINCT s.student\_name FROM Student s JOIN Mark m ON s.student\_id=m.student\_id WHERE m.marks<50;



| student\_name |

| ------------ |

| Scott Lang   |



\---

\*\*Query #29\*\*



&#x20;   SELECT staff\_name FROM Staff WHERE YEAR(hire\_date)<2018;



| staff\_name    |

| ------------- |

| Alice Johnson |

| Bob Smith     |

| Charlie Brown |

| Eva Green     |

| Grace Miller  |

| Ivy Clark     |



\---

\*\*Query #30\*\*



&#x20;   SELECT d.department\_name FROM Department d JOIN Staff s ON d.department\_id=s.department\_id GROUP BY d.department\_name HAVING COUNT(CASE WHEN s.salary IS NULL THEN 1 END)=0;



| department\_name  |

| ---------------- |

| Civil            |

| Computer Science |

| Mathematics      |

| Mechanical       |



\---

\*\*Query #31\*\*



&#x20;   SELECT student\_name,cgpa,@r:=@r+1 AS row\_num FROM Student,(SELECT @r:=0)x ORDER BY cgpa DESC;



| student\_name     | cgpa | row\_num |

| ---------------- | ---- | ------- |

| Tony Stark       | 9.8  | 1       |

| Bruce Wayne      | 9.5  | 2       |

| Mary Jane        | 9.1  | 3       |

| Jean Grey        | 8.8  | 4       |

| John Doe         | 8.7  | 5       |

| Diana Prince     | 8.4  | 6       |

| Natasha Romanoff | 8.0  | 7       |

| Logan Howlett    | 7.7  | 8       |

| Steve Rogers     | 7.5  | 9       |

| Wanda Maximoff   | 7.2  | 10      |

| Clark Kent       | 6.9  | 11      |

| Barry Allen      | 6.5  | 12      |

| Scott Lang       | 5.8  | 13      |

| Peter Parker     |      | 14      |

|                  |      | 15      |



\---

\*\*Query #32\*\*



&#x20;   SELECT student\_name,cgpa,@r:=@r+1 AS rank\_num FROM Student,(SELECT @r:=0)x ORDER BY cgpa DESC;



| student\_name     | cgpa | rank\_num |

| ---------------- | ---- | -------- |

| Tony Stark       | 9.8  | 1        |

| Bruce Wayne      | 9.5  | 2        |

| Mary Jane        | 9.1  | 3        |

| Jean Grey        | 8.8  | 4        |

| John Doe         | 8.7  | 5        |

| Diana Prince     | 8.4  | 6        |

| Natasha Romanoff | 8.0  | 7        |

| Logan Howlett    | 7.7  | 8        |

| Steve Rogers     | 7.5  | 9        |

| Wanda Maximoff   | 7.2  | 10       |

| Clark Kent       | 6.9  | 11       |

| Barry Allen      | 6.5  | 12       |

| Scott Lang       | 5.8  | 13       |

| Peter Parker     |      | 14       |

|                  |      | 15       |



\---

\*\*Query #33\*\*



&#x20;   SELECT staff\_name,salary,@r:=@r+1 AS salary\_rank FROM Staff,(SELECT @r:=0)x ORDER BY salary DESC;



| staff\_name    | salary   | salary\_rank |

| ------------- | -------- | ----------- |

| Grace Miller  | 120000.0 | 1           |

| Eva Green     | 99000.0  | 2           |

| Ivy Clark     | 98000.0  | 3           |

| Alice Johnson | 95000.0  | 4           |

| Charlie Brown | 91000.0  | 5           |

| Bob Smith     | 82000.0  | 6           |

| Henry Ford    | 65000.0  | 7           |

| David Lee     | 55000.0  | 8           |

|               | 50000.0  | 9           |

| Frank Hall    |          | 10          |



\---

\*\*Query #34\*\*



&#x20;   SELECT s.student\_name,SUM(m.marks) total\_marks FROM Student s JOIN Mark m ON s.student\_id=m.student\_id GROUP BY s.student\_id ORDER BY total\_marks DESC LIMIT 3;



| student\_name | total\_marks |

| ------------ | ----------- |

| John Doe     | 254         |

| Tony Stark   | 196         |

| Bruce Wayne  | 192         |



\---

\*\*Query #35\*\*



&#x20;   SELECT student\_id,exam\_date,marks FROM Mark ORDER BY student\_id,exam\_date;



| student\_id | exam\_date  | marks |

| ---------- | ---------- | ----- |

| 101        | 2024-03-10 | 88    |

| 101        | 2024-03-11 | 75    |

| 101        | 2024-05-10 | 91    |

| 102        | 2024-03-10 | 95    |

| 102        | 2024-05-11 | 89    |

| 103        | 2024-03-09 | 66    |

| 103        | 2024-05-12 | 72    |

| 104        | 2024-05-12 | 81    |

| 105        | 2024-03-14 | 98    |

| 105        | 2024-05-14 | 94    |

| 106        | 2024-03-14 | 54    |

| 106        | 2024-05-14 | 61    |

| 107        | 2024-03-16 | 87    |

| 108        | 2024-05-16 |       |

| 109        | 2024-03-20 | 97    |

| 109        | 2024-05-10 | 99    |

| 110        | 2024-03-18 | 71    |

| 111        | 2024-05-18 | 65    |

| 112        | 2024-03-21 |       |

| 113        | 2024-05-20 | 44    |

| 114        | 2024-03-18 | 90    |

| 115        | 2024-05-22 | 73    |



\---

\*\*Query #36\*\*



&#x20;   SELECT subject\_id,AVG(marks) avg\_marks FROM Mark GROUP BY subject\_id;



| subject\_id | avg\_marks |

| ---------- | --------- |

| 201        | 93.25     |

| 202        | 82.0      |

| 203        | 73.5      |

| 204        | 72.0      |

| 205        | 76.0      |

| 206        | 77.5      |

| 207        | 87.0      |

| 208        | 75.3333   |

| 209        | 73.0      |

| 210        | 70.5      |



\---

\*\*Query #37\*\*



&#x20;   SELECT \* FROM Mark ORDER BY student\_id,exam\_date;



| student\_id | subject\_id | exam\_type | marks | exam\_date  |

| ---------- | ---------- | --------- | ----- | ---------- |

| 101        | 201        | Mid       | 88    | 2024-03-10 |

| 101        | 202        | Mid       | 75    | 2024-03-11 |

| 101        | 201        | Final     | 91    | 2024-05-10 |

| 102        | 201        | Mid       | 95    | 2024-03-10 |

| 102        | 202        | Final     | 89    | 2024-05-11 |

| 103        | 203        | Mid       | 66    | 2024-03-09 |

| 103        | 204        | Final     | 72    | 2024-05-12 |

| 104        | 203        | Final     | 81    | 2024-05-12 |

| 105        | 205        | Mid       | 98    | 2024-03-14 |

| 105        | 206        | Final     | 94    | 2024-05-14 |

| 106        | 205        | Mid       | 54    | 2024-03-14 |

| 106        | 206        | Final     | 61    | 2024-05-14 |

| 107        | 207        | Mid       | 87    | 2024-03-16 |

| 108        | 207        | Final     |       | 2024-05-16 |

| 109        | 210        | Mid       | 97    | 2024-03-20 |

| 109        | 201        | Final     | 99    | 2024-05-10 |

| 110        | 208        | Mid       | 71    | 2024-03-18 |

| 111        | 208        | Final     | 65    | 2024-05-18 |

| 112        | 209        | Mid       |       | 2024-03-21 |

| 113        | 210        | Final     | 44    | 2024-05-20 |

| 114        | 208        | Mid       | 90    | 2024-03-18 |

| 115        | 209        | Final     | 73    | 2024-05-22 |



\---

\*\*Query #38\*\*



&#x20;   SELECT \* FROM Mark ORDER BY student\_id,exam\_date;



| student\_id | subject\_id | exam\_type | marks | exam\_date  |

| ---------- | ---------- | --------- | ----- | ---------- |

| 101        | 201        | Mid       | 88    | 2024-03-10 |

| 101        | 202        | Mid       | 75    | 2024-03-11 |

| 101        | 201        | Final     | 91    | 2024-05-10 |

| 102        | 201        | Mid       | 95    | 2024-03-10 |

| 102        | 202        | Final     | 89    | 2024-05-11 |

| 103        | 203        | Mid       | 66    | 2024-03-09 |

| 103        | 204        | Final     | 72    | 2024-05-12 |

| 104        | 203        | Final     | 81    | 2024-05-12 |

| 105        | 205        | Mid       | 98    | 2024-03-14 |

| 105        | 206        | Final     | 94    | 2024-05-14 |

| 106        | 205        | Mid       | 54    | 2024-03-14 |

| 106        | 206        | Final     | 61    | 2024-05-14 |

| 107        | 207        | Mid       | 87    | 2024-03-16 |

| 108        | 207        | Final     |       | 2024-05-16 |

| 109        | 210        | Mid       | 97    | 2024-03-20 |

| 109        | 201        | Final     | 99    | 2024-05-10 |

| 110        | 208        | Mid       | 71    | 2024-03-18 |

| 111        | 208        | Final     | 65    | 2024-05-18 |

| 112        | 209        | Mid       |       | 2024-03-21 |

| 113        | 210        | Final     | 44    | 2024-05-20 |

| 114        | 208        | Mid       | 90    | 2024-03-18 |

| 115        | 209        | Final     | 73    | 2024-05-22 |



\---

\*\*Query #39\*\*



&#x20;   SELECT subject\_id,MAX(marks) FROM Mark GROUP BY subject\_id;



| subject\_id | MAX(marks) |

| ---------- | ---------- |

| 201        | 99         |

| 202        | 89         |

| 203        | 81         |

| 204        | 72         |

| 205        | 98         |

| 206        | 94         |

| 207        | 87         |

| 208        | 90         |

| 209        | 73         |

| 210        | 97         |



\---

\*\*Query #40\*\*



&#x20;   SELECT exam\_date,AVG(marks) FROM Mark GROUP BY exam\_date;



| exam\_date  | AVG(marks) |

| ---------- | ---------- |

| 2024-03-09 | 66.0       |

| 2024-03-10 | 91.5       |

| 2024-03-11 | 75.0       |

| 2024-03-14 | 76.0       |

| 2024-03-16 | 87.0       |

| 2024-03-18 | 80.5       |

| 2024-03-20 | 97.0       |

| 2024-03-21 |            |

| 2024-05-10 | 95.0       |

| 2024-05-11 | 89.0       |

| 2024-05-12 | 76.5       |

| 2024-05-14 | 77.5       |

| 2024-05-16 |            |

| 2024-05-18 | 65.0       |

| 2024-05-20 | 44.0       |

| 2024-05-22 | 73.0       |



\---

\*\*Query #41\*\*



&#x20;   SELECT s.\* FROM Student s WHERE admission\_year=(SELECT MIN(admission\_year) FROM Student s2 WHERE s2.department\_id=s.department\_id);



| student\_id | student\_name     | gender | city     | admission\_year | department\_id | cgpa |

| ---------- | ---------------- | ------ | -------- | -------------- | ------------- | ---- |

| 104        | Natasha Romanoff | Female | Boston   | 2021           | 2             | 8.0  |

| 105        | Bruce Wayne      | Male   | Gotham   | 2019           | 3             | 9.5  |

| 108        | Peter Parker     | Male   | Queens   | 2021           | 4             |      |

| 109        | Tony Stark       | Male   | Malibu   | 2019           | 1             | 9.8  |

| 110        | Wanda Maximoff   | Female | Chicago  | 2022           | 5             | 7.2  |

| 114        | Jean Grey        | Female | New York | 2020           | 6             | 8.8  |

| 115        | Logan Howlett    | Male   | Denver   | 2022           | 7             | 7.7  |



\---

\*\*Query #42\*\*



&#x20;   SELECT s.\* FROM Staff s WHERE hire\_date=(SELECT MAX(hire\_date) FROM Staff s2 WHERE s2.department\_id=s.department\_id);



| staff\_id | staff\_name   | designation         | salary   | hire\_date  | department\_id |

| -------- | ------------ | ------------------- | -------- | ---------- | ------------- |

| 2        | Bob Smith    | Associate Professor | 82000.0  | 2017-09-01 | 1             |

| 4        | David Lee    | Lecturer            | 55000.0  | 2020-07-15 | 2             |

| 6        | Frank Hall   | Lecturer            |          | 2021-01-12 | 3             |

| 7        | Grace Miller | HOD                 | 120000.0 | 2010-02-28 | 4             |



\---

\*\*Query #43\*\*



&#x20;   SELECT \* FROM Student ORDER BY cgpa DESC;



| student\_id | student\_name     | gender | city          | admission\_year | department\_id | cgpa |

| ---------- | ---------------- | ------ | ------------- | -------------- | ------------- | ---- |

| 109        | Tony Stark       | Male   | Malibu        | 2019           | 1             | 9.8  |

| 105        | Bruce Wayne      | Male   | Gotham        | 2019           | 3             | 9.5  |

| 102        | Mary Jane        | Female | Chicago       | 2020           | 1             | 9.1  |

| 114        | Jean Grey        | Female | New York      | 2020           | 6             | 8.8  |

| 101        | John Doe         | Male   | New York      | 2021           | 1             | 8.7  |

| 107        | Diana Prince     | Female | Washington    | 2022           | 4             | 8.4  |

| 104        | Natasha Romanoff | Female | Boston        | 2021           | 2             | 8.0  |

| 115        | Logan Howlett    | Male   | Denver        | 2022           | 7             | 7.7  |

| 103        | Steve Rogers     | Male   | Dallas        | 2022           | 2             | 7.5  |

| 110        | Wanda Maximoff   | Female | Chicago       | 2022           | 5             | 7.2  |

| 106        | Clark Kent       | Male   | Metropolis    | 2020           | 3             | 6.9  |

| 111        | Barry Allen      | Male   |               | 2023           | 5             | 6.5  |

| 113        | Scott Lang       | Male   | San Francisco | 2021           |               | 5.8  |

| 108        | Peter Parker     | Male   | Queens        | 2021           | 4             |      |

| 112        |                  | Female | Seattle       | 2023           |               |      |



\---

\*\*Query #44\*\*



&#x20;   SELECT \* FROM Student ORDER BY cgpa DESC;



| student\_id | student\_name     | gender | city          | admission\_year | department\_id | cgpa |

| ---------- | ---------------- | ------ | ------------- | -------------- | ------------- | ---- |

| 109        | Tony Stark       | Male   | Malibu        | 2019           | 1             | 9.8  |

| 105        | Bruce Wayne      | Male   | Gotham        | 2019           | 3             | 9.5  |

| 102        | Mary Jane        | Female | Chicago       | 2020           | 1             | 9.1  |

| 114        | Jean Grey        | Female | New York      | 2020           | 6             | 8.8  |

| 101        | John Doe         | Male   | New York      | 2021           | 1             | 8.7  |

| 107        | Diana Prince     | Female | Washington    | 2022           | 4             | 8.4  |

| 104        | Natasha Romanoff | Female | Boston        | 2021           | 2             | 8.0  |

| 115        | Logan Howlett    | Male   | Denver        | 2022           | 7             | 7.7  |

| 103        | Steve Rogers     | Male   | Dallas        | 2022           | 2             | 7.5  |

| 110        | Wanda Maximoff   | Female | Chicago       | 2022           | 5             | 7.2  |

| 106        | Clark Kent       | Male   | Metropolis    | 2020           | 3             | 6.9  |

| 111        | Barry Allen      | Male   |               | 2023           | 5             | 6.5  |

| 113        | Scott Lang       | Male   | San Francisco | 2021           |               | 5.8  |

| 108        | Peter Parker     | Male   | Queens        | 2021           | 4             |      |

| 112        |                  | Female | Seattle       | 2023           |               |      |



\---

\*\*Query #45\*\*



&#x20;   SELECT \* FROM Staff ORDER BY salary DESC;



| staff\_id | staff\_name    | designation         | salary   | hire\_date  | department\_id |

| -------- | ------------- | ------------------- | -------- | ---------- | ------------- |

| 7        | Grace Miller  | HOD                 | 120000.0 | 2010-02-28 | 4             |

| 5        | Eva Green     | Professor           | 99000.0  | 2013-11-05 | 3             |

| 10       | Ivy Clark     | Professor           | 98000.0  | 2012-04-17 |               |

| 1        | Alice Johnson | Professor           | 95000.0  | 2015-06-12 | 1             |

| 3        | Charlie Brown | Professor           | 91000.0  | 2014-03-21 | 2             |

| 2        | Bob Smith     | Associate Professor | 82000.0  | 2017-09-01 | 1             |

| 9        | Henry Ford    | Assistant Professor | 65000.0  |            | 5             |

| 4        | David Lee     | Lecturer            | 55000.0  | 2020-07-15 | 2             |

| 8        |               | Lecturer            | 50000.0  | 2022-08-18 |               |

| 6        | Frank Hall    | Lecturer            |          | 2021-01-12 | 3             |



\---

\*\*Query #46\*\*



&#x20;   SELECT \* FROM Mark m WHERE m.marks>(SELECT AVG(m2.marks) FROM Mark m2 WHERE m2.subject\_id=m.subject\_id);



| student\_id | subject\_id | exam\_type | marks | exam\_date  |

| ---------- | ---------- | --------- | ----- | ---------- |

| 102        | 201        | Mid       | 95    | 2024-03-10 |

| 102        | 202        | Final     | 89    | 2024-05-11 |

| 104        | 203        | Final     | 81    | 2024-05-12 |

| 105        | 205        | Mid       | 98    | 2024-03-14 |

| 105        | 206        | Final     | 94    | 2024-05-14 |

| 109        | 201        | Final     | 99    | 2024-05-10 |

| 109        | 210        | Mid       | 97    | 2024-03-20 |

| 114        | 208        | Mid       | 90    | 2024-03-18 |



\---

\*\*Query #47\*\*



&#x20;   SELECT department\_id,AVG(salary) FROM Staff GROUP BY department\_id HAVING AVG(salary)>(SELECT AVG(salary) FROM Staff);



| department\_id | AVG(salary) |

| ------------- | ----------- |

| 1             | 88500.0     |

| 3             | 99000.0     |

| 4             | 120000.0    |



\---

\*\*Query #48\*\*



&#x20;   SELECT DISTINCT s.student\_name FROM Student s JOIN Mark m ON s.student\_id=m.student\_id;



| student\_name     |

| ---------------- |

| John Doe         |

| Mary Jane        |

| Tony Stark       |

| Steve Rogers     |

| Natasha Romanoff |

| Bruce Wayne      |

| Clark Kent       |

| Diana Prince     |

| Peter Parker     |

| Wanda Maximoff   |

| Barry Allen      |

| Jean Grey        |

|                  |

| Logan Howlett    |

| Scott Lang       |



\---

\*\*Query #49\*\*



&#x20;   SELECT DISTINCT marks FROM Mark ORDER BY marks DESC LIMIT 2,1;



| marks |

| ----- |

| 97    |



\---

\*\*Query #50\*\*



&#x20;   SELECT s.student\_name,d.department\_name,sub.subject\_name,m.exam\_type,m.marks FROM Student s JOIN Department d ON s.department\_id=d.department\_id JOIN Mark m ON s.student\_id=m.student\_id JOIN Subject sub ON m.subject\_id=sub.subject\_id;



| student\_name     | department\_name  | subject\_name            | exam\_type | marks |

| ---------------- | ---------------- | ----------------------- | --------- | ----- |

| John Doe         | Computer Science | Database Systems        | Final     | 91    |

| John Doe         | Computer Science | Database Systems        | Mid       | 88    |

| John Doe         | Computer Science | Operating Systems       | Mid       | 75    |

| Mary Jane        | Computer Science | Database Systems        | Mid       | 95    |

| Mary Jane        | Computer Science | Operating Systems       | Final     | 89    |

| Steve Rogers     | Mechanical       | Machine Design          | Mid       | 66    |

| Steve Rogers     | Mechanical       | Thermodynamics          | Final     | 72    |

| Natasha Romanoff | Mechanical       | Machine Design          | Final     | 81    |

| Bruce Wayne      | Electronics      | Digital Electronics     | Mid       | 98    |

| Bruce Wayne      | Electronics      | Signals and Systems     | Final     | 94    |

| Clark Kent       | Electronics      | Digital Electronics     | Mid       | 54    |

| Clark Kent       | Electronics      | Signals and Systems     | Final     | 61    |

| Diana Prince     | Civil            | Structural Engineering  | Mid       | 87    |

| Peter Parker     | Civil            | Structural Engineering  | Final     |       |

| Tony Stark       | Computer Science | Database Systems        | Final     | 99    |

| Tony Stark       | Computer Science | Artificial Intelligence | Mid       | 97    |

| Wanda Maximoff   | Mathematics      | Linear Algebra          | Mid       | 71    |

| Barry Allen      | Mathematics      | Linear Algebra          | Final     | 65    |

| Jean Grey        |                  | Linear Algebra          | Mid       | 90    |

| Logan Howlett    | Biotechnology    |                         | Final     | 73    |



\---



\[View on DB Fiddle](https://www.db-fiddle.com/)

