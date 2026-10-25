create view dbo.vw_PatientStudyDetails
as
select  P.PatientID, 
		P.PatientName, 
		P.Age, 
		S.SiteID, 
		S.SiteName, 
		S.City, 
		ST.StudyID,
		ST.StudyName, 
		ST.Phase as StudyPhase, 
		ST.Status as StudyStatus
from dbo.JoinPatients P
join dbo.JoinSites S 
	on P.SiteID = S.SiteID
join dbo.JoinStudies ST 
	on S.StudyID = ST.StudyID

