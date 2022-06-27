using System.Collections.Generic;
using TP_LPPA.Models.LPPA;
using TP_LPPA.Entities;
using TP_LPPA.Contracts;
using System;

namespace TP_LPPA.Utils
{
    public class PermissionManager : IGenericCRUD<Permiso>
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

        public Permiso GetOne(Guid id)
        {
            return new Permiso();
        }

        public List<Permiso> GetAll()
        {
            return new List<Permiso>();
        }

        public void Add(Permiso permission)
        {
        }

        public void Update(Permiso permission)
        {
        }

        public void Remove(Guid id)
        {
        }
    }
}