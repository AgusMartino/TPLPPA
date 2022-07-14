<template>
<div id="app">
    <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
            <router-link to="/menuPrincipal" class="nav-link active" aria-current="page">Trabajo integrador LPPA 2022</router-link>
            </li>
            <li class="nav-item">
            <router-link to="/gestionUsuario" class="nav-link">Gestion de usuarios</router-link>
            </li>
            <li class="nav-item">
            <router-link to="/gestionPrivilegio" class="nav-link">Gestion de privilegios</router-link>
            </li>
            <li class="nav-item">
            <router-link to="/profile" class="nav-link">Perfil</router-link>
            </li>
        </ul>
    </nav>
    <router-view/>
</div>
</template>

<script>
</script>
<style>
</style>
