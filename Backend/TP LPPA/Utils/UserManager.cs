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
            Guid id_usuario = Guid.NewGuid();
            return new LoginResponse() {
                user = new Usuario()
                {
                    Id_usuario = id_usuario,
                    Nombre_Usuario = username,
                    Email = $"{username}98@gmail.com",
                    Contraseña = password,
                    DNI = "40772334",
                    IdPregunta = Guid.NewGuid(),
                    Respuesta = "el perro del vecino",
                    Salt = Guid.NewGuid().ToString()
                },
                token = new Token()
                {
                    Id_token = Guid.NewGuid(),
                    Id_usuario = id_usuario,
                    Token1 = CryptographyService.RandomString(20),
                    Expiracion = DateTime.Now.AddMinutes(10)
                }
            };
        }

        public void Logout(string username)
        {
        }

        public void SignUp(Usuario user)
        {
        }

        public Usuario GetOne(Guid id)
        {
            return new Usuario()
            {
                Id_usuario = id,
                Nombre_Usuario = "Pablo",
                Email = "pablito95@hotmail.com.ar",
                Contraseña = "pablitoclavounclavito",
                DNI = "38992113",
                IdPregunta = Guid.NewGuid(),
                Respuesta = "tu vieja",
                Salt = Guid.NewGuid().ToString()
            };
        }

        public List<Usuario> GetAll()
        {
            return new List<Usuario>()
            {
                new Usuario()
                {
                    Id_usuario = Guid.NewGuid(),
                    Nombre_Usuario = "Pablo",
                    Email = "pablito95@hotmail.com.ar",
                    Contraseña = "pablitoclavounclavito",
                    DNI = "38992113",
                    IdPregunta = Guid.NewGuid(),
                    Respuesta = "tu vieja",
                    Salt = Guid.NewGuid().ToString()
                },
                new Usuario()
                {
                    Id_usuario = Guid.NewGuid(),
                    Nombre_Usuario = "Anita",
                    Email = "anita89@gmail.com",
                    Contraseña = "anitalavalatina",
                    DNI = "26854123",
                    IdPregunta = Guid.NewGuid(),
                    Respuesta = "puto el que lee",
                    Salt = Guid.NewGuid().ToString()
                }
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
                }
            };
        }

        public void UpdatePermissions(string username, List<Permiso> permissions)
        {
        }
    }
}