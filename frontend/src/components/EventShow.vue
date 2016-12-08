<template>
  <div class="event-show">
    <div class="show-left">
      <h2>{{ event.title }}</h2>
      <span class="show-type">Event type: {{ event.event_type }}</span>
      <li>{{ event.city }}, {{ event.state }}</li>
      <li>{{ calculateDate(event.start_date) }} - {{ calculateDate(event.end_date) }}</li>
      <li>${{ event.pay }} per {{ event.pay_freq }}</li>
      <button class="apply" type="button" @click='submit'>{{ showButton() }}</button>
        <div id="applyModal" class="modal">
          <div class="modal-apply">
            <p class="apply-response">
              Thank you for applying! The recruiter has been sent your details and will accept or deny your application shortly.
            </p>
            <button id="ok" @click='closeApplyModal'>OK</button>
          </div>
        </div>
    </div>
    <div class="show-right">
      <div class="show-description">{{ event.description }}</div>
      <div class="show-company">{{ showAdmin(event.admin_name,event.company_name) }}</div>
      <div class=""><a :href="event.company_website">Company Website</a></div>
    </div>
    <ul class="event-requirement-list">
      <span id="req-header">Requirements</span>
        <li  class="event-requirement" v-for='requirement in requirements'>{{ requirement.title }}</li>
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
      this.getRequest(this.$route.params.eventId)
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
    getRequest (eventId) {
      $.ajax({
        method: 'GET',
        url: '/api/requests',
        data: {event_id: eventId},
        success: request => {
          this.$store.dispatch('getRequest', request)
        }
      })
    },
    calculateDate (date) {
      const monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
      let newDate = new Date(date)
      return monthNames[newDate.getMonth()] + ' ' + newDate.getDate() + ', ' + newDate.getFullYear()
    },
    openApplyModal () {
      let applyModal = document.getElementById('applyModal')
      applyModal.style.display = 'block'
    },
    closeApplyModal () {
      let applyModal = document.getElementById('applyModal')
      applyModal.style.display = 'none'
    },
    submit () {
      if (this.$store.state.request) {
        $.ajax({
          method: 'DELETE',
          url: '/api/requests/' + this.event.id,
          data: {request: {event_id: this.event.id}},
          success: request => {
            this.$store.dispatch('deleteRequest', request)
          }
        })
      } else {
        $.ajax({
          method: 'POST',
          url: '/api/requests',
          data: {request: {event_id: this.event.id}},
          success: request => {
            this.$store.dispatch('createRequest', request)
            this.openApplyModal()
          }
        })
      }
    },
    showAdmin (admin, company) {
      if (company) {
        return ('Posted by: ' + admin + ' from ' + company)
      } else {
        return ('Posted by: ' + admin)
      }
    },
    showButton () {
      if (this.$store.state.request) {
        return ('Cancel Application')
      } else {
        return ('Apply')
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

.event-show {
  margin: 10%;
  margin-top: 100px;
  margin-bottom: 20px;
  display: flex;
  min-height: 75vh;
}

.event-show h2 {
  font-size: 44px;
  margin: 10px 0;
}

.show-left {
  width: 37%;
  background-color: rgba(237, 237, 230, .7);
  padding: 30px;
  text-align: center;
}

.show-left li {
  margin: 20px 0;
  font-size: 22px;
  list-style: none;
}

.apply {
  padding: 7px 14px;
  font-size: 20px;
  cursor: pointer;
  margin: 20px 0;
}

.show-right {
  width: 45%;
  margin-left: 3%;
  background-color: rgba(237, 237, 230, .7);
  padding: 24px;
  font-size: 19px;
}

.show-description {
  margin-bottom: 20px;
}

.event-requirement-list {
  background-color: rgba(86, 54, 165, .6);
  padding: 15px;
  list-style: none;
  text-align: center;
  color: rgba(237, 237, 230, 1);
}

#req-header {
  font-size: 20px;
  text-decoration: underline;
}

.event-requirement {
  padding: 10px;
  font-weight: 700;
  font-size: 16px;
}

a {
  color: rgba(86, 54, 165, 1);
}

.show-type {
  font-size: 18px;
}

.modal-apply {
  background-color: #fefefe;
  padding: 20px;
  border: 1px solid #888;
  width: 60%;
  margin: 10% auto;
}

.apply-form {
  display: flex;
  flex-direction: column;
}

.attach-resume, .cover-letter, .submit {
  margin: 10px 0;
}

.cover-letter textarea {
  padding: 10px;
  font-size: 18px;
}

#ok {
  font-size: 20px;
  padding: 6px 12px;
  cursor: pointer;
}

.apply-response {
  font-size: 20px;
}
</style>
