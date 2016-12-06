<template>
  <div id='events'>
    <div class="search">
      <input class="city-search" placeholder="City"></input>
      <select onChange="filter(miles,value)" class="miles">
        <option value="5">5 mi</option>
        <option value="10">10 mi</option>
        <option value="15">15 mi</option>
        <option value="20">20 mi</option>
        <option value="25">25 mi</option>
        <option value="30">30 mi</option>
        <option value="35">35 mi</option>
        <option selected value="40">40+ mi</option>
      </select>
      <div class="date-div">
        <div class="date-prompt">Within the next:
          <select onChange="filter" class="date-search">
            <option value="week">week</option>
            <option value="month">month</option>
            <option value="3 months">3 months</option>
            <option value="6 months">6 months</option>
            <option value="year">year</option>
          </select>
        </div>
      </div>
    </div>
    <ul class="events-list">
     <li class="event" v-for='event in allEvents'>
       <img @click="navToEventShow(event.id)" class="event-image" v-bind:id="event.id" :src="event.image_url" />
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
  created () {
    if (window.localStorage.user) {
      this.getEvents()
    } else {
      this.$router.replace('/')
    }
  },
  name: 'Events',
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
      this.$router.replace('events/' + eventId)
    },
    filter (type, value) {
      debugger
      $.ajax({
        method: 'GET',
        url: '/api/events',
        success: events => {
          this.$store.dispatch('getEventsByFilter', events, this.miles)
        }
      })
    }
  },
  computed: {
    allEvents: function () {
      return this.$store.state.events
    },
    miles: function () {
      return this.$store.state.miles
    }
  }
}
</script>

<style>

#events {
  margin-top: 75px;
}

.events-list {
 list-style: none;
 padding: 0;
}

.event {
 margin: 2% 10%;
 background-color: rgba(237, 237, 230, .7);
 padding: 1% 2%;
 display: flex;
 position: relative;
}

.event-image {
 width: 28%;
 height: 100%;
 cursor: pointer;
}

.event-image:hover {
  box-shadow: 0 0 4px black;
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
  background: #9882CF;
  padding: 10px;
  border-bottom-left-radius: 5px;
}

.search {
  display: flex;
  justify-content: center;
}

.city-search {
  width: 25%;
  font-size: 18px;
  padding: 5px 10px;
  margin-right: 2%;
}

.miles {
  font-size: 18px;
  padding: 5px 10px;
  margin-right: 3%;
}

.date-prompt {
  font-size: 18px;
  width: 320px;
}

.date-search {
  width: 120px;
  font-size: 18px;
  padding: 5px 10px;
}

.date-div {
  padding: 5px 10px;
}

.date-search option {
  padding: 5px 10px;
  font-size: 18px;
}
</style>
