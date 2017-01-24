<template>
  <div class="event-manage">
    <span>Event title <input v-model="event.title" placeholder="title"></span>
    <span>Event type <input v-model="event.event_type" placeholder="type"></span>
    <span>Location <input v-model="event.city" placeholder="city">  <input v-model="event.state" placeholder="state"></span>
    <span>Beginning Date <input type="date" v-model="event.start_date"></span>
    <span>Ending Date <input type="date" v-model="event.end_date"></span>
    <span>$<input v-model="event.pay" placeholder="pay rate"> per <input v-model="event.pay_freq" placeholder="pay frequency"></span>
    <textarea v-model="event.description" placeholder="description"/>
    <!-- <div>
      Requirements:
      <br/>
      <input type="checkbox" v-model="events.requirements" value="1">no visible tattoos
      <br/>
      <input type="checkbox" v-model="events.requirements" value="2">valid driver's license
      <br/>
      <input type="checkbox" v-model="events.requirements" value="3">valid TIPS certification
      <br/>
      <input type="checkbox" v-model="events.requirements" value="4">no felonies
    </div> -->
    <span>Company Website <input v-model="event.company_website" placeholder="website url"></span>
    <button @click="submitEventChanges(this.$route.params.eventId)">Update Event</button>
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
    submitEventChanges (eventId) {
      $.ajax({
        method: 'POST',
        url: '/api/events/' + eventId,
        data: {event: this.$store.state.event},
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

<style scoped>
.event-manage {
  position: absolute;
  top: 75px;
}

.event-manage span {
  display: block;
  margin-bottom: 10px;
}
</style>
