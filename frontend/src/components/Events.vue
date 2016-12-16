<template>
  <div id='events'>
    <div class="search">
      <div class="search-bar">
        <select v-model="searchParams.city" @change="filter" class="miles">
          <option>San Francisco, CA</option>
          <option>Berkeley, CA</option>
          <option>Napa, CA</option>
          <option>Los Angeles, CA</option>
          <option>Indio, CA</option>
        </select>
        <select v-model="searchParams.miles" @change="filter" class="miles">
          <option value="5">5 mi</option>
          <option value="10">10 mi</option>
          <option value="15">15 mi</option>
          <option value="20">20 mi</option>
          <option value="25">25 mi</option>
          <option value="30">30 mi</option>
          <option value="35">35 mi</option>
          <option value="40">40+ mi</option>
        </select>
        <div class="date-div">
          <div class="date-prompt">Within the next:
            <select v-model="searchParams.date" @change="filter" class="date-search">
              <option>week</option>
              <option>month</option>
              <option>3 months</option>
              <option>6 months</option>
              <option>year</option>
              <option>any date</option>
            </select>
          </div>
        </div>
      </div>
    </div>

    <ul class="events-list">
      <li class="event" v-for='event in allEvents'>
        <div class="event-image-container">
          <img @click="navToEventShow(event.id)" class="event-image" v-bind:id="event.id" v-bind:src="event.image_url" />
        </div>
        <div class="event-info">
          <h2 class="event-title">{{ event.title }}</h2>
          <div>{{ event.city }}, {{ event.state }}</div>
          <div>{{ calculateDate(event.start_date) }} - {{ calculateDate(event.end_date) }}</div>
          <div class="show-link" v-bind:id="event.id" @click="navToEventShow(event.id)">Event Details</div>
          <div class="pay">${{ event.pay }} per {{ event.pay_freq }}</div>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import $ from 'jquery'

export default {
  name: 'Events',
  created () {
    if (window.localStorage.user) {
      this.getEvents()
    } else {
      this.$router.replace('/')
    }
  },
  data: function () {
    return {
      searchParams: {
        city: 'San Francisco, CA',
        miles: '40',
        date: 'any date'
      }
    }
  },
  methods: {
    getEvents () {
      $.ajax({
        method: 'GET',
        url: '/api/events',
        success: events => {
          this.$store.dispatch('getEvents', events)
        }
      })
    },
    calculateDate (date) {
      const monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
      let newDate = new Date(date)
      return monthNames[newDate.getMonth()] + ' ' + newDate.getDate() + ', ' + newDate.getFullYear()
    },
    navToEventShow (eventId) {
      this.$router.push('events/' + eventId)
    },
    filter () {
      $.ajax({
        method: 'GET',
        url: '/api/events',
        data: this.searchParams,
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

.events-list {
  list-style: none;
  padding: 0;
  margin-top: 125px;
}

.event {
  margin: 2% 16%;
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

.pay {
  position: absolute;
  right: 0;
  top: -10px;
  background: rgba(86, 54, 165, 1);
  padding: 10px;
  border-bottom-left-radius: 5px;
  color: rgb(249,249,255);
}

.search {
  padding-top: 5px;
}
.search-bar {
  display: flex;
  justify-content: center;
  padding: 10px;
  background-color: rgba(86, 54, 165, 1);
  width: 70%;
  color: rgb(249,249,255);
  position: fixed;
  top: 64px;
  left: 14%;
  z-index: 20;
}

.city-search {
  width: 25%;
  padding: 5px 10px;
  margin-right: 2%;
  font-size: 16px;
}

.miles {
  padding: 5px 10px;
  margin-right: 3%;
  font-size: 16px;
}

.date-prompt {
  width: auto;
  font-size: 16px;
}

.date-search {
  width: 120px;
  padding: 5px 10px;
  font-size: 16px;
}

.date-div {
  padding: 5px 10px;
}

.date-search option {
  padding: 5px 10px;
  font-size: 18px;
}
</style>
