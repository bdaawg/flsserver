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
           (13,1,8,11,0
           ,'1.8.10.0'
           ,SYSUTCDATETIME())
GO

PRINT 'Add ERP articles table'
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Articles](
	[ArticleId] [uniqueidentifier] NOT NULL,
	[ClubId] [uniqueidentifier] NOT NULL,
	[ArticleNumber] [nvarchar](50) NOT NULL,
	[ArticleName] [nvarchar](250) NOT NULL,
	[ArticleInfo] [nvarchar](250) NULL,
	[Description] [nvarchar](MAX) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedByUserId] [uniqueidentifier] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedByUserId] [uniqueidentifier] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedByUserId] [uniqueidentifier] NULL,
	[RecordState] [int] NULL,
	[OwnerId] [uniqueidentifier] NOT NULL,
	[OwnershipType] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_Articles_ArticleNumber] UNIQUE NONCLUSTERED 
(
	[ArticleNumber] ASC,
	[ClubId] ASC,
	[DeletedOn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Club] FOREIGN KEY([ClubId])
REFERENCES [dbo].[Clubs] ([ClubId])
GO

ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Club]
GO

ALTER TABLE [dbo].[Articles] ADD  CONSTRAINT [UNIQUE_Articles_ArticleName] UNIQUE NONCLUSTERED 
(
	[ArticleName] ASC,
	[ClubId] ASC,
	[DeletedOn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO



PRINT 'Modify Clubs table'

ALTER TABLE [dbo].[Clubs]
	ADD [LastArticleSynchronisationOn] [datetime2](7) NULL
GO

PRINT 'Finished update to Version 1.8.11'