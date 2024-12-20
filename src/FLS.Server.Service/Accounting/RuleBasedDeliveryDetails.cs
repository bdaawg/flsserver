﻿using System;
using System.Collections.Generic;
using FLS.Data.WebApi.Accounting;
using FLS.Server.Data.DbEntities;
using Newtonsoft.Json;

namespace FLS.Server.Service.Accounting
{
    internal class RuleBasedDeliveryDetails : DeliveryDetails
    {
        [JsonIgnore]
        public Guid ClubId { get; set; }

        //logical fields for simplifying rules
        [JsonIgnore]
        public bool IsChargedToClubInternal { get; set; }

        [JsonIgnore]
        public long ActiveFlightTimeInSeconds { get; set; }

        [JsonIgnore]
        public long ActiveEngineTimeInSeconds { get; set; }

        [JsonIgnore]
        public bool NoLandingTaxForTowFlight { get; set; }


        [JsonIgnore]
        public bool NoLandingTaxForGliderFlight { get; set; }

        [JsonIgnore]
        public bool NoLandingTaxForFlight { get; set; }

        [JsonIgnore]
        public List<PersonFlightTimeCredit> PersonFlightTimeCredits { get; set; }

        [JsonIgnore]
        public PersonFlightTimeCredit MatchedPersonFlightTimeCredit { get; set; }

        [JsonIgnore]
        public PersonFlightTimeCreditTransaction NewPersonFlightTimeCreditTransaction { get; set; }

        [JsonIgnore]
        public PersonFlightTimeCreditTransaction OldPersonFlightTimeCreditTransaction { get; set; }
    }
}
