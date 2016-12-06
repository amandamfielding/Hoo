<template>
  <div class="event-show">
    <div class="show-left">
      <h2>{{ event.title }}</h2>
      <span class="show-type">Event type: {{ event.event_type }}</span>
      <li>{{ event.city }}, {{ event.state }}</li>
      <li>{{ calculateDate(event.start_date) }} - {{ calculateDate(event.end_date) }}</li>
      <li>${{ event.pay }} per {{ event.pay_freq }}</li>
      <button class="apply" type="button" @click='openApplyModal'>Apply</button>
        <div id="applyModal" class="modal">
          <div class="modal-apply">
            <span id="close" @click='closeApplyModal'>x</span>
            <form class="apply-form" action="index.html" method="post">
            </br>
              <div class="attach-resume">
                <label for="resume">Attach your resume?
                  <label>Yes
                    <input type="radio" id="yes">
                    </label>
                    <label>No
                      <input type="radio" id="no">
                    </label>
                </label>
              </div>
              <div class="cover-letter">
                <textarea rows="8" cols="50" placeholder="Why do you want to work this event? Why should the recruiter hire you?"></textarea>
              </div>
              <div class="submit">
                <button id="submit-button" type="button" @click="submit">Submit</button>
              </div>
            </form>
          </div>
        </div>
    </div>
    <div class="show-right">
      <div class="show-description">{{ event.description }}</div>
      <div class="show-company">{{ showAdmin(event.admin_name,event.company_name) }}</div>
      <div class=""><a :href="event.company_website">Company Website</a></div>
    </div>
    <ul class="event-requirement-list">
      Requirements: <li  class="event-requirement" v-for='requirement in requirements'>{{ requirement.title }}</li>
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
    openApplyModal () {
      let applyModal = document.getElementById('applyModal')
      applyModal.style.display = 'block'
    },
    closeApplyModal () {
      let applyModal = document.getElementById('applyModal')
      applyModal.style.display = 'none'
    },
    submit () {
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
  padding-top: 6%;
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
  font-size: 20px;
  color: rgba(237, 237, 230, 1);
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
  margin: 60px auto;
}

.apply-form {
  display: flex;
  flex-direction: column;
}

.attach-resume, .cover-letter, .submit {
  margin: 10px 0;
}

.cover-letter textarea {
  font-size: 18px;
}

#submit-button {
  font-size: 20px;
  padding: 6px 12px;
  cursor: pointer;
}
</style>
