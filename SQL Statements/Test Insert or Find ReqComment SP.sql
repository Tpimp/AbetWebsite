USE CSET_ABET_DB;
GO

DECLARE @comment_index1 INT = -1;
DECLARE @comment_index2 INT = -1;
DECLARE @comment_index3 INT = -1;
DECLARE @comment_index4 INT = -1;
DECLARE @comment_index5 INT = -1;
DECLARE @comment_index6 INT = -1;

EXEC @comment_index1 = sp_IOrFReqComment @commentID = @comment_index1,
					   @comment = 'This is my comment';

EXEC @comment_index2 = sp_IOrFReqComment @commentID = @comment_index2,
					   @comment = 'This is my comment';

EXEC @comment_index3 = sp_IOrFReqComment @commentID = @comment_index3,
					   @comment = 'This is my new comment';

EXEC @comment_index4 = sp_IOrFReqComment @commentID = @comment_index4,
					   @comment = 'This is my different new comment';

EXEC @comment_index5 = sp_IOrFReqComment @commentID = @comment_index5,
					   @comment = 'This is my next new comment';

EXEC @comment_index6 = sp_IOrFReqComment @commentID = @comment_index6,
					   @comment = 'This is my dint new comment';


-- in theory index 1, 2, 4, and 6 should be the same and 3 and 5 should be unique
SELECT @comment_index1, @comment_index2, @comment_index3, @comment_index4, @comment_index5, @comment_index6;


