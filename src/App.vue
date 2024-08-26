<template>
  <div id="app">
    <div class="content-wrapper">
      <router-view />
    </div>
  </div>
</template>

<script>
export default {
  name: 'App',
};
</script>

<style>
#app {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background: linear-gradient(135deg, #0a192f, #1b2e48, #0a192f, #1b2735, #22303f);
  background-size: 400% 400%;
  animation: gradientFlow 15s ease infinite;
  overflow-x: hidden; /* Prevent horizontal overflow */
}

.content-wrapper {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  overflow-y: auto; /* Allow vertical scrolling */
}

@keyframes gradientFlow {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

html, body {
  height: 100%;
  margin: 0;
  overflow-x: hidden; /* Prevent horizontal scrolling */
  overflow-y: auto;  /* Allow vertical scrolling */
  touch-action: pan-x pan-y; /* Prevent unwanted touch actions */
  background-color: #0a192f; /* Match the background gradient */
}

/* Prevent white space on mobile overscroll */
body {
  overscroll-behavior: contain;
}

/* Mobile adjustments */
@media (max-width: 768px) {
  body {
    overflow-y: auto; /* Ensure vertical scrolling on mobile */
  }
}
</style>
