<template>
  <ul class="request-list">
    <li class="request" v-for="request in requests">
      {{ request.fname}}
    </li>
  </ul>
</template>

<script>
import $ from 'jquery'

export default {
  name: 'RequestManage',
  created () {
    this.getRequests(this.$route.params.eventId)
  },
  methods:{
    getRequests (eventId) {
      $.ajax({
        method: 'GET',
        url: '/api/requests/',
        data: {eventId: eventId},
        success: requests => {
          this.$store.dispatch('getRequests', requests)
        }
      })
    }
  },
  computed: {
    requests: function () {
      return this.$store.state.requests
    }
  }
}
</script>
