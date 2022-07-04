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
            using (var db = new LPPAEntities())
            {
                var obj = db.Token.ToList().Where(x => x.Id_token == id).FirstOrDefault();

                if (obj == null) throw new NotFoundException();
                else return obj;
            }
        }
        public List<Token> GetAll()
        {
            using (var db = new LPPAEntities())
            {
                return db.Token.ToList();
            }
        }
        public void Add(Token obj)
        {
            using (var db = new LPPAEntities())
            {
                db.Token.Add(obj);
                db.SaveChanges();
            }
        }
        public void Update(Token obj)
        {
            using (var db = new LPPAEntities())
            {
                var db_obj = db.Token.SingleOrDefault(b => b.Id_token == obj.Id_token);

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
            using (var db = new LPPAEntities())
            {
                var db_obj = db.Token.SingleOrDefault(b => b.Id_token == id);

                if (db_obj != null)
                {
                    db.Token.Remove(db_obj);
                    db.SaveChanges();
                }
                else throw new NotFoundException();
            }
        }
    }
}