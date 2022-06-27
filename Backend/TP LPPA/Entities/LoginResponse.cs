using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP_LPPA.Models.LPPA;

namespace TP_LPPA.Entities
{
    public class LoginResponse
    {
        public Usuario user { get; set; }
        public Token token { get; set; }
    }
}