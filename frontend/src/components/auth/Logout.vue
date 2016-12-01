<template>
  <div>
    <button class="logout-button"
      @click="logout">Logout</button>
  </div>
</template>

<script>
  import authServices from './auth_services'

  export default {
    name: 'logout',
    methods: {
      logout: function (e) {
        authServices.logout(this)
      }
    }
  }
</script>

<style>
</style>
