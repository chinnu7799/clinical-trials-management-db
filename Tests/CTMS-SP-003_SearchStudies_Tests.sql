create or alter procedure dbo.usp_SearchStudies
(@Status VARCHAR(20) = null)
as
begin
	select StudyID,StudyName, Phase, Status, ManagerID
	from dbo.JoinStudies
	where Status = @Status or @Status is null
	order by StudyName asc
end
