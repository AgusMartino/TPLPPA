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
            <input type="text" name="userName" id="userName">
        </label>
    </div>
    <div class="row mt-3">
        <label for="email">
            <span>Email:</span>
            <input type="text" name="email" id="email">
        </label>
    </div>
    <div class="row mt-3">
        <label for="documentNumber">
            <span>Numero de documento:</span>
            <input type="text" name="documentNumber" id="documentNumber">
        </label>
    </div>
    <hr>
</div>
</template>

<script>
import axios from "axios"
export default{
    components:{
    },
    data() {
        return {
            loading: false
        };
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