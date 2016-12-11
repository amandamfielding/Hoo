<template>
  <div class="home">
    <div class="home-top">
      <video src="http://res.cloudinary.com/dbsxgncvx/video/upload/v1481232528/hoo5_gk2ww5.mp4" autoplay loop>
      </video>
      <div id="hoo">
        <h1>Hoo</h1>
        <div id="sub-header">Staffing Made Easy</div>
        <button type="button" @click="$router.replace('/authentication/login')">Log In</button>
        <button type="button" @click="$router.replace('/authentication/signup')">Sign Up</button>
        <button type="button" @click="demo">Use Demo Account</button>
      </div>
    </div>
    <section class="home-bottom">
      <div class="user-blurb">
        <div class="blurb-text">
          <h3 class="blurb-heading">Looking for your next short term gig?</h3>
          <div>Search for awesome upcoming events near you and apply with the click of a button.</div>
        </div>
        <img class="splash-img"src=""/>
      </div>
      <div class="recruiter-blurb">
        <img class="splash-img"src=""/>
        <div class="blurb-text">
          <h3 class="blurb-heading">Staffing a concert? Planning a wedding? Or just having an epic private party?</h3>
          <div>Don't sift through hundreds of emails from a craigslist ad. Let Hoo make finding your service staff easy.</div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import authServices from './auth/auth_services'

export default {
  created () {
    if (window.localStorage.user) {
      this.$router.replace('/events')
    }
  },
  methods: {
    demo: function (e) {
      const demoUser = Math.floor(Math.random() * 2) === 0 ? {username: 'AMF', password: 'password'} : {username: 'lew', password: '123456'}
      authServices.login(this, {user: demoUser}, '/events')
    }
  }
}
</script>

<style>
video {
  height: 100%;
  width: 100%;
  z-index: -1;
  background-size: cover;
  transition: 1s opacity;
  position: relative;
}

#hoo {
  position: absolute;
  left: 27%;
  top: 7%;
  background: rgba(0,0,0,0.3);
  color: white;
  padding: 2rem;
  width: 33%;
  margin:2rem;
  font-size: 1.2rem;
  border-radius: 10px;
}
h1 {
  text-align: center;
  font-size: 3rem;
  letter-spacing: .3rem;
  margin: 10px;
}

#sub-header {
  text-align: center;
  font-size: 1.8rem;
  letter-spacing: .1rem;
  margin: 20px;
}
#hoo button {
  display: block;
  width: 80%;
  padding: .4rem;
  border: none;
  margin: 1rem auto;
  font-size: 1.3rem;
  background: rgba(255,255,255,0.23);
  color: #fff;
  border-radius: 3px;
  cursor: pointer;
  transition: .3s background;
}
#hoo button:hover {
  background: rgba(86, 54, 165, 1);
}

.home-top {
  height: 100vh;
}
.home-bottom {
  background-color: white;
  height: 100vh;
}

.user-blurb, .recruiter-blurb {
  padding: 20px;
  display: flex;
}

.blurb-heading {
  font-size: 26px;
  color: rgba(86, 54, 165, 1);
}

.blurb-text {
  width: 50%;
}

.splash-img {
  width: 50%;
}
</style>
