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
           (36,1,9,22,0
           ,'1.9.21.0'
           ,SYSUTCDATETIME())
GO

PRINT 'Simplify language translation table'
ALTER TABLE [dbo].[LanguageTranslations]
	DROP COLUMN [CreatedByUserId],[ModifiedByUserId],[DeletedOn],[DeletedByUserId],[RecordState],[OwnerId],[OwnershipType],[IsDeleted]
GO

PRINT 'Add settings table'
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Settings](
	[SettingId] [uniqueidentifier] NOT NULL,
	[ClubId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[SettingKey] [nvarchar](250) NOT NULL,
	[SettingValue] [nvarchar](max) NULL,
	[IsPublic] [bit] NOT NULL CONSTRAINT [DF__Settings__IsPublic] DEFAULT ((0)),
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedByUserId] [uniqueidentifier] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedByUserId] [uniqueidentifier] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedByUserId] [uniqueidentifier] NULL,
	[RecordState] [int] NULL,
	[OwnerId] [uniqueidentifier] NOT NULL,
	[OwnershipType] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Settings__IsDeleted] DEFAULT ((0)),
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_Settings_SettingKey] UNIQUE NONCLUSTERED 
(
	[SettingKey] ASC,
	[ClubId] ASC,
	[UserId] ASC,
	[DeletedOn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_Club] FOREIGN KEY([ClubId])
REFERENCES [dbo].[Clubs] ([ClubId])
GO

ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_Settings_Club]
GO

ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_Settings_User]
GO

PRINT 'Finished update to Version 1.9.22'