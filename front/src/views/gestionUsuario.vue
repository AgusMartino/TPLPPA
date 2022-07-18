<template>
  <div class="container">
    <div class="col">
      <h3>Listado de usuarios existentes</h3>

      <router-link to="/userRegister" type="button" class="btn btn-secondary">
        Registrar un nuevo usuario
      </router-link>

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
          <th scope="col">Documento</th>
          <th scope="col">Email</th>
          <th scope="col">Modificar</th>
        </tr>
        <tbody id="myTable">
          <dataTable
            v-for="user in userfilter"
            :Usuario="user.Nombre_Usuario"
            :document = "user.DNI"
            :Email="user.Email"
            :Id="user.Id_usuario"
          />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import dataTable from "../components/dataTableUser.vue"
import axios from "axios"
export default{
    components:{
        dataTable,
    },
    data() {
        return {
            entradasJSON: [],
            loading: false,
            nombre: null
        };
    },
    mounted() {
        this.getUsers();
    },
    methods: {
        getUsers(){
            this.loading = true
            axios.get("https://localhost:44398/User/GetAll")
            .then(response=>{
            this.entradasJSON = response.data;
            })
            .catch(err =>{
            alert(err.data)
            })
            .finally(data =>{
            this.loading = false
            })
        }
    },
    computed:{
        userfilter(){
                if(!this.nombre)
                  return this.entradasJSON;
                else
                  return this.entradasJSON.filter((data) => {
                  return !data.Nombre_Usuario.toLowerCase().indexOf((this.nombre.toLowerCase()));
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
