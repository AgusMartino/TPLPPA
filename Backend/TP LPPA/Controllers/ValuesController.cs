using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using Newtonsoft.Json;

namespace TP_LPPA.Controllers
{
    public class ValuesController : ApiController
    {
        // GET api/values
        [HttpGet]
        public IHttpActionResult Get()
        {
            return Ok(new Persona() { Nombre = "Pablo", Edad = 30});
        }
        [HttpGet]
        public IHttpActionResult GetFiltered(string filtro)
        {
            var get = Get();
            var result = get as OkNegotiatedContentResult<Persona>;
            var persona = result.Content;
            return Ok($"(filtrado por '{filtro}') {persona}");
        }

        // GET api/values/5
        [HttpPost]
        public IHttpActionResult Procesar(string a_procesar)
        {
            return Ok($"(procesado) {a_procesar}");
        }

        [HttpPost]
        public IHttpActionResult Procesar2([FromBody] string a_procesar)
        {
            return Ok($"(procesado 2) {a_procesar}");
        }

        class Persona
        {
            public string Nombre;
            public int Edad;

            public override string ToString()
            {
                return $"Nombre: {Nombre}, Edad: {Edad}";
            }
        }
    }
}
