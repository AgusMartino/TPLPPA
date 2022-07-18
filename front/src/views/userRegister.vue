<template>
    <div class="container">
        <div class="col"><div class="container">
        <h4>Datos personales:</h4>
        <div class="row mt-3">
            <label for="userName">
                <span>Nombre de Usuario:</span>
                <input type="text" name="userName" id="userName" v-model="newUser.Nombre_Usuario">
            </label>
        </div>
        <div class="row mt-3">
            <label for="email">
                <span>Email:</span>
                <input type="text" name="email" id="email" v-model="newUser.Email">
            </label>
        </div>
        <div class="row mt-3">
            <label for="documentNumber">
                <span>Numero de documento:</span>
                <input type="text" name="documentNumber" id="documentNumber" v-model="newUser.DNI">
            </label>
        </div>
        <hr>
        <h4>Seguridad de Usuario:</h4>
        <div class="row mt-3">
            <label for="question">
                <span>Pregunta de seguridad:</span>
                <select class="form-select" name="question" id="question" v-model="newUser.IdPregunta">
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
                <input type="text" name="asnwer" id="asnwer" v-model="newUser.Respuesta">
            </label>
        </div>
        <div class="row mt-3">
            <label for="asnwerCheck">
                <span>Repetir Respuesta:</span>
                <input type="text" name="asnwerCheck" id="asnwerCheck" v-model="answerCheck">
            </label>
        </div>
        <div class="row mt-3">
            <label for="password">
                <span>Contraseña:</span>
                <input type="password" name="password" id="password" v-model="newUser.Contraseña">
            </label>
        </div>
        <div class="row mt-3">
            <label for="passwordCheck">
                <span>Repetir Respuesta:</span>
                <input type="password" name="passwordCheck" id="passwordCheck" v-model="passwordCheck">
            </label>
        </div>
    </div>
        <hr>
        <h4>Privilegios del usuario</h4>
        <table class="table">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Privilegio</th>
                <th scope="col">Asignar</th>
            </tr>
            <tablaPrivilegios v-for="privilegio in privilegios"
                :id="privilegio.Id_permiso"
                :privilegio="privilegio.Permiso1"
            />
        </table>
        <div class="row mt-3">
        <button type="submit" class="btn btn-secondary" v-on:click="registerUser()">Registrar Usuario</button>
    </div>
    </div>
</div>
</template>

<script>
import tablaPrivilegios from "../components/dataPrivilegeRegister.vue"
import axios from "axios"
export default{
    components:{
        tablaPrivilegios
    },
    data(){
        return{
            newUser: {
                Nombre_Usuario: null,
                DNI: null,
                Email: null,
                IdPregunta: null,
                Respuesta: null,
                Contraseña: null,
                Estado: true
            },
            privilegios:[],
            asnwerCheck: null,
            passwordCheck: null,
            updatePermissionsBody: {
                Username: String,
                Permissions: []
            }
        }
    },
    mounted() {
        this.getPrivilegies();
    },
    methods: {
        registerUser(){
            if(this.newUser.Contraseña != this.passwordCheck){
                alert("Las contraseñas no coinciden")
            } else if(this.newUser.Respuesta != this.answerCheck) {
                alert("Las respuestas no coinciden")
            } else {
                this.loading = true
                axios.post("https://localhost:44398/User/SignUp", this.newUser)
                .then(response=>{
                    if(response.status==200){
                        this.privilegios.forEach((privilege) => {
                            if (localStorage.getItem(privilege.Id_permiso) != null) {
                                this.updatePermissionsBody.Permissions.push(privilege.Id_permiso)
                            }
                        });
                        
                        if(this.updatePermissionsBody.Permissions != []) {
                            this.updatePermissions()
                        }

                        alert("Usuario registrado con exito!")
                    }
                })
                .catch(err =>{
                alert(err.data)
                })
                .finally(data =>{
                this.loading = false
                })
            }
        },
        getPrivilegies(){
            this.loading = true
            axios.get("https://localhost:44398/Permission/GetAll")
            .then(response=>{
            this.privilegios = response.data.filter((privilege) => {
                return privilege.Estado != false
                });
            })
            .catch(err =>{
            alert(err.data)
            })
            .finally(data =>{
            this.loading = false
            })
        },
        updatePermissions(){
            this.loading = true
            this.updatePermissionsBody.Username = this.newUser.Nombre_Usuario
            axios.post("https://localhost:44398/User/UpdatePermissions", this.updatePermissionsBody)
            .then(response=>{
                if (response.status == 200) {
                    this.updatePermissionsBody.Permissions.forEach((privilege) => {
                            localStorage.removeItem(privilege)
                        });
                }
            })
            .catch(err =>{
            alert(err.data)
            })
            .finally(data =>{
            this.loading = false
            })
        }
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
.col{
    justify-content: center;
    align-items: center;
    padding-right: 30%;
    padding-left: 30%
}
</style>
