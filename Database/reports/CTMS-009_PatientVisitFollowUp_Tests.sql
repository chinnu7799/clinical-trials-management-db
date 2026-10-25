select V.VisitID, P.PatientName, V.VisitNumber, V.VisitDate, V.VisitStatus, V.VisitCost, datediff(DAY,CAST(getdate() as date),V.VisitDate) DaysFromToday, case when V.VisitStatus = 'Completed' then 'Completed Visit'
																																				when V.VisitDate < CAST(GETDATE() AS date) then 'Overdue'
																																				when V.VisitDate = CAST(getdate() AS date) then 'Due Today'
																																				else 'Upcoming' end as VisitCategory
from dbo.JoinPatients P
inner join dbo.JoinPatientVisits V on P.PatientID = V.PatientID
where V.VisitStatus in('completed','scheduled')
order by V.VisitDate asc, PatientName asc