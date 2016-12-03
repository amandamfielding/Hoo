<template>
  <div class="profile">
    <div class="profile-left">
      <img class="profile-pic" :src="userInfo.image_url" />
      <ul class="profile-details">
        <li class="profile-name">{{userInfo.fname}} {{ userInfo.lname }}</li>
        <li class="profile-username">{{ userInfo.username }}</li>
        <li class="resume">Resume</li>
        <div class="age-and-gender">
          <li class="age">{{ userInfo.dob - DateTime.new }}</li>
          <li class="gender">{{ userInfo.gender }}</li>
        </div>
      </ul>
    </div>
    <div class="profile-right">
      <div class="about-me">{{ userInfo.about_me }}</div>
      <div class="qual-tips">{{ userInfo.tips_cert }}</div>
      <div class="qual-dl">{{ userInfo.valid_dl }}</div>
      <div class="qual-tats">{{ userInfo.vis_tats }}</div>
      <div class="qual-felonies">{{ userInfo.felonies }}</div>
    </div>
  </div>
</template>

<script>
import authServices from './auth/auth_services'

export default {
  created () {
    if (!authServices.user.authenticated) {
      this.$router.replace('/')
    }
  },
  name: 'profile',
  computed: {
    userInfo: function () {
      return this.$store.state.currentUser
    }
  }
}
</script>

<style>

.profile {
  display: flex;
  justify-content: space-between;
  width: 100%;
  margin-top: 70px;
  height: 85vh;
}

.profile-left {
  width: 40%;
  text-align: center;
  background-color: #EDEDE6;
  margin-left: 3%;
}

.profile-pic {
  width: 70%;
  margin-top: 25px;
}

.profile-right {
  width: 50%;
  background-color: #EDEDE6;
  margin-right: 3%;
}

.profile-details {
  list-style: none;
  margin: 10px;
}

.profile-details li {
  margin: 7px;
}

.profile-name {
  font-size: 22px;
}

.age-and-gender {
  display: flex;
  justify-content: center;
}
</style>
