<template>
<div class="container">
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
    <h4>Seguridad de Usuario:</h4>
    <div class="row mt-3">
        <label for="question">
            <span>Pregunta de seguridad:</span>
            <select class="form-select" name="question" id="question">
            <option selected>Seleccionar</option>
            <option value="d037ef91-dfb4-4c1d-a2ae-0c7092ee06e2">¿Cuál es el nombre de tu abuelo?</option>
            <option value="317ff8ba-096a-4a11-a258-64dd1ce65a79">¿Cuál fue tu primer auto?</option>
            <option value="36c87109c-9fd2-4a50-bd0b-8350bcc35e47">¿Cuál es el nombre de tu gato?</option>
            <option value="1fbf4f00-cbcb-4b47-a87c-8680511c8d4a">¿Cuál es tu color favorito?</option>
            </select>
        </label>
    </div>
    <div class="row mt-3">
        <label for="asnwer">
            <span>Respuesta:</span>
            <input type="text" name="asnwer" id="asnwer">
        </label>
    </div>
    <div class="row mt-3">
        <label for="asnwerCheck">
            <span>Repetir Respuesta:</span>
            <input type="text" name="asnwerCheck" id="asnwerCheck">
        </label>
    </div>
    <div class="row mt-3">
        <label for="password">
            <span>Contraseña:</span>
            <input type="password" name="password" id="password">
        </label>
    </div>
    <div class="row mt-3">
        <label for="passwordCheck">
            <span>Repetir Respuesta:</span>
            <input type="password" name="passwordCheck" id="passwordCheck">
        </label>
    </div>
</div>
</template>

<script>
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