create or alter procedure dbo.usp_TransactionHandling
(@visitid int,
 @addamt decimal(10,2))
as
begin
	set nocount on
	begin try
		if @addamt < 0
			throw 50002,'amount cannot be negativce',1
	begin transaction
			begin
				if not exists(select 1 from dbo.JoinPatientVisits where VisitID = @visitid)
				THROW 50001, 'VisitID does not exist.', 1;
			end

			begin
				update dbo.JoinPatientVisits
				set VisitCost = VisitCost+@addamt
				where VisitID = @visitid
			end
	commit transaction
	PRINT 'Visit cost updated successfully.';
	end try
	begin catch
		if @@TRANCOUNT > 0
			rollback transaction
		PRINT 'Transaction failed.'; 
		THROW;
	end catch
end

