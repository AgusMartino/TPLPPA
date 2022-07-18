<template>
<div class="container" v-if="loading">
    <div>
        <div class="spinner-border text-light" role="status"></div>
    </div>
    <h1>Cargando</h1>
</div>
<div class="container" v-if="!loading">
    <h4>Datos personales:</h4>
    <div class="row mt-3">
        <label for="userName">
            <span>Nombre de Usuario:</span>
            <input type="text" name="userName" id="userName" v-model="user.Nombre_Usuario">
        </label>
    </div>
    <div class="row mt-3">
        <label for="email">
            <span>Email:</span>
            <input type="text" name="email" id="email" v-model="user.Email">
        </label>
    </div>
    <div class="row mt-3">
        <label for="documentNumber">
            <span>Numero de documento:</span>
            <input type="text" name="documentNumber" id="documentNumber" v-model="user.DNI">
        </label>
    </div>
    <div class="row mt-3">
        <div class="col">
            <button type="button" class="btn btn-secondary" v-on:click="userUpdate()">Modificar</button>
        </div>
    </div>
    <hr>
</div>
</template>

<script>
import axios from "axios"

export default{
    props: {
        id: String
    },
    components:{
    },
    data() {
        return {
            loading: false,
            user: {}
        };
    },
    mounted(){
        this.getUsers()
    },
    methods: {
        getUsers(){
            this.loading = true
            axios.get("https://localhost:44398/User/GetAll")
            .then(response=>{
            response.data.forEach((user) => {
                if (user.Id_usuario == this.id){
                    this.user = user
                }
            });
            })
            .catch(err =>{
            alert(err.data)
            })
            .finally(data =>{
            this.loading = false
            })
        },

        userUpdate(){
                this.loading = true
                axios.put("https://localhost:44398/User/Update", this.user)
                .then(response=> {
                    if(response.status==200) {
                    alert('Usuario modificado con exito!');
                    }
                })
                .catch(err =>{
                    alert(err.Message)
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
    width: 100%;
}
.row{
    width: 100%;
    height: 50px;
    align-items: center;
    justify-content: center;
}
span{
    margin-right: 5px
}
</style>