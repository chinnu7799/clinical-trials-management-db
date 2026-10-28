if exists(select * from sys.procedures where name = 'usp_pagin_pat')
drop procedure usp_pagin_pat
go
create procedure usp_pagin_pat
(
@pagesize int,
@pagenum int
)
as
begin
declare @pagestart int
set @pagestart = (@pagenum -1) * @pagesize

select PatientID, PatientName,Age, SiteID
from dbo.JoinPatients
order by PatientID asc
offset @pagestart rows
fetch next @pagesize rows only
end
