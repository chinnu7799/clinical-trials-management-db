if not exists (select 1 from sys.tables t 
				inner join sys.schemas s on t.schema_id = s.schema_id
				where t.name = 'Studies' and s.name = 'dbo')
begin
	create table dbo.Studies(
	StudyID int identity(1,1) constraint PK_Studies primary key,
	StudyCode varchar(50) not null CONSTRAINT UQ_Studies_StudyCode UNIQUE,
	StudyName varchar(50) not null constraint CH_study_name check (len(trim(StudyName))>0),
	Description varchar(max),
	Phase varchar(40) constraint ck_study_phase check (Phase in ('Phase I','Phase II','Phase III','Phase IV')),
	Status varchar(30) constraint ck_study_status check (Status in ('Planned','Active','Completed','Cancelled')),
	StartDate date null,
	ExpectedEndDate date null,
	CreatedDate datetime not null constraint DF_study_Createdate default (getdate()),
	constraint ck_start_enddate check (StartDate is null or ExpectedEndDate is null or ExpectedEndDate >= StartDate)
	);
	PRINT 'Studies table created successfully'
end
ELSE 
BEGIN 
PRINT 'Studies table already exists.'; 
END; 
GO

