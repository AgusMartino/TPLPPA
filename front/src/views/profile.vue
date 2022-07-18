<template>
<div class="container" v-if="loading">
    <div>
        <div class="spinner-border text-light" role="status"></div>
    </div>
    <h1>Cargando</h1>
</div>
<div class="container" v-if="!loading">
    <div class="col" v-for="user in profileJSON">
    <h3>Datos del usuario:</h3>
        <profile
        :username="user.Nombre_Usuario"
        :Email="user.Email"
        :documentNumber="user.DNI"/>
    </div>
    <div class="col">
    <h3>Privilegios del usuario:</h3>
    <table class="table">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Privilegio</th>
        </tr>
        <privilegies v-for="privilege in privilegiesJSON"
        :id="privilege.id"
        :privilegio="privilege.privilegio"/>
    </table>
    </div>
</div>
</template>

<style>
.container{
    justify-content: center;
    align-items: center;
}
.col{
    justify-content: center;
    align-items: center;
    padding-right: 20%;
    padding-left: 20%;
    margin-top: 20px
}
</style>

<script>
import profile from "../components/userDataProfile.vue"
import privilegies from "../components/userDataPrivilege.vue"
import axios from "axios"
export default {
    components:{
        profile,
        privilegies
    },
    data(){
        return{
            loading: false,
            profileJSON: [],
            privilegiesJSON:[]
        }
    },
    mounted() {
        this.getUsers()
    },
    methods:{
        getUsers(){
            this.loading = true
            var id = localStorage.getItem("userid")
            axios.get("https://localhost:44398/User/GetOne/"+id)
            .then(response=>{
            response.data.forEach((user) => {
                if (user.Id_usuario == id){
                    this.profileJSON = user
                }
            });
            })
            .catch(err =>{
            alert(err.data)
            })
            .finally(data =>{
            this.loading = false
            })
        }
    }
}
</script>