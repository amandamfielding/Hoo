<template>
  <div class="home">
    <div class="home-top">
      <iframe id="bgvid" width="560" height="315"
      src="https://www.youtube.com/embed/jXv7eRZ8Eto?enablejsapi=1&autoplay=1&loop=1" frameborder="0" allowfullscreen></iframe>
      <div id="hoo">
        <h1>Hoo</h1>
        <h2>Staffing Made Easy</h2>
        <button type="button" @click="$router.replace('/authentication/login')">Log In</button>
        <button type="button" @click="$router.replace('/authentication/signup')">Sign Up</button>
      </div>
    </div>
    <div class="home-bottom">
      <p>Are you a bartender or server looking for your next short term gig?</p>
      <p>Are you a recruiter who tired </p>
    </div>
  </div>
</template>

<script>
// debugger
// const video = document.getElementsByTagName('iframe')
// video.mute()
export default {
}
</script>

<style>


iframe {
  position: fixed;
  top: 40%;
  left: 50%;
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  z-index: -100;
  transform: translateX(-50%) translateY(-50%);
  background-size: cover;
  transition: 1s opacity;
}

#hoo {
  position: absolute;
  left: 27%;
  top: 7%;
  background: rgba(0,0,0,0.5);
  color: white;
  padding: 2rem;
  width: 33%;
  margin:2rem;
  font-size: 1.2rem;
}
h1 {
  text-align: center;
  font-size: 3rem;
  letter-spacing: .3rem;
}

h2 {
  text-align: center;
  font-size: 2rem;
  letter-spacing: .3rem;
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
   background: rgba(0,0,0,0.5);
}

.home-top {
  min-height: 100vh;
}
.home-bottom {
  background-color: white;
  min-height: 500px;
}

p {
  font-size: 30px;
}
</style>
