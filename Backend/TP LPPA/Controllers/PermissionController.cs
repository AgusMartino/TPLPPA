using System;
using System.Web.Http;
using TP_LPPA.Models.LPPA;
using TP_LPPA.Utils;
using TP_LPPA.Entities.Exceptions;

namespace TP_LPPA.Controllers
{
    //[Authorize]
    [AllowAnonymous]
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Permiso</returns>
        [HttpGet]
        public IHttpActionResult GetOne([FromUri] Guid id)
        {
            try
            {
                return Ok(PermissionManager.Current.GetOne(id));
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
        /// <returns>Todos los permisos</returns>
        [HttpGet]
        public IHttpActionResult GetAll()
        {
            try
            {
                return Ok(PermissionManager.Current.GetAll());
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
        /// <param name="permission">Permiso</param>
        /// <returns></returns>
        [HttpPost]
        public IHttpActionResult Add([FromBody] Permiso permission)
        {
            try
            {
                PermissionManager.Current.Add(permission);
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
        /// <param name="permission">Permiso</param>
        /// <returns></returns>
        [HttpPut]
        public IHttpActionResult Update([FromBody] Permiso permission)
        {
            try
            {
                PermissionManager.Current.Update(permission);
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
        /// <param name="id">ID de permiso</param>
        /// <returns></returns>
        [HttpDelete]
        public IHttpActionResult Remove([FromUri] Guid id)
        {
            try
            {
                PermissionManager.Current.Remove(id);
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