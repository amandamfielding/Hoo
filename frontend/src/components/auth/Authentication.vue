<template>
   <div id="auth">
     <div class="authForm">
       <div class="auth-header">
         <img class="logo" src='../../assets/purple_owl2.png' />
       </div>
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
   height: 100%;
   display: flex;
 }

.auth-header {
 display: flex;
}

.authForm {
 background: rgba(237,237,230,.8);
 padding: 5%;
 margin: auto;
 margin-top: 70px;
 box-shadow: 0 0 10px darkslategray;
}

.logo {
 width: 80px;
 height: 100%;
 margin: auto;
}
</style>
