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
           (26,1,9,12,0
           ,'1.9.11.0'
           ,SYSUTCDATETIME())
GO

PRINT 'Redesign FlightStates'

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

INSERT [dbo].[FlightProcessStates] ([FlightProcessStateId], [FlightProcessStateName], [Comment], [CreatedOn]) VALUES (28, N'Ungültig', N'Flug wurde validiert, Angaben sind aber ungültig oder nicht plausibel', SYSUTCDATETIME())
GO

INSERT [dbo].[FlightProcessStates] ([FlightProcessStateId], [FlightProcessStateName], [Comment], [CreatedOn]) VALUES (30, N'Gültig', N'Flug wurde validiert und Angaben zum Flug sind gültig', SYSUTCDATETIME())
GO


UPDATE [dbo].[Flights] SET [ProcessStateId] = (CASE when [ProcessStateId] = 0 AND [ValidationStateId] > 0 THEN [ValidationStateId] ELSE [ProcessStateId] END)

ALTER TABLE [dbo].[Flights] DROP CONSTRAINT [DF__Flight__ValidationState]
GO

ALTER TABLE [dbo].[Flights] DROP CONSTRAINT [FK_Flights_FlightValidationStates]
GO

ALTER TABLE [dbo].[Flights]
	DROP COLUMN [ValidationStateId]
GO

DROP TABLE [dbo].[FlightValidationStates]
GO


PRINT 'Finished update to Version 1.9.12'