<template>
<div class="container">
    <div class="col">
        <userRegister/>
        <hr>
        <h4>Privilegios del usuario</h4>
        <table class="table">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Privilegio</th>
                <th scope="col">Asignar</th>
            </tr>
            <tablaPrivilegios v-for="privilegio in privilegios"
                :id="privilegio.Id_permiso"
                :privilegio="privilegio.Permiso1"
            />
        </table>
        <div class="row mt-3">
        <button type="submit" class="btn btn-secondary">Registrar Usuario</button>
    </div>
    </div>
</div>
</template>

<script>
import userRegister from "../components/userRegister.vue"
import tablaPrivilegios from "../components/dataPrivilegeRegister.vue"
import axios from "axios"
export default{
    components:{
        userRegister,
        tablaPrivilegios
    },
    data(){
        return{
            privilegios:[]
        }
    },
    mounted() {
        this.getPrivilegies();
    },
    methods: {
        getPrivilegies(){
            this.loading = true
            axios.get("https://localhost:44398/Permission/GetAll")
            .then(response=>{
            this.privilegios = response.data.filter((privilege) => {
                return privilege.Estado != false
                });
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
    padding-right: 30%;
    padding-left: 30%
}
</style>
