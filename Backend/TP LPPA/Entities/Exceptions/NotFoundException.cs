using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP_LPPA.Entities.Exceptions
{
    public class NotFoundException : Exception
    {
        public NotFoundException():base("No se pudo encontrar el recurso solicitado")
        {
        }
    }
}