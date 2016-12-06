<template>
  <div class="login">
    <ul class="login-errors">
      <li v-for="error in errors">
        {{ error }}
      </li>
    </ul>
    <h3 class="login-text">Log In</h3>
    <input type="text" class="form-control" placeholder="Username"
      v-model="user.username">
    <input type="password" class="form-control" placeholder="Password"
      v-model="user.password">
    <button class="login-button"
      @click="login">Log In</button>
    <span class="redirect">
      Don't have an account? <router-link to="/authentication/signup">Sign up!</router-link>
   </span>
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
    computed: {
      errors: function () {
        return this.$store.state.errors
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

.login {
  width: 300px;
	margin: auto;
  display: flex;
  flex-direction: column;
}

.login-text {
  font-size: 30px;
  margin: 20px 0;
  text-align: center;
}

.form-control {
  margin: 5px 0;
  padding: 2% 1%;
  font-size: 18px;
}

.login-button {
  font-size: 20px;
  padding: 8px;
  margin-top: 5px;
  cursor: pointer;
  font-family: Raleway;
}

.redirect {
  font-size: 18px;
  text-align: center;
  margin: 15px 0;
}
</style>
