<template>
    <a :href="link" target="_blank" class="project-card">
      <div class="thumbnail-container">
        <img :src="thumbnail" :alt="title" class="thumbnail" />
      </div>
      <div class="project-content">
        <h3>{{ title }}</h3>
        <p>{{ description }}</p>
        <div class="tags">
          <span v-for="tag in tags" :key="tag" class="tag">{{ tag }}</span>
        </div>
      </div>
    </a>
  </template>
  
  <script>
  export default {
    props: {
      title: String,
      description: String,
      tags: Array,
      thumbnail: String,
      link: String,
    },
  };
  </script>
  
  <style scoped>
  .project-card {
    display: block;
    background-color: #172a45;
    padding: 20px;
    border-radius: 10px;
    text-decoration: none;
    color: white;
    transition: transform 0.3s ease, box-shadow 0.3s ease, opacity 0.3s ease;
    margin-bottom: 20px;
  }
  
  .project-card:hover {
    transform: translateY(-10px);
    box-shadow: 0px 20px 30px rgba(0, 0, 0, 0.2);
  }
  
  .project-card.active {
    opacity: 1;
  }
  
  .project-card.inactive {
    opacity: 0.5;
  }
  
  .thumbnail-container {
    margin-bottom: 15px;
  }
  
  .thumbnail {
    width: 100%;
    border-radius: 10px;
    object-fit: cover;
  }
  
  .project-content {
    text-align: left;
  }
  
  .tags {
    margin-top: 10px;
  }
  
  .tag {
    background-color: #1c3b57;
    padding: 5px 10px;
    border-radius: 5px;
    margin-right: 5px;
    font-size: 0.875rem;
    color: #64ffda;
  }
  </style>
  