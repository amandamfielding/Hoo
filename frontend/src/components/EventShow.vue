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
      <ul class="event-requirement-list">
          <li  class="event-requirement" v-for='requirement in requirement_titles'>{{ requirement }}</li>
      </ul>
      <div class="show-company">{{ showAdmin(event.admin_name,event.company_name) }}
        <div class=""><a :href="event.company_website">Company Website</a></div>
      </div>
    </div>
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
        url: `/api/requests/1`,
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
      if (this.$store.state.request && this.$store.state.request.event_id) {
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
      if (this.$store.state.request && this.$store.state.request.event_id) {
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
    requirement_titles: function () {
      const titles = []
      if (this.event.requirements) {
        this.event.requirements.forEach(id => {
          if (id === 1) {
            titles.push('no visible tattoos')
          } else if (id === 2) {
            titles.push('valid driver\'s license')
          } else if (id === 3) {
            titles.push('valid TIPS certification')
          } else if (id === 4) {
            titles.push('no felonies')
          }
        })
      }
      return titles
    }
  }
}
</script>

<style>
.event-show {
  margin: 8% 12%;
  display: flex;
  min-height: 75vh;
  box-shadow: 0 2px 4px rgb(180,180,190);
}

.event-show h2 {
  font-size: 44px;
  margin: 10px 0;
}

.show-left {
  width: 35%;
  background-color: rgba(226, 226, 255, 0.9);
  padding: 5%;
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
  width: 55%;
  background-color: rgba(226, 226, 255, 0.9);
  padding: 5%;
  position: relative;
}

.show-description {
  margin-bottom: 20px;
  font-size: 18px;
  line-height: 1.6;
}

.event-requirement-list {
  list-style: none;
  color: rgba(86, 54, 165, 1);
  display: flex;
  justify-content: center;
}

#req-header {
  font-size: 20px;
  text-decoration: underline;
}

.event-requirement {
  padding: 10px;
  font-weight: 700;
  font-size: 16px;
  background-color: rgb(210,215,225);
  box-shadow: 0 0 2px white;
  margin: 3%;
}

a {
  color: rgba(86, 54, 165, 1);
}

.show-company {
  font-size: 16px;
  position: absolute;
  bottom: 7%;
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

.apply-response {
  font-size: 20px;
}
</style>
