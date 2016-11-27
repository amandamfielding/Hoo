<template><div>hey {{ message }}<router-view></router-view></div></template>


<script>

const data = {message: 'this is profile'};
module.exports  = {
  data: function() {
    return data;
  }
}
</script>
