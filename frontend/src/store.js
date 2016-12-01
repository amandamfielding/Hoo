import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  events: [],
  currentUser: (window.localStorage.user !== '') ? JSON.parse(window.localStorage.user) : {}
}

const mutations = {
  RECEIVE_EVENTS (state, events) {
    state.events = events
  },
  LOGIN (state, user) {
    if (window.localStorage.user !== '') {
      state.currentUser = JSON.parse(window.localStorage.user)
    }
  },
  LOGOUT (state) {
    state.currentUser = {}
  }
}

const actions = {
  getEvents ({ commit }, events) {
    commit('RECEIVE_EVENTS', events)
  },
  login ({commit}, user) {
    commit('LOGIN', user)
  },
  logout ({commit}) {
    commit('LOGOUT')
  }
}

export default new Vuex.Store({
  state,
  mutations,
  actions
})
