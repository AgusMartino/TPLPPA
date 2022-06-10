using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP_LPPA.Models.LPPA;

namespace TP_LPPA.Utils
{
    public class UserManager
    {
        #region Singleton
        private readonly static UserManager _instance;
        public static UserManager Current { get { return _instance; } }
        static UserManager() { _instance = new UserManager(); }
        private UserManager()
        {
            //Implent here the initialization of your singleton
        }
        #endregion

        public Usuario Login(string username, string password)
        {
            throw new NotImplementedException();
            return new Usuario();
        }

        public void SignUp(Usuario user)
        {
            throw new NotImplementedException();
        }

        public Usuario GetOne(string username)
        {
            throw new NotImplementedException();
            return new Usuario();
        }

        public List<Usuario> GetAll()
        {
            throw new NotImplementedException();
            return new List<Usuario>();
        }

        public void Add(Usuario user)
        {
            throw new NotImplementedException();
        }

        public void Update(Usuario user)
        {
            throw new NotImplementedException();
        }

        public void Remove(string username)
        {
            throw new NotImplementedException();
        }

        public List<Permiso> GetPermissions(string username)
        {
            throw new NotImplementedException();
            return new List<Permiso>();
        }

        public void UpdatePermissions(string username, List<Permiso> permissions)
        {
            throw new NotImplementedException();
        }
    }
}