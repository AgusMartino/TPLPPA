using System.Collections.Generic;
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

        public (Usuario, Token) Login(string username, string password)
        {
            return (new Usuario(), new Token());
        }

        public void SignUp(Usuario user)
        {
        }

        public Usuario GetOne(string username)
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

        public void Remove(string username)
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