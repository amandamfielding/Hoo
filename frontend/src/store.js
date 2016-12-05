import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  events: [],
  event: [],
  errors: [],
  currentUser: (window.localStorage.user !== '') ? JSON.parse(window.localStorage.user) : {}
}

const mutations = {
  RECEIVE_EVENTS (state, events) {
    state.events = events
  },
  RECEIVE_EVENT (state, event) {
    state.event = event
  },
  LOGIN (state, user) {
    if (window.localStorage.user !== '') {
      state.currentUser = JSON.parse(window.localStorage.user)
    }
  },
  LOGOUT (state) {
    state.currentUser = {}
  },
  RECEIVE_ERRORS (state, err) {
    state.errors = JSON.parse(err.responseText)
  },
  CLEAR_ERRORS () {
    state.errors = []
  }
}

const actions = {
  getEvents ({ commit }, events) {
    commit('RECEIVE_EVENTS', events)
  },
  getEvent ({ commit }, event) {
    commit('RECEIVE_EVENT', event)
  },
  login ({commit}, user) {
    commit('LOGIN', user)
  },
  logout ({commit}) {
    commit('LOGOUT')
  },
  getErrors ({commit}, err) {
    commit('RECEIVE_ERRORS', err)
  },
  clearErrors ({commit}) {
    commit('CLEAR_ERRORS')
  }
}

export default new Vuex.Store({
  state,
  mutations,
  actions
})
