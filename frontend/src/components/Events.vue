<template>
  <div id='events'>
    <div class="search">
      <input v-model="city" @input="filter" class="city-search" placeholder="City"></input>
      <select v-model="miles" @change="filter" class="miles">
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
          <select v-model="date" @change="filter" class="date-search">
            <option>week</option>
            <option>month</option>
            <option>3 months</option>
            <option>6 months</option>
            <option>year</option>
          </select>
        </div>
      </div>
    </div>

    <ul class="events-list">
     <li class="event" v-for='event in allEvents'>
       <img @click="navToEventShow(event.id)" class="event-image" v-bind:id="event.id" :src="event.image_url" />
       <div class="event-info" @click="navToEventShow(event.id)" v-bind:id="event.id">
         <h2>{{ event.title }}</h2>
         <div>{{ event.city }}, {{ event.state }}</div>
         <div>{{ calculateDate(event.start_date) }} - {{ calculateDate(event.end_date) }}</div>
         <div class="pay">${{ event.pay }} per {{ event.pay_freq }}</div>
         <!-- <ul v-for='requirement in {{event.requirements}}'>
         <li>{{requirement.title}}</li>
         </ul> -->
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
      city: '',
      miles: '',
      date: ''
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
      this.$router.replace('events/' + eventId)
    },
    filter () {
      $.ajax({
        method: 'GET',
        url: '/api/events',
        success: events => {
          this.$store.dispatch('getEventsByFilter', events)
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

#events {
  margin-top: 75px;
}

.events-list {
 list-style: none;
 padding: 0;
}

.event {
 margin: 2% 5%;
 background-color: #EDEDE6 ;
 padding: 1% 2%;
 display: flex;
 position: relative;
}

.event-image {
 width: 35%;
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
 margin: 5px 0;
}

.event-info h2 {
 margin-bottom: 10px;
 font-size: 30px;
 cursor: pointer;
}

.event-info h2:hover {
  text-shadow: 0 0 1px black;
}

.pay {
  position: absolute;
  right: 0;
  top: -5px;
  background: #9882CF;
  padding: 8px 10px;
  border-bottom-left-radius: 5px;
  font-size: 20px;
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
