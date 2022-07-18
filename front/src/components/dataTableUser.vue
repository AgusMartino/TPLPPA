<template>
        <tr>
            <td scope="row">{{Usuario}}</td>
            <td>{{document}}</td>
            <td>{{Email}}</td>
            <td><router-link :to="{name:'modifyUser', params:{id:this.Id}}" type="button" class="btn btn-outline-secondary" props="true">Modificar</router-link></td>
        </tr>
</template>

<script>
export default {
  props: {
    Usuario: String,
    Email: String,
    document: String,
    Id: String
  },
  data() {
    return {
    }
  }
}
</script>

<style>
</style>