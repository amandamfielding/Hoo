<template>
  <div class="top">
    <div @click="navToHome" class="header-left">
      <img class="top-logo" src="../assets/purple_owl2.png" />
      <h1 class="top-title">Hoo</h1>
    </div>
    <div class="header-right">
      <div class="greeting">Hey, {{ userInfo.fname }}</div>
      <div class="header-list">
        <img class="top-user-pic" :src="userInfo.image_url" />
        <ul id="user-dropdown">
          <li><router-link class="profile-link" to="/profile">My Profile</router-link></li>
          <li @click="logout"><router-link class="logout-link" to="/">Log Out</router-link></li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import authServices from './auth/auth_services'

export default {
  name: 'top',
  computed: {
    userInfo: function () {
      return this.$store.state.currentUser
    }
  },
  methods: {
    logout: function (e) {
      authServices.logout(this)
    },
    navToHome: function () {
      this.$router.replace('/')
    }
  }
}

</script>

<style>
.top {
  background-color: #F4EDFF;
  position: fixed;
  width: 100%;
  top: 0;
  height: 50px;
  display: flex;
  justify-content: space-between;
  z-index: 60;
}

.header-left, .header-right {
  display: flex;
}

.top-logo {
  height: 45px;
  margin: 2px 15px;
  cursor: pointer;
}

.top-title {
  font-size: 34px;
  vertical-align: middle;
  margin: auto;
  cursor: pointer;
}

.top-title:hover {
  text-shadow: 0 0 1px black;
}

.greeting {
  margin: auto;
  font-size: 20px;
}

.top-user-pic {
  border-radius: 50%;
  height: 50px;
  margin: 0 15px;
}

.top-user-pic:hover {
  box-shadow: 0 0 6px black;
  cursor: pointer;
}

.header-list:hover #user-dropdown {
  display: block;
}

#user-dropdown {
  position: absolute;
  background: #faf8fd;
  display: none;
  border-left: 1px solid #ccc;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  overflow: hidden;
  z-index: 50;
  top: 50px;
  font-size: 15px;
  width: 100px;
  color: #4d4e50;
  list-style: none;
  margin: auto;
  right: 0;
  cursor: pointer;
  padding: 0;
}

#user-dropdown > li {
  text-align: center;
  padding: 7px;
  border-top: 1px solid #ccc;
  color: #4d4e50;
}

#user-dropdown > li:hover {
  background: #eee;
}

.profile-link, .logout-link {
  text-decoration: none;
  color: #4d4e50;
}
</style>
