import Vue from 'vue/dist/vue'
import Vuex from 'vuex'
import * as actions from './actions'
import * as getters from './getters'
import user from './modules/user'
import events from './modules/events'
Vue.use(Vuex)

const store = new Vuex.Store({
  actions,
  getters,
  modules: {
    user,
    events
  }
})

export default store
