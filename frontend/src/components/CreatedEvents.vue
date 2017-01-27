<template>
  <div id='created-events'>
    <div class="created-search">
      <div class="created-search-panel">
        <select v-model="searchParams.city" @change="getCreatedEvents" class="miles">
          <option>San Francisco, CA</option>
          <option>Berkeley, CA</option>
          <option>Napa, CA</option>
          <option>Los Angeles, CA</option>
          <option>Indio, CA</option>
        </select>
        <select v-model="searchParams.miles" @change="getCreatedEvents" class="miles">
          <option value="5">5 mi</option>
          <option value="10">10 mi</option>
          <option value="15">15 mi</option>
          <option value="20">20 mi</option>
          <option value="25">25 mi</option>
          <option value="30">30 mi</option>
          <option value="35">35 mi</option>
          <option value="40">40+ mi</option>
        </select>
        <div class="created-date-div">
          Within the next:
          <select v-model="searchParams.date" @change="getCreatedEvents" class="date-search">
            <option>week</option>
            <option>month</option>
            <option>3 months</option>
            <option>6 months</option>
            <option>year</option>
            <option>any date</option>
          </select>
        </div>
        <div class="applicants-div">
          Minimum number of applicants: <input v-model="searchParams.applicants" @input="getCreatedEvents" class="applicants-search">
        </div>
        <div class="requirements">
          Requirements:
          <br/>
          <input type="checkbox" v-model="searchParams.requirements" @change="getCreatedEvents" value="1">no visible tattoos
          <br/>
          <input type="checkbox" v-model="searchParams.requirements" @change="getCreatedEvents" value="2">valid driver's license
          <br/>
          <input type="checkbox" v-model="searchParams.requirements" @change="getCreatedEvents" value="3">valid TIPS certification
          <br/>
          <input type="checkbox" v-model="searchParams.requirements" @change="getCreatedEvents" value="4">no felonies
        </div>
      </div>
    </div>

    <ul class="created-events-list">
      <li class="created-event" v-for='createdEvent in createdEvents'>
        <div class="event-image-container">
          <img @click="navToCreatedEventShow(createdEvent.id)" class="event-image" v-bind:id="createdEvent.id" v-bind:src="createdEvent.image_url" />
        </div>
        <div class="event-info">
          <h2 class="event-title">{{ createdEvent.title }}</h2>
          <div>{{ createdEvent.city }}, {{ createdEvent.state }}</div>
          <div>{{ calculateDate(createdEvent.start_date) }} - {{ calculateDate(createdEvent.end_date) }}</div>
          <div @click="navToCreatedEventShow(createdEvent.id)">{{ createdEvent.applicant_count }} applicants</div>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import $ from 'jquery'

export default {
  name: 'CreatedEvents',
  created () {
    if (window.localStorage.user) {
      this.getCreatedEvents()
    } else {
      this.$router.replace('/')
    }
  },
  data () {
    return {
      searchParams: {
        city: 'San Francisco, CA',
        miles: '40',
        date: 'any date',
        applicants: null,
        requirements: [],
        created: true
      }
    }
  },
  methods: {
    getCreatedEvents () {
      $.ajax({
        method: 'GET',
        url: '/api/events',
        data: this.searchParams,
        success: events => {
          this.$store.dispatch('getCreatedEvents', events)
        }
      })
    },
    calculateDate (date) {
      const monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
      let newDate = new Date(date)
      return monthNames[newDate.getMonth()] + ' ' + newDate.getDate() + ', ' + newDate.getFullYear()
    },
    navToCreatedEventShow (eventId) {
      this.$router.push('created-events/' + eventId)
    }
  },
  computed: {
    createdEvents: function () {
      return this.$store.state.createdEvents
    }
  }
}
</script>

<style scoped>
.created-events-list {
  list-style: none;
  padding: 0;
  margin-top: 70px;
  float: right;
  width: 70%;
}

.created-event {
  width: 90%;
  margin: auto;
  margin-bottom: 20px;
  background-color: rgba(226, 226, 255, 0.9);
  padding: 1% 2%;
  display: flex;
  position: relative;
  box-shadow: 0 2px 4px rgb(180,180,190);
}

.event-image-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.event-image {
  width: 260px;;
  cursor: pointer;
}

.event-image:hover {
  box-shadow: 0 0 6px black;
}

.event-info {
  margin-left: 2%;
}

.event-info div {
  margin: 10px 0;
  font-size: 1.2em;
}

.event-title {
  margin-bottom: 10px;
  font-size: 2.2em;
  cursor: pointer;
  text-align: left;
}

.show-link {
  text-decoration: underline;
  cursor: pointer;
}

.created-search {
  padding-top: 5px;
  position: fixed;
  height: 100%;
  width: 30%;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.created-search-panel {
  display: flex;
  justify-content: center;
  flex-direction: column;
  padding: 10px;
  background-color: rgba(86, 54, 165, 1);
  width: 80%;
  color: rgb(249,249,255);
  margin-left: 10%;
}

.miles {
  width: 100%;
  max-width: 180px;
  padding: 5px 10px;
  margin: auto;
  font-size: 16px;
  margin-bottom: 10px;
}

.created-date-div {
  width: 100%;
  font-size: 16px;
  text-align: center;
}

.date-div input {
  width: 90%;
}

.applicants-div {
  margin-top: 10px;
  margin-bottom: 10px;
  text-align: center;
}

.applicants-div input {
  width: 30px;
}
</style>
