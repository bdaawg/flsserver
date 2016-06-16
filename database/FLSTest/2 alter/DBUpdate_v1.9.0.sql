USE [FLSTest]
GO

PRINT 'Update SystemVersion Information'
INSERT INTO [dbo].[SystemVersion]
           ([VersionId]
		   ,[MajorVersion]
           ,[MinorVersion]
           ,[BuildVersion]
           ,[RevisionVersion]
           ,[UpgradeFromVersion]
           ,[UpgradeDateTime])
     VALUES
           (14,1,9,0,0
           ,'1.8.11.0'
           ,SYSUTCDATETIME())
GO

PRINT 'Modify Persons table'

ALTER TABLE [dbo].[Persons]
	ADD [EnableAddress] [bit] CONSTRAINT [DF__Persons__EnableAddress] DEFAULT((1)) NOT NULL,
	[HasMotorInstructorLicence] [bit] CONSTRAINT [DF__Persons__HasMotorInstrLic] DEFAULT((0)) NOT NULL
GO

PRINT 'Modify PersonClub table'
ALTER TABLE [dbo].[PersonClub]
	ADD [IsMotorInstructor] [bit] CONSTRAINT [DF__PersonClu__IsMotorInstr] DEFAULT((0)) NOT NULL
GO

PRINT 'Modify Aircrafts table'
ALTER TABLE [dbo].[Aircrafts]
	ADD [EngineOperatorCounterPrecision] [int] CONSTRAINT [DF__Aircrafts__EngineOperatorCounterPrecision] DEFAULT((1)) NOT NULL
GO

PRINT 'Modify Flights table'
ALTER TABLE [dbo].[Flights]
	ADD [NoStartTimeInformation] [bit] CONSTRAINT [DF__Flights__NoStartTimeInformation] DEFAULT((0)) NOT NULL,
	[NoLdgTimeInformation] [bit] CONSTRAINT [DF__Flights__NoLdgTimeInformation] DEFAULT((0)) NOT NULL,
	[NrOfLdgsOnStartLocation] [int] NULL
GO

PRINT 'Modify FlightCrew table'
ALTER TABLE [dbo].[FlightCrew]
	ADD [NrOfStarts] [int] NULL
GO

PRINT 'Add new email templates'
INSERT [dbo].[EmailTemplates] ([EmailTemplateId], [ClubId], [EmailTemplateName], [EmailTemplateKeyName], [Description], [FromAddress], [ReplyToAddresses], [Subject], [IsSystemTemplate], [CreatedOn], [CreatedByUserId], [ModifiedOn], [ModifiedByUserId], [DeletedOn], [DeletedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted], [HtmlBody], [TextBody]) 
VALUES (NEWID(), NULL, N'Planning day assignment notification', N'planningday-assignment-notification', N'Notifies the persons who are assigned to a planning day as towpilot, flight operator or instructor, etc. a week before the event.', N'fls@glider-fls.ch', N'noreply@glider-fls.ch', N'Erinnerung für {planningDayInfoModel.Date} in {planningDayInfoModel.LocationName} als {planningDayInfoModel.AssignmentTypeName}', 1, SYSUTCDATETIME(), N'13731ee2-c1d8-455c-8ad1-c39399893fff', NULL, NULL, NULL, NULL, 1, N'a1dde2cb-6326-4bb2-897d-7cfc118e842b', 2, 0, N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-gb" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Erinnerung für $PlanningDayInfoModel.Date in $PlanningDayInfoModel.LocationName als $PlanningDayInfoModel.AssignmentTypeName</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 14px;
}
</style>
</head>

<body>
<p>
Hallo $PlanningDayInfoModel.PersonFirstname
</p>
<p>
Dies ist ein Erinnerungsmail für den $PlanningDayInfoModel.Date in $PlanningDayInfoModel.LocationName. Du bist dann als $PlanningDayInfoModel.AssignmentTypeName eingeteilt.</p>

<p>
Falls in der Zwischenzeit etwas dazwischengekommen ist und du den Einsatz nicht wahrnehmen kannst, dann suche eine Ersatzperson und aktualisiere die Angaben im Flight Logging System.</p>

<p>Herzliche Grüsse</p>
<p>Flight Logging System</p>

</body>

</html>
', NULL)
GO

PRINT 'Finished update to Version 1.9.0'