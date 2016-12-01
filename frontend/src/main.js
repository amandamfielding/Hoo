import Vue from 'vue'
import App from './App'
import VueRouter from 'vue-router'
import Router from './router'
import store from './store'
import VueLocalStorage from 'vue-localstorage'

Vue.use(VueLocalStorage)
Vue.use(VueRouter)

export default new Vue({
  localStorage: {
    authToken: {
      default: null
    }
  },
  store,
  el: '#app',
  router: Router,
  template: '<App/>',
  components: { App }
})

window.store = store
