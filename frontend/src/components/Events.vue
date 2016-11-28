<template>
  <div>
    hey {{ events }}
  </div>
</template>

<script>
import store from '../store'
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
        store.dispatch(store.actions.getEvents(data))
      }
    })
  }
}
</script>

<style>
</style>
