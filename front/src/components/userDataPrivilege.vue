<template>
        <tr>
            <td scope="row">{{id}}</td>
            <td>{{privilegio}}</td>
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