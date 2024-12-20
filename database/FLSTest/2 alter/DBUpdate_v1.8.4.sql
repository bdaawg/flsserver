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
           (6,1,8,4,0
           ,'1.8.3.0'
           ,SYSUTCDATETIME())
GO

PRINT 'Modify AircraftReservationTypes table'

ALTER TABLE [dbo].[AircraftReservationTypes]
	ADD [IsInstructorRequired] [bit] NOT NULL default(0)
GO

UPDATE [dbo].[AircraftReservationTypes] SET [IsInstructorRequired] = 1 WHERE AircraftReservationTypeId = 2
GO

PRINT 'INSERT PlanningDayAssignmentTypes for instructor for all clubs'

INSERT INTO [dbo].[PlanningDayAssignmentTypes]
           ([PlanningDayAssignmentTypeId],[AssignmentTypeName],[ClubId],[RequiredNrOfPlanningDayAssignments],
		   [CreatedOn],[CreatedByUserId],[RecordState],[OwnerId],[OwnershipType],[IsDeleted])
	SELECT NEWID(), 'Fluglehrer', [ClubId], 1, SYSDATETIME(), [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], 0
	FROM [dbo].[PlanningDayAssignmentTypes] WHERE [AssignmentTypeName] = 'Segelflugleiter'

PRINT 'Finished update to Version 1.8.4'