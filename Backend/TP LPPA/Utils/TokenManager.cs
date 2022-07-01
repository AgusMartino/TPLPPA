using System.Collections.Generic;
using TP_LPPA.Models.LPPA;
using TP_LPPA.Entities;
using TP_LPPA.Contracts;
using System;
using TP_LPPA.Entities.Exceptions;
using System.Configuration;
using System.Linq;

namespace TP_LPPA.Utils
{
    public class TokenManager : IGenericCRUD<Token>
    {
        #region Singleton
        private readonly static TokenManager _instance;
        public static TokenManager Current { get { return _instance; } }
        static TokenManager() { _instance = new TokenManager(); }
        private TokenManager()
        {
            //Implent here the initialization of your singleton
        }
        #endregion

        public Token RefreshToken(Guid id_usuario)
        {
            int expiracion = Convert.ToInt32(ConfigurationManager.AppSettings["TokenExpirationSec"]);

            var token = GetAll().Where(x => x.Id_usuario == id_usuario).FirstOrDefault();

            if(token == null)
            {
                token = new Token()
                {
                    Id_usuario = id_usuario,
                    Token1 = CryptographyService.RandomString(20),
                    Expiracion = DateTime.Now.AddSeconds(expiracion)
                };
                
                Add(token);
            }
            else
            {
                token.Expiracion = DateTime.Now.AddSeconds(expiracion);
                Update(token);
            }

            return token;
        }
        public Token GetOne(Guid id)
        {
            throw new NotImplementedException();
        }

        public List<Token> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Add(Token obj)
        {
            throw new NotImplementedException();
        }

        public void Update(Token obj)
        {
            throw new NotImplementedException();
        }

        public void Remove(Guid id)
        {
            throw new NotImplementedException();
        }
    }
}