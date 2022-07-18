<template>
<div class="container">
    <form name="form" @submit.prevent="validarUser()">
        <div class="row mt-3">
            <div class="col mt-1">
                <label for="userName">
                    <span>Nombre de Usuario:</span>
                    <input type="text" name="userName" id="userName" v-model="userName">
                </label>
            </div>
            <div class="col mt-1">
                <button type="submit" class="btn btn-secondary">Validar usuario</button>
            </div>
        </div>
    </form>
    <form name="form" @submit.prevent="validarPregunta()">
    <div class="row mt-3" v-if="usuarioBool">
        <div class="col mt-1">
            <label for="question">
                <span>Pregunta de seguridad:</span>
                <input type="text" name="question" id="question" v-model="question">
            </label>
        </div>
        <div class="col mt-1">
            <label for="answer">
                <span>Respuesta:</span>
                <input type="text" name="answer" id="answer" v-model="answer">
            </label>
        </div>
        <div class="col mt-1">
            <button type="submit" class="btn btn-secondary">Validar Respuesta</button>
        </div>
    </div>
    </form>
    <form name="form" @submit.prevent="cambioContraseña()">
    <div class="row mt-3" v-if="preguntaBool">
        <div class="col mt-1">
            <label for="password">
                <span>Contraseña:</span>
                <input type="password" name="password" id="password" v-model="newPassword">
            </label>
        </div>
        <div class="col mt-1">
            <label for="passwordCheck">
                <span>Repetir Respuesta:</span>
                <input type="password" name="passwordCheck" id="passwordCheck" v-model="passwordCheck">
            </label>
        </div>
        <div class="col mt-1">
            <button type="submit" class="btn btn-secondary">Cambiar contraseña</button>
        </div>
    </div>
    </form>
</div>
</template>

<script>
import axios from 'axios'
export default{
    components:{
    },
    data() {
        return {
            usuarioBool: false,
            preguntaBool: false,
            Usuarios: [],
            preguntas: [
                {
                    id:"d037ef91-dfb4-4c1d-a2ae-0c7092ee06e2",
                    pregunta:"¿Cuál es el nombre de tu abuelo?"
                },
                {
                    id:"317ff8ba-096a-4a11-a258-64dd1ce65a79",
                    pregunta:"¿Cuál fue tu primer auto?"
                },
                {
                    id:"36c87109c-9fd2-4a50-bd0b-8350bcc35e47",
                    pregunta:"¿Cuál es el nombre de tu gato?"
                },
                {
                    id:"1fbf4f00-cbcb-4b47-a87c-8680511c8d4a",
                    pregunta:"¿Cuál es tu color favorito?"
                },     
            ],
            userName: null,
            question: null,
            answer: null,
            newPassword: null,
            passwordCheck: null,
            body:{
                Id_usuario: null,
                Nombre_Usuario: null,
                IdPregunta: null,
                Respuesta: null,
                Email: null,
                DNI: null,
                Contraseña: null,
                Salt: null,
                Estado: true
            },
        };
    },
    mounted(){
        this.getUsers();
    },
    methods: {
        getUsers(){
            axios.get("https://localhost:44398/User/GetAll")
            .then(response=>{
            this.Usuarios = response.data;
            })
            .catch(err =>{
            alert(err.data)
            })
            .finally(data =>{
            console.log(this.Usuarios)
            })
        },
        validarUser(){
            this.Usuarios.forEach((data) => {
                if(data.Nombre_Usuario.toLowerCase() == this.userName.toLowerCase()){
                    this.usuarioBool = true;
                    this.body.Id_usuario = data.Id_usuario;
                    this.body.Nombre_Usuario = data.Nombre_Usuario;
                    this.body.IdPregunta = data.IdPregunta;
                    this.body.Respuesta = data.Respuesta;
                    this.body.Email = data.Email;
                    this.body.DNI = data.DNI,
                    this.body.Contraseña = data.Contraseña,
                    this.body.Salt = data.Salt
                    this.body.Estado = data.Estado
                    var pregunta = [];
                    this.preguntas.forEach((pregunta) =>{
                        if(data.IdPregunta == pregunta.id){
                            this.question = pregunta.pregunta
                        }
                    })
                }
            })
            if(this.usuarioBool == false){
                alert("Usuario inexistente")
            }
        },
        validarPregunta(){
            if(this.body.Respuesta.toLowerCase() == this.answer.toLowerCase()){
                this.preguntaBool = true
            }
            else{
                alert("Respuesta incorrecta")
            }
        },
        cambioContraseña(){
            if(this.newPassword == this.passwordCheck){
                this.body.Contraseña = this.newPassword
                axios.put("https://localhost:44398/User/Update", this.body)
                .then(response=> {
                    if(response.status==200) {
                    alert('La contraseña se restablecio correctamente');
                    }
                    this.preguntaBool = false;
                    this.usuarioBool = false;
                    this.userName = null
                })
                .catch(err =>{
                    alert(err.data)
                })
            }
            else{
                alert('Las contraseñas no coinciden');
            }
        }
    },
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