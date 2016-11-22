import Vue from 'vue';
import Vuex from 'vuex';
import VueRouter from 'vue-router';
import app from './app';
import home from './home';
import profile from './profile';
Vue.use(VueRouter);

const routes = [
  { path: '/', component: app,
  children: [
    {path: 'home',
    component: home},
    {path: 'profile',
    component: profile
    }
  ]
  }
];

const router = new VueRouter({
  routes
});

export default router;
