<template>
  <div class="event-manage">
    <h2>{{ event.title }}</h2>
    <span class="manage-type">Event type: {{ event.event_type }}</span>
    <li>{{ event.city }}, {{ event.state }}</li>
    <li>{{ calculateDate(event.start_date) }} - {{ calculateDate(event.end_date) }}</li>
    <li>${{ event.pay }} per {{ event.pay_freq }}</li>
    <div class="manage-description">{{ event.description }}</div>
    <ul class="event-requirement-list">
        <li  class="event-requirement" v-for='requirement in requirements'>{{ requirement.title }}</li>
    </ul>
    <div class="manage-company">{{ showAdmin(event.admin_name,event.company_name) }}
      <div class=""><a :href="event.company_website">Company Website</a></div>
    </div>
    <button @click="navToRequestsManage">View {{ event.applicant_count }} Request(s)</button>
  </div>
</template>

<script>
import $ from 'jquery'

export default {
  name: 'EventManage',
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
    navToRequestsManage (eventId) {
      this.$router.push(`/created-events/${this.$store.state.event.id}/requests`)
    },
    delete () {
      $.ajax({
        method: 'DELETE',
        url: '/api/events/' + this.event.id,
        success: request => {
          this.$store.dispatch('deleteRequest', request)
        }
      })
    },
    edit () {
      $.ajax({
        method: 'POST',
        url: '/api/events',
        data: {event: {}},
        success: request => {
          this.$store.dispatch('createRequest', request)
          this.openApplyModal()
        }
      })
    },
    showAdmin (admin, company) {
      if (company) {
        return ('Posted by: ' + admin + ' from ' + company)
      } else {
        return ('Posted by: ' + admin)
      }
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

</style>
