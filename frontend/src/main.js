import Vue from 'vue'
import App from './App'
import VueRouter from 'vue-router'
import Vuex from 'vuex'
import VueResource from 'vue-resource'
import Home from './components/Home.vue'
import Profile from './components/Profile.vue'
import Top from './components/Top.vue'
import Events from './components/Events.vue'
Vue.use(VueRouter)
Vue.use(VueResource)
Vue.use(Vuex)

const router = new VueRouter({
  mode: 'history',
  base: __dirname,
  routes: [
    { path: '/',
      name: 'app',
      component: App,
      children: [
        {path: '',
          component: Home},
        {path: 'profile',
          components: {
            default: Profile,
            top: Top
          }
        },
        {path: 'events',
          components: {
            default: Events,
            top: Top
          }
        }
      ]}
  ]
})

new Vue({
  router,
  template: '<div><router-view name="top"></router-view><router-view></router-view></div>'
}).$mount('#app')
