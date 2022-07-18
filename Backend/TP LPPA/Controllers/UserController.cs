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

        /// <summary>
        /// Si existe el usuario, se logea en el sistema generando un token.
        /// </summary>
        /// <param name="login">Username y Password</param>
        /// <returns>Usuario y Token</returns>
        [HttpPost]
        [AllowAnonymous]
        public IHttpActionResult Login([FromBody] LoginBody login)
        {
            try //Si retorna null, return NotFound()
            {
                var response = UserManager.Current.Login(login.username, login.password);
                return Ok(response);
            }
            catch(NotFoundException)
            {
                return NotFound();
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

        /// <summary>
        /// Elimina cualquier token perteneciente al usuario
        /// </summary>
        /// <param name="username">Usuario</param>
        /// <returns>Usuario y Token</returns>
        [HttpDelete]
        [AllowAnonymous]
        public IHttpActionResult Logout([FromUri] string username)
        {
            try
            {
                UserManager.Current.Logout(username);
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

        /// <summary>
        /// Se registra a un usuario en el sistema.
        /// </summary>
        /// <param name="user">Usuario</param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public IHttpActionResult SignUp([FromBody] Usuario user)
        {
            try
            {
                UserManager.Current.SignUp(user);
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


        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">ID del usuario</param>
        /// <returns>Usuario</returns>
        [HttpGet]
        public IHttpActionResult GetOne([FromUri] Guid id)
        {
            try
            {
                return Ok(UserManager.Current.GetOne(id));
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

        /// <summary>
        /// 
        /// </summary>
        /// <returns>Todos los usuarios</returns>
        [HttpGet]
        public IHttpActionResult GetAll()
        {
            try
            {
                return Ok(UserManager.Current.GetAll());
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="user">Usuario</param>
        /// <returns></returns>
        [HttpPost]
        public IHttpActionResult Add([FromBody] Usuario user)
        {
            try
            {
                UserManager.Current.Add(user);
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="user">Usuario</param>
        /// <returns></returns>
        [HttpPut]
        public IHttpActionResult Update([FromBody] Usuario user)
        {
            try
            {
                UserManager.Current.Update(user);
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

        /// <summary>
        /// Establece al usuario solicitado estado 0 (inactivo).
        /// </summary>
        /// <param name="id">ID del usuario</param>
        /// <returns></returns>
        [HttpDelete]
        public IHttpActionResult Remove([FromUri] Guid id)
        {
            try //update estado 0
            {
                UserManager.Current.Remove(id);
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="username">Username</param>
        /// <returns>Permisos del usuario solicitado</returns>
        [HttpGet]
        public IHttpActionResult GetPermissions([FromBody] string username)
        {
            try
            {
                return Ok(UserManager.Current.GetPermissions(username));
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

        /// <summary>
        /// Eliminará las relaciones de los permisos viejos del usuario respectivo y le relacionará los nuevos
        /// </summary>
        /// <param name="userdata">Username y permisos de un usuario</param>
        /// <returns></returns>
        [HttpPost]
        public IHttpActionResult UpdatePermissions([FromBody] UserPermissionsBody userdata)
        {
            try
            {
                UserManager.Current.UpdatePermissions(userdata.Username, userdata.Permissions);
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