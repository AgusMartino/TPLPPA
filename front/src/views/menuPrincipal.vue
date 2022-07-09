<template>
<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-3">
            <button type="button" class="btn btn-secondary">Gestion de usuarios</button>
        </div>
        <div class="col-2">
            <button type="button" class="btn btn-secondary">Perfil</button>
        </div>
        <div class="col-3">
            <button type="button" class="btn btn-secondary">Gestion de privilegios</button>
        </div>
    </div>
</div>
</template>

<script>
import NAV from "./components/navInicio.vue"
export default{
    components:{
        NAV
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
