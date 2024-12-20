USE [FLS]
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
           (9,1,8,7,0
           ,'1.8.6.0'
           ,SYSUTCDATETIME())
GO

PRINT 'Modify systemdata table'

ALTER TABLE [dbo].[SystemData]
	ADD [TestmodeEmailPickupDirectory] [nvarchar](100) NULL
GO

ALTER TABLE [dbo].[SystemData]
	DROP COLUMN [TestmodeRecipientEmailAddresses]
GO

PRINT 'Finished update to Version 1.8.7'