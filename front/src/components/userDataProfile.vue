<template>
<form>
    <div class="row mt-3">
        <label for="userName">
            <span>Nombre de Usuario:</span>
            <input disabled type="text" name="userName" id="userName" v-model = "username">
        </label>
    </div>
    <div class="row mt-3">
        <label for="email">
            <span>Email:</span>
            <input disabled type="text" name="email" id="email" v-model = "Email">
        </label>
    </div>
    <div class="row mt-3">
        <label for="documentNumber">
            <span>Numero de documento:</span>
            <input disabled type="text" name="documentNumber" id="documentNumber" v-model = "documentNumber">
        </label>
    </div>
</form>
</template>

<style>
.row{
    width: 100%;
    height: 50px;
    align-items: center;
    justify-content: center;
}
span{
    margin-right: 5px
}
input{
    width: 60%
}
input:disabled {
  background: #d9d9d9;
}
</style>

<script>
export default {
  props: {
    username: String,
    Email: String,
    documentNumber: Number
  },
  data() {
    return {
    }
  }
}
</script>