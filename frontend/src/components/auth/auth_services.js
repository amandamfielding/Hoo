import $ from 'jquery'

export default {
  user: {
    authenticated: false
  },

  login (context, data, redirect) {
    context.$store.dispatch('clearErrors')
    $.ajax({
      method: 'POST',
      url: '/api/session',
      data: data,
      success: user => {
        context.$localStorage.set('authToken', user.session_token)
        context.$localStorage.set('user', JSON.stringify(user))
        context.$store.dispatch('login')
        this.user.authenticated = true
        if (redirect) {
          context.$router.push(redirect)
        }
      },
      error: err => {
        context.$store.dispatch('getErrors', err)
      }
    })
  },

  signup (context, data, redirect) {
    context.$store.dispatch('clearErrors')
    $.ajax({
      method: 'POST',
      url: '/api/users',
      data: data,
      success: user => {
        context.$localStorage.set('authToken', user.session_token)
        context.$localStorage.set('user', JSON.stringify(user))
        context.$store.dispatch('login', user)
        this.user.authenticated = true

        if (redirect) {
          context.$router.push(redirect)
        }
      },
      error: err => {
        context.$store.dispatch('getErrors', err)
      }
    })
  },

  logout (context) {
    $.ajax({
      method: 'DELETE',
      url: `/api/session`,
      success: user => {
        context.$store.dispatch('login', user)
        context.$localStorage.set('authToken', '')
        context.$localStorage.set('user', '')
        this.user.authenticated = false
        context.$router.push('/')
      }
    })
  },

  getAuthHeader (context) {
    return {
      'Authorization': 'Bearer ' + context.$localStorage.getItem('authToken')
    }
  }
}
