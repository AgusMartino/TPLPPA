<template>
        <tr>
            <td scope="row">{{Usuario}}</td>
            <td>{{Email}}</td>
            <td><button type="button" class="btn btn-outline-secondary">Asignar permisos</button></td>
            <td><button type="button" class="btn btn-outline-secondary">Modificar</button></td>
            <td><button type="button" class="btn btn-outline-danger">Eliminar</button></td>
        </tr>
</template>

<script>
export default {
  props: {
    Usuario: String,
    Email: String
  },
  data() {
    return {
    }
  }
}
</script>

<style>
</style>