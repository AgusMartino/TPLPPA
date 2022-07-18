<template>
<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-3">
            <router-link to="/gestionUsuario" type="button" class="btn btn-secondary">Gestion de usuarios</router-link>
        </div>
        <div class="col-2">
            <router-link to="/profile" type="button" class="btn btn-secondary">Perfil</router-link>
        </div>
        <div class="col-3">
            <router-link to="/gestionPrivilegio" type="button" class="btn btn-secondary">Gestion de privilegios</router-link>
        </div>
        <div class="col-3">
            <button type="button" class="btn btn-secondary" v-on:click="logout()">Logout</button>
        </div>
    </div>
</div>
</template>

<script>
import axios from 'axios'
import { useRouter } from 'vue-router';

export default{
    components:{
    },
    methods: {
        logout(){
                    axios.delete("https://localhost:44398/User/Logout", { params: { username: localStorage.getItem("username") } })
                    .then(response=> {
                        if(response.status==200) {
                        alert('Hasta la proxima!');
                        localStorage.clear()
                        this.$router.replace("/")
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
.container{
    justify-content: center;
    align-items: center;
}
.col-4{
    justify-content: center;
    align-items: center;
    margin-top: 10%;
    padding-right: 30%;
    padding-left: 30%
}
</style>
