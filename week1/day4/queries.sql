SELECT s.student_name,d.department_name FROM Student s LEFT JOIN Department d ON s.department_id=d.department_id;
SELECT s.staff_name,d.department_name FROM Staff s LEFT JOIN Department d ON s.department_id=d.department_id;
SELECT d.department_name FROM Department d LEFT JOIN Student s ON d.department_id=s.department_id WHERE s.student_id IS NULL;
SELECT s.student_name FROM Student s LEFT JOIN Mark m ON s.student_id=m.student_id WHERE m.student_id IS NULL;
SELECT subject_name FROM Subject WHERE staff_id IS NULL;
SELECT d.department_name,AVG(s.cgpa) FROM Student s JOIN Department d ON s.department_id=d.department_id GROUP BY d.department_name;
SELECT d.department_name,AVG(s.cgpa) FROM Student s JOIN Department d ON s.department_id=d.department_id GROUP BY d.department_name HAVING AVG(s.cgpa)>8;
SELECT d.department_name,COUNT(s.student_id) FROM Department d LEFT JOIN Student s ON d.department_id=s.department_id GROUP BY d.department_name;
SELECT sub.subject_name,MAX(m.marks),MIN(m.marks) FROM Subject sub JOIN Mark m ON sub.subject_id=m.subject_id GROUP BY sub.subject_name;
SELECT DISTINCT s.student_name FROM Student s JOIN Mark m ON s.student_id=m.student_id WHERE m.marks>90;
SELECT s.student_name FROM Student s JOIN Department d ON s.department_id=d.department_id WHERE d.department_name='Computer Science';
SELECT st.staff_name,COUNT(sub.subject_id) FROM Staff st LEFT JOIN Subject sub ON st.staff_id=sub.staff_id GROUP BY st.staff_name;
SELECT s.student_name,SUM(m.marks) FROM Student s LEFT JOIN Mark m ON s.student_id=m.student_id GROUP BY s.student_name;
SELECT d.department_name,COUNT(st.staff_id) FROM Department d JOIN Staff st ON d.department_id=st.department_id GROUP BY d.department_name HAVING COUNT(st.staff_id)>2;
SELECT student_name FROM Student WHERE cgpa>(SELECT AVG(cgpa) FROM Student);
SELECT staff_name FROM Staff s WHERE salary>(SELECT AVG(salary) FROM Staff WHERE department_id=s.department_id);
SELECT DISTINCT salary FROM Staff ORDER BY salary DESC LIMIT 1,1;
SELECT s.student_name,sub.subject_name,m.marks FROM Student s JOIN Mark m ON s.student_id=m.student_id JOIN Subject sub ON m.subject_id=sub.subject_id WHERE (m.subject_id,m.marks) IN (SELECT subject_id,MAX(marks) FROM Mark GROUP BY subject_id);
SELECT s.student_name,m.marks FROM Student s LEFT JOIN Mark m ON s.student_id=m.student_id;
SELECT sub.subject_name,AVG(m.marks) FROM Subject sub JOIN Mark m ON sub.subject_id=m.subject_id GROUP BY sub.subject_name HAVING AVG(m.marks)<70;
SELECT * FROM Student ORDER BY cgpa DESC;
SELECT d.department_name,SUM(s.salary) FROM Department d JOIN Staff s ON d.department_id=s.department_id GROUP BY d.department_name;
SELECT d.department_name,SUM(s.salary) FROM Department d JOIN Staff s ON d.department_id=s.department_id GROUP BY d.department_name HAVING SUM(s.salary)>200000;
SELECT student_name FROM Student WHERE admission_year>2021 AND cgpa>7.5;
SELECT admission_year,COUNT(*) FROM Student GROUP BY admission_year;
SELECT city,COUNT(*) FROM Student GROUP BY city ORDER BY COUNT(*) DESC LIMIT 1;
SELECT d.department_name,COUNT(s.staff_id) FROM Department d LEFT JOIN Staff s ON d.department_id=s.department_id GROUP BY d.department_name;
SELECT DISTINCT s.student_name FROM Student s JOIN Mark m ON s.student_id=m.student_id WHERE m.marks<50;
SELECT staff_name FROM Staff WHERE YEAR(hire_date)<2018;
SELECT d.department_name FROM Department d JOIN Staff s ON d.department_id=s.department_id GROUP BY d.department_name HAVING COUNT(CASE WHEN s.salary IS NULL THEN 1 END)=0;
SELECT student_name,cgpa,@r:=@r+1 AS row_num FROM Student,(SELECT @r:=0)x ORDER BY cgpa DESC;

SELECT student_name,cgpa,@r:=@r+1 AS rank_num FROM Student,(SELECT @r:=0)x ORDER BY cgpa DESC;

SELECT staff_name,salary,@r:=@r+1 AS salary_rank FROM Staff,(SELECT @r:=0)x ORDER BY salary DESC;

SELECT s.student_name,SUM(m.marks) total_marks FROM Student s JOIN Mark m ON s.student_id=m.student_id GROUP BY s.student_id ORDER BY total_marks DESC LIMIT 3;

SELECT student_id,exam_date,marks FROM Mark ORDER BY student_id,exam_date;

SELECT subject_id,AVG(marks) avg_marks FROM Mark GROUP BY subject_id;

SELECT * FROM Mark ORDER BY student_id,exam_date;

SELECT * FROM Mark ORDER BY student_id,exam_date;

SELECT subject_id,MAX(marks) FROM Mark GROUP BY subject_id;

SELECT exam_date,AVG(marks) FROM Mark GROUP BY exam_date;

SELECT s.* FROM Student s WHERE admission_year=(SELECT MIN(admission_year) FROM Student s2 WHERE s2.department_id=s.department_id);

SELECT s.* FROM Staff s WHERE hire_date=(SELECT MAX(hire_date) FROM Staff s2 WHERE s2.department_id=s.department_id);

SELECT * FROM Student ORDER BY cgpa DESC;

SELECT * FROM Student ORDER BY cgpa DESC;

SELECT * FROM Staff ORDER BY salary DESC;

SELECT * FROM Mark m WHERE m.marks>(SELECT AVG(m2.marks) FROM Mark m2 WHERE m2.subject_id=m.subject_id);

SELECT department_id,AVG(salary) FROM Staff GROUP BY department_id HAVING AVG(salary)>(SELECT AVG(salary) FROM Staff);

SELECT DISTINCT s.student_name FROM Student s JOIN Mark m ON s.student_id=m.student_id;

SELECT DISTINCT marks FROM Mark ORDER BY marks DESC LIMIT 2,1;
SELECT s.student_name,d.department_name,sub.subject_name,m.exam_type,m.marks FROM Student s JOIN Department d ON s.department_id=d.department_id JOIN Mark m ON s.student_id=m.student_id JOIN Subject sub ON m.subject_id=sub.subject_id;