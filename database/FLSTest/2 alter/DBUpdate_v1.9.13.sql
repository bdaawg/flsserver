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
           (27,1,9,13,0
           ,'1.9.12.0'
           ,SYSUTCDATETIME())
GO

PRINT 'Redesign Clubs table'

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[Clubs]
	ADD [SendTrialFlightRegistrationOperatorEmailTo] [nvarchar](250) NULL
GO

PRINT 'Finished update to Version 1.9.13'