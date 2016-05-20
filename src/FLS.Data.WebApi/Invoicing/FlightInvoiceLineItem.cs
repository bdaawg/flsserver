﻿using System;

namespace FLS.Data.WebApi.Invoicing
{
    public class FlightInvoiceLineItem
    {
        public Guid FlightId { get; set; }

        public int InvoiceLinePosition { get; set; }

        public string ERPArticleNumber { get; set; }

        public string InvoiceLineText { get; set; }

        public string AdditionalInfo { get; set; }

        public decimal Quantity { get; set; }

        public string UnitType { get; set; }

        public override string ToString()
        {
            return $"{InvoiceLinePosition} {ERPArticleNumber} {InvoiceLineText} {Quantity} {UnitType} {AdditionalInfo}";
        }
    }
}
