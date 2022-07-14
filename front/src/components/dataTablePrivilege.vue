<template>
        <tr>
            <td scope="row">{{id}}</td>
            <td>{{privilegio}}</td>
            <td><router-link to="/modifyPrivilegio" type="button" class="btn btn-outline-secondary">Modificar</router-link></td>
            <td><button type="button" class="btn btn-outline-danger">Eliminar</button></td>
        </tr>
</template>

<script>
export default {
  props: {
    id: Number,
    privilegio: String
  },
  data() {
    return {
    }
  }
}
</script>

<style>
</style>