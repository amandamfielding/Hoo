<template>
  <div>
    <h3 class="text-center">Sign Up</h3>

    <input type="email" class="form-control m-b-15" placeholder="Email address"
           v-model="user.email">
    <input type="text" class="form-control m-b-15" placeholder="Username"
           v-model="user.username">
    <input type="password" class="form-control m-b-15" placeholder="Password"
           v-model="user.password">
    <input type="text" class="form-control m-b-15" placeholder="First Name"
           v-model="user.fname">
    <input type="text" class="form-control m-b-15" placeholder="Last Name"
           v-model="user.lname">

    <label>Gender</label>
      <input type="radio" id="woman" value="woman" name="gender" v-model="user.gender">
      <label for='woman'>Cis-woman</label>
      <input type="radio" id="man" value="man" name="gender" v-model="user.gender">
      <label for='man'>Cis-man</label>
      <input type="radio" id="trans-woman" value="trans-woman" name="gender" v-model="user.gender">
      <label for='trans-woman'>Trans-woman</label>
      <input type="radio" id="trans-man" value="trans-man" name="gender" v-model="user.gender">
      <label for='trans-man'>Trans-man</label>
      <input type="radio" id="other" value="other" name="gender" v-model="user.gender">
      <label for='other'>Other</label>
      <input type="radio" id="not-specified" value="not-specified" name="gender" v-model="user.gender">
      <label for='not-specified'>Prefer not to state</label>

    <input type="date" class="form-control m-b-15" placeholder="Date of Birth"
           v-model="user.dob">
    <input type="text" class="form-control m-b-15" placeholder="Phone Number"
           v-model="user.phone_number">
    <textarea class="form-control m-b-15" placeholder="About Me"
           v-model="user.about_me"></textarea>
    <input type="text" class="form-control m-b-15" placeholder="Profile Picture URL"
           v-model="user.image_url">
    <input type="text" class="form-control m-b-15" placeholder="Resume URL"
           v-model="user.resume_url">

    <label>TIPS Certified</label>
      <label><input type="radio" value="true" name="tips_cert" v-model="user.tips_cert">Yes</label>
      <label><input type="radio" value="false" name="tips_cert" v-model="user.tips_cert">No</label>
    <label>Visible Tattoos</label>
      <label><input type="radio" value="true" name="vis_tats" v-model="user.vis_tats">Yes</label>
      <label><input type="radio" value="false" name="vis_tats" v-model="user.vis_tats">No</label>
    <label>Felonies</label>
      <label><input type="radio" value="true" name="felonies" v-model="user.felonies">Yes</label>
      <label><input type="radio" value="false" name="felonies" v-model="user.felonies">No</label>
    <label>Valid Driver's License</label>
      <label><input type="radio" value="true" name="valid_dl" v-model="user.valid_dl">Yes</label>
      <label><input type="radio" value="false" name="valid_dl" v-model="user.valid_dl">No</label>

    <button class="btn btn-lg btn-primary btn-block m-b-15"
          @click="signup">Sign Up</button>
    <p class="text-center">
        Already have an account? <router-link to="/authentication/login">Login!</router-link>
    </p>
  </div>
</template>

<script>
  import authServices from './auth_services'

  export default {
    name: 'signup',
    data: function () {
      return {
        user: {
          email: '',
          username: '',
          password: '',
          fname: '',
          lname: '',
          gender: '',
          dob: null,
          phone_number: '',
          about_me: '',
          image_url: '',
          resume_url: '',
          tips_cert: null,
          vis_tats: null,
          felonies: null,
          valid_dl: null
        }
      }
    },
    methods: {
      signup: function (e) {
        authServices.signup(this, {user: this.user}, '/events')
      }
    }
  }
</script>

<style>
</style>
