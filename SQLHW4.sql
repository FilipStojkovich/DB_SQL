--Declare scalar variable for storing FirstName values
--• Assign value ‘Antonio’ to the FirstName variable
--• Find all Students having FirstName same as the variable
DECLARE @FirstName nvarchar(100)
SET @FirstName = 'Antonio'
SELECT * FROM dbo.Student
WHERE FirstName = @FirstName
GO

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--• Fill the table variable with all Female students
DECLARE @StudentList TABLE
(StudentID int, StudentName nvarchar(100), DateOfBirth date)

INSERT INTO @StudentList
SELECT s.ID AS StudentId, s.FirstName AS StudentFirstName, s.DateOfBirth
FROM dbo.Student s
WHERE s.Gender = 'F'
GROUP BY s.ID, s.FirstName, s.DateOfBirth
GO

--Declare temp table that will contain LastName and EnrolledDate columns
--• Fill the temp table with all Male students having First Name starting with ‘A’
--• Retrieve the students from the table which last name is with 7 characters
CREATE TABLE #MaleStudents
(FirstName nvarchar(100), LastName nvarchar(100), EnrolledDate date)

INSERT INTO #MaleStudents
SELECT FirstName, LastName, EnrolledDate
FROM dbo.Student 
WHERE Gender = 'M' AND FirstName LIKE 'A%'
GROUP BY FirstName, LastName, EnrolledDate
GO

SELECT * FROM #MaleStudents
WHERE LastName LIKE '_______'
GO

--Find all teachers whose FirstName length is less than 5 and
--• the first 3 characters of their FirstName and LastName are the same
SELECT t.FirstName, t.LastName
FROM dbo.Teacher t
WHERE LEN(FirstName) < 5
GO

SELECT t.FirstName, t.LastName
FROM dbo.Teacher t
WHERE SUBSTRING(FirstName, 1, 3) = SUBSTRING(LastName, 1, 3)
GO