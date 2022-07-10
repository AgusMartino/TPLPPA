<template>
  <div class="container">
    <div class="col">
      <h3>Listado de usuarios existentes</h3>

      <button type="button" class="btn btn-secondary">
        Registrar un nuevo usuario
      </button>

      <input
        v-model="nombre"
        class="form-control mt-3 mb-3"
        id="myInput"
        type="text"
        placeholder="Buscar usuario"
      />

      <table class="table">
        <tr>
          <th scope="col">Usuario</th>
          <th scope="col">Email</th>
          <th scope="col">Modificar</th>
        </tr>
        <tbody id="myTable">
          <dataTable
            v-for="user in userfilter"
            :Usuario="user.Usuario"
            :Email="user.Email"
          />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import NAV from "../components/nav.vue"
import dataTable from "../components/dataTableUser.vue"
export default{
    components:{
        NAV,
        dataTable,
    },
    data(){
        return{
             entradasJSON: [
                {
                    Usuario: "Agustin",
                    Email: "martinoagustin4@gmail.com"
                },
                {
                    Usuario: "Eze",
                    Email: "EzeAmorosino@gmail.com"
                }
             ],
             nombre: null
        }
    },
    computed:{
        userfilter(){
                if(!this.nombre)
                  return this.entradasJSON;
                else
                  return this.entradasJSON.filter((data) => {
                  return !data.Usuario.toLowerCase().indexOf((this.nombre.toLowerCase()));
                  })
        }
    }
}
</script>

<style>
.container {
  justify-content: center;
  align-items: center;
}
.col {
  justify-content: center;
  align-items: center;
  padding-right: 20%;
  padding-left: 20%;
}
</style>
