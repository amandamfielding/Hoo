<template>
  <div class="event-show">
    <h2>{{event.title}}</h2>
    <p class="">{{event.city}}, {{event.state}}</p>
    <p>{{ calculateDate(event.start_date) }} - {{ calculateDate(event.end_date) }}</p>
    <p class="">{{event.description}}</p>
    <p class="">${{event.pay}} per {{event.pay_freq}}</p>
    <ul class="event-requirement-list">
      <li  class="event-requirement" v-for='requirement in requirements'>{{requirement.title}}</li>
    </ul>
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
    },
    apply () {
    }
  },
  computed: {
    event: function () {
      return this.$store.state.event
    },
    requirements: function () {
      return this.event.requirements
    }
  }
}
</script>

<style>

.event-show {
  margin-top: 75px;
}
</style>
