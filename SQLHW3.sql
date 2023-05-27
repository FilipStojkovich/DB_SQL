
--Calculate the count of all grades per Teacher in the system
SELECT g.Grade, t.ID, COUNT(*) AS TOTAL
FROM dbo.Grade g
JOIN dbo.Teacher t on g.TeacherID = t.ID
GROUP BY g.Grade, t.ID
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT g.Grade, g.StudentID AS StudentID, COUNT(*) AS TOTAL
FROM dbo.Grade g
JOIN dbo.Teacher t on g.TeacherID = t.ID
WHERE StudentID < 100
GROUP BY g.Grade, g.StudentID
GO

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.FirstName, MAX(Grade) as MaxGrade, AVG(Grade) as AvgGrade 
FROM dbo.Grade g
JOIN dbo.Student s on g.StudentID = s.ID
GROUP BY s.FirstName 
GO

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName, COUNT(Grade) AS Total
FROM dbo.Grade g
JOIN dbo.Teacher t on g.TeacherID = t.ID
GROUP BY t.FirstName
HAVING COUNT(Grade) > 200
GO

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the
--system. Filter only records where Maximal Grade is equal to Average Grade
SELECT StudentId, COUNT(Grade) AS GradeCount, MAX(Grade) AS MaxGrade, AVG(Grade) AS AvgGrade
FROM dbo.Grade g
INNER JOIN dbo.Student s on g.StudentID = s.ID
GROUP BY StudentId
HAVING MAX(Grade) = AVG(Grade)
GO

--List Student First Name and Last Name next to the other details from previous query
SELECT s.FirstName as FirstName, s.LastName as LastName, COUNT(Grade) AS GradeCount, MAX(Grade) AS MaxGrade, AVG(Grade) AS AvgGrade
FROM dbo.Grade g
inner join dbo.Student s on g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName 
HAVING MAX(Grade) = AVG(Grade)
GO

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
DROP VIEW IF EXISTS vv_StudentGrades;
GO

CREATE VIEW vv_StudentGrades
AS 
SELECT StudentId, COUNT(Grade) as GradeCount
FROM dbo.Grade g
GROUP BY StudentID
GO

--Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades
AS
SELECT s.FirstName AS FirstName, s.LastName AS LastName, COUNT(Grade) as GradeCount
FROM dbo.Grade g
INNER JOIN dbo.Student s on g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName
GO

--List all rows from view ordered by biggest Grade Count
SELECT * FROM vv_StudentGrades
ORDER BY GradeCount DESC
GO