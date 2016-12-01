<template>
  <div>
    <h3 class="text-center">Login</h3>
    <input type="text" class="form-control" placeholder="Username"
      v-model="user.username">
    <input type="password" class="form-control" placeholder="Password"
      v-model="user.password">
    <button class="login-button"
      @click="login">Sign in</button>
    <p class="text-center">
      Don't have an account? <router-link to="/authentication/signup">Sign up!</router-link>
   </p>
  </div>
</template>

<script>
  import authServices from './auth_services'

  export default {
    name: 'login',
    data: function () {
      return {
        user: {
          username: '',
          password: ''
        }
      }
    },
    methods: {
      login: function (e) {
        authServices.login(this, {user: this.user}, '/events')
      }
    }
  }
</script>

<style>
</style>
