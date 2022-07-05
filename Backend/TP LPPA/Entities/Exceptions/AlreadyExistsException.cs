﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP_LPPA.Entities.Exceptions
{
    public class AlreadyExistsException : Exception
    {
        public AlreadyExistsException():base("Un usuario con ese nombre ya existe en la base de datos")
        {
        }
    }
}