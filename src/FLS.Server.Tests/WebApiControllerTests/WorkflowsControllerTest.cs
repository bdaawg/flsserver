﻿using System;
using FLS.Server.Service;
using FLS.Server.TestInfrastructure;
using FLS.Server.Tests.Helpers;
using FLS.Server.Tests.Infrastructure.WebApi;
using Microsoft.Owin.Testing;
using Microsoft.Practices.Unity;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace FLS.Server.Tests.WebApiControllerTests
{
    [TestClass]
    public class WorkflowsControllerTest : BaseAuthenticatedTests
    {
        protected override void PostSetup(TestServer server)
        {
            LoginAsWorkflow();
        }
        
        [TestMethod]
        [TestCategory("WebApi-Workflow-Jobs")]
        public void ExecuteWorkflowsWebApiTest()
        {
            var response = GetAsync(RoutePrefix).Result;

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        [TestCategory("WebApi-Workflow-Jobs")]
        public void ExecuteDailyReportJobWebApiTest()
        {
            var response = GetAsync(RoutePrefix + "dailyreports").Result;

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        [TestCategory("WebApi-Workflow-Jobs")]
        public void ExecuteMonthlyReportJobWebApiTest()
        {
            var response = GetAsync(RoutePrefix + "monthlyreports").Result;

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        [TestCategory("WebApi-Workflow-Jobs")]
        public void ExecuteFlightValidationWebApiTest()
        {
            var response = GetAsync(RoutePrefix + "flightvalidation").Result;

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        [TestCategory("WebApi-Workflow-Jobs")]
        public void ExecutePlanningDayMailsWebApiTest()
        {
            var response = GetAsync(RoutePrefix + "planningdaymails").Result;

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        [TestCategory("WebApi-Workflow-Jobs")]
        public void ExecuteTestMailWebApiTest()
        {
            var response = GetAsync(RoutePrefix + "testmails").Result;

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        [TestCategory("WebApi-Workflow-Jobs")]
        public void ExecuteInvoiceReportJobWebApiTest()
        {
            var response = GetAsync(RoutePrefix + "invoices").Result;

            Assert.IsTrue(response.IsSuccessStatusCode);
        }
        
        protected override string Uri
        {
            get { return RoutePrefix; }
        }

        protected override string RoutePrefix
        {
            get { return "/api/v1/workflows/"; }
        }
    }
}
