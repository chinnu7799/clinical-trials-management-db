create view vw_StudyPatientStatistics
as
select  JS.StudyID, 
		JS.StudyName, 
		JS.Status, 
		COUNT(P.Patientid) as TotalPatients
from	dbo.JoinStudies JS
left join	dbo.JoinSites S	
	on JS.StudyID = S.StudyID
left join	dbo.JoinPatients P 
	on P.SiteID	= S.SiteID
group by JS.StudyID, JS.StudyName, JS.Status