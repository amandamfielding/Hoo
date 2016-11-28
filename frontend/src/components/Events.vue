<template>
  <div>
    hey {{ events }}
  </div>
</template>

<script>
import store from '../store/index'
const data = {events: store.state.events}

export default {
  data () {
    return data
  },
  created: function () {
    this.fetchEvents()
  },
  methods: {
    fetchEvents: function () {
      debugger
      this.$http({
        url: 'http://localhost:3000/api/events',
        method: 'GET',
        headers: {
          'Access-Control-Allow-Origin': true
        }
      }).then((events) => {
        this.$set('list', events.json())
      },
      (response) => { console.log(response) })
    }
  }
}
</script>

<style>
</style>
