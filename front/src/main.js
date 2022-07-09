import Vue from 'vue'
import App from './index.vue'
import vueRouter from 'vue-router'
import Routes from './router' 

Vue.use(vueRouter);

const rutas = new vueRouter({
	routes: Routes
})

new Vue({
  el: '#app',
  render: h => h(App),
  router: rutas
})





