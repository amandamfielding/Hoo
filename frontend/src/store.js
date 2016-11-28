import Vue from 'vue/dist/vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    events: []
  },
  mutations: {
    RECEIVE_EVENTS (state, events) {
      state.events = events
    }
  },
  actions: {
    getEvents ({ commit }, events) {
      commit('RECEIVE_EVENTS', events)
    }
  }
})
