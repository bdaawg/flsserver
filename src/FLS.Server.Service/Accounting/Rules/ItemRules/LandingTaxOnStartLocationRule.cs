﻿using System.Linq;
using FLS.Common.Validators;
using FLS.Data.WebApi.Accounting;
using FLS.Data.WebApi.Accounting.RuleFilters;
using FLS.Server.Data.DbEntities;
using FLS.Server.Data.Enums;
using FLS.Server.Data.Extensions;
using FLS.Server.Service.RulesEngine.Conditions;
using System;

namespace FLS.Server.Service.Accounting.Rules.ItemRules
{
    internal class LandingTaxOnStartLocationRule : BaseAccountingRule
    {
        private readonly long _minFlightTimeInSecondsMatchingValue;
        private readonly long _maxFlightTimeInSecondsMatchingValue;

        internal LandingTaxOnStartLocationRule(Flight flight, RuleBasedAccountingRuleFilterDetails landingTaxAccountingRuleFilter)
            : base(flight, landingTaxAccountingRuleFilter)
        {
            _minFlightTimeInSecondsMatchingValue = landingTaxAccountingRuleFilter.MinFlightTimeInSecondsMatchingValue ?? 0;
            _maxFlightTimeInSecondsMatchingValue = landingTaxAccountingRuleFilter.MaxFlightTimeInSecondsMatchingValue ?? long.MaxValue;
        }

        public override void Initialize(RuleBasedDeliveryDetails ruleBasedDelivery)
        {
            AccountingRuleFilter.ArticleTarget.NotNull("ArticleTarget");
            base.Initialize(ruleBasedDelivery);

            if (ruleBasedDelivery.NoLandingTaxForGliderFlight &&
                Flight.FlightAircraftType == (int) FlightAircraftTypeValue.GliderFlight)
            {
                //rule must not be applied
                Conditions.Add(new Equals<bool>(false, true));
            }

            if (ruleBasedDelivery.NoLandingTaxForTowFlight &&
                Flight.FlightAircraftType == (int)FlightAircraftTypeValue.TowFlight)
            {
                //rule must not be applied
                Conditions.Add(new Equals<bool>(false, true));
            }

            Conditions.Add(new Between<long>(Convert.ToInt64(Flight.FlightDurationZeroBased.TotalSeconds), _minFlightTimeInSecondsMatchingValue, _maxFlightTimeInSecondsMatchingValue, includeMinValue: false, includeMaxValue: true));
        }

        /// <summary>
        /// Overrides the initialisation of landing location conditions for nr of landings on start location
        /// </summary>
        /// <param name="ruleBasedDelivery"></param>
        protected override void InitializeLdgLocationConditions(RuleBasedDeliveryDetails ruleBasedDelivery)
        {
            if (Flight.NrOfLdgsOnStartLocation.GetValueOrDefault(0) <= 0)
            {
                // no landings on start location set, disable rule (rule must not be applied)
                Conditions.Add(new Equals<bool>(false, true));
                return;
            }

            if (AccountingRuleFilter.UseRuleForAllLdgLocationsExceptListed)
            {
                if (AccountingRuleFilter.MatchedLdgLocationIds != null && AccountingRuleFilter.MatchedLdgLocationIds.Any())
                {
                    if (Flight.StartLocationId.HasValue == false)
                    {
                        Logger.Warn($"Flight has no start location set. May we account something wrong!");
                    }
                    else
                    {
                        Conditions.Add(
                            new Inverter(new Contains<Guid>(AccountingRuleFilter.MatchedLdgLocationIds,
                                Flight.StartLocationId.Value)));
                    }
                }
            }
            else
            {
                if (Flight.StartLocationId.HasValue == false)
                {
                    Logger.Warn($"Flight has no start location set. May we account something wrong!");
                }
                else
                {
                    Conditions.Add(new Contains<Guid>(AccountingRuleFilter.MatchedLdgLocationIds,
                        Flight.StartLocationId.Value));
                }
            }
        }

        public override RuleBasedDeliveryDetails Apply(RuleBasedDeliveryDetails ruleBasedDelivery)
        {
            if (ruleBasedDelivery.DeliveryItems.Any(x => x.ArticleNumber == AccountingRuleFilter.ArticleTarget.ArticleNumber))
            {
                var line = ruleBasedDelivery.DeliveryItems.First(x => x.ArticleNumber == AccountingRuleFilter.ArticleTarget.ArticleNumber);
                line.Quantity += Flight.NrOfLdgsOnStartLocation.GetValueOrDefault(1);

                Logger.Warn($"Delivery line for landing tax already exists. Add quantity to the existing line! New line value: {line}");
            }
            else
            {
                var line = new DeliveryItemDetails();
                line.Position = ruleBasedDelivery.DeliveryItems.Count + 1;
                line.ArticleNumber = AccountingRuleFilter.ArticleTarget.ArticleNumber;
                line.Quantity = Flight.NrOfLdgsOnStartLocation.GetValueOrDefault(1);
                line.UnitType = GetUnitTypeString();
                line.ItemText = $"{AccountingRuleFilter.ArticleTarget.DeliveryLineText}";

                ruleBasedDelivery.DeliveryItems.Add(line);

                Logger.Debug($"Added new delivery item line to delivery. Line: {line}");
            }

            AccountingRuleFilter.HasMatched = true;
            return base.Apply(ruleBasedDelivery);
        }
    }
}
