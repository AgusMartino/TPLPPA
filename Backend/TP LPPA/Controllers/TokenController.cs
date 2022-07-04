using System;
using System.Collections.Generic;
using System.Web.Http;
using TP_LPPA.Entities;
using TP_LPPA.Models.LPPA;
using TP_LPPA.Utils;
using TP_LPPA.Entities.Exceptions;

namespace TP_LPPA.Controllers
{
    //[Authorize]
    [AllowAnonymous]
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
        /// Si hay token, refresca la fecha de expiración del token del usuario correspondiente, si no existe, lo crea
        /// </summary>
        /// <param name="id_user">ID del usuario</param>
        /// <returns></returns>
        [HttpPost]
        public IHttpActionResult RefreshToken([FromBody] Guid id_user)
        {
            try
            {
                TokenManager.Current.RefreshToken(id_user);
                return Ok();
            }
            catch (NotFoundException)
            {
                return NotFound();
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }
    }
}