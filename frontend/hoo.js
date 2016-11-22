import Vue from 'vue';
import Vuex from 'vuex';
import VueRouter from 'vue-router';
import router from './components/root';
Vue.use(VueRouter);
Vue.use(Vuex);

document.addEventListener('DOMContentLoaded',() => {
  const store = new Vuex.Store({
    state: {
    }
  });

  const root = new Vue({
    router
  }).$mount('#root');

});
