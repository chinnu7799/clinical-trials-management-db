create or alter procedure dbo.usp_GetActiveStudies
as
begin
	select StudyID,StudyName,Phase,Status,ManagerID
	from dbo.JoinStudies
	where Status = 'Active'
	order by StudyName asc
end