USE CSET_ABET_DB
GO
INSERT INTO Course (Title, Number, [Lecture Hours], [Lab Hours], Credits, Description, Goals, Topics, DepartmentID, CoordinatorID) VALUES
('title', 111, 3, 3, 3, 'Long description', 'course goals', 'topics covered by course', 1, 1)
GO
UPDATE Course
SET Title = 'new title', Number = 111,[Lecture Hours] = 3,[Lab Hours] =  3, Credits = 3, Description = 'new long description',Goals = 'new goals', Topics = 'new topics', DepartmentID = NULL, CoordinatorID = NULL
WHERE CourseID = 1
GO
SELECT Title, Number, [Lecture Hours], [Lab Hours], Credits, Description, Goals, Topics, DepartmentID, CoordinatorID 
FROM Course
