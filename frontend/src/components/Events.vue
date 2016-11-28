<template>
  <div>
    hey {{ events }}
  </div>
</template>

<script>
import store from '../store/index'
import $ from 'jquery'
const data = {events: store.state.events}

export default {
  data () {
    return data
  },
  created () {
    $.ajax({
      method: 'GET',
      url: '/api/events',
      success: function (data) {
        console.log(data)
      }
    })
  }
}
</script>

<style>
</style>
