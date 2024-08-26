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
/* body {
  overscroll-behavior: contain;
} */

/* Webkit-based browsers (Chrome, Safari, etc.) */
::-webkit-scrollbar {
  width: 12px;
}

::-webkit-scrollbar-track {
  background-color: #1b2e48; /* Dark background color for the track */
  border-radius: 10px; /* Rounded corners for a softer look */
}

::-webkit-scrollbar-thumb {
  background-color: #3b4252; /* Softer blue-grey color for the thumb */
  border-radius: 10px; /* Rounded corners for a softer look */
  border: 3px solid #1b2e48; /* Padding around the thumb to create space */
}

::-webkit-scrollbar-thumb:hover {
  background-color: #4c566a; /* Slightly lighter shade on hover */
}

/* Firefox */
* {
  scrollbar-width: thin;
  scrollbar-color: #3b4252 #1b2e48; /* Thumb and track color */
}

/* Internet Explorer, Edge */
body {
  -ms-overflow-style: -ms-autohiding-scrollbar;
}

/* Styling for scrollbar in other sections */
.container::-webkit-scrollbar {
  width: 12px;
}

.container::-webkit-scrollbar-track {
  background-color: #1b2e48;
  border-radius: 10px;
}

.container::-webkit-scrollbar-thumb {
  background-color: #3b4252;
  border-radius: 10px;
  border: 3px solid #1b2e48;
}

.container::-webkit-scrollbar-thumb:hover {
  background-color: #4c566a;
}



/* Mobile adjustments */
@media (max-width: 768px) {
  body {
    overflow-y: auto; /* Ensure vertical scrolling on mobile */
  }
}
</style>
