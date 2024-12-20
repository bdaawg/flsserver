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
           (15,1,9,1,0
           ,'1.9.0.0'
           ,SYSUTCDATETIME())
GO

PRINT 'Modify PersonClub table'

ALTER TABLE [dbo].[PersonClub] DROP CONSTRAINT [UNIQUE_PersonClub_PersonId_ClubId_MemberKey]
GO

ALTER TABLE [dbo].[PersonClub]
	DROP COLUMN [MemberKey]
GO

PRINT 'Redesign FlightStates'

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FlightAirStates](
	[FlightAirStateId] [int] NOT NULL,
	[FlightAirStateName] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](200) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
 CONSTRAINT [PK_FlightAirStates] PRIMARY KEY CLUSTERED 
(
	[FlightAirStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[FlightValidationStates](
	[FlightValidationStateId] [int] NOT NULL,
	[FlightValidationStateName] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](200) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
 CONSTRAINT [PK_FlightValidationStates] PRIMARY KEY CLUSTERED 
(
	[FlightValidationStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[FlightProcessStates](
	[FlightProcessStateId] [int] NOT NULL,
	[FlightProcessStateName] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](200) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
 CONSTRAINT [PK_FlightProcessStates] PRIMARY KEY CLUSTERED 
(
	[FlightProcessStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


INSERT [dbo].[FlightAirStates] ([FlightAirStateId], [FlightAirStateName], [Comment], [CreatedOn]) VALUES (0, N'Neu', N'Neuer Flug / Noch nicht gestartet', SYSUTCDATETIME())
GO
INSERT [dbo].[FlightAirStates] ([FlightAirStateId], [FlightAirStateName], [Comment], [CreatedOn]) VALUES (5, N'Flugplan eröffnet', N'Flugplan eröffnet', SYSUTCDATETIME())
GO
INSERT [dbo].[FlightAirStates] ([FlightAirStateId], [FlightAirStateName], [Comment], [CreatedOn]) VALUES (10, N'Gestartet', N'Flugzeug gestartet / in der Luft', SYSUTCDATETIME())
GO
INSERT [dbo].[FlightAirStates] ([FlightAirStateId], [FlightAirStateName], [Comment], [CreatedOn]) VALUES (20, N'Gelandet', N'Flugzeug gelandet', SYSUTCDATETIME())
GO
INSERT [dbo].[FlightAirStates] ([FlightAirStateId], [FlightAirStateName], [Comment], [CreatedOn]) VALUES (25, N'Geschlossen', N'Flug/Flugplan geschlossen', SYSUTCDATETIME())
GO

INSERT [dbo].[FlightValidationStates] ([FlightValidationStateId], [FlightValidationStateName], [Comment], [CreatedOn]) VALUES (0, N'Nicht validiert', N'Flug wurde noch nicht validiert', SYSUTCDATETIME())
GO
INSERT [dbo].[FlightValidationStates] ([FlightValidationStateId], [FlightValidationStateName], [Comment], [CreatedOn]) VALUES (28, N'Ungültig', N'Flug wurde validiert, Angaben sind aber ungültig oder nicht plausibel', SYSUTCDATETIME())
GO
INSERT [dbo].[FlightValidationStates] ([FlightValidationStateId], [FlightValidationStateName], [Comment], [CreatedOn]) VALUES (30, N'Gültig', N'Flug wurde validiert und Angaben zum Flug sind gültig', SYSUTCDATETIME())
GO

INSERT [dbo].[FlightProcessStates] ([FlightProcessStateId], [FlightProcessStateName], [Comment], [CreatedOn]) VALUES (0, N'Kein Prozess gelaufen', N'Für diesen Flug war noch kein Prozess gelaufen', SYSUTCDATETIME())
GO
INSERT [dbo].[FlightProcessStates] ([FlightProcessStateId], [FlightProcessStateName], [Comment], [CreatedOn]) VALUES (40, N'Gesperrt', N'Flug kann nicht mehr editiert werden und ist für Verrechnung bereit', SYSUTCDATETIME())
GO
INSERT [dbo].[FlightProcessStates] ([FlightProcessStateId], [FlightProcessStateName], [Comment], [CreatedOn]) VALUES (50, N'Verrechnet', N'Flug wurde verrechnet und kann nicht mehr editiert werden', SYSUTCDATETIME())
GO
INSERT [dbo].[FlightProcessStates] ([FlightProcessStateId], [FlightProcessStateName], [Comment], [CreatedOn]) VALUES (55, N'Teilweise bezahlt', N'Flug wurde verrechnet und einen Teil der Rechnung(en) wurde bezahlt.', SYSUTCDATETIME())
GO
INSERT [dbo].[FlightProcessStates] ([FlightProcessStateId], [FlightProcessStateName], [Comment], [CreatedOn]) VALUES (60, N'Bezahlt', N'Flug wurde bezahlt.', SYSUTCDATETIME())
GO


ALTER TABLE [dbo].[Flights]
	ADD [AirStateId] [int]  CONSTRAINT [DF__Flight__AirState] DEFAULT((0)) NOT NULL,
		[ValidationStateId] [int]  CONSTRAINT [DF__Flight__ValidationState] DEFAULT((0)) NOT NULL,
		[ProcessStateId] [int]  CONSTRAINT [DF__Flight__ProcessState] DEFAULT((0)) NOT NULL,
		[ValidationErrors] [nvarchar](max) NULL
GO

ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_Flights_FlightAirStates] FOREIGN KEY([AirStateId])
REFERENCES [dbo].[FlightAirStates] ([FlightAirStateId])
GO

ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_Flights_FlightAirStates]
GO


ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_Flights_FlightValidationStates] FOREIGN KEY([ValidationStateId])
REFERENCES [dbo].[FlightValidationStates] ([FlightValidationStateId])
GO

ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_Flights_FlightValidationStates]
GO


ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_Flights_FlightProcessStates] FOREIGN KEY([ProcessStateId])
REFERENCES [dbo].[FlightProcessStates] ([FlightProcessStateId])
GO

ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_Flights_FlightProcessStates]
GO

UPDATE [dbo].[Flights] SET [AirStateId] = (CASE when FlightState <=25 THEN FlightState ELSE (CASE WHEN FlightState >= 30 THEN 25 ELSE (CASE WHEN LdgDateTime IS NOT NULL THEN 20 ELSE (CASE WHEN StartDateTime IS NOT NULL THEN 10 ELSE 0 END) END) END) END)
UPDATE [dbo].[Flights] SET [ValidationStateId] = (CASE when FlightState < 28 THEN 0 ELSE (CASE WHEN FlightState = 28 THEN 28 ELSE 30 END) END)
UPDATE [dbo].[Flights] SET [ProcessStateId] = (CASE when FlightState >= 40 THEN FlightState ELSE 0 END)


ALTER TABLE [dbo].[Flights] DROP CONSTRAINT [FK_Flights_FlightStates]
GO

ALTER TABLE [dbo].[Flights]
	DROP COLUMN [FlightState]
GO

DROP TABLE [dbo].[FlightStates]
GO


PRINT 'Finished update to Version 1.9.1'