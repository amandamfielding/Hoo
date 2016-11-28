<template>
  <div>
    hey {{ message }}
  </div>
</template>

<script>
import store from '../store'
const data = {message: 'this is profile', events: store.state.events}

export default {
  data () {
    return data
  }
}
</script>

<style>
</style>
