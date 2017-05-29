using System;
using System.Linq;
using FLS.Data.WebApi.Accounting;
using FLS.Server.Interfaces;
using FLS.Server.Service.Accounting;
using FLS.Server.Service.Email;
using FLS.Server.Service.Exporting;
using NLog;
using Quartz;

namespace FLS.Server.Service.Jobs
{
    /// <summary>
    /// The job for the quartz.net scheduler (http://quartznet.sourceforge.net/) which sends the monthly reports to the club.
    /// Every time, the scheduler execute this job a new instance of this class is created.
    /// </summary>
    public class DeliveryMailExportJob : IJob
    {
        private readonly DeliveryService _deliveryService;
        private readonly IDeliveryExcelExporter _deliveryExcelExporter;
        private readonly ClubService _clubService;
        private readonly AccountingEmailBuildService _emailBuildService;
        private Logger _logger = LogManager.GetCurrentClassLogger();

        protected Logger Logger
        {
            get { return _logger; }
            set { _logger = value; }
        }

        public DeliveryMailExportJob(DeliveryService deliveryService, IDeliveryExcelExporter deliveryExcelExporter, 
            ClubService clubService, AccountingEmailBuildService emailBuildService)
        {
            _deliveryService = deliveryService;
            _deliveryExcelExporter = deliveryExcelExporter;
            _clubService = clubService;
            _emailBuildService = emailBuildService;
        }

        /// <summary>
        /// Every time when the scheduler executes a job this method is called.
        /// </summary>
        /// <param name="context">not used</param>
        public void Execute(IJobExecutionContext context)
        {
            try
            {
                Logger.Info("Executing Delivery mail export job");

                //as the Job runs on 3rd each month, we have to catch the correct year by add some minus days (for january)
                var fromDate = new DateTime(DateTime.Now.AddDays(-10).Year, 1, 1);
                var toDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                var clubs = _clubService.GetClubs(false);

                foreach (var club in clubs.Where(c => c.RunDeliveryMailExportJob && string.IsNullOrWhiteSpace(c.SendDeliveryMailExportTo) == false))
                {
                    try
                    {
                        var deliveries = _deliveryService.GetDeliveryDetailsList(false, club.ClubId);

                        if (deliveries.Any() == false)
                        {
                            Logger.Info($"No Flights to invoice. Will send no invoice email message to club: {club.Clubname}");
                            var noInvoiceMessage = _emailBuildService.CreateNoAccountingEmail(club.SendDeliveryMailExportTo, fromDate, toDate);
                            _emailBuildService.SendEmail(noInvoiceMessage);
                            continue;
                        }

                        var zipBytes = _deliveryExcelExporter.ExportDeliveriesToExcel(deliveries);

                        var message = _emailBuildService.CreateAccountingEmail(club.SendDeliveryMailExportTo, zipBytes, fromDate, toDate);
                        _emailBuildService.SendEmail(message);

                        foreach (var delivery in deliveries)
                        {
                            var deliveryBooking = new DeliveryBooking
                            {
                                DeliveryId = delivery.DeliveryId,
                                DeliveryDateTime = DateTime.UtcNow,
                                DeliveryNumber = $"Workflow {DateTime.Now.ToShortTimeString()}"
                            };

                            _deliveryService.SetDeliveryAsDelivered(deliveryBooking);
                        }

                        Logger.Info($"{deliveries.Count} Flights invoiced and exported to excel.");
                    }
                    catch (Exception e)
                    {
                        Logger.Error(e, $"Error while processing flights for invoicing for club {club.Clubname}. Error: {e.Message}");
                    }
                }

                Logger.Info("Executed Delivery mail export job.");
            }
            catch (Exception ex)
            {
                Logger.Error(ex, $"Error while processing flights for invoicing. Error: {ex.Message}");
            }
        }
    }
}