﻿using System;
using System.Collections.Generic;
using FLS.Data.WebApi.Flight;
using FLS.Data.WebApi.Invoicing;
using FLS.Data.WebApi.Invoicing.RuleFilters;
using FLS.Server.Interfaces;
using NLog;

namespace FLS.Server.Service.Invoicing
{
    public class InvoiceMappingFactory
    {
        public InvoiceRules CreateInvoiceRules()
        {
            var invoiceRules = new InvoiceRules();
            invoiceRules.InvoiceLineBaseRuleFilters = CreateInvoiceLineRuleFilterContainer();
            invoiceRules.InvoiceRecipientRuleFilters = CreateFlightTypeToInvoiceRecipientMapping();
            return invoiceRules;
        }

        internal List<BaseRuleFilter> CreateInvoiceLineRuleFilterContainer()
        {
            var invoiceLineRuleFilters = new List<BaseRuleFilter>();

            var baseTeachingFlightTypeCodes = new List<string>();
            baseTeachingFlightTypeCodes.Add("70"); //Grundschulung Doppelsteuer
            baseTeachingFlightTypeCodes.Add("80"); //Grundschulung Solo
            baseTeachingFlightTypeCodes.Add("66"); //Lufttaufe bar
            baseTeachingFlightTypeCodes.Add("68"); //Schnupperflug Gutschein
            baseTeachingFlightTypeCodes.Add("69"); //Schnupperflug bar

            var furtherTrainingFlightTypeCodes = new List<string>();
            furtherTrainingFlightTypeCodes.Add("77"); //Weiterbildung Doppelsteuer
            furtherTrainingFlightTypeCodes.Add("88"); //Weiterbildung Solo
            furtherTrainingFlightTypeCodes.Add("78"); //Jahres-Checkflug

            var noFlatRateClubMemberNumbers = new List<string>();
            noFlatRateClubMemberNumbers.Add("363289"); //Marc
            noFlatRateClubMemberNumbers.Add("897764"); //Hermann
            noFlatRateClubMemberNumbers.Add("155264"); //Heiri
            noFlatRateClubMemberNumbers.Add("463161"); //Fredi
            noFlatRateClubMemberNumbers.Add("622976"); //Rolf
            noFlatRateClubMemberNumbers.Add("686001"); //Gian

            var vsfFeeRuleFilter = new VsfFeeRuleFilter()
            {
                ArticleTarget = new ArticleTarget { ArticleNumber = "1003", InvoiceLineText = "VFS-Gebühr"},
                RuleFilterName = "VFS-Gebühr",
                UseRuleForAllLdgLocationsExceptListed = false,
                MatchedLdgLocations = new List<string> { "LSZK" },
                UseRuleForAllAircraftsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllFlightTypesExceptListed = true,
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                IsRuleForMotorFlights = true
            };
            invoiceLineRuleFilters.Add(vsfFeeRuleFilter);

            var instructorRule = new InstructorFeeRuleFilter()
            {
                UseRuleForAllClubMemberNumbersExceptListed = false,
                MatchedClubMemberNumbers = new List<string>() {"999999"},
                Description = "Silvan",
                ArticleTarget = new ArticleTarget() { ArticleNumber = "50" },
                UseRuleForAllFlightCrewTypesExceptListed = false,
                MatchedFlightCrewTypes = new List<int>() {(int) FlightCrewType.FlightInstructor},
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllAircraftsExceptListed = true,
                UseRuleForAllFlightTypesExceptListed = true,
                RuleFilterName = "Instruktor-Honorar Silvan"
            };
            invoiceLineRuleFilters.Add(instructorRule);

            instructorRule = new InstructorFeeRuleFilter()
            {
                UseRuleForAllClubMemberNumbersExceptListed = false,
                MatchedClubMemberNumbers = new List<string>() { "424976" },
                Description = "Karl",
                ArticleTarget = new ArticleTarget() { ArticleNumber = "29" },
                UseRuleForAllFlightCrewTypesExceptListed = false,
                MatchedFlightCrewTypes = new List<int>() { (int)FlightCrewType.FlightInstructor },
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllAircraftsExceptListed = true,
                UseRuleForAllFlightTypesExceptListed = true,
                RuleFilterName = "Instruktor-Honorar Karl"
            };
            invoiceLineRuleFilters.Add(instructorRule);

            instructorRule = new InstructorFeeRuleFilter()
            {
                UseRuleForAllClubMemberNumbersExceptListed = false,
                MatchedClubMemberNumbers = new List<string>() { "536594" },
                Description = "HUK",
                ArticleTarget = new ArticleTarget() { ArticleNumber = "19" },
                UseRuleForAllFlightCrewTypesExceptListed = false,
                MatchedFlightCrewTypes = new List<int>() { (int)FlightCrewType.FlightInstructor },
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllAircraftsExceptListed = true,
                UseRuleForAllFlightTypesExceptListed = true,
                RuleFilterName = "Instruktor-Honorar HUK"
            };
            invoiceLineRuleFilters.Add(instructorRule);

            instructorRule = new InstructorFeeRuleFilter()
            {
                UseRuleForAllClubMemberNumbersExceptListed = false,
                MatchedClubMemberNumbers = new List<string>() { "836001" },
                Description = "Päde",
                ArticleTarget = new ArticleTarget() { ArticleNumber = "116" },
                UseRuleForAllFlightCrewTypesExceptListed = false,
                MatchedFlightCrewTypes = new List<int>() { (int)FlightCrewType.FlightInstructor },
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllAircraftsExceptListed = true,
                UseRuleForAllFlightTypesExceptListed = true,
                RuleFilterName = "Instruktor-Honorar Päde"
            };
            invoiceLineRuleFilters.Add(instructorRule);

            instructorRule = new InstructorFeeRuleFilter()
            {
                UseRuleForAllClubMemberNumbersExceptListed = false,
                MatchedClubMemberNumbers = new List<string>() { "888888" },
                Description = "Thomas",
                ArticleTarget = new ArticleTarget() { ArticleNumber = "90" },
                UseRuleForAllFlightCrewTypesExceptListed = false,
                MatchedFlightCrewTypes = new List<int>() { (int)FlightCrewType.FlightInstructor },
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllAircraftsExceptListed = true,
                UseRuleForAllFlightTypesExceptListed = true,
                RuleFilterName = "Instruktor-Honorar Thomas"
            };
            invoiceLineRuleFilters.Add(instructorRule);

            int sortIndicator = 1;
            var aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1059",
                    InvoiceLineText = "Schulung"
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-3256 Schulung"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-3256");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1061",
                    InvoiceLineText = "Schulung",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-3407 Schulung"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-3407");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1063",
                    InvoiceLineText = "Schulung",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-1841 Schulung"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-1841");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1065",
                    InvoiceLineText = "Schulung",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-1824 Schulung"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-1824");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1072",
                    InvoiceLineText = "Schulung",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-2464 Schulung"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-2464");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1059",
                    InvoiceLineText = "Weiterbildung ohne Pauschale",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(furtherTrainingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = false,
                MatchedClubMemberNumbers = new List<string>(noFlatRateClubMemberNumbers),
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-3256 Weiterbildung ohne Pauschale"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-3256");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1061",
                    InvoiceLineText = "Weiterbildung ohne Pauschale",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(furtherTrainingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = false,
                MatchedClubMemberNumbers = new List<string>(noFlatRateClubMemberNumbers),
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-3407 Weiterbildung ohne Pauschale"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-3407");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1063",
                    InvoiceLineText = "Weiterbildung ohne Pauschale",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(furtherTrainingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = false,
                MatchedClubMemberNumbers = new List<string>(noFlatRateClubMemberNumbers),
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-1841 Weiterbildung ohne Pauschale"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-1841");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1065",
                    InvoiceLineText = "Weiterbildung ohne Pauschale",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(furtherTrainingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = false,
                MatchedClubMemberNumbers = new List<string>(noFlatRateClubMemberNumbers),
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-1824 Weiterbildung ohne Pauschale"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-1824");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1072",
                    InvoiceLineText = "Weiterbildung ohne Pauschale",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(furtherTrainingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = false,
                MatchedClubMemberNumbers = new List<string>(noFlatRateClubMemberNumbers),
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-2464 Weiterbildung ohne Pauschale"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-2464");
            invoiceLineRuleFilters.Add(aircraftMappingRule);




            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1187",
                    InvoiceLineText = "Weiterbildung mit Pauschale",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(furtherTrainingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                MatchedClubMemberNumbers = new List<string>(noFlatRateClubMemberNumbers),
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-3256 Weiterbildung mit Pauschale"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-3256");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1186",
                    InvoiceLineText = "Weiterbildung mit Pauschale",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(furtherTrainingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                MatchedClubMemberNumbers = new List<string>(noFlatRateClubMemberNumbers),
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-3407 Weiterbildung mit Pauschale"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-3407");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1189",
                    InvoiceLineText = "Weiterbildung mit Pauschale",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(furtherTrainingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                MatchedClubMemberNumbers = new List<string>(noFlatRateClubMemberNumbers),
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-1841 Weiterbildung mit Pauschale"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-1841");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1188",
                    InvoiceLineText = "Weiterbildung mit Pauschale",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(furtherTrainingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                MatchedClubMemberNumbers = new List<string>(noFlatRateClubMemberNumbers),
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-1824 Weiterbildung mit Pauschale"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-1824");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1190",
                    InvoiceLineText = "Weiterbildung mit Pauschale",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(furtherTrainingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                MatchedClubMemberNumbers = new List<string>(noFlatRateClubMemberNumbers),
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-2464 Weiterbildung mit Pauschale"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-2464");
            invoiceLineRuleFilters.Add(aircraftMappingRule);


            sortIndicator = 1;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1058",
                    InvoiceLineText = "Privat",
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-3256 Privat"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-3256");
            aircraftMappingRule.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1060",
                    InvoiceLineText = "Privat"
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-3407 Privat"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-3407");
            aircraftMappingRule.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1062",
                    InvoiceLineText = "Privat"
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-1841 Privat"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-1841");
            aircraftMappingRule.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1064",
                    InvoiceLineText = "Privat"
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-1824 Privat"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-1824");
            aircraftMappingRule.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1071",
                    InvoiceLineText = "Privat"
                },
                IncludeFlightTypeName = true,
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllStartLocationsExceptListed = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-2464 Privat"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-2464");
            aircraftMappingRule.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            //Towing Aircrafts
            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1068",
                    InvoiceLineText = "Schulung"
                },
                IncludeThresholdText = true,
                ThresholdText = "1. bis 10. Min.",
                IncludeFlightTypeName = false,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                ExtendMatchingFlightTypeCodesToGliderAndTowFlight = true,
                MinFlightTimeMatchingValue = 0,
                MaxFlightTimeMatchingValue = 10,
                UseRuleForAllStartLocationsExceptListed = false,
                MatchedStartLocations = new List<string> {"LSZK"},
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-KCB Schulung bis 10min"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-KCB");
            aircraftMappingRule.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1069",
                    InvoiceLineText = "Schulung"
                },
                IncludeThresholdText = true,
                ThresholdText = "ab 11. Min.",
                IncludeFlightTypeName = false,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                ExtendMatchingFlightTypeCodesToGliderAndTowFlight = true,
                MinFlightTimeMatchingValue = 10,
                MaxFlightTimeMatchingValue = int.MaxValue,
                UseRuleForAllStartLocationsExceptListed = false,
                MatchedStartLocations = new List<string> {"LSZK"},
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-KCB Schulung ab 11.min"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-KCB");
            aircraftMappingRule.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1066",
                    InvoiceLineText = "Privat"
                },
                IncludeThresholdText = true,
                ThresholdText = "1. bis 10. Min.",
                IncludeFlightTypeName = false,
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                ExtendMatchingFlightTypeCodesToGliderAndTowFlight = true,
                MinFlightTimeMatchingValue = 0,
                MaxFlightTimeMatchingValue = 10,
                UseRuleForAllStartLocationsExceptListed = false,
                MatchedStartLocations = new List<string> {"LSZK"},
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-KCB Privat bis 10min"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-KCB");
            aircraftMappingRule.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1067",
                    InvoiceLineText = "Privat"
                },
                IncludeThresholdText = true,
                ThresholdText = "ab 11. Min.",
                IncludeFlightTypeName = false,
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                ExtendMatchingFlightTypeCodesToGliderAndTowFlight = true,
                MinFlightTimeMatchingValue = 10,
                MaxFlightTimeMatchingValue = int.MaxValue,
                UseRuleForAllStartLocationsExceptListed = false,
                MatchedStartLocations = new List<string> {"LSZK"},
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-KCB Privat ab 11.min"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-KCB");
            aircraftMappingRule.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1153",
                    InvoiceLineText = ""
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(),
                MinFlightTimeMatchingValue = 0,
                MaxFlightTimeMatchingValue = int.MaxValue,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-PFW"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-PFW");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1154",
                    InvoiceLineText = ""
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(),
                MinFlightTimeMatchingValue = 0,
                MaxFlightTimeMatchingValue = int.MaxValue,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-KIO"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-KIO");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1155",
                    InvoiceLineText = ""
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(),
                MinFlightTimeMatchingValue = 0,
                MaxFlightTimeMatchingValue = int.MaxValue,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-PDL"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-PDL");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1156",
                    InvoiceLineText = ""
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(),
                MinFlightTimeMatchingValue = 0,
                MaxFlightTimeMatchingValue = int.MaxValue,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-EQC"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-EQC");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1157",
                    InvoiceLineText = ""
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(),
                MinFlightTimeMatchingValue = 0,
                MaxFlightTimeMatchingValue = int.MaxValue,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-WAT"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-WAT");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1158",
                    InvoiceLineText = ""
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(),
                MinFlightTimeMatchingValue = 0,
                MaxFlightTimeMatchingValue = int.MaxValue,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-DGP"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-DGP");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1159",
                    InvoiceLineText = ""
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(),
                MinFlightTimeMatchingValue = 0,
                MaxFlightTimeMatchingValue = int.MaxValue,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-KDO"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-KDO");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1161",
                    InvoiceLineText = ""
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(),
                MinFlightTimeMatchingValue = 0,
                MaxFlightTimeMatchingValue = int.MaxValue,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-DCU"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-DCU");
            invoiceLineRuleFilters.Add(aircraftMappingRule);

            sortIndicator++;
            aircraftMappingRule = new AircraftRuleFilter
            {
                SortIndicator = sortIndicator,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1162",
                    InvoiceLineText = "Saanen"
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(),
                MinFlightTimeMatchingValue = 0,
                MaxFlightTimeMatchingValue = int.MaxValue,
                UseRuleForAllStartLocationsExceptListed = false,
                MatchedStartLocations = new List<string> { "LSGK" },
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllAircraftsExceptListed = false,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-KCB Saanen"
            };
            aircraftMappingRule.AircraftImmatriculations.Add("HB-KCB");
            invoiceLineRuleFilters.Add(aircraftMappingRule);



            var additionalFuelFeeRule = new AdditionalFuelFeeRuleFilter
            {
                UseRuleForAllAircraftsExceptListed = false,
                AircraftImmatriculations = new List<string> { "HB-KCB" },
                SortIndicator = 1,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1086",
                    InvoiceLineText = "Treibstoffzuschlag"
                },
                UseRuleForAllStartLocationsExceptListed = false,
                MatchedStartLocations = new List<string> {"LSZK"},
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllFlightTypesExceptListed = true,
                UseRuleForAllLdgLocationsExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForGliderFlights = true,
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForMotorFlights = true,
                IsRuleForTowingFlights = true,
                RuleFilterName = "HB-KCB Treibstoffzuschlag"
            };
            invoiceLineRuleFilters.Add(additionalFuelFeeRule);

            var noLandingTax = new NoLandingTaxRuleFilter()
            {
                IsRuleForGliderFlights = true,
                IsRuleForTowingFlights = true,
                IsRuleForSelfstartedGliderFlights = false,
                UseRuleForAllAircraftsExceptListed = true,
                AircraftImmatriculations = new List<string>(),
                SortIndicator = 1,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllLdgLocationsExceptListed = false,
                MatchedLdgLocations = new List<string> { "LSZK" },
                NoLandingTaxForGlider = true,
                NoLandingTaxForTowingAircraft = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForMotorFlights = true,
                UseRuleForAllStartLocationsExceptListed = true,
                RuleFilterName = "Keine Landetaxen für Schulung ab Speck"
            };
            noLandingTax.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(noLandingTax);

            //TODO: May duplicate rule with rule above, test it.
            noLandingTax = new NoLandingTaxRuleFilter()
            {
                IsRuleForGliderFlights = false,
                IsRuleForTowingFlights = true,
                IsRuleForSelfstartedGliderFlights = false,
                UseRuleForAllAircraftsExceptListed = true,
                AircraftImmatriculations = new List<string>(),
                SortIndicator = 1,
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                ExtendMatchingFlightTypeCodesToGliderAndTowFlight = true,
                UseRuleForAllLdgLocationsExceptListed = false,
                MatchedLdgLocations = new List<string> { "LSZK" },
                NoLandingTaxForGlider = true,
                NoLandingTaxForTowingAircraft = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                IsRuleForMotorFlights = true,
                UseRuleForAllStartLocationsExceptListed = true
            };
            noLandingTax.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(noLandingTax);

            var landingTaxRule = new LandingTaxRuleFilter
            {
                UseRuleForAllAircraftsExceptListed = true,
                AircraftImmatriculations = new List<string>(),
                SortIndicator = 1,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "",
                    InvoiceLineText = "Keine Landetaxen Speck für Schulung"
                },
                UseRuleForAllFlightTypesExceptListed = false,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllLdgLocationsExceptListed = false,
                MatchedLdgLocations = new List<string> { "LSZK" },
                IsRuleForSelfstartedGliderFlights = true,
                IsRuleForGliderFlights = true,
                IsRuleForTowingFlights = true,
                IsRuleForMotorFlights = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                UseRuleForAllStartLocationsExceptListed = true,
                RuleFilterName = "Keine Landetaxen Speck für Schulung"
            };
            landingTaxRule.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(landingTaxRule);

            landingTaxRule = new LandingTaxRuleFilter
            {
                UseRuleForAllAircraftsExceptListed = true,
                AircraftImmatriculations = new List<string>(),
                SortIndicator = 1,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1037",
                    InvoiceLineText = "Landetaxen Speck"
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(baseTeachingFlightTypeCodes),
                UseRuleForAllLdgLocationsExceptListed = false,
                MatchedLdgLocations = new List<string> { "LSZK"},
                IsRuleForSelfstartedGliderFlights = true,   //TODO: create start tax for self starting gliders
                IsRuleForGliderFlights = false,
                IsRuleForTowingFlights = true,
                IsRuleForMotorFlights = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                UseRuleForAllStartLocationsExceptListed = true,
                RuleFilterName = "Landetaxen Speck"
            };
            landingTaxRule.MatchedFlightTypeCodes.AddRange(furtherTrainingFlightTypeCodes);
            invoiceLineRuleFilters.Add(landingTaxRule);

            landingTaxRule = new LandingTaxRuleFilter
            {
                UseRuleForAllAircraftsExceptListed = true,
                AircraftImmatriculations = new List<string>(),
                SortIndicator = 1,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1106",
                    InvoiceLineText = "Landetaxen Montricher"
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(),
                UseRuleForAllLdgLocationsExceptListed = false,
                MatchedLdgLocations = new List<string> { "LSTR" },
                IsRuleForSelfstartedGliderFlights = false,
                IsRuleForGliderFlights = false,
                IsRuleForTowingFlights = true,
                IsRuleForMotorFlights = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                UseRuleForAllStartLocationsExceptListed = true,
                RuleFilterName = "Landetaxen Montricher"
            };
            invoiceLineRuleFilters.Add(landingTaxRule);

            landingTaxRule = new LandingTaxRuleFilter
            {
                UseRuleForAllAircraftsExceptListed = true,
                AircraftImmatriculations = new List<string>(),
                SortIndicator = 1,
                ArticleTarget = new ArticleTarget
                {
                    ArticleNumber = "1160",
                    InvoiceLineText = "Landetaxen Saanen"
                },
                UseRuleForAllFlightTypesExceptListed = true,
                MatchedFlightTypeCodes = new List<string>(),
                UseRuleForAllLdgLocationsExceptListed = false,
                MatchedLdgLocations = new List<string> { "LSGK" },
                IsRuleForSelfstartedGliderFlights = false,
                IsRuleForGliderFlights = false,
                IsRuleForTowingFlights = true,
                IsRuleForMotorFlights = true,
                UseRuleForAllClubMemberNumbersExceptListed = true,
                UseRuleForAllFlightCrewTypesExceptListed = true,
                IsActive = true,
                UseRuleForAllStartLocationsExceptListed = true,
                RuleFilterName = "Landetaxen Saanen"
            };
            invoiceLineRuleFilters.Add(landingTaxRule);

            return invoiceLineRuleFilters;
        }

        internal List<InvoiceRecipientRuleFilter> CreateFlightTypeToInvoiceRecipientMapping()
        {
            var invoiceRecipientRuleFilters = new List<InvoiceRecipientRuleFilter>();

            var invoiceRecipientRuleFilter = new InvoiceRecipientRuleFilter();
            invoiceRecipientRuleFilter.RecipientTarget = new RecipientDetails()
            {
                RecipientName = "FGZO Schnupperflug Gutschein",
                PersonClubMemberNumber = "999006"
            };
            invoiceRecipientRuleFilter.MatchedFlightTypeCodes = new List<string>() {"68"};
            invoiceRecipientRuleFilter.UseRuleForAllFlightTypesExceptListed = false;
            invoiceRecipientRuleFilter.RuleFilterName = "Schnupperflug Gutschein auf FGZO Konto buchen";
            invoiceRecipientRuleFilter.Description = "Schnupperflug Gutschein auf FGZO Konto buchen";
            invoiceRecipientRuleFilter.IsInvoicedToClubInternal = true;
            invoiceRecipientRuleFilters.Add(invoiceRecipientRuleFilter);

            invoiceRecipientRuleFilter = new InvoiceRecipientRuleFilter();
            invoiceRecipientRuleFilter.RecipientTarget = new RecipientDetails()
            {
                RecipientName = "FGZO Schnupperflug und Lufttaufe bar",
                PersonClubMemberNumber = "999000"
            };
            invoiceRecipientRuleFilter.MatchedFlightTypeCodes = new List<string>();
            invoiceRecipientRuleFilter.MatchedFlightTypeCodes.Add("66"); //Lufttaufe bar
            invoiceRecipientRuleFilter.MatchedFlightTypeCodes.Add("69"); //Schnupperflug bar
            invoiceRecipientRuleFilter.UseRuleForAllFlightTypesExceptListed = false;
            invoiceRecipientRuleFilter.RuleFilterName = "FGZO Schnupperflug und Lufttaufe bar auf FGZO Konto buchen";
            invoiceRecipientRuleFilter.Description = "FGZO Schnupperflug und Lufttaufe bar auf FGZO Konto buchen";
            invoiceRecipientRuleFilter.IsInvoicedToClubInternal = true;
            invoiceRecipientRuleFilters.Add(invoiceRecipientRuleFilter);


            invoiceRecipientRuleFilter = new InvoiceRecipientRuleFilter();
            invoiceRecipientRuleFilter.RecipientTarget = new RecipientDetails()
            {
                RecipientName = "FGZO Passagierflug bar",
                PersonClubMemberNumber = "999001"
            };
            invoiceRecipientRuleFilter.MatchedFlightTypeCodes = new List<string>() { "63" };
            invoiceRecipientRuleFilter.UseRuleForAllFlightTypesExceptListed = false;
            invoiceRecipientRuleFilter.RuleFilterName = "FGZO Passagierflug bar auf FGZO Konto buchen";
            invoiceRecipientRuleFilter.Description = "FGZO Passagierflug bar auf FGZO Konto buchen";
            invoiceRecipientRuleFilter.IsInvoicedToClubInternal = true;
            invoiceRecipientRuleFilters.Add(invoiceRecipientRuleFilter);


            invoiceRecipientRuleFilter = new InvoiceRecipientRuleFilter();
            invoiceRecipientRuleFilter.RecipientTarget = new RecipientDetails()
            {
                RecipientName = "FGZO Passagierflug Gutschein",
                PersonClubMemberNumber = "999007"
            };
            invoiceRecipientRuleFilter.MatchedFlightTypeCodes = new List<string>() { "62" };
            invoiceRecipientRuleFilter.UseRuleForAllFlightTypesExceptListed = false;
            invoiceRecipientRuleFilter.RuleFilterName = "FGZO Passagierflug Gutschein auf FGZO Konto buchen";
            invoiceRecipientRuleFilter.Description = "FGZO Passagierflug Gutschein auf FGZO Konto buchen";
            invoiceRecipientRuleFilter.IsInvoicedToClubInternal = true;
            invoiceRecipientRuleFilters.Add(invoiceRecipientRuleFilter);

            invoiceRecipientRuleFilter = new InvoiceRecipientRuleFilter();
            invoiceRecipientRuleFilter.RecipientTarget = new RecipientDetails()
            {
                RecipientName = "FGZO Marketingflug",
                PersonClubMemberNumber = "999004"
            };
            invoiceRecipientRuleFilter.MatchedFlightTypeCodes = new List<string>() { "100" };
            invoiceRecipientRuleFilter.UseRuleForAllFlightTypesExceptListed = false;
            invoiceRecipientRuleFilter.RuleFilterName = "FGZO Marketingflug auf FGZO Konto buchen";
            invoiceRecipientRuleFilter.Description = "FGZO Marketingflug auf FGZO Konto buchen";
            invoiceRecipientRuleFilter.IsInvoicedToClubInternal = true;
            invoiceRecipientRuleFilters.Add(invoiceRecipientRuleFilter);

            return invoiceRecipientRuleFilters;
        }
    }
}