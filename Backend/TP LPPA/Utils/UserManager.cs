using System.Collections.Generic;
using TP_LPPA.Models.LPPA;
using TP_LPPA.Entities;
using TP_LPPA.Contracts;
using System;

namespace TP_LPPA.Utils
{
    public class UserManager : IGenericCRUD<Usuario>
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

        public LoginResponse Login(string username, string password)
        {
            return new LoginResponse() { user = new Usuario(), token = new Token()};
        }

        public void Logout(string username)
        {
        }

        public void SignUp(Usuario user)
        {
        }

        public Usuario GetOne(Guid id)
        {
            return new Usuario();
        }

        public List<Usuario> GetAll()
        {
            return new List<Usuario>()
            {
                new Usuario(){ Nombre_Usuario = "Usuario 1"},
                new Usuario()
            };
        }

        public void Add(Usuario user)
        {
        }

        public void Update(Usuario user)
        {
        }

        public void Remove(Guid id)
        {
        }

        public List<Permiso> GetPermissions(string username)
        {
            return new List<Permiso>();
        }

        public void UpdatePermissions(string username, List<Permiso> permissions)
        {
        }
    }
}