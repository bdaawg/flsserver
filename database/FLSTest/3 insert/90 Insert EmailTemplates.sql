USE [FLSTest]
GO

DELETE FROM [dbo].[EmailTemplates];

INSERT [dbo].[EmailTemplates] ([EmailTemplateId], [ClubId], [EmailTemplateName], [EmailTemplateKeyName], [Description], [FromAddress], [ReplyToAddresses], [Subject], [IsSystemTemplate], [CreatedOn], [CreatedByUserId], [ModifiedOn], [ModifiedByUserId], [DeletedOn], [DeletedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted], [HtmlBody], [TextBody]) 
VALUES (NEWID(), NULL, N'User lost password reset email', N'lostpassword', N'New password reset token link', N'fls@glider-fls.ch', N'noreply@glider-fls.ch',
 N'Passwort-Reset für Flight Logging System Zugang', 1, SYSUTCDATETIME(), N'13731ee2-c1d8-455c-8ad1-c39399893fff', NULL, NULL, NULL, NULL, 1, N'a1dde2cb-6326-4bb2-897d-7cfc118e842b', 2, 0, 
N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-gb" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Passwort-Reset für FLS</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 14px;
}
</style>
</head>

<body>
<p>
Hallo $LostPasswordResetModel.RecipientName
</p>
<p>
Du hast ein Passwort-Reset vom Flight Logging System angefordert. Falls du dieses Email unerwartet erhalten hast, dann sende bitte ein Email an $LostPasswordResetModel.UnexpectedReturnAddress damit wir die Sicherheit deines Accounts gewährleisten können.
</p>
<p>
Mit <a href=$LostPasswordResetModel.LostPasswordResetUrl>diesem Link</a> kannst du dein Passwort für das Flight Logging System zurücksetzen.
</p>

<p>Herzliche Grüsse</p>
<p>Flight Logging System</p>

</body>

</html>
', NULL)
GO

