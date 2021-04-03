import Vue from 'vue'
import VueRouter from 'vue-router'
import Main from '../views/main.vue'
import Result from '../views/result.vue'
import NotFound from '../views/notfound.vue'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'main',
    component: Main
  },
  {
    path: '/search/:id',
    name: 'result',
    component: Result
  },
  {
    path: '/user/:id/notfound',
    name: 'notfound',
    component: NotFound
  },
]

const router = new VueRouter({
 
  routes
})

export default router
