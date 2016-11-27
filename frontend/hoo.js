import Vue from 'vue/dist/vue'
import Vuex from 'vuex'
import VueRouter from 'vue-router'
import App from './components/app.vue'
import Home from './components/home.vue'
import Profile from './components/profile.vue'
Vue.use(VueRouter);
Vue.use(Vuex);

document.addEventListener('DOMContentLoaded',() => {

  const router = new VueRouter({
    mode: 'history',
    base: __dirname,
    routes: [
      { path: '/',
      name:"app",
      component: App,
      children: [
        {path: 'home',
        component: Home},
        {path: 'profile',
        component: Profile
        }
      ]}
    ]
  });

  const root = new Vue({
    router
  }).$mount('#root');
});
