--Find all Students with FirstName = Antonio
SELECT * FROM dbo.Students WHERE FirstName = 'Antonio'
GO

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * FROM dbo.Students WHERE DateOfBirth > '1999.01.01'
GO

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * FROM dbo.Students WHERE LastName LIKE 'J%' AND EnrolledDate >='1998.01.01' and EnrolledDate < '1998.02.01'
GO

--List all Students ordered by FirstName
SELECT * FROM dbo.Students ORDER BY FirstName
GO

--List all Teacher Last Names and Student Last Names in single result set.
--Remove duplicates
SELECT LastName FROM dbo.Teacher 
UNION ALL
SELECT LastName FROM dbo.Students
GO

--Create Foreign key constraints from diagram or with script
ALTER TABLE [dbo].[Grade] ADD CONSTRAINT [FK_Grade_Student] FOREIGN KEY([StudentId]) REFERENCES [dbo].[Students]([Id])
ALTER TABLE [dbo].[Grade] ADD CONSTRAINT [FK_Grade_Teacher] FOREIGN KEY([TeacherId]) REFERENCES [dbo].[Teacher]([Id])
ALTER TABLE [dbo].[Grade] ADD CONSTRAINT [FK_Grade_Course] FOREIGN KEY([CourseId]) REFERENCES [dbo].[Course]([Id])
ALTER TABLE [dbo].[GradeDetails] ADD CONSTRAINT [FK_GradeDetails_Grade] FOREIGN KEY ([GradeId]) REFERENCES [dbo].[Grade]([Id])

--List all possible combinations of Courses names and AchievementType
--names that can be passed by student
SELECT c.Name as CourseName, a.Name as AchievementTypeName
FROM dbo.Course c
CROSS JOIN dbo.AchievementType a
GO

--List all Teachers without exam Grade
SELECT t.*
FROM dbo.Grade g
RIGHT JOIN dbo.Teacher t on g.TeacherId = t.Id
WHERE g.Grade is NULL
GO