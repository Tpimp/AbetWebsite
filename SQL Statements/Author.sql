USE CSET_ABET_DB
GO
-- insert new author
INSERT INTO Author (FName, LName) VALUES 
('first', 'last')
--UPDATE Author
UPDATE Author
SET FName = 'First', LName = 'Last'
WHERE AuthorID = 1
--Select Authors
SELECT FName, LName
FROM Author


