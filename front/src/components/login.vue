<template>
<div class="container-sm">
    <div class="row mt-3">
    <div id="validationException"></div>
        <div class="col">
            <label for="user">
                <span>Usuario:</span>
                <input type="text" name="user" id="user">
            </label>
        </div>
    </div>
    <div id="userException"></div>
    <div class="row mt-3">
        <div class="col">
            <label for="password">
                <span>Contraseña:</span>
                <input type="password" name="password" id="password">
            </label>
        </div>
    </div>
    <div id="passwordException"></div>
    <div class="row mt-3">
        <div class="col">
            <a href="#" target="_blank">Olvide mi contraseña</a>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col">
            <button type="button" class="btn btn-secondary">Ingresar</button>
        </div>
    </div>
</div>
</template>

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
</style>

<script>
</script>