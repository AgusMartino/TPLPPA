using System;
using System.Collections.Generic;
using System.Web.Http;
using TP_LPPA.Entities;
using TP_LPPA.Models.LPPA;
using TP_LPPA.Utils;

namespace TP_LPPA.Controllers
{
    [Authorize]
    public class TokenController : ApiController
    {
        #region Singleton
        private readonly static TokenController _instance;
        public static TokenController Current { get { return _instance; } }
        static TokenController() { _instance = new TokenController(); }
        private TokenController()
        {
            //Implent here the initialization of your singleton
        }
        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">ID del token</param>
        /// <returns></returns>
        [HttpPut]
        public IHttpActionResult RefreshToken([FromBody] Guid id)
        {
            try
            {
                TokenManager.Current.RefreshToken(id);
                return Ok();
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }
    }
}