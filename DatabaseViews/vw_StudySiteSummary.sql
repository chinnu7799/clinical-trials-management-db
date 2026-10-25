--#	Output column			Source					Description
--1	PatientID				JoinPatients			Unique patient identifier
--2	PatientName				JoinPatients			Patient's name
--3	Age						JoinPatients			Patient's age
--4	SiteID					JoinSites				Research site identifier
--5	SiteName				JoinSites				Research site name
--6	City					JoinSites				Site's city
--7	StudyID					JoinStudies				Clinical study identifier
--8	StudyName				JoinStudies				Clinical study name
--9	StudyPhase				JoinStudies.Phase		Phase of the clinical study
--10StudyStatus				JoinStudies.Status		Current study status

select P.PatientID, P.PatientName, P.Age, S.SiteID. S.SiteName, 
from dbo.JoinPatients P
join dbo.JoinSites S on P.SiteID = S.SiteID

