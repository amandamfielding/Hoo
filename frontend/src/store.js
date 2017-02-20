import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  events: [],
  miles: '',
  event: {},
  errors: [],
  currentUser: (window.localStorage.user) ? JSON.parse(window.localStorage.user) : {},
  request: null,
  createdEvents: [],
  requests: [],
  user: {}
}

const mutations = {
  RECEIVE_EVENTS (state, events) {
    state.events = events
  },
  RECEIVE_CREATED_EVENTS (state, events) {
    state.createdEvents = events
  },
  RECEIVE_EVENTS_BY_FILTER (state, events) {
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
  CLEAR_ERRORS (state) {
    state.errors = []
  },
  RECEIVE_NEW_REQUEST (state, request) {
    state.request = request
  },
  RECEIVE_REQUEST (state, request) {
    state.request = request
  },
  RECEIVE_REQUESTS (state, requests) {
    state.requests = requests
  },
  DELETE_REQUEST (state, request) {
    state.request = null
  },
  RECEIVE_USER (state, user) {
    state.user = user
  },
  SET_CURRENT_USER (state) {
    state.user = state.currentUser
  }
}

const actions = {
  getEvents ({ commit }, events) {
    commit('RECEIVE_EVENTS', events)
  },
  getCreatedEvents ({ commit }, events) {
    commit('RECEIVE_CREATED_EVENTS', events)
  },
  getRequests ({ commit }, requests) {
    commit('RECEIVE_REQUESTS', requests)
  },
  getRequest ({ commit }, request) {
    commit('RECEIVE_REQUEST', request)
  },
  getUser ({ commit }, user) {
    commit('RECEIVE_USER', user)
  },
  setCurrentUser ({ commit }) {
    commit('SET_CURRENT_USER')
  },
  getEventsByFilter ({ commit }, events) {
    commit('RECEIVE_EVENTS_BY_FILTER', events)
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
  },
  createRequest ({commit}, request) {
    commit('RECEIVE_NEW_REQUEST', request)
  },
  deleteRequest ({commit}, request) {
    commit('DELETE_REQUEST', request)
  }
}

export default new Vuex.Store({
  state,
  mutations,
  actions
})