INSERT [dbo].[EmailTemplates] ([EmailTemplateId], [ClubId], [EmailTemplateName], [EmailTemplateKeyName], [Description], [FromAddress], [ReplyToAddresses], [Subject], [IsSystemTemplate], [CreatedOn], [CreatedByUserId], [ModifiedOn], [ModifiedByUserId], [DeletedOn], [DeletedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted], [HtmlBody], [TextBody]) 
VALUES (N'b5c04ee0-53ce-4ff3-bd88-63d37a3d815b', NULL, N'Flight Report', N'flightreport', N'Flight report about todays flights', N'fls@glider-fls.ch', N'noreply@glider-fls.ch', N'Flug-Informationen vom $FlightInfoModel.Date', 1, CAST(N'2016-01-31 15:01:22.0652718' AS DateTime2), N'13731ee2-c1d8-455c-8ad1-c39399893fff', NULL, NULL, NULL, NULL, 1, N'a1dde2cb-6326-4bb2-897d-7cfc118e842b', 2, 0, N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-gb" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Deine Flüge</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 14px;
}
.datagrid table { border-collapse: collapse; text-align: left; width: 100%; }
.datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #006699; }
.datagrid table td, 
.datagrid table th { padding: 3px 10px; }
.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#006699'', endColorstr=''#00557F'');background-color:#006699; color:#ffffff; font-size: 15px; font-weight: bold; border-left: 1px solid #0070A8; } 
.datagrid table thead th:first-child { border: none; }
.datagrid table tbody td { color: #00496B; border-left: 1px solid #E1EEF4;font-size: 12px;font-weight: normal; }
.datagrid table tbody .alt td { background: #E1EEF4; color: #00496B; }
.datagrid table tbody td:first-child { border-left: none; }
.datagrid table tbody tr:last-child td { border-bottom: none; }
</style>
</head>

<body>
<p>
Hallo $FlightInfoModel.RecipientName
</p>
<p>
Die nachfolgende Tabelle zeigt deine Flüge vom $FlightInfoModel.Date. (Details dazu unter <a href="$FlightInfoModel.FLSUrl">$FlightInfoModel.FLSUrl</a>)</p>

<div class="datagrid">
<table>
    <thead>
        <tr>
            <th>Datum</th>
            <th>Segelflugzeug</th>
            <th>Pilot</th>
            <th>Startart</th>
            <th>Flugart</th>
            <th>Soloflug</th>
            <th>Startort</th>
            <th>Landeort</th>
            <th>Start</th>
            <th>Landung</th>
            <th>Dauer</th>
            <th>2. Flugbesatzung</th>
            <th>Bemerkungen</th>
            <th>Schleppflugzeug</th>
            <th>Schleppilot</th>
            <th>Start (Schlepp)</th>
            <th>Landung (Schlepp)</th>
            <th>Dauer (Schlepp)</th>
        </tr>
    </thead>
    <tbody>

    #foreach($flight in $FlightInfoModel.Flights)

        <tr 
        #if( $velocityCount%2 == 0 )
        class="alt"
        #end
        >
            <td>$!flight.FlightDate</td>
            <td>$!flight.AircraftImmatriculation</td>
            <td>$!flight.PilotName</td>
            <td>$!flight.StartType</td>
            <td>$!flight.FlightTypeName</td>
            <td>$!flight.IsSoloFlight</td>
            <td>$!flight.StartLocation</td>
            <td>$!flight.LdgLocation</td>
            <td>$!flight.StartTimeLocal</td>
            <td>$!flight.LdgTimeLocal</td>
            <td>$!flight.FlightDuration</td>
            <td>$!flight.SecondCrewName</td>
            <td>$!flight.FlightComment</td>
            <td>$!flight.TowAircraftImmatriculation</td>
            <td>$!flight.TowPilotName</td>
            <td>$!flight.TowStartTimeLocal</td>
            <td>$!flight.TowLdgTimeLocal</td>
            <td>$!flight.TowFlightDuration</td>
        </tr>

    #end
    
</tbody>
</table>
</div>

<p>Herzliche Grüsse</p>
<p>Flight Logging System</p>

</body>

</html>
', NULL)
GO
INSERT [dbo].[EmailTemplates] ([EmailTemplateId], [ClubId], [EmailTemplateName], [EmailTemplateKeyName], [Description], [FromAddress], [ReplyToAddresses], [Subject], [IsSystemTemplate], [CreatedOn], [CreatedByUserId], [ModifiedOn], [ModifiedByUserId], [DeletedOn], [DeletedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted], [HtmlBody], [TextBody]) VALUES (N'5c0efadc-a24d-406f-acff-66858952ad07', NULL, N'Aircraft Statistic Report', N'aircraftstatisticreport', N'Aircraft statistic report for CAMO with flight statistic data of last month', N'fls@glider-fls.ch', N'noreply@glider-fls.ch', N'Flugzeug-Statistik-Report', 1, CAST(N'2016-01-31 15:01:22.0332710' AS DateTime2), N'13731ee2-c1d8-455c-8ad1-c39399893fff', NULL, NULL, NULL, NULL, 1, N'a1dde2cb-6326-4bb2-897d-7cfc118e842b', 2, 0, N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-gb" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Flugzeug-Statistik</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 14px;
}
.datagrid table { border-collapse: collapse; text-align: left; width: 100%; }
.datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #006699; }
.datagrid table td, 
.datagrid table th { padding: 3px 10px; }
.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#006699'', endColorstr=''#00557F'');background-color:#006699; color:#ffffff; font-size: 15px; font-weight: bold; border-left: 1px solid #0070A8; } 
.datagrid table thead th:first-child { border: none; }
.datagrid table tbody td { color: #00496B; border-left: 1px solid #E1EEF4;font-size: 12px;font-weight: normal; }
.datagrid table tbody .alt td { background: #E1EEF4; color: #00496B; }
.datagrid table tbody td:first-child { border-left: none; }
.datagrid table tbody tr:last-child td { border-bottom: none; }
</style>
</head>

<body>
<p>
Hallo $!EmailAircraftFlightReport.RecipientName
</p>
<p>
Die nachfolgende Tabelle zeigt die Statistik der Flugzeuge für die Flüge zwischen $EmailAircraftFlightReport.FilterCriteria.StatisticStartDateTime und $EmailAircraftFlightReport.FilterCriteria.StatisticEndDateTime. (Details dazu unter <a href="$EmailAircraftFlightReport.FLSUrl">$EmailAircraftFlightReport.FLSUrl</a>)</p>

<div class="datagrid">
<table>
    <thead>
        <tr>
            <th>Segelflugzeug</th>
            <th align="right">Total Flugzeit</th>
			<th align="right">Total Motorlaufzeit</th>
			<th align="right">Total Anzahl Starts</th>
            <th align="right">Anzahl Schleppstarts</th>
            <th align="right">Anzahl Windenstarts</th>
            <th align="right">Anzahl Eigenstarts</th>
			<th align="right">Anzahl Motorflugstarts</th>
            <th align="right">Anzahl Starts unbekannter Startart</th>
        </tr>
    </thead>
    <tbody>

    #foreach($flight in $EmailAircraftFlightReport.AircraftFlightReportData)

        <tr 
        #if( $velocityCount%2 == 0 )
        class="alt"
        #end
        >
            <td>$flight.AircraftImmatriculation</td>
            <td align="right">$flight.FlightDurationString</td>
			<td align="right">$flight.EngineDurationString</td>
			<td align="right">$flight.NumberOfAllStarts</td>
            <td align="right">$flight.NumberOfTowingStarts</td>
            <td align="right">$flight.NumberOfWinchStarts</td>
            <td align="right">$flight.NumberOfSelfStarts</td>
			<td align="right">$flight.NumberOfMotorflightStarts</td>
            <td align="right">$flight.NumberOfStartsOfUnknownType</td>
        </tr>

    #end
    
</tbody>
</table>
</div>

<p>Herzliche Grüsse</p>
<p>Flight Logging System</p>

</body>

</html>
', NULL)
GO
INSERT [dbo].[EmailTemplates] ([EmailTemplateId], [ClubId], [EmailTemplateName], [EmailTemplateKeyName], [Description], [FromAddress], [ReplyToAddresses], [Subject], [IsSystemTemplate], [CreatedOn], [CreatedByUserId], [ModifiedOn], [ModifiedByUserId], [DeletedOn], [DeletedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted], [HtmlBody], [TextBody]) 
VALUES (N'2ba4ed5f-056b-4f15-b8e6-ba47061d32c2', NULL, N'Planning day ok email', N'planningday-ok', N'Planning day will take place', N'fls@glider-fls.ch', N'noreply@glider-fls.ch', N'Flugtag vom $PlanningDayInfoModel.Date in $PlanningDayInfoModel.LocationName findet statt', 1, CAST(N'2016-01-31 15:01:22.2332820' AS DateTime2), N'13731ee2-c1d8-455c-8ad1-c39399893fff', NULL, NULL, NULL, NULL, 1, N'a1dde2cb-6326-4bb2-897d-7cfc118e842b', 2, 0, N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-gb" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Flugtag vom $PlanningDayInfoModel.Date in $PlanningDayInfoModel.LocationName findet statt</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 14px;
}
.datagrid table { border-collapse: collapse; text-align: left; width: 100%; }
.datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #006699; }
.datagrid table td, 
.datagrid table th { padding: 3px 10px; }
.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#006699'', endColorstr=''#00557F'');background-color:#006699; color:#ffffff; font-size: 15px; font-weight: bold; border-left: 1px solid #0070A8; } 
.datagrid table thead th:first-child { border: none; }
.datagrid table tbody td { color: #00496B; border-left: 1px solid #E1EEF4;font-size: 12px;font-weight: normal; }
.datagrid table tbody .alt td { background: #E1EEF4; color: #00496B; }
.datagrid table tbody td:first-child { border-left: none; }
.datagrid table tbody tr:last-child td { border-bottom: none; }
</style>
</head>

<body>
<p>
Hallo zusammen...
</p>
<p>
Der Flugtag vom $PlanningDayInfoModel.Date in $PlanningDayInfoModel.LocationName findet statt (sofern das Wetter dann auch noch mitspielt).
</p>
<p>
Eingeteilter Flugdienstleiter: $!PlanningDayInfoModel.FlightOperatorName<br>
Eingeteilter Schlepppilot: $!PlanningDayInfoModel.TowPilotName<br><br>
Eingeteilter Segelfluglehrer: $!PlanningDayInfoModel.InstructorName<br><br>
Bemerkungen: $!PlanningDayInfoModel.Remarks
</p>

Flugzeugreservationen:
<div class="datagrid">
<table>
    <thead>
        <tr>
            <th>Flugzeug</th>
            <th>Pilot</th>
            <th>Reservations-Typ</th>
            <th>Reservations-Zeit</th>
            <th>Fluglehrer</th>
        </tr>
    </thead>
    <tbody>

    #foreach($reservation in $PlanningDayInfoModel.AircraftReservations)

        <tr 
        #if( $velocityCount%2 == 0 )
        class="alt"
        #end
        >
            <td>$reservation.AircraftImmatriculation</td>
            <td>$reservation.PilotName</td>
            <td>$reservation.ReservationTypeName</td>
			<td>$reservation.ReservationPeriod</td>
            <td>$!reservation.InstructorName</td>
        </tr>

    #end
    
</tbody>
</table>
</div>

<p>Herzliche Grüsse</p>
<p>Flight Logging System</p>

</body>

</html>
', NULL)
GO
INSERT [dbo].[EmailTemplates] ([EmailTemplateId], [ClubId], [EmailTemplateName], [EmailTemplateKeyName], [Description], [FromAddress], [ReplyToAddresses], [Subject], [IsSystemTemplate], [CreatedOn], [CreatedByUserId], [ModifiedOn], [ModifiedByUserId], [DeletedOn], [DeletedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted], [HtmlBody], [TextBody]) 
VALUES (N'5083f403-f892-44f0-b1a0-be58c0fb6d01', NULL, N'Planning day cancel email', N'planningday-cancel', N'Planning day has no aircraft reservations, so cancel flight day', N'fls@glider-fls.ch', N'noreply@glider-fls.ch', N'Flugtag vom $PlanningDayInfoModel.Date in $PlanningDayInfoModel.LocationName hat keine Flugzeugreservationen', 1, CAST(N'2016-01-31 15:01:22.2142812' AS DateTime2), N'13731ee2-c1d8-455c-8ad1-c39399893fff', NULL, NULL, NULL, NULL, 1, N'a1dde2cb-6326-4bb2-897d-7cfc118e842b', 2, 0, N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-gb" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Flugtag vom $PlanningDayInfoModel.Date in $PlanningDayInfoModel.LocationName hat keine Flugzeugreservationen</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 14px;
}
</style>
</head>

<body>
<p>
Hallo zusammen...
</p>
<p>
Leider sind für den Flugtag vom $PlanningDayInfoModel.Date in $PlanningDayInfoModel.LocationName keine Flugzeugreservationen getätigt worden. Somit scheint leider kein Flugtag stattzufinden.</p>
<p>
Falls doch noch jemand fliegen möchte, müsste derjenige den Betrieb sowie den Schlepppiloten selber organisieren.</p>

<p>
Eingeteilter Flugdienstleiter: $!PlanningDayInfoModel.FlightOperatorName<br>
Eingeteilter Schlepppilot: $!PlanningDayInfoModel.TowPilotName<br><br>
Eingeteilter Segelfluglehrer: $!PlanningDayInfoModel.InstructorName<br><br>
Bemerkungen: $!PlanningDayInfoModel.Remarks
</p>

<p>Herzliche Grüsse</p>
<p>Flight Logging System</p>

</body>

</html>
', NULL)
GO
INSERT [dbo].[EmailTemplates] ([EmailTemplateId], [ClubId], [EmailTemplateName], [EmailTemplateKeyName], [Description], [FromAddress], [ReplyToAddresses], [Subject], [IsSystemTemplate], [CreatedOn], [CreatedByUserId], [ModifiedOn], [ModifiedByUserId], [DeletedOn], [DeletedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted], [HtmlBody], [TextBody]) 
VALUES (NEWID(), NULL, N'Email confirmation email', N'emailconfirmation', N'New user account was created or registered in FLS and email confirmation is required', N'fls@glider-fls.ch', N'noreply@glider-fls.ch', N'Email-Bestätigung für neues Benutzerkonto im Flight Logging System', 1, SYSUTCDATETIME(), N'13731ee2-c1d8-455c-8ad1-c39399893fff', NULL, NULL, NULL, NULL, 1, N'a1dde2cb-6326-4bb2-897d-7cfc118e842b', 2, 0, 
N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-gb" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Email-Bestätigung für neuer Benutzeraccount im FLS</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 14px;
}
</style>
</head>

<body>
<p>
Hallo $EmailConfirmationModel.RecipientName
</p>
<p>
Für das Flight Logging System wurde ein neuer Benutzer-Zugang erstellt. Falls du dieses Email unerwartet erhalten hast, dann sende bitte ein Email an $EmailConfirmationModel.UnexpectedReturnAddress damit wir diesem unerwarteten Verhalten nachgehen können.
</p>
<p>
Folgende Angaben sind für das Flight Logging System gültig:<br>
URL: $EmailConfirmationModel.FLSUrl<br>
Benutzername: $EmailConfirmationModel.Username<br>
</p>
<p>
Bitte bestätige deine Email-Adresse mit einem Klick auf <a href=$EmailConfirmationModel.EmailConfirmationUrl>diesen Link</a>.
</p>

<p>Herzliche Grüsse</p>
<p>Flight Logging System</p>

</body>

</html>
', NULL)
GO

INSERT [dbo].[EmailTemplates] ([EmailTemplateId], [ClubId], [EmailTemplateName], [EmailTemplateKeyName], [Description], [FromAddress], [ReplyToAddresses], [Subject], [IsSystemTemplate], [CreatedOn], [CreatedByUserId], [ModifiedOn], [ModifiedByUserId], [DeletedOn], [DeletedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted], [HtmlBody], [TextBody]) 
VALUES (NEWID(), NULL, N'Licence expires soon', N'licenceexpiressoon', N'A licence does expire within the next few days or weeks. Let person know about it.', N'fls@glider-fls.ch', N'noreply@glider-fls.ch', N'Lizenz läuft bald ab', 1, SYSUTCDATETIME(), N'13731ee2-c1d8-455c-8ad1-c39399893fff', NULL, NULL, NULL, NULL, 1, N'a1dde2cb-6326-4bb2-897d-7cfc118e842b', 2, 0, 
N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-gb" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Lizenz läuft bald ab</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 14px;
}
</style>
</head>

<body>
<p>
Hallo $LicenceExpireModel.RecipientName
</p>
<p>
Dein $LicenceExpireModel.LicenceName läuft am $LicenceExpireModel.ExpireDate ab.
</p>
<p>
Bitte melde dich bei der entsprechenden Stelle für die Lizenzerneuerung.
</p>

<p>Herzliche Grüsse</p>
<p>Flight Logging System</p>

</body>

</html>
', NULL)
GO

UPDATE [dbo].[EmailTemplates] SET [IsCustomizable] = 1 where EmailTemplateKeyName = 'emailconfirmation' 
OR EmailTemplateKeyName = 'lostpassword' OR EmailTemplateKeyName = 'planningday-ok' OR EmailTemplateKeyName = 'planningday-cancel'  
GO

INSERT [dbo].[EmailTemplates] ([EmailTemplateId], [ClubId], [EmailTemplateName], [EmailTemplateKeyName], [Description], [FromAddress], [ReplyToAddresses], [Subject], [IsSystemTemplate], [CreatedOn], [CreatedByUserId], [ModifiedOn], [ModifiedByUserId], [DeletedOn], [DeletedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted], [HtmlBody], [TextBody], [IsCustomizable]) 
VALUES (NEWID(), NULL, N'Planning day assignment notification', N'planningday-assignment-notification', N'Notifies the persons who are assigned to a planning day as towpilot, flight operator or instructor, etc. a week before the event.', N'fls@glider-fls.ch', N'noreply@glider-fls.ch', N'Erinnerung für $PlanningDayAssignmentModel.Date in $PlanningDayAssignmentModel.LocationName als $PlanningDayAssignmentModel.AssignmentTypeName', 1, SYSUTCDATETIME(), N'13731ee2-c1d8-455c-8ad1-c39399893fff', NULL, NULL, NULL, NULL, 1, N'a1dde2cb-6326-4bb2-897d-7cfc118e842b', 2, 0, N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-gb" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Erinnerung für $PlanningDayAssignmentModel.Date in $PlanningDayAssignmentModel.LocationName als $PlanningDayAssignmentModel.AssignmentTypeName</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 14px;
}
</style>
</head>

<body>
<p>
Hallo $PlanningDayAssignmentModel.AssignedPersonName
</p>
<p>
Dies ist ein Erinnerungsmail für den $PlanningDayAssignmentModel.Date in $PlanningDayAssignmentModel.LocationName. Du bist dann als $PlanningDayAssignmentModel.AssignmentTypeName eingeteilt.</p>

<p>
Falls in der Zwischenzeit etwas dazwischengekommen ist und du den Einsatz nicht wahrnehmen kannst, dann suche eine Ersatzperson und aktualisiere die Angaben im Flight Logging System.</p>

<p>Herzliche Grüsse</p>
<p>Flight Logging System</p>

</body>

</html>
', NULL, 1)
GO


INSERT [dbo].[EmailTemplates] ([EmailTemplateId], [ClubId], [EmailTemplateName], [EmailTemplateKeyName], [Description], [FromAddress], [ReplyToAddresses], [Subject], [IsSystemTemplate], [CreatedOn], [CreatedByUserId], [ModifiedOn], [ModifiedByUserId], [DeletedOn], [DeletedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted], [HtmlBody], [TextBody], [IsCustomizable]) 
VALUES (NEWID(), NULL, N'Trial flight registration confirmation email for trial pilot', N'TrialFlightRegistrationEmailForTrialPilot', N'Sends a registration confirmation email to the trial pilot.', N'fls@glider-fls.ch', N'noreply@glider-fls.ch', N'Bestätigung für Schnupperflug-Registrierung', 1, SYSUTCDATETIME(), N'13731ee2-c1d8-455c-8ad1-c39399893fff', NULL, NULL, NULL, NULL, 1, N'a1dde2cb-6326-4bb2-897d-7cfc118e842b', 2, 0, N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-gb" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Bestätigung für Schnupperflug-Registrierung</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 14px;
}
</style>
</head>

<body>
<p>
Hallo $TrialFlightRegistrationModel.RecipientName
</p>
<p>
Danke für Ihre Anmeldung zu einem Schnupperflug.
</p>
<p>
Dies ist eine Bestätigung für die Registrierung zu einem Schnupperflug am <b>$TrialFlightRegistrationModel.SelectedTrialFlightDate</b> in $TrialFlightRegistrationModel.LocationName.</p>
<p>
Schnupperflug-Kandidat:<br>
$TrialFlightRegistrationModel.Lastname $TrialFlightRegistrationModel.Firstname<br>
$TrialFlightRegistrationModel.AddressLine1<br>
$TrialFlightRegistrationModel.ZipCode $TrialFlightRegistrationModel.City<br>
$!TrialFlightRegistrationModel.PrivateEmail<br>
Tel. Mobil: $!TrialFlightRegistrationModel.MobilePhoneNumber<br>
Tel. Privat: $!TrialFlightRegistrationModel.PrivatePhoneNumber<br>
Tel. Geschäft: $!TrialFlightRegistrationModel.BusinessPhoneNumber<br>
</p>
<p>
Bemerkungen: $!TrialFlightRegistrationModel.Remarks
</p>
<p>
Wir werden den Schnupperflug-Kandidaten am $TrialFlightRegistrationModel.WillBeContactedOnDate über die Durchführung des Schnupperflugtages informieren. Je nach Wetter kann der Schnupperflugtag nicht durchgeführt werden und muss verschoben werden.</p>

<p>
Die Rechnung wird an folgende Adresse gesendet:<br>
$TrialFlightRegistrationModel.InvoiceToLastname $TrialFlightRegistrationModel.InvoiceToFirstname<br>
$TrialFlightRegistrationModel.InvoiceToAddressLine1<br>
$TrialFlightRegistrationModel.InvoiceToZipCode $TrialFlightRegistrationModel.InvoiceToCity<br>
</p>

<p>
Der Gutschein wird gesendet an: $TrialFlightRegistrationModel.SendCouponToInformation
</p>

<p>Herzliche Grüsse<br>
Flugsportgruppe Zürcher Oberland</p>

</body>

</html>
', NULL, 1)
GO


INSERT [dbo].[EmailTemplates] ([EmailTemplateId], [ClubId], [EmailTemplateName], [EmailTemplateKeyName], [Description], [FromAddress], [ReplyToAddresses], [Subject], [IsSystemTemplate], [CreatedOn], [CreatedByUserId], [ModifiedOn], [ModifiedByUserId], [DeletedOn], [DeletedByUserId], [RecordState], [OwnerId], [OwnershipType], [IsDeleted], [HtmlBody], [TextBody], [IsCustomizable]) 
VALUES (NEWID(), NULL, N'New trial flight registration', N'NewTrialFlightRegistrationEmail', N'Sends a registration information to the organisator.', N'fls@glider-fls.ch', N'noreply@glider-fls.ch', N'Neue Schnupperflug-Registrierung', 1, SYSUTCDATETIME(), N'13731ee2-c1d8-455c-8ad1-c39399893fff', NULL, NULL, NULL, NULL, 1, N'a1dde2cb-6326-4bb2-897d-7cfc118e842b', 2, 0, N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="en-gb" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Neue Schnupperflug-Registrierung</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, Sans-Serif;
    font-size: 14px;
}
</style>
</head>

<body>
<p>
Hallo
</p>
<p>
Es hat eine neue Registrierung zu einem Schnupperflug am <b>$TrialFlightRegistrationModel.SelectedTrialFlightDate</b> in $TrialFlightRegistrationModel.LocationName gegeben.</p>

<p>
Schnupperflug-Kandidat:<br>
$TrialFlightRegistrationModel.Lastname $TrialFlightRegistrationModel.Firstname<br>
$TrialFlightRegistrationModel.AddressLine1<br>
$TrialFlightRegistrationModel.ZipCode $TrialFlightRegistrationModel.City<br>
$!TrialFlightRegistrationModel.PrivateEmail<br>
Tel. Mobil: $!TrialFlightRegistrationModel.MobilePhoneNumber<br>
Tel. Privat: $!TrialFlightRegistrationModel.PrivatePhoneNumber<br>
Tel. Geschäft: $!TrialFlightRegistrationModel.BusinessPhoneNumber<br>
</p>

<p>
Rechnung an:<br>
$TrialFlightRegistrationModel.InvoiceToLastname $TrialFlightRegistrationModel.InvoiceToFirstname<br>
$TrialFlightRegistrationModel.InvoiceToAddressLine1<br>
$TrialFlightRegistrationModel.InvoiceToZipCode $TrialFlightRegistrationModel.InvoiceToCity<br>
</p>

<p>
Gutschein an:<br>
$TrialFlightRegistrationModel.SendCouponToInformation
</p>

<p>
Bemerkungen: $!TrialFlightRegistrationModel.Remarks
</p>

<p>
Flugzeug-Reservation: $!TrialFlightRegistrationModel.ReservationInformation
</p>

<p>
Bitte Schnupperflug-Gutschein und Rechnung entsprechend ausstellen.
</p>

<p>
Der Schnupperflug-Kandidat soll durch den Organisator am $TrialFlightRegistrationModel.WillBeContactedOnDate über die Durchführung des Schnupperflugtages informiert werden. 
</p>

<p>Herzliche Grüsse</p>
<p>Flight Logging System</p>

</body>

</html>
', NULL, 1)
GO