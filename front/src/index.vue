<template>
<div>
    <NAV/>
</div>
<div class="container">
    <div class="col">
        <login/>
    </div>
</div>
</template>

<script>
import NAV from "./components/nav.vue"
import login from "./components/login.vue"
export default{
    components:{
        NAV,
        login
    }
}
</script>
<style>
.container{
    justify-content: center;
    align-items: center;
    padding-right: 25%;
    padding-left: 25%
}
</style>
