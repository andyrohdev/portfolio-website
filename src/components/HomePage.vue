<template>
  <div id="home-page">
    <div class="container">
      <Header :activeSection="activeSection" />
      <main class="content">
        <Section id="about" title="">
          <div class="about-content">
            <div class="profile-container">
              <img 
                src="https://res.cloudinary.com/dtwxjssaq/image/upload/v1722004673/1715554927606_c7dr5q.jpg" 
                alt="Profile" 
                class="profile-image" 
              />
            </div>
            <div class="about-text">
              <h3>Hi, I'm Andy!</h3>
              <p>
                I’m a passionate Full Stack Developer, constantly learning and honing my skills to build highly functional and visually appealing websites. I enjoy working on projects that challenge me to think critically and creatively.
              </p>
              <p>
                In my free time, I love to explore new technology, gaming, and editing videos. I’m an avid gamer who loves diving into different game worlds. I also enjoy sharing my experiences and knowledge with others in the community.
              </p>
              <p>
                Here are a few technologies I’ve been working with recently:
              </p>
              <ul class="skills-list">
                <li>JavaScript (ES6+)</li>
                <li>Vue.js</li>
                <li>Node.js</li>
                <li>SQL</li>
                <li>Java</li>
                <li>Express.js</li>
              </ul>
            </div>
          </div>
        </Section>
        <Section id="experience" title="Experience">
          <div class="experience-list">
            <ExperienceCard
              v-for="experience in experiences"
              :key="experience.title"
              :title="experience.title"
              :duration="experience.duration"
              :description="experience.description"
              :tags="experience.tags"
              :class="{ active: hoveredCard === experience.title, inactive: hoveredCard !== null && hoveredCard !== experience.title }"
              @mouseenter="hoveredCard = experience.title"
              @mouseleave="hoveredCard = null"
            />
          </div>
        </Section>
        <Section id="projects" title="Projects">
          <div>
            <h3>LanternDB</h3>
            <p>
              LanternDB is a video game database web application developed using Vue.js and Express. It allows users to explore and track video games, with features like user reviews, ratings, and collections.
              <a href="https://github.com/andyrohdev/LanternDB" target="_blank">View Repo</a>
            </p>
            <h3>Typing Test</h3>
            <p>
              This is a web application built to test typing speed and accuracy. Users can choose from different modes and track their performance.
              <a href="https://github.com/andyrohdev/TypingTest" target="_blank">View Repo</a>
            </p>
          </div>
        </Section>
      </main>
    </div>
  </div>
</template>

<script>
import Header from "../components/TheHeader.vue";
import Section from "../components/Section.vue";
import ExperienceCard from "../components/ExperienceCard.vue";

export default {
  components: {
    Header,
    Section,
    ExperienceCard,
  },
  data() {
    return {
      experiences: [
        {
          title: "Tech Elevator Student",
          duration: "2024",
          description: "Completed a full-stack coding bootcamp focusing on software development and web applications.",
          tags: ["Java", "JavaScript", "Vue.js", "SQL"],
        },
        {
          title: "Davita - Patient Care Technician",
          duration: "2021 - 2024",
          description: "Provided patient care and support in a healthcare environment, ensuring quality treatment.",
          tags: ["Healthcare", "Patient Care"],
        },
        {
          title: "Freelance Gaming Video Editor",
          duration: "2018 - 2021",
          description: "Edited and produced gaming videos, applying creativity and technical skills to deliver high-quality content.",
          tags: ["Video Editing", "Gaming"],
        },
      ],
      hoveredCard: null,
      activeSection: null, // Track the currently active section
    };
  },
  mounted() {
    this.observeSections();
  },
  methods: {
    observeSections() {
      const options = {
        root: null,
        rootMargin: '0px',
        threshold: 0.6, // Adjust this value based on when you want to trigger the highlight
      };

      const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            this.activeSection = entry.target.id;
          }
        });
      }, options);

      // Observe each section
      document.querySelectorAll('section').forEach((section) => {
        observer.observe(section);
      });
    },
  },
};
</script>

<style>
#home-page {
  display: flex;
  justify-content: center;
  min-height: 100vh;
  background: linear-gradient(135deg, #0a192f, #172a45, #0a192f);
  background-size: 200% 200%;
  animation: gradientFlow 30s ease infinite;
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

.container {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  width: 100%;
  max-width: 1200px;
  padding: 0 5%;
  box-sizing: border-box;
}

.content {
  flex-grow: 1;
  max-width: 800px;
  background-color: transparent;
  color: white;
  padding: 40px;
}

.about-content {
  display: flex;
  align-items: center;
  margin-bottom: 40px;
  padding: 20px;
  background-color: rgba(28, 43, 71, 0.8);
  border-radius: 15px;
  box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.2);
}

.profile-container {
  flex-shrink: 0;
  margin-right: 30px;
}

.profile-image {
  border-radius: 50%;
  width: 150px;
  height: 150px;
  border: 4px solid #64ffda; /* Add a border around the image */
}

.about-text h3 {
  font-size: 1.8rem;
  margin-bottom: 20px;
  color: #64ffda;
}

.about-text p {
  margin-bottom: 15px;
  line-height: 1.6;
}

.skills-list {
  display: flex;
  flex-wrap: wrap;
  margin-top: 20px;
  padding-left: 0;
  list-style: none;
}

.skills-list li {
  background-color: #1c3b57;
  padding: 5px 10px;
  border-radius: 5px;
  margin-right: 10px;
  margin-bottom: 10px;
  color: #64ffda;
  font-size: 0.875rem;
}

.experience-list {
  display: flex;
  flex-direction: column;
}

section {
  margin-bottom: 100px;
}

/* Mobile Styles */
@media (max-width: 768px) {
  .about-content {
    flex-direction: column;
    text-align: center;
    padding: 30px;
  }

  .profile-container {
    margin-right: 0;
    margin-bottom: 20px;
  }

  .profile-image {
    width: 120px;
    height: 120px;
  }

  .about-text h3 {
    font-size: 1.5rem;
  }

  .skills-list {
    justify-content: center;
  }
}

@media (max-width: 1200px) {
  .container {
    flex-direction: column;
    align-items: flex-start;
  }

  .content {
    width: 100%;
    padding-left: 20px;
  }

  section {
    margin-bottom: 100px;
  }
}
</style>
