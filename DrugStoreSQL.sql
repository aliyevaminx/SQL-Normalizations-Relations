CREATE DATABASE DrugStore

USE DrugStore

CREATE TABLE Owners (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50),
	Surname NVARCHAR(50)
)

CREATE TABLE DrugStores (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50),
	[Address] NVARCHAR(50),
	ContactNumber INT DEFAULT '+994000000000',
	CreationDate DATE,
	OwnerId INT,
	FOREIGN KEY (OwnerId) REFERENCES Owners(Id)
)

CREATE TABLE Druggists (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50),
	Surname NVARCHAR(50),
	Age INT,
	Experience INT,
	DrugStoreId INT,
	FOREIGN KEY (DrugStoreId) REFERENCES DrugStores(Id)
)

CREATE TABLE Drugs (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50),
	Price INT,
	[Count] INT,
	DrugStoreId INT,
	FOREIGN KEY (DrugStoreId) REFERENCES DrugStores(Id)
)