<template>
    <tr>
        <td scope="row">{{id}}</td>
        <td>{{privilegio}}</td>
        <td><input class="form-check-input" type="checkbox" id="privilegeUser" v-model="checkedPrivilege" v-on:change="updatePrivilegeList()"></td>
    </tr>
</template>

<script>
export default {
  props: {
    id: String,
    privilegio: String
  },
  data() {
    return {
      checkedPrivilege: false
    }
  },
  methods: {
    updatePrivilegeList(){
      if (this.checkedPrivilege){
        localStorage.setItem(this.id, this.id)
      } else{
        localStorage.removeItem(this.id)
      }
    }
  }
}
</script>

<style>
</style>