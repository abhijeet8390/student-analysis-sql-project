USE student_analysis;
SHOW TABLES;
SELECT COUNT(*) AS total_students 
FROM students;

-- Total number of students = 5000

SELECT Gender, COUNT(*) AS total
FROM students
GROUP BY Gender
ORDER BY total DESC;

-- Male - 2551 , female - 2449

SELECT Department, COUNT(*) AS total_students
FROM students
GROUP BY Department
ORDER BY total_students DESC;

-- Engineering -1274 , business - 1264 , cs - 1239 , math - 1223
SELECT ROUND(AVG(Age), 1) AS avg_age
FROM students;
-- avg age - 21

SELECT Grade, COUNT(*) AS total_students
FROM grades
GROUP BY Grade
ORDER BY Grade;
-- A - 16,B - 638 , C - 2307 , D -1760 , F -279

 -- fixing column name 
 ALTER TABLE students RENAME COLUMN `ï»¿Student_ID` TO Student_ID;
ALTER TABLE grades RENAME COLUMN `ï»¿Student_ID` TO Student_ID;
ALTER TABLE attendance_study RENAME COLUMN `ï»¿Student_ID` TO Student_ID;
ALTER TABLE family_background RENAME COLUMN `ï»¿Student_ID` TO Student_ID;

SELECT s.Department, ROUND(AVG(g.Total_Score), 2) AS avg_score
FROM students s
JOIN grades g ON s.Student_ID = g.Student_ID
GROUP BY s.Department
ORDER BY avg_score DESC;

-- Business = 71.92, Engineering - 71.69, mathematics - 71.55, cs - 71.43

SELECT s.Student_ID, s.First_Name, s.Last_Name, s.Department, g.Total_Score
FROM students s
JOIN grades g ON s.Student_ID = g.Student_ID
WHERE g.Grade = 'A'
ORDER BY g.Total_Score DESC;

-- 16 students got A grade out of 5000

SELECT s.Department, COUNT(*) AS failed_students
FROM students s
JOIN grades g ON s.Student_ID = g.Student_ID
WHERE g.Grade = 'F'
GROUP BY s.Department
ORDER BY failed_students DESC;

-- Mathematics has the most failures
-- Mathematics	76 Engineering	71  Business	66  CS	66

-- Q9: Average attendance by department
SELECT s.Department, ROUND(AVG(a.`Attendance (%)`), 2) AS avg_attendance
FROM students s
JOIN attendance_study a ON s.Student_ID = a.Student_ID
GROUP BY s.Department
ORDER BY avg_attendance DESC;

-- Business	75.76 Engineering	75.46 Mathematics	75.45 CS	74.75
-- All departments have similar attendance around 75%. 

SELECT s.Student_ID, s.First_Name, s.Department, a.`Attendance (%)`
FROM students s
JOIN attendance_study a ON s.Student_ID = a.Student_ID
WHERE a.`Attendance (%)` < 50
ORDER BY a.`Attendance (%)` ASC;

-- No student has attendance below 50% 
SELECT s.Student_ID, s.First_Name, s.Department, 
       a.`Attendance (%)`, g.Grade
FROM students s
JOIN attendance_study a ON s.Student_ID = a.Student_ID
JOIN grades g ON s.Student_ID = g.Student_ID
WHERE a.`Attendance (%)` < 60
ORDER BY a.`Attendance (%)` ASC;

-- Lots of at-risk students with low attendance


