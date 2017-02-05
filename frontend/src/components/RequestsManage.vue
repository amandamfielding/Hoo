<template>
  <div class="request-manage">
    <h2>Requests for </h2>
    <ul class="request-list">
      <li class="request" v-for="request in requests">
        <span @click="navToUserProfile(request.user_id)">{{ request.fname}} {{ request.lname }}</span>
        <button @click="toggleApproval(request.id)">{{ request.accepted ? "Deny" : "Approve" }}</button>
      </li>
    </ul>
    <button @click="navToEventManage">Back to Event</button>
  </div>
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
    },
    navToEventManage () {
      this.$router.push(`/created-events/${this.$route.params.eventId}`)
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
  .request-manage {
    font-size: 20px;
    font-weight: bold;
    margin: auto;
    margin-top: 50px;
  }

  .request-list {
    list-style: none;
  }

  .request-list span {
    cursor: pointer;
  }
</style>
