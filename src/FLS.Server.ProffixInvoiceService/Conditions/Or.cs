﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FLS.Server.Interfaces.RulesEngine;

namespace FLS.Server.ProffixInvoiceService.Conditions
{
    internal class Or : ICondition
    {
        private readonly ICondition _conditionA;
        private readonly ICondition _conditionB;

        public Or(ICondition conditionA, ICondition conditionB)
        {
            _conditionA = conditionA;
            _conditionB = conditionB;
        }

        public bool IsSatisfied()
        {
            if (_conditionA == null) return _conditionB.IsSatisfied();
            if (_conditionB == null) return _conditionA.IsSatisfied();

            return _conditionA.IsSatisfied() || _conditionB.IsSatisfied();
        }
    }
}