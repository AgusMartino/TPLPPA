using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP_LPPA.Models.LPPA;

namespace TP_LPPA.Entities
{
    public class UserPermissionsBody
    {
        public string Username { get; set; }
        public List<Permiso> Permissions { get; set; }
    }
}