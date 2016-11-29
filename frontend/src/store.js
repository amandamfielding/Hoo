import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  events: []
}

const mutations = {
  RECEIVE_EVENTS (state, events) {
    state.events = events
  }
}

const actions = {
  getEvents ({ commit }, events) {
    commit('RECEIVE_EVENTS', events)
  }
}

export default new Vuex.Store({
  state,
  mutations,
  actions
})
