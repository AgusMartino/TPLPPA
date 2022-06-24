<template>
        <tr>
            <td scope="row">{{id}}</td>
            <td>{{privilegio}}</td>
            <td><button type="button" class="btn btn-outline-secondary">Modificar</button></td>
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