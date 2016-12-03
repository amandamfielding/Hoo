<template>
  <div id='events'>
   <ul class="events-list">
     <li class="event" v-for='event in allEvents'>
       <img class="event-image" :src="event.image_url" />
       <div class="event-info">
         <h2>{{ event.title }}</h2>
         <div>{{ event.city }}, {{ event.state }}</div>
         <div>{{ calculateDate(event.start_date) }} - {{ calculateDate(event.end_date) }}</div>
         <div>{{ event.description }}</div>
         <div>${{ event.pay }} per {{ event.pay_freq }}</div>
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
}

.event-image {
 width: 35%;
 height: 100%;
}

.event-info {
 margin-left: 2%;
}

.event-info div {
 margin: 5px 0;
}

.event-info h2 {
 margin-bottom: 10px;
}
</style>
