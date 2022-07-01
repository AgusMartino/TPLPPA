using System.Collections.Generic;
using TP_LPPA.Models.LPPA;
using TP_LPPA.Entities;
using TP_LPPA.Contracts;
using System;
using TP_LPPA.Entities.Exceptions;

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
            return new Permiso()
            {
                Id_permiso = id,
                Permiso1 = "pase de temporada"
            };
        }

        public List<Permiso> GetAll()
        {
            return new List<Permiso>() 
            {
                new Permiso()
                {
                    Id_permiso = Guid.NewGuid(),
                    Permiso1 = "veterano de las malvinas"
                },
                new Permiso()
                {
                    Id_permiso = Guid.NewGuid(),
                    Permiso1 = "mujer empoderada"
                },new Permiso()
                {
                    Id_permiso = Guid.NewGuid(),
                    Permiso1 = "pase de temporada"
                }
            };
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