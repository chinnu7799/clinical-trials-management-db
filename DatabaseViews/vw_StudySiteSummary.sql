create view dbo.vw_StudySiteSummary
as
select st.StudyID, st.StudyName, st.Phase, si.SiteID, si.SiteName, si.City
from dbo.JoinStudies st
left join dbo.joinSites si 
on st.StudyID = si.StudyID