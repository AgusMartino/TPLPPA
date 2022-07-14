<template>
        <tr>
            <td scope="row">{{Usuario}}</td>
            <td>{{document}}</td>
            <td>{{Email}}</td>
            <td><router-link to="/modifyUser" type="button" class="btn btn-outline-secondary">Modificar</router-link></td>
        </tr>
</template>

<script>
export default {
  props: {
    Usuario: String,
    Email: String,
    document: String
  },
  data() {
    return {
    }
  }
}
</script>

<style>
</style>