<template>
   <div id="auth">
     <div class="authForm">
       <div class="auth-header">
         <img class="logo" src='../../assets/purple_owl2.png' />
         <h1 class="text-center">Hoo</h1>
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
 background: #EDEDE6 ;
 padding: 5%;
 margin: auto;
}

.logo {
 width: 30%;
 height: 100%;
}
</style>
