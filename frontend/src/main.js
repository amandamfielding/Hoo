import Vue from 'vue'
import App from './App'
import VueRouter from 'vue-router'
import Profile from './components/Profile.vue'
import Events from './components/Events.vue'
import store from './store'
Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  base: __dirname,
  routes: [
    {
      path: '/',
      components: {
        default: App
      }
    },
    {
      path: '/profile',
      components: {
        default: Profile
      }
    },
    {
      path: '/events',
      component: Events
    }
  ]
})

export default new Vue({
  store,
  el: '#app',
  router,
  components: { App, Events },
  template: `
  <div>
    <router-view></router-view>
  </div>`
})
// <router-view name="events"></router-view>
