-- Q1: Rank students by total score within each department
SELECT s.First_Name, s.Department, g.Total_Score,
       RANK() OVER(PARTITION BY s.Department ORDER BY g.Total_Score DESC) AS dept_rank
FROM students s
JOIN grades g ON s.Student_ID = g.Student_ID;

-- Q2: Find students who scored above average total score
SELECT s.First_Name, s.Department, g.Total_Score, g.Grade
FROM students s
JOIN grades g ON s.Student_ID = g.Student_ID
WHERE g.Total_Score > (SELECT AVG(Total_Score) FROM grades)
ORDER BY g.Total_Score DESC
LIMIT 10;

-- Q3: Categorize students by attendance using CASE
SELECT s.First_Name, s.Department,
       a.`Attendance (%)`,
       CASE 
           WHEN a.`Attendance (%)` >= 90 THEN 'Excellent'
           WHEN a.`Attendance (%)` >= 75 THEN 'Good'
           WHEN a.`Attendance (%)` >= 60 THEN 'Average'
           ELSE 'Poor'
       END AS attendance_category
FROM students s
JOIN attendance_study a ON s.Student_ID = a.Student_ID
ORDER BY a.`Attendance (%)` DESC
LIMIT 10;