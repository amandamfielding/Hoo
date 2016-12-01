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
        context.$localStorage.set('authToken', user.session_token)
        context.$localStorage.set('user', JSON.stringify(user))
        context.$store.dispatch('login')
        this.user.authenticated = true
        if (redirect) {
          context.$router.push(redirect)
        }
      },
      error: err => {
        context.error = err
      }
    })
  },

  signup (context, data, redirect) {
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
        context.error = err
      }
    })
  },

  // To log out, we just need to remove the token
  // logout (context) {
  //   $.ajax({
  //     method: 'DELETE',
  //     url: `/api/users/{}`,
  //     data: data,
  //     success: user => {
  //       context.$localStorage.set('authToken', user.session_token)
  //       context.$localStorage.set('user', JSON.stringify(user))
  //       context.$store.dispatch('login', user)
  //       this.user.authenticated = true
  //
  //       if (redirect) {
  //         context.$router.push(redirect)
  //       }
  //     },
  //     error: err => {
  //       context.error = err
  //     }
  //   })
  //   context.$localStorage.removeItem('authToken')
  //   context.$localStorage.removeItem('user')
  //   this.user.authenticated = false
  // },

  // The object to be passed as a header for authenticated requests
  getAuthHeader (context) {
    return {
      'Authorization': 'Bearer ' + context.$localStorage.getItem('authToken')
    }
  }
}
