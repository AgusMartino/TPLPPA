using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using Newtonsoft.Json;
using TP_LPPA.Utils;
using TP_LPPA.Models.LPPA;

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
                return Ok(new List<Permiso>());
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }
    }
}