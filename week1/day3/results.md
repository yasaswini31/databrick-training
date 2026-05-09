\*\*Schema (MySQL v5.7)\*\*



&#x20;   

&#x20;   -- SQL Joins Assignment Starter File

&#x20;   -- Compatible with PostgreSQL

&#x20;   

&#x20;   DROP TABLE IF EXISTS enrollments;

&#x20;   DROP TABLE IF EXISTS courses;

&#x20;   DROP TABLE IF EXISTS students;

&#x20;   DROP TABLE IF EXISTS instructors;

&#x20;   

&#x20;   CREATE TABLE instructors (

&#x20;       instructor\_id INT PRIMARY KEY,

&#x20;       instructor\_name VARCHAR(100),

&#x20;       department VARCHAR(100)

&#x20;   );

&#x20;   

&#x20;   CREATE TABLE students (

&#x20;       student\_id INT PRIMARY KEY,

&#x20;       student\_name VARCHAR(100),

&#x20;       email VARCHAR(100)

&#x20;   );

&#x20;   

&#x20;   CREATE TABLE courses (

&#x20;       course\_id INT PRIMARY KEY,

&#x20;       course\_name VARCHAR(100),

&#x20;       instructor\_id INT NULL,

&#x20;       FOREIGN KEY (instructor\_id) REFERENCES instructors(instructor\_id)

&#x20;   );

&#x20;   

&#x20;   CREATE TABLE enrollments (

&#x20;       enrollment\_id INT PRIMARY KEY,

&#x20;       student\_id INT,

&#x20;       course\_id INT,

&#x20;       enrollment\_date DATE,

&#x20;       FOREIGN KEY (student\_id) REFERENCES students(student\_id),

&#x20;       FOREIGN KEY (course\_id) REFERENCES courses(course\_id)

&#x20;   );

&#x20;   

&#x20;   -- Insert instructors

&#x20;   INSERT INTO instructors VALUES

&#x20;   (1, 'Sarah Connor', 'Databases'),

&#x20;   (2, 'Michael Scott', 'Programming'),

&#x20;   (3, 'Tony Stark', 'Cloud Computing'),

&#x20;   (4, 'Bruce Wayne', 'Cyber Security');

&#x20;   

&#x20;   -- Insert students

&#x20;   INSERT INTO students VALUES

&#x20;   (1, 'Alice Johnson', 'alice@email.com'),

&#x20;   (2, 'Bob Smith', 'bob@email.com'),

&#x20;   (3, 'Charlie Brown', 'charlie@email.com'),

&#x20;   (4, 'Diana Prince', 'diana@email.com'),

&#x20;   (5, 'Ethan Hunt', 'ethan@email.com'),

&#x20;   (6, 'Fiona Green', 'fiona@email.com');

&#x20;   

&#x20;   -- Insert courses

&#x20;   INSERT INTO courses VALUES

&#x20;   (101, 'SQL Basics', 1),

&#x20;   (102, 'Python Fundamentals', 2),

&#x20;   (103, 'Data Analytics', NULL),

&#x20;   (104, 'Cloud Computing', 3),

&#x20;   (105, 'Machine Learning', NULL),

&#x20;   (106, 'Cyber Security', 4);

&#x20;   

&#x20;   -- Insert enrollments

&#x20;   INSERT INTO enrollments VALUES

&#x20;   (1, 1, 101, '2024-01-10'),

&#x20;   (2, 1, 102, '2024-01-12'),

&#x20;   (3, 2, 101, '2024-01-15'),

&#x20;   (4, 3, 104, '2024-01-20'),

&#x20;   (5, 4, 106, '2024-01-25');

&#x20;   

&#x20;   -- Notes:

&#x20;   -- Student 5 and 6 are not enrolled in any course.

&#x20;   -- Courses 103 and 105 have no instructor assigned.

&#x20;   -- Courses 103 and 105 also have no enrollments.

&#x20;   -- Instructor 4 teaches one course.

&#x20;   



\---



\*\*Query #1\*\*



&#x20;   select s.student\_name,c.course\_name from students s left join enrollments e on s.student\_id = e.enrollment\_id left join courses c on c.course\_id = e.course\_id;



| student\_name  | course\_name         |

| ------------- | ------------------- |

| Alice Johnson | SQL Basics          |

| Bob Smith     | Python Fundamentals |

| Charlie Brown | SQL Basics          |

| Diana Prince  | Cloud Computing     |

| Ethan Hunt    | Cyber Security      |

| Fiona Green   |                     |



\---

\*\*Query #2\*\*



&#x20;   select c.course\_name from courses c left join enrollments e on c.course\_id = e.course\_id where e.course\_id IS NULL;



| course\_name      |

| ---------------- |

