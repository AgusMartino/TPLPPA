using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP_LPPA.Models.LPPA;

namespace TP_LPPA.Utils
{
    public class TesteoManager
    {
        #region Singleton
        private readonly static TesteoManager _instance;
        public static TesteoManager Current { get { return _instance; } }
        static TesteoManager() { _instance = new TesteoManager(); }
        private TesteoManager()
        {
            //Implent here the initialization of your singleton
        }
        #endregion

        public List<Usuario> GetFromDB()
        {
            using (var db = new LPPAEntities())
            { 
                return db.Usuario.ToList();
            }
        }
    }
}