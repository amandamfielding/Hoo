<template>
  <div class="profile-page">
    <div class="profile">

      <div class="profile-left">
        <img class="profile-pic" :src="userInfo.image_url" />
        <ul class="profile-details">
          <li class="profile-name">{{userInfo.fname}} {{ userInfo.lname }}</li>
          <li class="profile-username">@{{ userInfo.username }}</li>
          <li class="age-and-gender">
            <div class="age">{{ userInfo.age }}</div>
            <div class="profile-gender">{{ userInfo.gender }}</div>
          </li>
        </ul>
      </div>

      <div class="profile-right">
        <div class="about-me">{{ userInfo.about_me }}</div>
        <li class="resume" @click='openResumeModal'>Resume</li>
          <div id="myModal" class="modal">
            <div class="modal-resume">
              <span id="close" @click='closeResumeModal'>x</span>
              <img :src="userInfo.resume_url"/>
            </div>
          </div>
        <div class="qualifications">
          <div class="qual-tips" v-if=userInfo.tips_cert><img class="checkmark" :src=checkMark(userInfo.tips_cert) /> TIPS Certified</div>
          <div class="qual-dl" v-if=userInfo.valid_dl><img class="checkmark" :src=checkMark(userInfo.valid_dl) /> Drivers License</div>
          <div class="qual-tats" v-if=userInfo.no_vis_tats><img class="checkmark" :src=checkMark(userInfo.no_vis_tats) /> No Visible Tattoos</div>
          <div class="qual-felonies" v-if=userInfo.no_felonies><img class="checkmark" :src=checkMark(userInfo.no_felonies) /> No Felonies</div>
        </div>
        <router-link to="/events" class="events-nav">Back to Events</router-link>
      </div>

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
    },
    checkMark (type) {
      if (type === true) {
        return 'http://res.cloudinary.com/dbsxgncvx/image/upload/v1480793923/medium-Tick-Mark-Check-Correct-Choose-Accurate-0-13398_yu4tsz.png'
      }
    }
  }
}
</script>

<style>

.profile-page {
  margin: 2% 6%;
}

.profile {
  display: flex;
  justify-content: center;
  width: 100%;
  max-height: 92vh;
  z-index: 1;
}

.profile-left {
  width: 35%;
  margin-top: 50px;
  text-align: center;
  background-color: rgba(86, 54, 165, 1);
  color: rgb(249,249,255);
  box-shadow: 0 0 4px white;
}

.profile-pic {
  width: 100%;
}

.profile-name {
  font-family: 'Playball';
  font-size: 30px;
  font-weight: 700;
  letter-spacing: 0.1rem;
}

.profile-right {
  width: 50%;
  margin-top: 50px;
  background-color: rgb(249,249,255);
  position: relative;
  padding: 3%;
  box-shadow: 0 0 4px white;
}

.profile-details {
  list-style: none;
  margin: 10px;
  font-weight: 700;
}

.profile-details li {
  margin: 7px;
  padding-bottom: 5px;
}

.age-and-gender {
  display: flex;
  justify-content: center;
  font-size: 18px;
}

.age {
  margin-right: 15px;
}

.resume {
  text-decoration: underline;
  cursor: pointer;
  list-style: none;
}

.modal-resume {
  background-color: #fefefe;
  margin: 5% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

.events-nav {
  position: absolute;
  bottom: 20px;
  font-size: 20px;
  width: 100%;
  margin: 10px 0;
  text-align: center;
}

.checkmark {
  width: 10%;
}

.about-me {
  margin: 20px 0;
  font-size: 20px;
}

.qualifications {
  display: flex;
  justify-content: center;
  position: absolute;
  bottom: 45px;
  margin: 5% 2%;
}

.qualifications div {
  margin: 0 5px;
}
</style>
