<template>
  <div class="experience-card">
    <div class="experience-header">
      <h3>{{ title }}</h3>
      <p>{{ duration }}</p>
    </div>
    <!-- Render description content as HTML -->
    <p v-html="description"></p>
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
    description: String, // Ensure the description is a string with HTML content
    tags: Array,
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

.experience-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.tags {
  display: flex;
  flex-wrap: wrap;
  margin-top: 10px;
}

.tag {
  background-color: #1c3b57;
  padding: 5px 10px;
  border-radius: 5px;
  margin-right: 5px;
  margin-bottom: 5px;
  font-size: 0.875rem;
  color: #64ffda;
  white-space: nowrap;
}

/* Style for all links within experience cards */
.experience-card a {
  color: #64ffda;
  text-decoration: none;
  font-weight: bold;
  transition: color 0.3s ease;
}

/* Hover effect for links */
.experience-card a:hover {
  text-decoration: underline;
}

/* Additional styling for other domain-specific links (example for GitHub) */
.experience-card a[href*="github.com"] {
  color: #333; /* GitHub Dark Grey */
}

/* Responsive styles */
@media (max-width: 768px) {
  .experience-header {
    flex-direction: column;
    align-items: flex-start;
  }

  .experience-header h3,
  .experience-header p {
    text-align: left;
    width: 100%;
  }

  .experience-card {
    text-align: left;
  }
}
</style>
