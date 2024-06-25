CREATE DATABASE CodeAcademy

USE CodeAcademy

CREATE TABLE GroupTypes (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50)
)

CREATE TABLE Groups (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50),
	BeginDate DATE,
	EndDate DATE,
	LessonHours INT,
	GroupTypeId INT,
	FOREIGN KEY (GroupTypeId) REFERENCES GroupTypes(Id)
) 

CREATE TABLE Students (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50),
	Surname NVARCHAR(50),
	BirthDate DATE,
	RegistrationDate DATE,
	PhoneNumber INT,
	Email NVARCHAR(100),
	GroupId INT,
	FOREIGN KEY (GroupId) REFERENCES Groups(Id)
) 

CREATE TABLE Topics (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50),
	LessonHours INT
)

CREATE TABLE GroupTopics (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	GroupId INT,
	TopicId INT,
	FOREIGN KEY(GroupId) REFERENCES Groups(Id),
	FOREIGN KEY(TopicId) REFERENCES Topics(Id)
)  

CREATE TABLE ExerciseType (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50)
)

CREATE TABLE Exercises (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(100),
	Grade INT,
	TypeId INT,
	FOREIGN KEY (TypeId) REFERENCES ExerciseType(Id)
)

CREATE TABLE StudentExercises (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	StudentId INT,
	ExerciseId INT,
	FOREIGN KEY (StudentId) REFERENCES Students(Id),
	FOREIGN KEY (ExerciseId) REFERENCES Exercises(Id)
) 