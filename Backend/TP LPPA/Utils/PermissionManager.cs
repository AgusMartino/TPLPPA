using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP_LPPA.Models.LPPA;

namespace TP_LPPA.Utils
{
    public class PermissionManager
    {
        #region Singleton
        private readonly static PermissionManager _instance;
        public static PermissionManager Current { get { return _instance; } }
        static PermissionManager() { _instance = new PermissionManager(); }
        private PermissionManager()
        {
            //Implent here the initialization of your singleton
        }
        #endregion

        public List<Permiso> GetAll()
        {
            return new List<Permiso>();
        }
    }
}