using System.Collections.Generic;
using TP_LPPA.Models.LPPA;
using TP_LPPA.Entities;
using TP_LPPA.Contracts;
using System;

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

        public void RefreshToken(Guid id)
        {
            
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