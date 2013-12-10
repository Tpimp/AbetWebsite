-- Insert some Departments
USE CSET_ABET_DB
GO
INSERT INTO Department (DepartmentName, DepartmentAbbr)
VALUES ('Applied Mathematics', 'AM');
GO
INSERT INTO Department (DepartmentName, DepartmentAbbr)
VALUES ('Computer Systems Engineering Technology', 'CST');
GO
INSERT INTO Department (DepartmentName, DepartmentAbbr)
VALUES ('Embedded Systems Engineering Technology', 'ESET');
GO
INSERT INTO Department (DepartmentName, DepartmentAbbr)
VALUES ('Electrical Engineering', 'EE');
GO
INSERT INTO Department (DepartmentName, DepartmentAbbr)
VALUES ('Electronics Engineering Technology', 'EET');
GO
INSERT INTO Department (DepartmentName, DepartmentAbbr)
VALUES ('Software Engineering Technology', 'SET');
GO
--Insert a building
INSERT INTO Building (BuildingAbbr, BuildingName) VALUES
('PV', 'Purvine')
GO
--Insert Some Professors
INSERT INTO Professor (FName,LName, DepartmentID, BuildingID, OfficeNumber)
VALUES ('Calvin', 'Coldwell',2,1,100);
GO
INSERT INTO Professor (FName,LName, DepartmentID, BuildingID, OfficeNumber)
VALUES ('Cluade', 'Kansaku', 2,1,101);
GO
INSERT INTO Professor (FName,LName, DepartmentID, BuildingID, OfficeNumber)
VALUES ('Jim', 'Long', 2,1,102);
GO
INSERT INTO Professor (FName,LName, DepartmentID, BuildingID, OfficeNumber)
VALUES ('Phong', 'Nguyen', 2,1,103);
GO
INSERT INTO Professor (FName,LName, DepartmentID, BuildingID, OfficeNumber)
VALUES ('Randy', 'Albert', 2,1,104);
GO
INSERT INTO Professor (FName,LName, DepartmentID, BuildingID, OfficeNumber)
VALUES ('Todd', 'Breedlove',2,1,105);
GO
INSERT INTO Professor (FName,LName, DepartmentID, BuildingID, OfficeNumber)
VALUES ('Troy', 'Scevers',2,1,106);
GO