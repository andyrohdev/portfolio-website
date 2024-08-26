<template>
  <div class="experience-card">
    <div class="experience-header">
      <h3>{{ title }}</h3>
      <p>{{ duration }}</p>
    </div>
    <p>{{ description }}</p>
    <div class="tags">
      <span v-for="tag in tags" :key="tag" class="tag">{{ tag }}</span>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: String,
    duration: String,
    description: String,
    tags: Array
  }
};
</script>

<style scoped>
.experience-card {
  background-color: #172a45;
  padding: 20px;
  border-radius: 10px;
  transition: transform 0.3s ease, box-shadow 0.3s ease, opacity 0.3s ease;
  margin-bottom: 20px;
}

.experience-card:hover {
  transform: translateY(-10px);
  box-shadow: 0px 20px 30px rgba(0, 0, 0, 0.2);
}

.experience-card.active {
  opacity: 1; /* Full visibility when active */
}

.experience-card.inactive {
  opacity: 0.5; /* Dim non-active cards */
}

.experience-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.tags {
  display: flex;
  flex-wrap: wrap; /* Allow tags to wrap to the next line */
  margin-top: 10px;
}

.tag {
  background-color: #1c3b57;
  padding: 5px 10px;
  border-radius: 5px;
  margin-right: 5px;
  margin-bottom: 5px; /* Add margin to the bottom to create space between rows */
  font-size: 0.875rem;
  color: #64ffda;
  white-space: nowrap; /* Prevent tags from breaking mid-word */
}
</style>
