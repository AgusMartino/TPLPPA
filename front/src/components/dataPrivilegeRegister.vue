<template>
    <tr>
        <td scope="row">{{id}}</td>
        <td>{{privilegio}}</td>
        <td><input class="form-check-input" type="checkbox" value="" id="privilegeUser"></td>
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