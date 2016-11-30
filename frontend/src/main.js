import Vue from 'vue'
import App from './App'
import VueRouter from 'vue-router'
import Router from './router'
import store from './store'
import VueLocalStorage from 'vue-localstorage'
// import VueAuth from '@websanova/vue-auth'

Vue.use(VueLocalStorage)
Vue.use(VueRouter)

// Vue.use(VueAuth, {
//   router: require('@websanova/vue-auth/drivers/router/vue-router.2.x.js'),
//   rolesVar: 'roles',
//   http: require('jquery'),
//   auth: require('@websanova/vue-auth/drivers/auth/bearer.js')
// })

export default new Vue({
  localStorage: {
    id_token: {
      default: null
    }
    // methods: {
    //   setIdToken (value) {
    //     this.$localStorage.set('id_token', value)
    //   }
    // }
  },
  store,
  el: '#app',
  router: Router,
  template: '<App/>',
  components: { App }
})

window.store = store
