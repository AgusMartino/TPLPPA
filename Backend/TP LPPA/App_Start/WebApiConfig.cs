using System.Web.Http;

namespace TP_LPPA
{
    public static class WebApiConfig
    {
        //NUEVO RUTEO POR NOMBRE
        public static void Register(HttpConfiguration config)
        {

            // Configuración y servicios de Web API

            // Rutas de Web API
            config.MapHttpAttributeRoutes();

            //RUTEO VIEJO
            /*config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );*/

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "{controller}/{action}/{id}",
                defaults: new { action = "Get", id = RouteParameter.Optional }
            );
        }
    }
}
