select P.PatientID, 
		UPPER(P.PatientName) as StandardizedName,
		P.PatientName as OriginalName,
		P.age,  
		(case when age  < 30 then 'Young Adult'							
							when age >= 30 and age <= 44 then 'Adult'
							when age >= 45 and age <= 59 then 'Middle Aged'
							when age >= 60 then 'Senior' end) as agecategory,
		('PAT-'+RIGHT(REPLICATE('0',5)+CAST(patientid as varchar(20)),5)) as PatientCode, 
		S.SiteName, 
		S.City 
from dbo.joinpatients P
inner join dbo.JoinSites S on P.siteID = S.siteID


