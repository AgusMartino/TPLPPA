<template>
<div>
    <NAV/>
</div>
<div class="container">
    <div class="col">
        <userRegister/>
    </div>
</div>
</template>

<script>
import NAV from "./components/nav.vue"
import userRegister from "./components/userRegister.vue"
export default{
    components:{
        NAV,
        userRegister
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
