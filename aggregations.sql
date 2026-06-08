SELECT s.Department, 
       ROUND(AVG(g.Total_Score), 2) AS avg_score,
       COUNT(*) AS total_students
FROM students s
JOIN grades g ON s.Student_ID = g.Student_ID
GROUP BY s.Department
ORDER BY avg_score DESC;

-- Business	71.92	1264 Engineering	71.69	1274 Mathematics	71.55	1223 CS	71.43	1239

SELECT g.Grade,
       ROUND(AVG(a.`Study_Hours_per_Week`), 2) AS avg_study_hours
FROM grades g
JOIN attendance_study a ON g.Student_ID = a.Student_ID
GROUP BY g.Grade
ORDER BY g.Grade;

-- A	18.73 B	17.31 C	17.63 D	17.39 F	17.87

SELECT f.Parent_Education_Level,
       COUNT(*) AS total_students,
       ROUND(AVG(g.Total_Score), 2) AS avg_score
FROM family_background f
JOIN grades g ON f.Student_ID = g.Student_ID
GROUP BY f.Parent_Education_Level
ORDER BY avg_score DESC;