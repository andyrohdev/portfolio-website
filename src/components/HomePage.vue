<template>
  <div id="home-page">
    <div class="container">
      <Header :activeSection="activeSection" />
      <main class="content">
        <Section id="about" title="">
          <div class="about-content fade-in">
            <div class="profile-container">
              <img 
                src="https://res.cloudinary.com/dtwxjssaq/image/upload/v1722004673/1715554927606_c7dr5q.jpg" 
                alt="Profile" 
                class="profile-image" 
              />
            </div>
            <div class="about-text">
              <h3>Hi, I'm Andy.</h3>
              <p>
                A passionate Full Stack Developer, constantly learning and honing my skills to build highly functional and visually appealing websites. I enjoy working on projects that challenge me to think critically and creatively.
              </p>
              <p>
                In my free time, I like to explore new technology, play games, and edit videos. Previously a highschool eSports captain, I excel in fast paced environments. I also enjoy sharing my experiences and knowledge.
              </p>
              <p>
                Here are a few technologies I’ve been working with recently:
              </p>
              <ul class="skills-list">
                <li>JavaScript</li>
                <li>Vue.js</li>
                <li>Node.js</li>
                <li>SQL</li>
                <li>Java</li>
                <li>Spring Framework</li>
                <li>PostgresSQL</li>
                <li>RESTful APIs</li>
                <li>Micro Services</li>
              </ul>
              <p>
                <a href="../assets/andy_roh_resume.pdf" target="_blank" class="resume-link">View My Résumé</a>
              </p>
            </div>
          </div>
        </Section>

        <Section id="experience" title="Experience">
          <div class="experience-list fade-in">
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
          <div class="project-list fade-in">
            <ProjectCard
              v-for="project in projects"
              :key="project.title"
              :title="project.title"
              :description="project.description"
              :tags="project.tags"
              :thumbnail="project.thumbnail"
              :link="project.link"
              :class="{ active: hoveredCard === project.title, inactive: hoveredCard !== null && hoveredCard !== project.title }"
              @mouseenter="hoveredCard = project.title"
              @mouseleave="hoveredCard = null"
            />
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
import ProjectCard from "../components/ProjectCard.vue";

export default {
  components: {
    Header,
    Section,
    ExperienceCard,
    ProjectCard,
  },
  data() {
    return {
      experiences: [
        {
          title: "Tech Elevator Student",
          duration: "2024",
          description: "Completed a full-stack coding bootcamp focusing on software development and web applications.",
          tags: ["Java", "HTML", "CSS", "JavaScript", "Vue.js", "Spring Boot", "Agile", "SQL", "Unit Testing", "Visual Studio Code", "IntelliJ CE"],
        },
        {
          title: "Davita - Patient Care Technician",
          duration: "2023 - 2024",
          description: "Provided patient care and support in a healthcare environment, ensuring quality treatment.",
          tags: ["Healthcare", "Patient Care"],
        },
        {
          title: "High School VALORANT eSports Captain",
          duration: "2020 - 2022",
          description: "Led the high school VALORANT eSports team, developing leadership, strategy, and team coordination skills in a competitive environment.",
          tags: ["Leadership", "Team Management", "Strategy"],
        },
        {
          title: "Freelance Gaming Video Editor",
          duration: "2020 - 2022",
          description: "Edited and produced gaming videos, applying creativity and technical skills to deliver high-quality content.",
          tags: ["Video Editing", "Gaming", "Sound Design", "Visual Effects", "Color Grading", "Adobe"],
        },
        
      ],
      projects: [
        {
          title: "LanternDB",
          description: "LanternDB is a video game database web application developed using Vue.js.",
          tags: ["Vue.js", "JavaScript", "Node.js", "Java", "Spring Boot", "Spring Security", "PostgresSQL"],
          thumbnail: "https://res.cloudinary.com/dtwxjssaq/image/upload/v1724637273/Home_Page_kxtrqd.png",
          link: "https://github.com/andyrohdev/lanterndb-capstone",
        },
        {
          title: "Typing Test",
          description: "A front-end web application built to test typing speed and accuracy with different modes.",
          tags: ["JavaScript", "CSS", "HTML"],
          thumbnail: "https://res.cloudinary.com/dtwxjssaq/image/upload/v1724637397/Screenshot_2024-08-25_215549_wqaz4c.png",
          link: "https://github.com/andyrohdev/typingtest-project",
        },
      ],
      hoveredCard: null,
      activeSection: null, // Track the currently active section
    };
  },
  mounted() {
    this.observeSections();
    this.observeAnimations(); // Add this to trigger scroll animations
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
    observeAnimations() {
      const animationOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.2, // Adjust this value based on when you want the animations to trigger
      };

      const animationObserver = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add('animate');
          } else {
            entry.target.classList.remove('animate'); // Reset animation when out of view
          }
        });
      }, animationOptions);

      // Observe each animatable section
      document.querySelectorAll('.fade-in').forEach((section) => {
        animationObserver.observe(section);
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
  background: linear-gradient(135deg, #0a192f, #1b2e48, #0a192f, #1b2735, #22303f);
  background-size: 400% 400%;
  animation: gradientFlow 15s ease infinite;
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
  border: 4px solid #64ffda;
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

.resume-link {
  color: #64ffda;
  text-decoration: none;
  font-weight: 600;
}

.resume-link:hover {
  text-decoration: underline;
}

.experience-list,
.project-list {
  display: flex;
  flex-direction: column;
}

/* Fade-in Animation */
.fade-in {
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 0.6s ease, transform 0.6s ease;
}

.fade-in.animate {
  opacity: 1;
  transform: translateY(0);
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
}
</style>
