USE [FLSTest]
GO

DROP TABLE [dbo].[AircraftReservations]
DROP TABLE [dbo].[AircraftReservationTypes]

/****** Object:  Table [dbo].[AircraftReservations]    Script Date: 28.12.2014 13:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AircraftReservations](
	[AircraftReservationId] [uniqueidentifier] NOT NULL,
	[Start] [datetime2](7) NOT NULL,
	[End] [datetime2](7) NOT NULL,
	[IsAllDayReservation] [bit] NOT NULL,
	[AircraftId] [uniqueidentifier] NOT NULL,
	[LocationId] [uniqueidentifier] NOT NULL,
	[PilotPersonId] [uniqueidentifier] NOT NULL,
	[InstructorPersonId] [uniqueidentifier] NULL,
	[ReservationTypeId] [int] NOT NULL,
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
 CONSTRAINT [PK_dbo.AircraftReservations] PRIMARY KEY CLUSTERED 
(
	[AircraftReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AircraftReservationTypes]    Script Date: 28.12.2014 13:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AircraftReservationTypes](
	[AircraftReservationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[AircraftReservationTypeName] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
 CONSTRAINT [PK_dbo.AircraftReservationTypes] PRIMARY KEY CLUSTERED 
(
	[AircraftReservationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[AircraftReservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AircraftReservations_dbo.AircraftReservationTypes_ReservationTypeId] FOREIGN KEY([ReservationTypeId])
REFERENCES [dbo].[AircraftReservationTypes] ([AircraftReservationTypeId])
GO
ALTER TABLE [dbo].[AircraftReservations] CHECK CONSTRAINT [FK_dbo.AircraftReservations_dbo.AircraftReservationTypes_ReservationTypeId]
GO
ALTER TABLE [dbo].[AircraftReservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AircraftReservations_dbo.Aircrafts_AircraftId] FOREIGN KEY([AircraftId])
REFERENCES [dbo].[Aircrafts] ([AircraftId])
GO
ALTER TABLE [dbo].[AircraftReservations] CHECK CONSTRAINT [FK_dbo.AircraftReservations_dbo.Aircrafts_AircraftId]
GO
ALTER TABLE [dbo].[AircraftReservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AircraftReservations_dbo.Persons_InstructorPersonId] FOREIGN KEY([InstructorPersonId])
REFERENCES [dbo].[Persons] ([PersonId])
GO
ALTER TABLE [dbo].[AircraftReservations] CHECK CONSTRAINT [FK_dbo.AircraftReservations_dbo.Persons_InstructorPersonId]
GO
ALTER TABLE [dbo].[AircraftReservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AircraftReservations_dbo.Persons_PilotPersonId] FOREIGN KEY([PilotPersonId])
REFERENCES [dbo].[Persons] ([PersonId])
GO
ALTER TABLE [dbo].[AircraftReservations] CHECK CONSTRAINT [FK_dbo.AircraftReservations_dbo.Persons_PilotPersonId]
GO
ALTER TABLE [dbo].[AircraftReservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AircraftReservations_dbo.Clubs_ClubId] FOREIGN KEY([ClubId])
REFERENCES [dbo].[Clubs] ([ClubId])
GO
ALTER TABLE [dbo].[AircraftReservations] CHECK CONSTRAINT [FK_dbo.AircraftReservations_dbo.Clubs_ClubId]
GO
ALTER TABLE [dbo].[AircraftReservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AircraftReservations_dbo.Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[AircraftReservations] CHECK CONSTRAINT [FK_dbo.AircraftReservations_dbo.Locations_LocationId]
GO
