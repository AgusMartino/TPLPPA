using System;
using System.Web.Http;
using TP_LPPA.Utils;

namespace TP_LPPA.Controllers
{
    public class PermissionController : ApiController
    {
        #region Singleton
        private readonly static PermissionController _instance;
        public static PermissionController Current { get { return _instance; } }
        static PermissionController() { _instance = new PermissionController(); }
        private PermissionController()
        {
            //Implent here the initialization of your singleton
        }
        #endregion

        [HttpGet]
        public IHttpActionResult GetAll()
        {
            try
            {
                return Ok(PermissionManager.Current.GetAll());
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }
    }
}