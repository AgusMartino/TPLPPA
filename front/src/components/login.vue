<template>
<div class="container-sm">
    <div class="row mt-3">
    <div id="validationException"></div>
        <div class="col">
            <label for="user">
                <span>Usuario:</span>
                <input type="text" name="user" id="user" v-model="loginPostBody.username">
            </label>
        </div>
    </div>
    <div id="userException"></div>
    <div class="row mt-3">
        <div class="col">
            <label for="password">
                <span>Contraseña:</span>
                <input type="password" name="password" id="password" v-model="loginPostBody.password">
            </label>
        </div>
    </div>
    <div id="passwordException"></div>
    <div class="row mt-3">
        <div class="col">
            <router-link to="/resetPassword" target="_blank">Olvide mi contraseña</router-link>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col">
            <button type="button" class="btn btn-secondary" v-on:click="login()">Ingresar</button>
        </div>
    </div>
</div>
</template>

<script>
import axios from "axios"

export default{
    data(){
        return {
            loginPostBody: {
                username: "",
                password: ""
            }
        };
    },
    methods: {
            login(){
                this.loading = true
                axios.post("https://localhost:44398/User/Login", this.loginPostBody)
                .then(response=> {
                    if(response.status==200) {
                    alert('Bienvenido!');
                    localStorage.setItem("username", response.data.user.Nombre_Usuario)
                    localStorage.setItem("userid", response.data.user.Id_usuario)
                    this.$router.push("/menuPrincipal")
                    }
                })
                .catch(err =>{
                    alert(err.Message)
                })
                .finally(data =>{
                this.loading = false
                })
            }
        }
    }
</script>

<style>
.container{
    justify-content: center;
}
.row{
    justify-content: center;
    align-items: center;

}
.col{
    justify-content: center;
    align-items: center;
}
a{
    text-decoration:none;
    color:black
}
span{
    margin-right: 5px
}
</style>