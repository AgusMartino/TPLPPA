<template>
<div class="container" v-if="loading">
    <div>
        <div class="spinner-border text-light" role="status"></div>
    </div>
    <h1>Cargando</h1>
</div>
<div class="container" v-if="!loading">
    <div class="col">
        <h3>Registro de nuevo Privilegio</h3>
        <form name="form" @submit.prevent="CreatePrivilege()">
            <label for="privilegeName">
                <span>Nombre de privilegio nuevo:</span>
                <input type="text" name="privilegeName" id="inputPrivilegeName" v-model="newPrivilege.Permiso1">
            </label>
            <button type="submit" class="btn btn-secondary">Registrar nuevo privilegio</button>
        </form>
    </div>
    <div class="col mt-5">
        <hr>
        <h3>Listado de privilegios</h3>
        <table class="table">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Privilegio</th>
                <th scope="col">Modificar</th>
                <th scope="col">Eliminar</th>
            </tr>
            <dataTable v-for="privilegio in entradasJSON"
                :id="privilegio.Id_permiso"
                :privilegio="privilegio.Permiso1"
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
            loading: false,
            newPrivilege: {
                        Permiso1: "",
                        Estado: true
            }
        };
    },
    mounted() {
        this.getPrivilegies();
    },
    methods: {
        getPrivilegies(){
            this.loading = true
            axios.get("https://localhost:44398/Permission/GetAll")
            .then(response=>{
            this.entradasJSON = response.data.filter((privilege) => {
                return privilege.Estado != false
            });
            })
            .catch(err =>{
            alert(err.data)
            })
            .finally(data =>{
            this.loading = false
            })
        },
        CreatePrivilege(){
            this.loading = true
            axios.post("https://localhost:44398/Permission/Add", this.newPrivilege)
            .then(response=> {
                if(response.status==200) {
                alert('El nuevo privilegio fue ingresado correctamente');
                }
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