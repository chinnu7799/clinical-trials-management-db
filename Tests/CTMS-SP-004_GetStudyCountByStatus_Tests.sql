create or alter procedure dbo.usp_GetStudyCountByStatus
( 
@status VARCHAR(20),
@studycount int output
 )
as
begin
	select @studycount=COUNT(StudyID)
	from dbo.JoinStudies
	where Status = @status
end
