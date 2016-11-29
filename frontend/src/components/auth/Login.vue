<template>
    <div>
        <h3 class="text-center">Login</h3>
        <input type="text" class="form-control m-b-15" placeholder="Username"
               v-model="user.username">
        <input type="password" class="form-control" placeholder="Password"
               v-model="user.password">
        <button class="btn btn-lg btn-primary btn-block m-b-15"
            @click="login">Sign in</button>
        <p class="text-center">
            Don't have an account? <router-link to="/authentication/signup">Sign up!</router-link>
        </p>
    </div>
</template>

<script>
  import $ from 'jquery'
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
      login: function (user) {
        debugger
        $.ajax({
          method: 'POST',
          url: '/api/session',
          data: {user: {username: this.user.username, password: this.user.password}},
          success: user => {
            this.$store.dispatch('login', user)
          }
        })
      }
    }
  }
</script>

<style>
</style>
