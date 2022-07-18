<template>
        <tr>
            <td scope="row">{{id}}</td>
            <td>{{privilegio}}</td>
            <td><router-link to="/modifyPrivilegio" type="button" class="btn btn-outline-secondary">Modificar</router-link></td>
            <td><button type="button" class="btn btn-outline-danger" v-on:click="deletePrivilege()">Eliminar</button></td>
        </tr>
</template>

<script>
import axios from "axios"

export default {
  props: {
    id: Number,
    privilegio: String
  },
  data() {
    return {
    }
  },
  methods: {
    deletePrivilege(){
            axios.post("https://localhost:44398/Permission/Remove", this.id.toString())
            .then(response=> {
                if(response.status==200) {
                alert('Privilegio eliminado correctamente');
                }
            })
            .catch(err =>{
                alert(err.data)
            })
        }
  }
}
</script>

<style>
</style>