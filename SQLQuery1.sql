USE [master]
GO

DROP DATABASE IF EXISTS [SEDCACADEMYDB]
GO

CREATE DATABASE [SEDCACADEMYDB]
GO

CREATE TABLE Students (
		[Id] int IDENTITY(1,1),
		[FirstName] nvarchar(100),	
		[LastName] nvarchar(100),
		[DateOfBirth] date,
		[EnrolledDate] date,
		[Gender] nchar(1),
		[NationalIDNumber] nvarchar(20),
		[StudentCardNumber] nvarchar(20),
		CONSTRAINT [PK_Students] PRIMARY KEY (Id)
)

CREATE TABLE Teacher (
		[Id] int IDENTITY(1,1),
		[FirstName] nvarchar(100),
		[LastName] nvarchar(100),
		[DateOfBirth] date,
		[AcademicRank] int,
		[HireDate] date,
		CONSTRAINT [PK_Teacher] PRIMARY KEY (Id)
)

CREATE TABLE Grade (
		[Id] int IDENTITY(1,1),
		[StudentId] int,
		[CourseId] int,
		[TeacherId] int,
		[Grade] int,
		[Comment] nvarchar(max),
		[CreatedDate] date,
		CONSTRAINT [PK_Grade] PRIMARY KEY (Id)
)

CREATE TABLE Course (
		[Id] int IDENTITY(1,1),
		[Name] nvarchar(100),
		[Credit] bigint,
		[AcademicYear] nvarchar(20),
		[Semester] int,
		CONSTRAINT [PK_Course] PRIMARY KEY (Id)
)

CREATE TABLE GradeDetails (
		[Id] int IDENTITY(1,1),
		[GradeId] int,
		[AchievmentTypeId] int,
		[AchievementPoints] int,
		[AchievementMaxPoints] int,
		[AchievementDate] date,
		CONSTRAINT [PK_GradeDetails] PRIMARY KEY (Id)
)

CREATE TABLE AchievementType (
		[Id] int IDENTITY(1,1),
		[Name] nvarchar(100),
		[Description] nvarchar(max),
		[ParticipationRate] decimal(3,2)
		CONSTRAINT [PK_AchievementType] PRIMARY KEY (Id)
)
