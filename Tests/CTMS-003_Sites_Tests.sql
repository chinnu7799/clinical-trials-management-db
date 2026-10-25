if not exists(select 1 from sys.tables t inner join sys.schemas s 
					on t.schema_id = s.schema_id
					where t.name = 'Sites' and s.name = 'dbo')
begin
	create table dbo.Sites(
	SiteID int identity(1,1) constraint PK_sitesid primary key,
	StudyID int not null,
	SiteCode varchar(30) not null constraint UQ_Sites_SiteCode unique,
	SiteName varchar(30) not null constraint ck_sites_sitename check (len(trim(SiteName))>0),
	City varchar(30) not null,
	Country varchar(20) not null,
	Status varchar(40) not null constraint ck_sites_status check (Status in ('Active','Inactive','Closed')),
	CreatedDate datetime not null constraint DF_createdate default (getdate()),
	constraint FK_Sites_Studies
	foreign key (StudyID)
	references dbo.Studies(StudyID)
	)
	PRINT 'Table created successfuly'
end
else
begin	
	print('table already exists')
end

