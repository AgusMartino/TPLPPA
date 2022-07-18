<template>
<div class="container" v-if="loading">
    <div>
        <div class="spinner-border text-light" role="status"></div>
    </div>
    <h1>Cargando</h1>
</div>
<div class="container" v-if="!loading">
    <div class="col">
        <h3>Modificar Privilegio</h3>
        <label for="modifyPrivilege">
            <span>Nombre de privilegio nuevo:</span>
            <input type="text" name="modifyPrivilege" id="modifyPrivilege" v-model="privilege.Permiso1">
        </label>
        <button type="button" class="btn btn-secondary" v-on:click="privilegeUpdate()">Modificar privilegio</button>
    </div>
</div>
</template>

<script>
import axios from "axios"

export default{
    components:{
    },
    data() {
        return {
            loading: false,
            privilege: {
                Id_permiso: "",
                Permiso1: "",
                Estado: true
            }
        };
    },
    methods: {
        privilegeUpdate(){
                this.loading = true
                axios.post("https://localhost:44398/Permission/Update", this.privilege)
                .then(response=> {
                    if(response.status==200) {
                    alert('Privilegio modificado con exito!');
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