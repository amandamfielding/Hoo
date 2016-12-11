<template>
   <div id="auth">
     <div class="authForm">
       <transition name="fade">
         <router-view></router-view>
       </transition>
     </div>
   </div>
</template>

<script>
 export default {
   name: 'authentication'
 }
</script>

<style scoped>
 #auth {
   min-height: 100vh;
   display: flex;
 }

.auth-header {
 display: flex;
}

.authForm {
 background: rgb(249,249,255);
 padding: 2% 5%;
 margin: auto;
 box-shadow: 0 0 10px darkslategray;
}

</style>