| Data Analytics   |

| Machine Learning |



\---

\*\*Query #3\*\*



&#x20;   select i.instructor\_id,i.instructor\_name,c.course\_name from instructors i left join courses c on i.instructor\_id = c.instructor\_id;



| instructor\_id | instructor\_name | course\_name         |

| ------------- | --------------- | ------------------- |

| 1             | Sarah Connor    | SQL Basics          |

| 2             | Michael Scott   | Python Fundamentals |

| 3             | Tony Stark      | Cloud Computing     |

| 4             | Bruce Wayne     | Cyber Security      |



\---

\*\*Query #4\*\*



&#x20;   select course\_name from courses where instructor\_id IS NULL;



| course\_name      |

| ---------------- |

| Data Analytics   |

| Machine Learning |



\---

\*\*Query #5\*\*



&#x20;   SELECT s.student\_id, s.student\_name, e.enrollment\_id, e.course\_id FROM enrollments e right join students s on e.student\_id = s.student\_id;



| student\_id | student\_name  | enrollment\_id | course\_id |

| ---------- | ------------- | ------------- | --------- |

| 1          | Alice Johnson | 1             | 101       |

| 1          | Alice Johnson | 2             | 102       |

| 2          | Bob Smith     | 3             | 101       |

| 3          | Charlie Brown | 4             | 104       |

| 4          | Diana Prince  | 5             | 106       |

| 5          | Ethan Hunt    |               |           |

| 6          | Fiona Green   |               |           |



\---

\*\*Query #6\*\*



&#x20;   SELECT s.student\_id, s.student\_name FROM students s LEFT JOIN enrollments e ON s.student\_id = e.student\_id WHERE e.student\_id IS NULL;



| student\_id | student\_name |

| ---------- | ------------ |

| 5          | Ethan Hunt   |

| 6          | Fiona Green  |



\---

\*\*Query #7\*\*



&#x20;   SELECT s.student\_id, s.student\_name, e.enrollment\_id, e.course\_id FROM students s LEFT JOIN enrollments e ON s.student\_id = e.student\_id UNION SELECT s.student\_id, s.student\_name, e.enrollment\_id, e.course\_id FROM students s RIGHT JOIN enrollments e ON s.student\_id = e.student\_id;



| student\_id | student\_name  | enrollment\_id | course\_id |

| ---------- | ------------- | ------------- | --------- |

| 1          | Alice Johnson | 1             | 101       |

| 1          | Alice Johnson | 2             | 102       |

| 2          | Bob Smith     | 3             | 101       |

| 3          | Charlie Brown | 4             | 104       |

| 4          | Diana Prince  | 5             | 106       |

| 5          | Ethan Hunt    |               |           |

| 6          | Fiona Green   |               |           |



\---

\*\*Query #8\*\*



&#x20;   SELECT c.course\_id, c.course\_name FROM courses c LEFT JOIN enrollments e ON c.course\_id = e.course\_id WHERE e.course\_id IS NULL;



| course\_id | course\_name      |

| --------- | ---------------- |

| 103       | Data Analytics   |

| 105       | Machine Learning |



\---

\*\*Query #9\*\*



&#x20;   SELECT i.instructor\_name, c.course\_name FROM instructors i LEFT JOIN courses c ON i.instructor\_id = c.instructor\_id UNION SELECT i.instructor\_name, c.course\_name FROM instructors i RIGHT JOIN courses c ON i.instructor\_id = c.instructor\_id;



| instructor\_name | course\_name         |

| --------------- | ------------------- |

| Sarah Connor    | SQL Basics          |

| Michael Scott   | Python Fundamentals |

| Tony Stark      | Cloud Computing     |

| Bruce Wayne     | Cyber Security      |

|                 | Data Analytics      |

|                 | Machine Learning    |



\---

\*\*Query #10\*\*



&#x20;   SELECT s.student\_name, c.course\_name, i.instructor\_name FROM students s LEFT JOIN enrollments e ON s.student\_id = e.student\_id LEFT JOIN courses c ON e.course\_id = c.course\_id LEFT JOIN instructors i ON c.instructor\_id = i.instructor\_id;



| student\_name  | course\_name         | instructor\_name |

| ------------- | ------------------- | --------------- |

| Alice Johnson | SQL Basics          | Sarah Connor    |

| Alice Johnson | Python Fundamentals | Michael Scott   |

| Bob Smith     | SQL Basics          | Sarah Connor    |

| Charlie Brown | Cloud Computing     | Tony Stark      |

| Diana Prince  | Cyber Security      | Bruce Wayne     |

| Ethan Hunt    |                     |                 |

| Fiona Green   |                     |                 |



\---



\[View on DB Fiddle](https://www.db-fiddle.com/)

