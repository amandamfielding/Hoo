import Vue from 'vue';


//
// const header = new Vue({
//
//
//   // methods: ,
//   // computed:
// });

const data = {message: 'this is header'};

const app = Vue.component('app', {
  template:
    "<div>hey {{ message }}<router-view></router-view></div>",
  data: function() {
    return data;
  }
});


export default app;
