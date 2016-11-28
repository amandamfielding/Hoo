import Vue from 'vue/dist/vue'
import Vuex from 'vuex'
Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    events: '',
    users: '',
    companies: ''
  },
  mutations: {

  }
})

export default store
