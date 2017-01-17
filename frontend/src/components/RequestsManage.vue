<template>
  <ul class="request-list">
    <li class="request" v-for="request in requests" @click="navToUserProfile">
      <span>{{ request.fname}} {{ request.lname }}</span>
      <span></span>
      <button>{{ acceptButton(request) }}</button>
    </li>
  </ul>
</template>

<script>
import $ from 'jquery'

export default {
  name: 'RequestsManage',
  created () {
    this.getRequests(this.$route.params.eventId)
  },
  methods: {
    getRequests (eventId) {
      $.ajax({
        method: 'GET',
        url: '/api/requests/',
        data: {eventId: eventId},
        success: requests => {
          this.$store.dispatch('getRequests', requests)
        }
      })
    },
    navToUserProfile (e) {
      this.$router.push(`users/${e.user_id}`)
    }
  },
  computed: {
    requests: function () {
      return this.$store.state.requests
    },
    acceptButton: function (request) {
      if (request.approved) {
        return 'Reject'
      } else {
        return 'Approve'
      }
    }
  }
}
</script>

<style>
  .request-list {
    position: absolute;
    top: 200px;
  }
</style>
