<template>
<div class="container" v-if="loading">
    <div>
        <div class="spinner-border text-light" role="status">
    </div>
    <h1>Cargando</h1>
</div>
<div class="container" v-if="!loading">
    <div class="col">
        <h3>Registro de nuevo Privilegio</h3>
        <label for="userName">
            <span>Nombre de privilegio nuevo:</span>
            <input type="text" name="userName" id="userName">
        </label>
        <router-link to="/userRegister" type="button" class="btn btn-secondary">Registrar nuevo privilegio</router-link>
    </div>
    <div class="col mt-5">
        <hr>
        <h3>Registro de nuevo Privilegio</h3>
        <table class="table">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Privilegio</th>
                <th scope="col">Modificar</th>
                <th scope="col">Eliminar</th>
            </tr>
            <dataTable v-for="privilegio in entradasJSON"
                :id="privilegio.id"
                :privilegio="privilegio.privilegio"
            />
        </table>
    </div>
</div>
</template>

<script>
import dataTable from "../components/dataTablePrivilege.vue"
import axios from "axios"
export default{
    components:{
        dataTable
    },
    data() {
        return {
            entradasJSON: [],
            loading: false
        };
    },
    mounted() {
        this.getPrivilegies();
    },
    methods: {
        getPrivilegies(){
            debugger;
            this.loading = true
            axios.get("https://localhost:44398/Permission/GetAll")
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
}
</script>

<style>
.container{
    justify-content: center;
    align-items: center;
}
.col{
    justify-content: center;
    align-items: center;
    padding-right: 20%;
    padding-left: 20%
}
span{
    margin-right: 5px
}
label{
    margin-right: 5px
}
</style>