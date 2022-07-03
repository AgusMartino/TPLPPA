<template>
<div>
    <NAV/>
</div>
<div class="container">
    <div class="col">
        <userRegister/>
        <hr>
        <h4>Privilegios del usuario</h4>
        <table class="table">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Privilegio</th>
                <th scope="col">Asignar</th>
            </tr>
            <tablaPrivilegios v-for="privilegio in privilegios"
                :id="privilegio.id"
                :privilegio="privilegio.privilegio"
            />
        </table>
        <div class="row mt-3">
        <button type="submit" class="btn btn-secondary">Registrar Usuario</button>
    </div>
    </div>
</div>
</template>

<script>
import NAV from "./components/nav.vue"
import userRegister from "./components/userRegister.vue"
import tablaPrivilegios from "./components/dataPrivilegeRegister.vue"
export default{
    components:{
        NAV,
        userRegister,
        tablaPrivilegios
    },
    data(){
        return{
            privilegios:[
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
    padding-right: 30%;
    padding-left: 30%
}
</style>
