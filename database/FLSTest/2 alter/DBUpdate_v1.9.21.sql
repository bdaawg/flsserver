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
           (35,1,9,21,0
           ,'1.9.20.0'
           ,SYSUTCDATETIME())
GO

PRINT 'Add language settings to users and email templates table'
ALTER TABLE [dbo].[Users]
	ADD [LanguageId] [int] NOT NULL CONSTRAINT [DF__Users__LanguageId]  DEFAULT ((1))
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_User_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_User_Language]
GO

ALTER TABLE [dbo].[EmailTemplates]
	ADD [LanguageId] [int] NOT NULL CONSTRAINT [DF__EmailTemplates__LanguageId]  DEFAULT ((1))
GO

ALTER TABLE [dbo].[EmailTemplates]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplate_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO

ALTER TABLE [dbo].[EmailTemplates] CHECK CONSTRAINT [FK_EmailTemplate_Language]
GO

PRINT 'Finished update to Version 1.9.21'