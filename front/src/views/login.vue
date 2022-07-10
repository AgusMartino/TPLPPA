<template>
<div class="container">
    <div class="col">
        <login/>
    </div>
</div>
</template>

<script>
import login from "../components/login.vue";

export default{
    components:{
         login
    }
}
</script>
<style>
.container{
    justify-content: center;
    align-items: center;
}
.col{
    justify-content: center;
    align-items: center;
    padding-right: 30%;
    padding-left: 30%
}
</style>