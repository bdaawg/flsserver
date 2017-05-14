﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Mail;
using Alpinely.TownCrier;
using FLS.Common.Extensions;
using FLS.Common.Validators;
using FLS.Data.WebApi.Registrations;
using FLS.Server.Data.DbEntities;
using FLS.Server.Service.Email.Model;
using NLog;

namespace FLS.Server.Service.Email
{
    public class RegistrationEmailBuildService : EmailBuildService
    {
        public RegistrationEmailBuildService(DataAccessService dataAccessService, 
            IEmailSendService emailSendService, TemplateService templateService)
            : base(dataAccessService, emailSendService, templateService)
        {
            
        }
        
        public MailMessage CreateTrialFlightRegistrationEmailForTrialPilot(TrialFlightRegistrationDetails trialFlightRegistrationDetails,
            string emailRecipientAddress, Guid clubId, string locationName)
        {
            trialFlightRegistrationDetails.ArgumentNotNull("trialFlightRegistrationDetails");

            var model = new TrialFlightRegistrationModel()
            {
                RecipientName = $"{trialFlightRegistrationDetails.Firstname} {trialFlightRegistrationDetails.Lastname}",
                Firstname = trialFlightRegistrationDetails.Firstname,
                Lastname = trialFlightRegistrationDetails.Lastname,
                AddressLine1 = trialFlightRegistrationDetails.AddressLine1,
                ZipCode = trialFlightRegistrationDetails.ZipCode,
                City = trialFlightRegistrationDetails.City,
                BusinessPhoneNumber = trialFlightRegistrationDetails.BusinessPhoneNumber,
                MobilePhoneNumber = trialFlightRegistrationDetails.MobilePhoneNumber,
                PrivatePhoneNumber = trialFlightRegistrationDetails.PrivatePhoneNumber,
                PrivateEmail = trialFlightRegistrationDetails.PrivateEmail,
                SelectedTrialFlightDate = trialFlightRegistrationDetails.SelectedDay.ToShortDateString(),
                WillBeContactedOnDate = trialFlightRegistrationDetails.SelectedDay.AddDays(-2).ToShortDateString(),
                LocationName = locationName,
                Remarks = trialFlightRegistrationDetails.Remarks
            };

            if (string.IsNullOrWhiteSpace(trialFlightRegistrationDetails.Remarks))
            {
                model.Remarks = "keine";
            }

            if (trialFlightRegistrationDetails.InvoiceAddressIsSame)
            {
                model.InvoiceToFirstname = trialFlightRegistrationDetails.Firstname;
                model.InvoiceToLastname = trialFlightRegistrationDetails.Lastname;
                model.InvoiceToAddressLine1 = trialFlightRegistrationDetails.AddressLine1;
                model.InvoiceToZipCode = trialFlightRegistrationDetails.ZipCode;
                model.InvoiceToCity = trialFlightRegistrationDetails.City;
            }
            else
            {
                model.RecipientName =
                    $"{trialFlightRegistrationDetails.InvoiceToFirstname} {trialFlightRegistrationDetails.InvoiceToLastname}";
                model.InvoiceToFirstname = trialFlightRegistrationDetails.InvoiceToFirstname;
                model.InvoiceToLastname = trialFlightRegistrationDetails.InvoiceToLastname;
                model.InvoiceToAddressLine1 = trialFlightRegistrationDetails.InvoiceToAddressLine1;
                model.InvoiceToZipCode = trialFlightRegistrationDetails.InvoiceToZipCode;
                model.InvoiceToCity = trialFlightRegistrationDetails.InvoiceToCity;
            }

            if (trialFlightRegistrationDetails.InvoiceAddressIsSame == false
                && trialFlightRegistrationDetails.SendCouponToInvoiceAddress)
            {
                model.SendCouponToInformation = "Rechnungs-Empfänger";
            }
            else
            {
                model.SendCouponToInformation = "Schnupperflug-Kandidat";
            }

            var factory = new MergedEmailFactory(new VelocityTemplateParser("TrialFlightRegistrationModel"));

            var tokenValues = new Dictionary<string, object>
                {
                    {"TrialFlightRegistrationModel", model}
                };

            return base.BuildEmail("TrialFlightRegistrationEmailForTrialPilot", factory, tokenValues, emailRecipientAddress.SanitizeEmailAddress(), clubId);
        }

