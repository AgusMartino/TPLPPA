<template>
<div>
    <NAV/>
</div>
<div class="container">
    <div class="col">
        <h3>Listado de usuarios existentes</h3>
        
        <button type="button" class="btn btn-secondary">Registrar un nuevo usuario</button>

        <input class="form-control" id="myInput" type="text" placeholder="Buscar usuario">

        <table class="table">
            <tr>
                <th scope="col">Usuario</th>
                <th scope="col">Email</th>
                <th scope="col">Modificar</th>
            </tr>
            <tbody id="myTable">
                <dataTable v-for="user in entradasJSON"
                    :Usuario="user.Usuario"
                    :Email="user.Email"
                />
            </tbody>
        </table>
    </div>
</div>
</template>

<script>
import NAV from "./components/nav.vue"
import dataTable from "./components/dataTableUser.vue"
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
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
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