<template>
  <div class="event-show">
    <h2>{{event.title}}</h2>
    <div class="">{{event.city}}, {{event.state}}</div>
    <div>{{ calculateDate(event.start_date) }} - {{ calculateDate(event.end_date) }}</div>
    <div class=""></div>
    <div class=""></div>
  </div>
</template>

<script>
import $ from 'jquery'

export default {
  name: 'EventShow',
  created () {
    if (window.localStorage.user) {
      this.getEvent(this.$route.params.eventId)
    } else {
      this.$router.replace('/')
    }
  },
  methods: {
    getEvent (eventId) {
      $.ajax({
        method: 'GET',
        url: '/api/events/' + eventId,
        success: event => {
          this.$store.dispatch('getEvent', event)
        }
      })
    },
    calculateDate (date) {
      const monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
      let newDate = new Date(date)
      return monthNames[newDate.getMonth()] + ' ' + newDate.getDate() + ', ' + newDate.getFullYear()
    }
  },
  computed: {
    event: function () {
      return this.$store.state.event
    }
  }
}
</script>

<style>

.event-show {
  margin-top: 75px;
}
</style>