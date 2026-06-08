SELECT s.First_Name, s.Department, g.Total_Score, g.Grade
FROM students s
JOIN grades g ON s.Student_ID = g.Student_ID
ORDER BY g.Total_Score DESC
LIMIT 10;
-- Top 10 students all have grade A
SELECT s.First_Name, s.Department, 
       a.`Attendance (%)`, g.Grade
FROM students s
JOIN attendance_study a ON s.Student_ID = a.Student_ID
JOIN grades g ON s.Student_ID = g.Student_ID
ORDER BY a.`Attendance (%)` DESC
LIMIT 10;
-- High attendance doesn't guarantee good grades

SELECT s.First_Name, s.Department,
       a.`Study_Hours_per_Week`, g.Grade
FROM students s
JOIN attendance_study a ON s.Student_ID = a.Student_ID
JOIN grades g ON s.Student_ID = g.Student_ID
ORDER BY a.`Study_Hours_per_Week` DESC
LIMIT 10;
-- even students studying 30 hours/week are getting D grades!

SELECT s.First_Name, s.Department,
       f.`Stress_Level (1-10)`, g.Grade
FROM students s
JOIN family_background f ON s.Student_ID = f.Student_ID
JOIN grades g ON s.Student_ID = g.Student_ID
WHERE f.`Stress_Level (1-10)` >= 8
ORDER BY f.`Stress_Level (1-10)` DESC
LIMIT 10;

SELECT f.Family_Income_Level, g.Grade,
       COUNT(*) AS total_students
FROM family_background f
JOIN grades g ON f.Student_ID = g.Student_ID
GROUP BY f.Family_Income_Level, g.Grade
ORDER BY f.Family_Income_Level, g.Grade;

-- Grade distribution is almost the same across all income levels — family income doesn't significantly affect grades in this dataset.

