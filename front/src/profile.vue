<template>
<div>
    <NAV/>
</div>
<div class="container">
    <div class="col" v-for="user in profileJSON">
    <h3>Datos del usuario:</h3>
        <profile
        :username="user.Usuario"
        :Email="user.Email"
        :documentNumber="user.documentNumber"/>
    </div>
    <div class="col">
    <h3>Privilegios del usuario:</h3>
    <table class="table">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Privilegio</th>
        </tr>
        <privilegies v-for="privilege in privilegiesJSON"
        :id="privilege.id"
        :privilegio="privilege.privilegio"/>
    </table>
    </div>
</div>
</template>

<style>
.container{
    justify-content: center;
    align-items: center;
}
.col{
    justify-content: center;
    align-items: center;
    padding-right: 20%;
    padding-left: 20%;
    margin-top: 20px
}
</style>

<script>
import NAV from "./components/nav.vue"
import profile from "./components/userDataProfile.vue"
import privilegies from "./components/userDataPrivilege.vue"
export default {
    components:{
        NAV,
        profile,
        privilegies
    },
    data(){
        return{
             profileJSON: [
                {
                    Usuario: "Agustin",
                    Email: "martinoagustin4@gmail.com",
                    documentNumber: 43013181
                }
             ],
             privilegiesJSON:[
                {
                    id: 1,
                    privilegio: "Usuario"
                },
                {
                    id: 2,
                    privilegio: "Permiso"
                }
             ]

        }
    }
}
</script>