<template>
  <div>
    <div class="background">
    </div>
      <router-view name="top"></router-view>
      <transition name="scale">
        <router-view></router-view>
      </transition>
  </div>
</template>

<script>
</script>
<style src="./assets/hoo.css"></style>
