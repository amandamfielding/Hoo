import Router from '../../router.js'
import $ from 'jquery'

export default {

  // User object will let us check authentication status
  user: {
    authenticated: false
  },

  // Send a request to the login URL and save the returned JWT
  login (context, data, redirect) {
    $.ajax({
      method: 'POST',
      url: '/api/session',
      data: data,
      success: user => {
        debugger
        context.$localStorage.set('id_token', data.id_token)
        context.$store.state.session.currentUser = user
        this.user.authenticated = true
        // Redirect to a specified route
        if (redirect) {
          Router.go(redirect)
        }
      },
      error: err => {
        context.error = err
      }
    })
  },

  // signup (context, creds, redirect) {
  //   context.$http.post(SIGNUP_URL, creds, (data) => {
  //     context.$localStorage.setItem('id_token', data.id_token)
  //
  //     this.user.authenticated = true
  //
  //     if (redirect) {
  //       Router.go(redirect)
  //     }
  //
  //   }).error((err) => {
  //     context.error = err
  //   })
  // },

  // To log out, we just need to remove the token
  logout () {
    this.$localStorage.removeItem('id_token')
    this.user.authenticated = false
  },

  checkAuth () {
    var jwt = this.$localStorage.getItem('id_token')
    if (jwt) {
      this.user.authenticated = true
    } else {
      this.user.authenticated = false
    }
  },

  // The object to be passed as a header for authenticated requests
  getAuthHeader () {
    return {
      'Authorization': 'Bearer ' + this.$localStorage.getItem('id_token')
    }
  }
}
