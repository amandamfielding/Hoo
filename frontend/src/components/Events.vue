<template>
  <div id='events'>
    hey
    <ul>
      <li v-for='event in allEvents'>{{ event.title }}</li>
    </ul>
  </div>
</template>

<script>
import $ from 'jquery'

export default {
  data () {
  },
  created () {
    this.getEvents()
  },
  name: 'Events',
  methods: {
    getEvents () {
      $.ajax({
        method: 'GET',
        url: '/api/events',
        success: events => {
          this.$store.dispatch('getEvents', events)
        }
      })
    }
  },
  computed: {
    allEvents: function () {
      return this.$store.state.events
    }
  }
}
</script>

<style>
</style>
