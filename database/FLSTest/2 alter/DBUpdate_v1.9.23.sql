﻿USE [FLSTest]
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
           (37,1,9,23,0
           ,'1.9.22.0'
           ,SYSUTCDATETIME())
GO

PRINT 'Drop and create AircraftReservationTypes table'
ALTER TABLE [dbo].[AircraftReservations] 
	DROP CONSTRAINT [FK_dbo.AircraftReservations_dbo.AircraftReservationTypes_ReservationTypeId]
GO

DROP TABLE [dbo].[AircraftReservationTypes]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AircraftReservationTypes](
	[AircraftReservationTypeId] [uniqueidentifier] NOT NULL,
	[AircraftReservationTypeName] [nvarchar](100) NOT NULL,
	[IsInstructorRequired] [bit] NOT NULL CONSTRAINT [DF__AircraftReservationTypes__IsInstructorRequired]  DEFAULT ((0)),
	[IsMaintenance] [bit] NOT NULL CONSTRAINT [DF__AircraftReservationTypes__IsMaintenance]  DEFAULT ((0)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF__AircraftReservationTypes__IsActive]  DEFAULT ((1)),
	[Remarks] [nvarchar](max) NULL,
	[ClubId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedByUserId] [uniqueidentifier] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedByUserId] [uniqueidentifier] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedByUserId] [uniqueidentifier] NULL,
	[RecordState] [int] NULL,
	[OwnerId] [uniqueidentifier] NOT NULL,
	[OwnershipType] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AircraftReservationTypes] PRIMARY KEY CLUSTERED 
