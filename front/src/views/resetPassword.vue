<template>
<div class="container">
    <div class="row mt-3">
        <div class="col mt-1">
            <label for="userName">
                <span>Nombre de Usuario:</span>
                <input type="text" name="userName" id="userName">
            </label>
        </div>
        <div class="col mt-1">
            <button type="button" class="btn btn-secondary">Validar usuario</button>
        </div>
    </div>
    <div class="row mt-3" v-if="usuario">
        <div class="col mt-1">
            <label for="question">
                <span>Pregunta de seguridad:</span>
                <input type="text" name="question" id="question">
            </label>
        </div>
        <div class="col mt-1">
            <label for="answer">
                <span>Respuesta:</span>
                <input type="text" name="answer" id="answer">
            </label>
        </div>
        <div class="col mt-1">
            <button type="button" class="btn btn-secondary">Validar Respuesta</button>
        </div>
    </div>
    <div class="row mt-3" v-if="pregunta">
        <div class="col mt-1">
            <label for="password">
                <span>Contraseña:</span>
                <input type="password" name="password" id="password">
            </label>
        </div>
        <div class="col mt-1">
            <label for="passwordCheck">
                <span>Repetir Respuesta:</span>
                <input type="password" name="passwordCheck" id="passwordCheck">
            </label>
        </div>
        <div class="col mt-1">
            <button type="button" class="btn btn-secondary">Cambiar contraseña</button>
        </div>
    </div>
</div>
</template>

<script>
import NAV from "../components/navInicio.vue"
export default{
    components:{
        NAV
    },
    data() {
        return {
            entradasJSON: [],
            usuario: false,
            pregunta: false
        };
    }
}
</script>

<style>
.container{
    justify-content: center;
    align-items: center;
}
.row{
    justify-content: center;
    align-items: center;
    padding-right: 20%;
    padding-left: 20%;
}
.col{
    justify-content: center;
    align-items: center;
    padding-right: 20%;
    padding-left: 20%;
}
span{
    margin-right: 5px
}
</style>