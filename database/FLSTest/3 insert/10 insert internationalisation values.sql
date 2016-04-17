USE [FLSTest]
GO

DELETE FROM [dbo].[LanguageTranslations];
GO

DECLARE @insertClubId as uniqueidentifier
-- System-Club
SET @insertClubId = 'A1DDE2CB-6326-4BB2-897D-7CFC118E842B'

DECLARE @OwnershipType as bigint
SET @OwnershipType = 0 --System 

DECLARE @insertUserId as uniqueidentifier
SET @insertUserId = '13731EE2-C1D8-455C-8AD1-C39399893FFF'

DECLARE @ownerId as uniqueidentifier
SET @ownerId = @insertClubId

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MASTERDATA', 'Stammdaten', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'RESERVATIONS', 'Reservationen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PLANNING', 'Planung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'FLIGHTS', 'Startliste', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LOCATIONS', 'Flugpl�tze', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CLUBS', 'Vereine', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PERSONS', 'Personen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'AIRCRAFTS', 'Flugzeuge', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'START_LOCATION', 'Startflugplatz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LANDING_LOCATION', 'Landeflugplatz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LOGOUT', 'Logout', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DATE', 'Datum', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LOCATION', 'Flugplatz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'REMARKS', 'Bemerkungen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'COMMENT', 'Kommentar', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'TOWING_PILOT', 'Schleppilot', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'TOWING_PLANE', 'Schleppflugzeug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'GLIDER_PILOT', 'Segelflugpilot', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CO_PILOT', 'Co-Pilot', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'GLIDER_PLANE', 'Segelflugzeug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'FLIGHT_OPERATOR', 'Segelflugleiter', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'TAKEOFF', 'Start', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LANDING', 'Landung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DURATION', 'Dauer', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'TOW_LANDING', 'Schlepp Landung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'GLIDER_LANDING', 'Segelflieger Landung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'START', 'Start', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'END', 'Ende', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DAY', 'Tag', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ALL_DAY', 'Ganztags', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IMMATRICULATION', 'Immatrikulation', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'AIRCRAFT_MODEL', 'Modell', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PILOT_NAME', 'Pilot', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'INSTRUCTOR_NAME', 'Instruktor', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'RESERVATION_TYPE', 'Reservationstyp', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SAVE', 'Speichern', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'OK', 'Ok', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CANCEL', 'Abbrechen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SETUP', 'Vorbereitung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'AIRCRAFT', 'Flugzeug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'INSTRUCTOR', 'Instruktor', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'OBSERVER', '�berwachender Pilot / Instruktor', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PILOT', 'Pilot', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PASSENGER', 'Passagier', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SECOND_CREW_MEMBER', 'Mit an Bord', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NUM_RESERVATIONS', 'Anzahl Reservationen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NEW', 'Neu', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NEW_PURGED', 'Neu (Leer)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'START_TYPE', 'Starttyp', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'FLIGHT_TYPE', 'Flugtyp', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DLG_ADD_NEW_PILOT', 'Neuer Pilot', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DLG_ADD_NEW_PERSON', 'Neue Person', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'FIRST_NAME', 'Vorname', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LAST_NAME', 'Nachname', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ADDRESS_LINE1', 'Strasse/Nr.', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ADDRESS_LINE2', 'Zusatz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ZIP_CODE', 'PLZ', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CITY', 'Stadt', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'COUNTRY', 'Land', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HAS_GLIDER_INSTRUCTOR_LICENCE', 'Segelfluglehrer Lizenz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HAS_GLIDER_PILOT_LICENCE', 'Segelflug Lizenz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HAS_GLIDER_TRAINEE_LICENCE', 'Segelflugsch�ler Lizenz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HAS_MOTOR_PILOT_LICENCE', 'Motorflug Lizenz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HAS_TOW_PILOT_LICENCE', 'Schlepp Lizenz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HAS_GLIDER_PASSENGER_LICENCE', 'Segelflug Passagier Lizenz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HAS_TMG_LICENCE', 'TMG Lizenz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HAS_WINCH_OPERATOR_LICENCE', 'Windenf�hrer Lizenz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'COST_BALANCE_TYPE', 'Kostenverteilung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'INVOICE_RECEIPIENT', 'Rechnungsempf�nger', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_SOLO_FLIGHT', 'Soloflug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NR_LANDINGS', 'Anz. Ldg', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'OUTBOUND_ROUTE', 'Outbound', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'INBOUND_ROUTE', 'Inbound', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'FROM_DATE', 'Von', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'TO_DATE', 'Bis', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'APPLY_FILTER', 'Filter Anwenden', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LOAD_FLIGHTS', 'Fl�ge laden', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ALL_TIME', 'Gesamter Zeitraum', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), '12_MONTHS', '12 Monate', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), '24_MONTHS', '24 Monate', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'TODAY', 'Heute', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MY_PROFILE', 'Mein Profil', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'USER', 'Benutzer', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'USERNAME', 'Benutzername', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PASSWORD', 'Passwort', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'OLD_PASSWORD', 'Aktuelles Passwort', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NEW_PASSWORD', 'Neues Passwort', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NEW_PASSWORD_CONFIRM', 'Neues Passwort best�tigen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'UPDATE_PASSWORD', 'Passwort aktualisieren', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'UPDATE_PERSON_DATA', 'Benutzerdaten aktualisieren', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'EMAIL_ADDRESS', 'Email Adresse', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MANUFACTURER_NAME', 'Hersteller', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'COMPETITION_SIGN', 'Wettbewerbszeichen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NUMBER_OF_SEATS', 'Anzahl Sitzpl�tze', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_TOWING_AIRCRAFT', 'Schleppflugzeug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_TOWING_OR_WINCH_REQUIRED', 'ben�tigt Schlepp', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_TOWING_START_ALLOWED', 'Flugzeugschlepp erlaubt', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_WINCH_START_ALLOWED', 'Windenstart erlaubt', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'COUPON_NUMBER', 'Gutschein-Nr.', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'RELOAD_MASTERDATA', 'Stammdaten neu laden', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LOCATION_NAME', 'Name', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LOCATION_TYPE', 'Typ', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ICAO_CODE', 'ICAO Code', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LENGTH_UNIT', 'L�ngeneinheit', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ELEVATION_UNIT', 'H�heneinheit', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'RUNWAY_LENGTH', 'Pistenl�nge', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'RUNWAY_DIRECTION', 'Pistenrichtung (Grad Himmelsrichtung)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'RUNWAY_ELEVATION', 'Pistenh�he', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DESCRIPTION', 'Beschreibung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LATITUDE', 'Breitengrad (e.g. 47.37639N)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LONGITUDE', 'L�ngengrad (e.g. 8.7575E)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'WARN_TOWFLIGHT_LONGER_THAN_GLIDERFLIGHT', 'ACHTUNG: Der eingegebene Schleppflug ist l�nger als der Segelflug!', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CLUB_NAME', 'Club Name', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CLUB_KEY', 'Club Schl�ssel', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CLUB_HOME_BASE', 'Club Flugplatz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'USERS', 'Benutzer', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'USER_NAME', 'Benutzername', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'FRIENDLY_USER_NAME', 'Benutzer Bezeichnung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PERSON_NAME', 'Person Name', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ROLES', 'Rollen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NOTIFICATION_EMAIL', 'Email Adresse f�r Benachrichtigungen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CONTACT', 'Kontakt', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ADDRESS', 'Adresse', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'EMAIL', 'Email Adresse', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PHONE_NUMBER', 'Telefonnummer', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'FAX_NUMBER', 'Fax', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'WEB_PAGE', 'Webseite', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DEFAULT_SETTINGS', 'Default Einstellungen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_INBOUND_ROUTE_REQUIRED', 'Inbound Route erforderlich', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_OUTBOUND_ROUTE_REQUIRED', 'Outbound Route erforderlich', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DEFAULT_GLIDER_FLIGHT_TYPE', 'Default Segelflug Typ', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DEFAULT_TOWING_FLIGHT_TYPE', 'Default Schleppflug Typ', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DEFAULT_MOTOR_FLIGHT_TYPE', 'Default Motorflug Typ', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'THIS_MONTH', 'Laufender Monat', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LAST_MONTH', 'Letzer Monat', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'YESTERDAY', 'Gestern', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CODE', 'Code', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NAME', 'Name', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_INSTRUCTOR_REQUIRED', 'Instruktor n�tig', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_OBSERVERPILOT_OR_INSTRUCTOR_REQUIRED', 'Instruktor oder Einweisungspilot n�tig', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_CHECKFLIGHT', 'Checkflug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_PASSENGERFLIGHT', 'Passagierflug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_SOLOFLIGHT', 'Soloflug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_FLIGHTCOSTBALANCE_SELECTABLE', 'Kostenverteilung w�hlbar', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_FOR_GLIDERFLIGHTS', 'f�r Segelfl�ge', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_FOR_MOTORFLIGHTS', 'f�r Motorfl�ge', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_FOR_TOWFLIGHTS', 'f�r Schleppfl�ge', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_SYSTEMFLIGHT', 'System Flug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_COUPONNUMBER_REQUIRED', 'Coupon n�tig', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'FLIGHT_TYPES', 'Flugtypen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LOST_PASSWORD', 'Passwort vergessen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LOST_PASSWORD_FORM_EXPLANATION', 'Bitte geben Sie entweder Ihren Benutzernamen oder die Email Adresse an um ein neues Passwort generieren zu lassen. Beachten Sie dass falls Sie mehrere Benutzer besitzen, und Ihre Angaben nicht eindeutig sind, alle gefundenen Benutzer ein neues Passwort bekommen werden.', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'GENERATE_NEW_PASSWORD', 'Neues Passwort generieren', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'USERNAME_OR_EMAIL', 'Benutzername oder Email Adresse', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'GENERATE_NEW_PASSWORD_SUCCEEDED', 'Das Passwort wurde zur�ckgesetzt. Sie sollten in den n�chsten Minuten ein Email mit dem entsprchenden Link erhalten.', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'AIRCRAFT_TYPE', 'Flugzeug Typ', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'AIRCRAFT_OWNER_CLUB', 'Inhaber (Club)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'AIRCRAFT_OWNER_PERSON', 'Inhaber (Privat)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'AIRCRAFT_SERIAL_NUMBER', 'Seriennummer', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'AIRCRAFT_YEAR_OF_MANUFACTURE', 'Herstellungsjahr', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'FLARM_ID', 'FLARM ID', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DEAC_INDEX', 'DEAC Index', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NOISE_CLASS', 'L�rmklasse', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NOISE_LEVEL', 'Noise Level', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MAXIMUM_TAKEOFF_MASS', 'Maximum Takeoff Mass (kg)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_CLUB_OWNED', 'Verein Inhaber', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_PRIVATELY_OWNED', 'Privater Inhaber', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MOBILE_NUMBER', 'Mobilnummer', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'COMPANY', 'Firma', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'BUSINESS_EMAIL_ADDRESS', 'Email Adresse (gesch�ftlich)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'BUSINESS_PHONE_NUMBER', 'Telefonnummer (gesch�ftlich)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LICENSE_NUMBER', 'Lizenznummer', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SPOT_LINK', 'Spot URL', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'TEST_LINK', 'Link testen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'RECEIVE_OWNED_AIRCRAFT_STATISTIC_REPORT', 'Statistiken zu den eigenen Flugzeugen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CLUB_MEMBER_NUMBER', 'Verein Mitgliednummer', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CLUB_MEMBER_KEY', 'Verein Mitgliedschl�ssel', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_GLIDER_INSTRUCTOR', 'Segelfluglehrer', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_GLIDER_PILOT', 'Segelflugpilot', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_GLIDER_TRAINEE', 'Segelflugsch�ler', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_MOTOR_PILOT', 'Motorflugpilot', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_PASSENGER', 'Passagier', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_TOW_PILOT', 'Schleppilot', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'IS_WINCH_OPERATOR', 'Windenf�hrer', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'RECEIVE_FLIGHT_REPORTS', 'Flug Statistiken', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'RECEIVE_AIRCRAFT_RESERVATION_NOTIFICATIONS', 'Notifikationen zu Reservationen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'RECEIVE_PLANNING_DAY_ROLE_REMINDER', 'Erinnerungen zu Planung der Einteilungen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'REGION', 'Region / Kanton', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MID_NAME', 'Zwischenname', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'USER_RELATED_PERSON', 'Zugeh�rige Person', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'USER_ACCOUNT_STATE', 'Benutzerkonto Status', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CLUB', 'Verein', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'STATUS', 'Status', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MY_DASHBOARD', 'Mein Dashboard', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MY_FLIGHTS', 'Meine Fl�ge', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MY_SAFETY_STATUS', 'Mein Safety Status', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MY_MEDICAL', 'Mein Medical', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'EXPIRES_AT', 'L�uft aus am', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MY_START_PERMISSIONS', 'Meine Starterlaubnis', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SAFETY_GREEN_TITLE', 'Gr�ner Bereich', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SAFETY_GREEN_SUBTITLE', 'Der �bungsstand ist gut - trotzdem Vorsicht!', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SAFETY_GREEN_DESCRIPTION', 'Ge�bte Piloten machten folgende Fehler <ul> <li>Segelflugzeug fehlerhaft ausger�stet</li><li>mangelhafter Cockpitcheck</li><li>Fehlverhalten bei Startunterbrechungen</li><li>Fehler bei der Landeeinteilung (vor allem bei Au�enlandungen)</li></ul>', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SAFETY_YELLOW_TITLE', 'Gelber Bereich', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SAFETY_YELLOW_SUBTITLE', 'Mehr �bung k�nnte nicht schaden - Unerwartete Ereignisse k�nnen gef�hrlich werden!', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SAFETY_YELLOW_DESCRIPTION', 'Vorsicht ist geboten beim Start <ul> <li>in unbekannten Landschaftsregionen (z.B. Alpen)</li> <li>auf unbekannten Fluggel�nden</li><li>auf selten geflogenen Flugzeugmustern</li><li>in einer selten durchgef�hrten Startart</li> </ul>', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SAFETY_RED_TITLE', 'Roter Bereich', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SAFETY_RED_SUBTITLE', '�bung tut Not - Fliegen kann zum Risiko werden!', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SAFETY_RED_DESCRIPTION', 'F�r unge�bte Piloten gilt: <ul> <li>die ersten Starts nach einer l�ngeren Pause nur mit vertrauten Mustern und bei unkritischen Wetterlagen durchf�hren</li> <li>falls der letzte Start mehr als drei Monate zur�ck liegt, ist Training mit einem Fluglehrer der beste Weg zu einem guten �bungsstand</li> </ul>', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'AIR_MOVEMENTS', 'Luftbewegungen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'GLIDER_STARTLIST', 'Segelflug Startliste', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MOTOR_PLANE', 'Motorflugzeug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SYSTEM', 'System', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LOGS', 'Logs', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'AIRPLANE', 'Flugzeug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MOTOR_MOVEMENTS', 'Motorflug Bewegungen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'COMMUNICATION', 'Kommunikation', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LICENSE', 'Lizenz', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HAS_GLIDER_TOWING_START_PERMISSION', 'Schleppstart Zulassung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HAS_GLIDER_SELF_START_PERMISSION', 'Eigenstart Zulassung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HAS_GLIDER_WINCH_START_PERMISSION', 'Windenstart Zulassung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CLUB_SETTINGS', 'Club Einstellungen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NOTIFICATION_SETTINGS', 'Notifikationseinstellungen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MEDICAL_CLASS1_EXPIRE_DATE', 'Medical Class 1 G�ltigkeit bis', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MEDICAL_CLASS2_EXPIRE_DATE', 'Medical Class 2 G�ltigkeit bis', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MEDICAL_LAPL_EXPIRE_DATE', 'Medical LAPL G�ltigkeit bis', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'BLOCK_TIME_BEGIN', 'Beginn Blockzeit', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'BLOCK_TIME_END', 'Ende Blockzeit', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'BLOCK_TIME_DURATION', 'Blockzeit', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ENGINE_MINUTES_BEGIN', 'Beginn Motorz�hlerst. (hhhh:mm)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ENGINE_MINUTES_END', 'Ende Motorz�hlerst. (hhhh:mm)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ENGINE_MINUTES_DURATION', 'Motorlaufzeit', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LAST_ENGINE_TIME', 'Letzer Z�hlerstand', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'ERROR_NO_CORRESPONDING_PERSON', 'Der Benutzer "{{user}}" hat keine zugewiesene Person, weshalb keine Statistiken angezeigt werden.', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SEND_AIRCRAFT_STATISTIC_REPORT_TO', 'Flugzeug Statistik an (Email)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SEND_PLANNING_DAY_INFO_MAIL_TO', 'Planungstage Informationen an (Email)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SEND_INVOICE_REPORTS_TO', 'Rechnungs-Informationen an (Email)', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'TECHNICAL_DATA', 'Technische Daten', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
	 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'OPERATIONAL_DATA', 'Betriebliche Daten', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
	 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'HISTORY_OF', 'Historie von ', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
	 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MODIFICATION', 'Ver�nderung', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
	 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CLOSE', 'Schliessen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
	 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PLANNINGDAY', 'Planungs-Tag', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
	 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'FLIGHT', 'Flug', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
	 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PERSON', 'Person', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
	 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'FLIGHTTYPE', 'Flugtyp', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
	 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'RESERVATION', 'Reservation', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
	 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'TIME', 'Zeit', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
	 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'GLIDER_INSTRUCTOR_LICENCE_EXPIRE_DATE', 'Segelfluglehrer Lizenz G�ltigkeit bis', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'WINCH_OPERATOR', 'Windenf�hrer', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CHOOSE_PASSWORD', 'Passwort w�hlen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PASSWORD_CONFIRM', 'Passwort best�tigen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SET_PASSWORD', 'Passwort setzen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'CHOOSE_PASSWORD_FORM_EXPLANATION', 'Bitte geben sie ihr neues Passwort ein, um den Benutzer zu aktivieren.', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'PASSWORD_MISMATCH', 'Die eingegebenen Passw�rter stimmen nicht �berein.', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'LANDED', 'gelandet', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'AIRBORN', 'in der Luft', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'WAITING', 'wartend', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'COPY', 'Kopieren', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SHOW_HISTORY', 'Historie anzeigen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)
 
INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'DELETE', 'L�schen', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'EDIT', 'Bearbeiten', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'NR_OF_PASSENGERS', 'Anzahl Passagiere', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'SEATS_INSUFFICIENT', 'Zu wenig Sitzpl�tze', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'MINIMUM_NUMBER_OF_SEATS_REQUIRED', 'Mninimale Anzahl Sitzpl�tze', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

INSERT INTO [dbo].[LanguageTranslations] ([LanguageTranslationId], [TranslationKey], [TranslationValue], [LanguageId], [CreatedOn], [CreatedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted]) 
     VALUES (NEWID(), 'BIRTHDAY', 'Geburtstag', 1, SYSDATETIME(), @insertUserId, 1, @ownerId, @OwnerShipType, 0)

GO


