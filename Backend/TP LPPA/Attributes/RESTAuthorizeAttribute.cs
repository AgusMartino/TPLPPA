using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using TP_LPPA.Utils;

namespace TP_LPPA.Attributes
{
    public class RESTAuthorizeAttribute : AuthorizationFilterAttribute
    {

        public override Task OnAuthorizationAsync(HttpActionContext actionContext, System.Threading.CancellationToken cancellationToken)
        {
            //#if DEBUG
            //Avoid token validation for debug mode
            //            return Task.FromResult<object>(null);
            //#endif

            if (!skipAuthorization(actionContext))
            {
                string token = HttpUtility.ParseQueryString(actionContext.Request.RequestUri.Query).Get("token");

                if (token == null)
                {
                    actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Unauthorized, "Operation not allowed. Token not provided.");
                    return Task.FromResult<object>(null);
                }
                else if (!SecurityManager.IsTokenValid(token))
                {
                    actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Unauthorized, "Operation not allowed. Invalid token.");
                    return Task.FromResult<object>(null);
                }
            }

            //User is Authorized, complete execution
            return Task.FromResult<object>(null);

        }

        private bool skipAuthorization(HttpActionContext actionContext)
        {
            Contract.Assert(actionContext != null);

            return actionContext.ActionDescriptor.GetCustomAttributes<System.Web.Http.AllowAnonymousAttribute>().Any()
                   || actionContext.ControllerContext.ControllerDescriptor.GetCustomAttributes<System.Web.Http.AllowAnonymousAttribute>().Any();
        }
    }
}