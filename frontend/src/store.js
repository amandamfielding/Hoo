import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  events: [],
  currentUser: {}
}

const mutations = {
  RECEIVE_EVENTS (state, events) {
    state.events = events
  },
  LOGIN (state, user) {
    state.currentUser = user
  }
}

const actions = {
  getEvents ({ commit }, events) {
    commit('RECEIVE_EVENTS', events)
  },
  login ({commit}, user) {
    commit('LOGIN', user)
  }
}

export default new Vuex.Store({
  state,
  mutations,
  actions
})
