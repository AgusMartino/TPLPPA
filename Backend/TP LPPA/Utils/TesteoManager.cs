using System.Collections.Generic;
using TP_LPPA.Models.LPPA;
using TP_LPPA.Entities;
using TP_LPPA.Contracts;
using System;

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