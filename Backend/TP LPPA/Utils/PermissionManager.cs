using System.Collections.Generic;
using TP_LPPA.Models.LPPA;
using TP_LPPA.Entities;
using TP_LPPA.Contracts;
using System;
using TP_LPPA.Entities.Exceptions;
using System.Linq;

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
            using (var db = new LPPAEntities())
            {
                var obj = db.Permiso.ToList().Where(x => x.Id_permiso == id).FirstOrDefault();

                if (obj == null) throw new NotFoundException();
                else return obj;
            }
        }
        public List<Permiso> GetAll()
        {
            using (var db = new LPPAEntities())
            {
                return db.Permiso.ToList();
            }
        }
        public void Add(Permiso obj)
        {
            using (var db = new LPPAEntities())
            {
                db.Permiso.Add(obj);
                db.SaveChanges();
            }
        }
        public void Update(Permiso obj)
        {
            using (var db = new LPPAEntities())
            {
                var db_obj = db.Permiso.SingleOrDefault(b => b.Id_permiso == obj.Id_permiso);

                if (db_obj != null)
                {
                    db.Entry(db_obj).CurrentValues.SetValues(obj);
                    db.SaveChanges();
                }
                else throw new NotFoundException();
            }
        }
        public void Remove(Guid id)
        {
            var obj_db = GetOne(id);
            obj_db.Estado = false;
            Update(obj_db);
        }
    }
}