﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FLS.Data.WebApi.Aircraft;

namespace FLS.Server.Interfaces
{
    public interface IAircraftService
    {
        AircraftDetails GetAircraftDetails(string immatriculation);
    }
}