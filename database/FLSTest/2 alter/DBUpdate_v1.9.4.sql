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
           (18,1,9,4,0
           ,'1.9.3.0'
           ,SYSUTCDATETIME())
GO


PRINT 'Make FlightTypeCodes unique'
CREATE UNIQUE NONCLUSTERED INDEX [UNIQUE_FlightTypes_ClubId_FlightTypeCode] ON [dbo].[FlightTypes]
(
	[ClubId] ASC,
	[FlightCode] ASC,
	[DeletedOn] ASC
)
WHERE ([FlightCode] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

PRINT 'Make ICAO codes unique'
CREATE UNIQUE NONCLUSTERED INDEX [UNIQUE_Locations_IcaoCode] ON [dbo].[Locations]
(
	[IcaoCode] ASC,
	[DeletedOn] ASC
)
WHERE ([IcaoCode] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
PRINT 'Finished update to Version 1.9.4'