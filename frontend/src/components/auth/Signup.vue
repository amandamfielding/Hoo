<template>
  <div>
    <div class="signup">
      <ul class="login-errors">
        <li v-for="error in errors">
          {{ error }}
        </li>
      </ul>
      <h3 class="signup-text">Sign Up</h3>
      <input type="email" class="form-control" placeholder="Email address"
             v-model="user.email">
      <input type="text" class="form-control" placeholder="Username"
             v-model="user.username">
      <input type="password" class="form-control" placeholder="Password"
             v-model="user.password">
      <input type="text" class="form-control" placeholder="First Name"
             v-model="user.fname">
      <input type="text" class="form-control" placeholder="Last Name"
             v-model="user.lname">

      <label class="gender">Gender</label>
        <label for='woman'>
          <input type="radio" id="woman" value="female" name="gender" v-model="user.gender">
        Female</label>
        <label for='man'>
          <input type="radio" id="man" value="male" name="gender" v-model="user.gender">
        Male</label>
        <label for='trans-woman'>
          <input type="radio" id="trans-woman" value="trans-woman" name="gender" v-model="user.gender">
        Trans-woman</label>
        <label for='trans-man'>
          <input type="radio" id="trans-man" value="trans-man" name="gender" v-model="user.gender">
        Trans-man</label>
        <label for='other'>
          <input type="radio" id="other" value="other" name="gender" v-model="user.gender">
        Other</label>
        <label for='not-specified'>
        <input type="radio" id="not-specified" value="not-specified" name="gender" v-model="user.gender">
        Prefer not to state</label>

      <input type="date" class="form-control" placeholder="Date of Birth"
             v-model="user.dob">
      <input type="text" class="form-control" placeholder="Phone Number"
             v-model="user.phone_number">
      <textarea class="form-control" placeholder="About Me"
             v-model="user.about_me"></textarea>
      <input type="text" class="form-control" placeholder="Profile Picture URL"
             v-model="user.image_url">
      <input type="text" class="form-control" placeholder="Resume URL"
             v-model="user.resume_url">

      <label class="auth-qualifications">TIPS Certified
        <label class="qual"><input type="radio" value="true" name="tips_cert" v-model="user.tips_cert">Yes</label>
        <label class="qual"><input type="radio" value="false" name="tips_cert" v-model="user.tips_cert">No</label>
      </label>
      <label class="auth-qualifications">Visible Tattoos
        <label class="qual"><input type="radio" value="false" name="no_vis_tats" v-model="user.no_vis_tats">Yes</label>
        <label class="qual"><input type="radio" value="true" name="no_vis_tats" v-model="user.no_vis_tats">No</label>
      </label>
      <label class="auth-qualifications">Felonies
        <label class="qual"><input type="radio" value="false" name="no_felonies" v-model="user.no_felonies">Yes</label>
        <label class="qual"><input type="radio" value="true" name="no_felonies" v-model="user.no_felonies">No</label>
      </label>
      <label class="auth-qualifications">Valid Driver's License
        <label class="qual"><input type="radio" value="true" name="valid_dl" v-model="user.valid_dl">Yes</label>
        <label class="qual"><input type="radio" value="false" name="valid_dl" v-model="user.valid_dl">No</label>
      </label>

      <button class="signup-button"
            @click="signup">Sign Up</button>
      <span class="redirect">
          Already have an account? <router-link to="/authentication/login">Log In!</router-link>
      </span>
    </div>
  </div>
</template>

<script type="text/javascript">
  import authServices from './auth_services'
  // import jquery from 'jquery'
  // import jquery.ui.widget from
  // import jquery.iframe-transport.js
  // import jquery.fileupload.js
  // import jquery.cloudinary.js

  // $.cloudinary.config({"api_key":"248296192615369","dbsxgncvx":"demo"});

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
    computed: {
      errors: function () {
        return this.$store.state.errors
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

.signup {
  width: 300px;
	margin: auto;
  display: flex;
  flex-direction: column;
}

.signup-text {
  font-size: 30px;
  margin: 20px 0;
  text-align: center;
}

.redirect {
  font-size: 18px;
  text-align: center;
  margin: 15px 0;
}

.gender {
  font-size: 18px;
  margin: 5px;
}

.auth-qualifications {
  display: flex;
  margin: 10px 0;
}

.qual {
  margin-left: 10px;
}

.signup-button {
  font-size: 20px;
  padding: 8px;
  margin-top: 5px;
  cursor: pointer;
  font-family: Raleway;
}

input, textarea {
  background-color: #EDEDE6;
  font-family: Raleway;
}
</style>
