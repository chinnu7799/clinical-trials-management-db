create or alter procedure dbo.usp_GetStudiesByStatus
(
	@status varchar(20)
)
as
begin
	select StudyID, StudyName, Phase, Status, ManagerID
	from dbo.JoinStudies
	where Status = @status
end