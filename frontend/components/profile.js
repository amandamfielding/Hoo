import Vue from 'vue';

const data = {message: 'this is profile'};

const profile = Vue.component('profile', {
  template:
    "<div>hey {{ message }}<router-view></router-view></div>",
  data: function() {
    return data;
  }
});



export default profile;
