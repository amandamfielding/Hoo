import VueRouter from 'vue-router'
import Authentication from './components/auth/Authentication'
import Login from './components/auth/Login'
import Signup from './components/auth/Signup'
import Profile from './components/Profile'
import Events from './components/Events'
import CreatedEvents from './components/CreatedEvents'
import EventShow from './components/EventShow'
import EventManage from './components/EventManage'
import RequestsManage from './components/RequestsManage'
import Home from 'components/Home'
import App from './App'
import Top from './components/Top'

const Router = new VueRouter({
  mode: 'history',
  base: __dirname,
  routes: [
    {
      path: '/',
      components: {
        default: Home,
        app: App
      }
    },
    {
      path: '/authentication',
      component: Authentication,
      redirect: '/authentication/login',
      children: [
        {
          path: 'login',
          component: Login
        },
        {
          path: 'signup',
          component: Signup
        }
      ]
    },
    {
      path: '/profile',
      components: {
        default: Profile,
        top: Top
      }
    },
    {
      path: '/events',
      components: {
        top: Top,
        default: Events
      }
    },
    {
      path: '/events/:eventId',
      components: {
        default: EventShow,
        top: Top
      }
    },
    {
      path: '/created-events',
      components: {
        top: Top,
        default: CreatedEvents
      }
    },
    {
      path: '/created-events/:eventId',
      components: {
        default: EventManage,
        top: Top
      }
    },
    {
      path: '/created-events/:eventId/requests',
      components: {
        default: RequestsManage,
        top: Top
      }
    },
    {
      path: '/users/:userId',
      components: {
        default: Profile,
        top: Top
      }
    }
  ]
})

export default Router
