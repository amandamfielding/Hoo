<template>
  <ul class="request-list">
    <li class="request" v-for="request in requests">
      <span @click="navToUserProfile(request.user_id)">{{ request.fname}} {{ request.lname }}</span>
      <button @click="toggleApproval(request.id)">{{ request.accepted ? "Deny" : "Approve" }}</button>
    </li>
  </ul>
</template>

<script>
import $ from 'jquery'

const nameSort = function (a, b) {
  if (a.lname < b.lname) {
    return -1
  } else if (a.lname > b.lname) {
    return 1
  } else {
    return 0
  }
}

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
        data: {eventId: eventId, manage: true},
        success: requests => {
          this.$store.dispatch('getRequests', requests.sort(nameSort))
        }
      })
    },
    toggleApproval (requestId) {
      $.ajax({
        method: 'PATCH',
        url: `/api/requests/${requestId}`,
        success: requests => {
          this.$store.dispatch('getRequests', requests.sort(nameSort))
        }
      })
    },
    navToUserProfile (userId) {
      this.$router.push(`/users/${userId}`)
    }
  },
  computed: {
    requests () {
      return this.$store.state.requests
    }
  }
}
</script>

<style>
  .request-list {
    position: absolute;
    top: 100px;
  }
</style>
