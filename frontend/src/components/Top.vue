<template>
  <header class="top">hey {{ userInfo.fname }}</header>
</template>

<script>
export default {
  name: 'top',
  computed: {
    userInfo: function () {
      return JSON.parse(window.localStorage.user)
    }
  }
}

</script>

<style>

</style>
