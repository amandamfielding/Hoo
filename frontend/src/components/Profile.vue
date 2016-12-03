<template>
  <div class="profile">
    <div class="profile-left">
      <img class="profile-pic" :src="userInfo.image_url" />
      <ul class="profile-details">
        <li class="profile-name">{{userInfo.fname}} {{ userInfo.lname }}</li>
        <li class="profile-username">{{ userInfo.username }}</li>
        <li class="resume" @click='openResumeModal'>Resume</li>
        <div id="myModal" class="modal">
            <div class="modal-resume">
              <span id="close" @click='closeResumeModal'>x</span>
              <img :src="userInfo.resume_url"/>
            </div>
            </div>
        <li class="age-and-gender">
          <div class="age">{{ userInfo.age }}</div>
          <div class="gender">{{ userInfo.gender }}</div>
        </li>
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
export default {
  created () {
    if (!window.localStorage.user) {
      this.$router.replace('/')
    }
  },
  name: 'profile',
  computed: {
    userInfo: function () {
      return this.$store.state.currentUser
    }
  },
  methods: {
    openResumeModal () {
      let resumeModal = document.getElementById('myModal')
      resumeModal.style.display = 'block'
    },
    closeResumeModal () {
      let resumeModal = document.getElementById('myModal')
      resumeModal.style.display = 'none'
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
  margin-bottom: 20px;
  max-height: 90vh;
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

.age {
  margin-right: 20px;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
}

.modal-resume {
    background-color: #fefefe;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    font-size: 22px;
}

#close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

#close:hover,
#close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
</style>
