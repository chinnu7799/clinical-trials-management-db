select P.PatientID, 
		P.PatientName, 
		COUNT(V.VisitID) as TotalVisits,
		sum(case when V.VisitStatus = 'completed' then 1 else 0 end) as completedVisits, 
		sum(case when V.VisitStatus = 'scheduled' then 1 else 0 end) as ScheduledVisits,
		SUM(V.VisitCost) as TotalVisitCost, 
		ROUND(AVG(V.VisitCost),2) as AverageVisitCost
from dbo.JoinPatients P
left join dbo.JoinPatientVisits V on P.PatientID = V.PatientID
group by P.PatientID, P.PatientName
having SUM(V.VisitCost) > 400
order by TotalVisitCost desc