        public MailMessage CreateTrialFlightRegistrationEmailForOrganisator(TrialFlightRegistrationDetails trialFlightRegistrationDetails, string emailRecipientAddress, Guid clubId, string locationName, string reservationInfo)
        {
            trialFlightRegistrationDetails.ArgumentNotNull("trialFlightRegistrationDetails");

            var model = new TrialFlightRegistrationModel()
            {
                Firstname = trialFlightRegistrationDetails.Firstname,
                Lastname = trialFlightRegistrationDetails.Lastname,
                AddressLine1 = trialFlightRegistrationDetails.AddressLine1,
                ZipCode = trialFlightRegistrationDetails.ZipCode,
                City = trialFlightRegistrationDetails.City,
                BusinessPhoneNumber = trialFlightRegistrationDetails.BusinessPhoneNumber,
                MobilePhoneNumber = trialFlightRegistrationDetails.MobilePhoneNumber,
                PrivatePhoneNumber = trialFlightRegistrationDetails.PrivatePhoneNumber,
                PrivateEmail = trialFlightRegistrationDetails.PrivateEmail,
                SelectedTrialFlightDate = trialFlightRegistrationDetails.SelectedDay.ToShortDateString(),
                WillBeContactedOnDate = trialFlightRegistrationDetails.SelectedDay.AddDays(-2).ToShortDateString(),
                LocationName = locationName,
                ReservationInformation = reservationInfo,
                Remarks = trialFlightRegistrationDetails.Remarks
            };

            if (string.IsNullOrWhiteSpace(trialFlightRegistrationDetails.Remarks))
            {
                model.Remarks = "keine";
            }

            if (trialFlightRegistrationDetails.InvoiceAddressIsSame)
            {
                model.InvoiceToFirstname = trialFlightRegistrationDetails.Firstname;
                model.InvoiceToLastname = trialFlightRegistrationDetails.Lastname;
                model.InvoiceToAddressLine1 = trialFlightRegistrationDetails.AddressLine1;
                model.InvoiceToZipCode = trialFlightRegistrationDetails.ZipCode;
                model.InvoiceToCity = trialFlightRegistrationDetails.City;
            }
            else
            {
                model.InvoiceToFirstname = trialFlightRegistrationDetails.InvoiceToFirstname;
                model.InvoiceToLastname = trialFlightRegistrationDetails.InvoiceToLastname;
                model.InvoiceToAddressLine1 = trialFlightRegistrationDetails.InvoiceToAddressLine1;
                model.InvoiceToZipCode = trialFlightRegistrationDetails.InvoiceToZipCode;
                model.InvoiceToCity = trialFlightRegistrationDetails.InvoiceToCity;
            }

            if (trialFlightRegistrationDetails.InvoiceAddressIsSame == false 
                && trialFlightRegistrationDetails.SendCouponToInvoiceAddress)
            {
                model.SendCouponToInformation = "Rechnungs-Empfänger";
            }
            else
            {
                model.SendCouponToInformation = "Schnupperflug-Kandidat";
            }

            var factory = new MergedEmailFactory(new VelocityTemplateParser("TrialFlightRegistrationModel"));

            var tokenValues = new Dictionary<string, object>
                {
                    {"TrialFlightRegistrationModel", model}
                };

            return base.BuildEmail("NewTrialFlightRegistrationEmail", factory, tokenValues, emailRecipientAddress.FormatMultipleEmailAddresses(), clubId);
        }
    }
}
