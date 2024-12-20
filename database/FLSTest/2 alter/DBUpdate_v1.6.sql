USE [FLSTest]
GO

ALTER TABLE [dbo].[FlightTypes] 
	ADD [IsCouponNumberRequired] [bit] NOT NULL default(0)
GO

ALTER TABLE [dbo].[Flights] 
	ADD [CouponNumber] [nvarchar](20) NULL
GO

UPDATE [dbo].Flights SET [CouponNumber] = [PaxGiftCouponNumber]
GO

ALTER TABLE [dbo].[Flights] 
	DROP COLUMN [PaxGiftCouponNumber]
GO

ALTER TABLE [dbo].[Clubs] 
	ADD [SendAircraftStatisticReportTo] [nvarchar](250) NULL,
	    [SendPlanningDayInfoMailTo] [nvarchar](250) NULL,
		[SendPlanningDayInfoMailToClubMembers] [bit] NOT NULL default(0),
		[SendInvoiceReportsTo] [nvarchar](250) NULL
GO

ALTER TABLE [dbo].[PersonClub]
	ADD [ReceiveFlightReports] [bit] NOT NULL default(1),
		[ReceiveAircraftReservationNotifications] [bit] NOT NULL default(1),
		[ReceivePlanningDayRoleReminder] [bit] NOT NULL default(1)
GO

ALTER TABLE [dbo].[Persons]
	ADD [ReceiveOwnedAircraftStatisticReports] [bit] NOT NULL default(1)
GO
