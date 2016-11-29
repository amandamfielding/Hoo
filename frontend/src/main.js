import Vue from 'vue'
import App from './App'
import VueRouter from 'vue-router'
import Authentication from './components/auth/Authentication'
import Login from './components/auth/Login'
import Signup from './components/auth/Signup'
import Profile from './components/Profile'
import Events from './components/Events'
import store from './store'
// import VueAuth from '@websanova/vue-auth'

Vue.use(VueRouter)

const Router = new VueRouter({
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
      path: '/authentication',
      component: Authentication,
      redirect: '/authentication/login',
      children: [
        {
          path: 'login',
          component: Login
          // meta: {auth: false}
        },
        {
          path: 'signup',
          component: Signup
          // meta: {auth: false}
        }
      ]
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

// Vue.use(VueAuth, {
//   router: Router,
//   rolesVar: 'roles'
// })

export default new Vue({
  store,
  el: '#app',
  router: Router,
  template: '<App/>',
  components: { App }
})

window.store = store
