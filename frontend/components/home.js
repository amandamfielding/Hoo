import Vue from 'vue';

const data = {message: "this is home"};

const home = Vue.component('home',{
  template: '<div>{{ message }}</div>',
  data: function() {
    return data;
  }
}
);

export default home;
