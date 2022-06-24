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
using TP_LPPA.Entities;

namespace TP_LPPA.Controllers
{
    public class UserController : ApiController
    {
        #region Singleton
        private readonly static UserController _instance;
        public static UserController Current { get { return _instance; } }
        static UserController() { _instance = new UserController(); }
        private UserController()
        {
            //Implent here the initialization of your singleton
        }
        #endregion

        [HttpGet]
        public IHttpActionResult Login([FromBody] LoginBody login)
        {
            try //Si retorna null, return NotFound()
            {
                var user = UserManager.Current.Login(login.username, login.password);
                return Ok(user);
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

        [HttpPost]
        public IHttpActionResult SignUp([FromBody] Usuario user)
        {
            try
            {
                UserManager.Current.SignUp(user);
                return Ok();
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

        [HttpGet]
        public IHttpActionResult GetOne(string username)
        {
            try
            {
                return Ok(UserManager.Current.GetOne(username));
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

        [HttpGet]
        public IHttpActionResult GetAll()
        {
            try
            {
                return Ok(UserManager.Current.GetAll());
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

        [HttpPost]
        public IHttpActionResult Add([FromBody] Usuario user)
        {
            try
            {
                UserManager.Current.Add(user);
                return Ok();
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

        [HttpPut]
        public IHttpActionResult Update([FromBody] Usuario user)
        {
            try
            {
                UserManager.Current.Update(user);
                return Ok();
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

        [HttpDelete]
        public IHttpActionResult Remove(string username)
        {
            try //update estado 0
            {
                UserManager.Current.Remove(username);
                return Ok();
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

        [HttpGet]
        public IHttpActionResult GetPermissions(string username)
        {
            try
            {
                return Ok(UserManager.Current.GetPermissions(username));
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

        [HttpGet]
        public IHttpActionResult UpdatePermissions(string username, [FromBody] List<Permiso> permissions)
        {
            try
            {
                UserManager.Current.UpdatePermissions(username, permissions);
                return Ok();
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }
    }
}