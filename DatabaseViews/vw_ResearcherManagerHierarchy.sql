create view dbo.vw_ResearcherManagerHierarchy
as
select R1.ResearcherID, R1.ResearcherName, R1.ManagerID, R2.ResearcherName as ManagerName
from	JoinResearchers R1
left join	JoinResearchers R2
	on R1.ManagerID = R2.ResearcherID


	
