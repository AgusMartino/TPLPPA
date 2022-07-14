import { createApp } from 'vue'
import App from './index.vue'
import { createRouter, createWebHistory } from 'vue-router'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap/dist/js/bootstrap.js'

const routes = [
  {
    path:'/',
    name:'home',
    component: () => import('./views/login.vue')
},
{
    path:'/resetPassword',
    name:'resetPassword',
    component: () => import('./views/resetPassword.vue')
},
{
    path:'/menuPrincipal',
    name:'menuPrincipal',
    component: () => import('./views/menuPrincipal.vue')
},
{
    path:'/gestionPrivilegio',
    name:'gestionPrivilegio',
    component: () => import('./views/gestionPrivilegio.vue')
},
{
    path:'/modifyPrivilegio',
    name:'modifyPrivilegio',
    component: () => import('./views/modifyPrivilege.vue')
},
{
    path:'/gestionUsuario',
    name:'gestionUsuario',
    component: () => import('./views/gestionUsuario.vue')
},
{
    path:'/userRegister',
    name:'userRegister',
    component: () => import('./views/userRegister.vue')
},
{
    path:'/modifyUser',
    name:'modifyUser',
    component: () => import('./views/modifyUser.vue')
},
{
    path:'/profile',
    name:'profile',
    component: () => import('./views/profile.vue')
}
]

const router = createRouter({
  history: createWebHistory('/'),
  routes
})

createApp(App).use(router).mount('#app')