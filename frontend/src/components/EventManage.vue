<template>
  <div class="event-manage">
    <span>Event title <input v-model="event.title" placeholder="Add a short, clear name" class="manage-title"></span>
    <span>Event type <input v-model="event.event_type" class="manage-type"></span>
    <span>Location <input v-model="event.city" placeholder="City" class="manage-city"> <input v-model="event.state" placeholder="State" class="manage-state"></span>
    <span>Geocoordinates <input v-model="event.lat" placeholder="Latitude" class="manage-geo"> <input v-model="event.lng" placeholder="Longitude" class="manage-geo"></span>
    <span>Beginning Date <input type="date" v-model="event.start_date" class="manage-date"></span>
    <span>Ending Date <input type="date" v-model="event.end_date" class="manage-date"></span>
    <span>$<input v-model="event.pay" placeholder="pay rate" class="manage-pay"> per <input v-model="event.pay_freq" placeholder="pay frequency" class="manage-freq"></span>
    <textarea v-model="event.description" placeholder="Add a longer description of the event"/>
    <span>Event Image URL <input v-model="event.image_url" placeholder="Add an image for the event" class="manage-url"/></span>
    <span>Company Website <input v-model="event.company_website" placeholder="website url" class="manage-url"></span>
    <div class="requirements-div">
      Requirements
      <select v-if="event.requirements" v-model="event.requirements" multiple>
        <option value="1">no visible tattoos</option>
        <option value="2">valid driver's license</option>
        <option value="3">valid TIPS certification</option>
        <option value="4">no felonies</option>
      </select>
    </div>
    <div class="button-div">
      <button @click="submitEventChanges">Update Event</button>
      <div id="event-update-modal" class="modal">
        <div class="modal-update">
          <p class="update-response">
            Your event has been updated!
          </p>
          <button id="ok" @click='closeEventUpdateModal'>OK</button>
        </div>
      </div>
      <button @click="navToRequestsManage">View {{ event.applicant_count }} Request(s)</button>
    </div>
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
        method: 'PATCH',
        url: '/api/events/' + this.$route.params.eventId,
        data: {event: this.$store.state.event},
        success: event => {
          this.$store.dispatch('getEvent', event)
          this.openEventUpdateModal()
        }
      })
    },
    openEventUpdateModal () {
      let eventUpdateModal = document.getElementById('event-update-modal')
      eventUpdateModal.style.display = 'block'
    },
    closeEventUpdateModal () {
      let eventUpdateModal = document.getElementById('event-update-modal')
      eventUpdateModal.style.display = 'none'
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
    }
  }
}
</script>

<style>
.event-manage {
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 70%;
  margin: auto;
  margin-top: 75px;
}

.event-manage span {
  display: inline;
  margin: auto;
  margin-bottom: 10px;
  font-weight: bold;
}

.event-manage input {
  font-size: 14px;
  padding: 5px;
}

.event-manage textarea {
  font-size: 14px;
  padding: 5px;
  width: 80%;
  height: 100px;
  margin: auto;
  margin-bottom: 10px;
}

.requirements-div {
  font-weight: bold;
  display: flex;
  justify-content: center;
}

.requirements-div select {
  margin-left: 10px;
}

.manage-title {
  width: 200px;
}

.manage-type {
  width: 150px;
}

.manage-city {
  width: 100px;
}

.manage-state {
  width: 30px;
}

.manage-date {
  width: 130px;
}

.manage-pay {
  width: 40px;
}

.manage-freq {
  width: 75px;
}

.manage-url {
  width: 270px;
}

.manage-geo {
  width: 60px;
}

.modal-update {
  background-color: #fefefe;
  padding: 20px;
  border: 1px solid #888;
  width: 60%;
  margin: 10% auto;
  display: flex;
  flex-direction: column;
}

.update-response {
  font-size: 20px;
  text-align: center;
}

#ok {
  width: 50px;
  margin: auto;
}

.button-div {
  margin: auto;
  margin-top: 10px;
  margin-bottom: 50px;
}

button {
  font-size: 14px;
  padding: 6px 12px;
  cursor: pointer;
}
</style>
