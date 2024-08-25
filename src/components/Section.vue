<template>
    <section :id="id">
      <h2>{{ title }}</h2>
      <slot></slot>
    </section>
  </template>
  
  <script>
  export default {
    props: {
      id: String,
      title: String
    }
  };
  </script>
  
  <style scoped>
  section {
    padding: 60px 0;
    color: white;
    background-color: transparent; /* Make background transparent */
  }
  
  h2 {
    font-size: 2rem;
    margin-bottom: 20px;
  }
  </style>
  