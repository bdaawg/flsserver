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
           (33,1,9,19,0
           ,'1.9.18.0'
           ,SYSUTCDATETIME())
GO

PRINT 'Extend Accounting rule filters table'

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[AccountingRuleFilters]
	ADD [UseRuleForAllAircraftsOnHomebaseExceptListed] [bit] NOT NULL CONSTRAINT [DF__AccountingRuleFilters__UseRuleForAllAircraftsOnHomebase]  DEFAULT ((1)),
	[MatchedAircraftsHomebase] [nvarchar](max) NULL,
	[UseRuleForAllMemberStatesExceptListed] [bit] NOT NULL CONSTRAINT [DF__AccountingRuleFilters__UseRuleForAllMemberStates]  DEFAULT ((1)),
	[MatchedMemberStates] [nvarchar](max) NULL,
	[UseRuleForAllPersonCategoriesExceptListed] [bit] NOT NULL CONSTRAINT [DF__AccountingRuleFilters__UseRuleForAllPersonCategories]  DEFAULT ((1)),
	[MatchedPersonCategories] [nvarchar](max) NULL
GO


PRINT 'Finished update to Version 1.9.19'