(
	[AircraftReservationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[AircraftReservationTypes]  WITH CHECK ADD  CONSTRAINT [FK_AircraftReservationTypes_Clubs_ClubId] FOREIGN KEY([ClubId])
REFERENCES [dbo].[Clubs] ([ClubId])
GO

ALTER TABLE [dbo].[AircraftReservationTypes] CHECK CONSTRAINT [FK_AircraftReservationTypes_Clubs_ClubId]
GO

PRINT 'Update AircraftReservations table'
ALTER TABLE [dbo].[AircraftReservations]
	ADD [AircraftReservationTypeId] [uniqueidentifier] NULL,
		[FlightTypeId] [uniqueidentifier] NULL,
		[SecondCrewPersonId] [uniqueidentifier] NULL
GO

ALTER TABLE [dbo].[AircraftReservations] DROP CONSTRAINT [FK_dbo.AircraftReservations_dbo.Persons_InstructorPersonId]
GO

ALTER TABLE [dbo].[AircraftReservations]  WITH CHECK ADD  CONSTRAINT [FK_AircraftReservations_AircraftReservationTypes_AircraftReservationTypeId] FOREIGN KEY([AircraftReservationTypeId])
REFERENCES [dbo].[AircraftReservationTypes] ([AircraftReservationTypeId])
GO

ALTER TABLE [dbo].[AircraftReservations] CHECK CONSTRAINT [FK_AircraftReservations_AircraftReservationTypes_AircraftReservationTypeId]
GO

ALTER TABLE [dbo].[AircraftReservations]  WITH CHECK ADD  CONSTRAINT [FK_AircraftReservations_FlightTypes_FlightTypeId] FOREIGN KEY([FlightTypeId])
REFERENCES [dbo].[FlightTypes] ([FlightTypeId])
GO

ALTER TABLE [dbo].[AircraftReservations] CHECK CONSTRAINT [FK_AircraftReservations_FlightTypes_FlightTypeId]
GO

ALTER TABLE [dbo].[AircraftReservations]  WITH CHECK ADD  CONSTRAINT [FK_AircraftReservations_Persons_SecondCrewPersonId] FOREIGN KEY([SecondCrewPersonId])
REFERENCES [dbo].[Persons] ([PersonId])
GO

ALTER TABLE [dbo].[AircraftReservations] CHECK CONSTRAINT [FK_AircraftReservations_Persons_SecondCrewPersonId]
GO

PRINT 'Update FlightTypes table'
ALTER TABLE [dbo].[FlightTypes]
	ADD [IsForAircraftReservationType] [bit] NOT NULL CONSTRAINT [DF__FlightTypes__IsForAircraftReservationType]  DEFAULT ((1))
GO

PRINT 'Update/Migrate data'
DECLARE @clubIdFGZO as uniqueidentifier
-- Club FGZO
SET @clubIdFGZO = (SELECT TOP 1 ClubId FROM [dbo].[Clubs] WHERE ClubKey = 'FGZO')

DECLARE @clubIdSGN as uniqueidentifier
-- Club SGN
SET @clubIdSGN = (SELECT TOP 1 ClubId FROM [dbo].[Clubs] WHERE ClubKey = 'SGN')

DECLARE @insertUserId as uniqueidentifier
DECLARE @ownerId as uniqueidentifier
DECLARE @recordState as bigint
DECLARE @insertClubId as uniqueidentifier
DECLARE @OwnershipType as bigint
DECLARE @flightTypeId as uniqueidentifier

SET @OwnershipType = 2 --Club
SET @insertUserId = (SELECT TOP 1 userId FROM Users where Username = 'fgzo')
SET @recordState = 1

SET @ownerId = @clubIdFGZO 

SET @flightTypeId = (SELECT TOP 1 FlightTypeId FROM [dbo].[FlightTypes] WHERE ClubId = @clubIdFGZO AND FlightCode = '68') --Schnupperflug-Gutschein

UPDATE [dbo].[Settings] SET SettingValue = CONCAT('"',@flightTypeId,'"'), ModifiedOn = SYSUTCDATETIME(), ModifiedByUserId = @insertUserId WHERE ClubId = @clubIdFGZO AND SettingKey = 'TrialFlight.AircraftReservation.FlightTypeId'
IF @@ROWCOUNT=0
    INSERT INTO [dbo].[Settings] ([SettingId] ,[ClubId] ,[SettingKey] ,[SettingValue] ,[IsPublic] ,[CreatedOn] ,[CreatedByUserId],[RecordState] ,[OwnerId] ,[OwnershipType]) VALUES (NEWID(), @clubIdFGZO, 'TrialFlight.AircraftReservation.FlightTypeId', CONCAT('"',@flightTypeId,'"'), 0, SYSUTCDATETIME(), @insertUserId, @recordState,@ownerId,@OwnershipType)

INSERT INTO [dbo].[Settings] ([SettingId] ,[ClubId] ,[SettingKey] ,[SettingValue] ,[IsPublic] ,[CreatedOn] ,[CreatedByUserId],[RecordState] ,[OwnerId] ,[OwnershipType])
 VALUES (NEWID(), @clubIdFGZO, 'TrialFlight.EventDates', '["2018-05-26T10:00:00","2018-06-16T10:00:00","2018-08-25T10:00:00","2018-09-15T10:00:00"]', 0, SYSUTCDATETIME(), @insertUserId, @recordState,@ownerId,@OwnershipType)

UPDATE [dbo].[AircraftReservations]
   SET [FlightTypeId] = (SELECT TOP 1 FlightTypeId FROM [dbo].[FlightTypes] WHERE FlightCode = '60' AND ClubId = @clubIdFGZO)
 WHERE ReservationTypeId = 1 AND ClubId = @clubIdFGZO


UPDATE [dbo].[AircraftReservations]
   SET [FlightTypeId] = (SELECT TOP 1 FlightTypeId FROM [dbo].[FlightTypes] WHERE FlightCode = '70' AND ClubId = @clubIdFGZO)
 WHERE ReservationTypeId = 2 AND ClubId = @clubIdFGZO


UPDATE [dbo].[AircraftReservations]
   SET [FlightTypeId] = (SELECT TOP 1 FlightTypeId FROM [dbo].[FlightTypes] WHERE FlightCode = '60' AND ClubId = @clubIdSGN)
 WHERE ReservationTypeId = 1 AND ClubId = @clubIdSGN


UPDATE [dbo].[AircraftReservations]
   SET [FlightTypeId] = (SELECT TOP 1 FlightTypeId FROM [dbo].[FlightTypes] WHERE FlightCode = '70' AND ClubId = @clubIdSGN)
 WHERE ReservationTypeId = 2 AND ClubId = @clubIdSGN
GO

UPDATE [dbo].[AircraftReservations]
   SET [SecondCrewPersonId] = [InstructorPersonId]
GO

UPDATE [dbo].[EmailTemplates]
SET [HtmlBody] = REPLACE([HtmlBody], 'InstructorName', 'SecondCrewName')
WHERE [EmailTemplateKeyName] in ('planningday-ok', 'planningday-cancel')

UPDATE [dbo].[EmailTemplates]
SET [HtmlBody] = REPLACE([HtmlBody], 'Fluglehrer', '2. Flugbesatzung')
WHERE [EmailTemplateKeyName] in ('planningday-ok', 'planningday-cancel')


PRINT 'Drop old columns'
ALTER TABLE [dbo].[AircraftReservations]
	DROP COLUMN [ReservationTypeId]
GO

ALTER TABLE [dbo].[AircraftReservations]
	DROP COLUMN [InstructorPersonId]
GO
PRINT 'Finished update to Version 1.9.23'