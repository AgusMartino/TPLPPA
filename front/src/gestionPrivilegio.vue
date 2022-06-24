<template>
<div>
    <NAV/>
</div>
<div class="container">
    <div class="col">
        <h3>Listado de privilegios existentes</h3>
        
        <button type="button" class="btn btn-secondary">Registrar un nuevo privilegio</button>

        <table class="table">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Privilegio</th>
                <th scope="col">Modificar</th>
                <th scope="col">Eliminar</th>
            </tr>
            <dataTable v-for="privilegio in entradasJSON"
                :id="privilegio.id"
                :privilegio="privilegio.privilegio"
            />
        </table>
    </div>
</div>
</template>

<script>
import NAV from "./components/nav.vue"
import dataTable from "./components/dataTablePrivilege.vue"
export default{
    components:{
        NAV,
        dataTable
    },
    data(){
        return{
             entradasJSON: [
                {
                    id: "1",
                    privilegio: "Usuario"
                },
                {
                    id: "2",
                    privilegio: "Permiso"
                }
             ]
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
</style>