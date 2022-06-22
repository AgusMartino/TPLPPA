<template>
<div>
    <NAV/>
</div>
<div class="container">
    <div class="col">
        <h3>Listado de usuarios existentes</h3>
        
        <button type="button" class="btn btn-secondary">Registrar un nuevo usuario</button>

        <table class="table">
            <tr>
                <th scope="col">Usuario</th>
                <th scope="col">Email</th>
                <th scope="col">Asignar permisos</th>
                <th scope="col">Modificar</th>
                <th scope="col">Eliminar</th>
            </tr>
            <dataTable v-for="user in entradasJSON"
                :Usuario="user.Usuario"
                :Email="user.Email"
            />
        </table>
    </div>
</div>
</template>

<script>
import NAV from "./components/nav.vue"
import dataTable from "./components/dataTable.vue"
export default{
    components:{
        NAV,
        dataTable
    },
    data(){
        return{
             entradasJSON: [
                {
                    Usuario: "Agustin",
                    Email: "martinoagustin4@gmail.com"
                },
                {
                    Usuario: "Eze",
                    Email: "EzeAmorosino@gmail.com"
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
table{

}
</style>