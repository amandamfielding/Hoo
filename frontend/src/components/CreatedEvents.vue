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
        <div class="date-div">
          <div class="date-prompt">Within the next:
            <select v-model="searchParams.date" @change="getCreatedEvents" class="date-search">
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

    <ul class="created-events-list">
      <li class="event" v-for='event in createdEvents'>
        <div class="event-image-container">
          <img @click="navToCreatedEventShow(event.id)" class="event-image" v-bind:id="event.id" v-bind:src="event.image_url" />
        </div>
        <div class="event-info">
          <h2 class="event-title">{{ event.title }}</h2>
          <div>{{ event.city }}, {{ event.state }}</div>
          <div>{{ calculateDate(event.start_date) }} - {{ calculateDate(event.end_date) }}</div>
          <div @click="navToCreatedEventShow(event.id)">{{ event.applicant_count }} applicants</div>
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

<style>
.created-events-list {
  list-style: none;
  padding: 0;
  margin-top: 125px;
}

.created-event {
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

.created-search {
  padding-top: 5px;
}
.created-search-panel {
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
