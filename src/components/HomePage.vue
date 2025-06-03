<template>
  <div id="home-page">
    <div class="container">
      <Header :activeSection="activeSection" />
      <main class="content">
        <Section id="about" title="">
          <div class="about-content fade-in">
            <div class="profile-container">
              <img
                src="https://res.cloudinary.com/dtwxjssaq/image/upload/v1738096657/1-1_Roh_Andy_8x10_GrayBackground_jz39le.jpg"
                alt="Profile"
                class="profile-image"
              />
            </div>
            <div class="about-text">
              <h3>Hello, I'm Andy.</h3>
              <p>
                Full Stack Developer, learning and
                honing my skills to build highly functional and visually
                appealing websites. I enjoy working on projects that challenge
                me to think critically / creatively.
              </p>
              <p>
                In my free time, I like to explore new technology, video game,
                and edit videos.
              </p>
              <p>
                Some technologies I’ve been working with recently:
              </p>
              <ul class="skills-list">
                <li>Vercel</li>
                <li>TypeScript</li>
                <li>Next.js</li>
                <li>Zod</li>
                <li>Mantine</li>
                <li>Node.js</li>
                <li>MariaDB</li>
                <li>Spring Framework</li>
                <li>Micro Services</li>
                <li>OAuth 2.0</li>
                <li>React.js</li>
              </ul>
              <p>
                <a href="/portfolio-website/andy_roh_resume.pdf" target="_blank" class="resume-link">View My Résumé</a>
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
              :class="{
                active: hoveredCard === experience.title,
                inactive:
                  hoveredCard !== null && hoveredCard !== experience.title,
              }"
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
              :class="{
                active: hoveredCard === project.title,
                inactive: hoveredCard !== null && hoveredCard !== project.title,
              }"
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
      hoveredCard: null,
      experiences: [
        {
          title: "Software Developer @ OFCC",
          duration: "2025",
          description: "Java Backend Software Developer at the Ohio Facilities Construction Commission.",
          tags: [
            "Java",
            "Spring Boot",
            "MongoDB",
            "NoSQL",
            "Azure DevOps",
            "Unit Testing",
            "Linux",
            "Agile",
            "Next.js",
            "TypeScript",
            "Zod",
            "Mantine",
            "MariaDB",
            "MongoDB",
          ]
        },
        {
          title: "Tech Elevator Student",
          duration: "2024",
          description:
            "Completed a full-stack coding bootcamp focusing on software development and web applications.",
          tags: [
            "Java",
            "HTML",
            "CSS",
            "JavaScript",
            "Vue.js",
            "Spring Boot",
            "Agile",
            "SQL",
            "Unit Testing",
            "Visual Studio Code",
            "IntelliJ CE",
          ],
        },
        {
          title: "Patient Care Technician @ DaVita",
          duration: "2023 - 2024",
          description:
            "Provided patient care and support in a healthcare environment, ensuring quality treatment.",
          tags: ["Healthcare", "Patient Care"],
        },
        {
          title: "VALORANT eSports Captain",
          duration: "2020 - 2022",
          description:
            "Led the high school VALORANT eSports team, developing leadership, strategy, and team coordination skills in a competitive environment.",
          tags: ["Leadership", "Team Management", "Strategy", "eSports"],
        },
        {
          title: "Freelance Video Editor",
          duration: "2020 - 2022",
          description: `
            Edited and produced gaming videos, applying creativity and technical skills to deliver high-quality content.
            Check out my YouTube channel for examples of my work: 
            <a href="https://www.youtube.com/@nojiwon" target="_blank" class="youtube-link">nojiwon</a>.
          `,
          tags: [
            "Video Editing",
            "Adobe After Effects",
            "Sound Design",
            "Visual Effects",
            "Color Grading",
            "Motion Design",
          ],
        },
      ],
      projects: [
        {
          title: "LanternDB",
          description:
            "LanternDB is a video game database web application developed using Vue.js.",
          tags: [
            "Vue.js",
            "JavaScript",
            "Node.js",
            "Java",
            "Spring Boot",
            "Spring Security",
            "PostgresSQL",
          ],
          date: "2024",
          thumbnail:
            "https://res.cloudinary.com/dtwxjssaq/image/upload/v1724637273/Home_Page_kxtrqd.png",
          link: "https://github.com/andyrohdev/lanterndb-capstone",
        },
        {
          title: "Typing Test",
          description:
            "A front-end web application built to test typing speed and accuracy with different modes.",
          tags: ["JavaScript", "CSS", "HTML"],
          date: "2024",
          thumbnail:
            "https://res.cloudinary.com/dtwxjssaq/image/upload/v1724637397/Screenshot_2024-08-25_215549_wqaz4c.png",
          link: "https://andyrohdev.github.io/typing-test/",
        },
        {
          title: "Portfolio Website",
          description:
            "A personal portfolio website showcasing my skills, projects, and experience as a full-stack developer.",
          tags: ["Vue.js", "JavaScript", "CSS", "HTML"],
          date: "2024",
          thumbnail:
            "https://res.cloudinary.com/dtwxjssaq/image/upload/v1748968823/portfolio-cloudinary-thumbnail_qfjnfo.png",
          link: "https://andyrohdev.github.io/portfolio-website/"
        },
        {
          title: "Spotify Profile Overview (SPO)",
          description:
            "A web application that integrates with the Spotify Web API to provide a detailed overview of your Spotify profile, including top tracks, artists, and playlists.",
          tags: ["React", "Spotify Web API", "JavaScript", "CSS"],
          date: "2024",
          thumbnail:
            "https://upload.wikimedia.org/wikipedia/commons/1/19/Spotify_logo_without_text.svg", // White Spotify logo placeholder
          link: "https://andyrohdev.github.io/spotify-profile-overview/#/",
        },
        {
          title: "QuickTask",
          description:
            "A simple frontend demo task management application that allows users to create, manage, and track their tasks efficiently. Note: This is a demo application and does not include backend functionality.",
            date: "2025",
          tags: ["Vercel", "Next.js", "TypeScript", "CSS", "HTML", "Mantine", "React.js"],
          thumbnail:
          "https://res.cloudinary.com/dtwxjssaq/image/upload/v1748975520/quick-task-cloudinary-thumbnail_ih7mpp.png",
          link: "https://quick-task-nu.vercel.app/"
        }
      ],

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
        rootMargin: "0px",
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
      document.querySelectorAll("section").forEach((section) => {
        observer.observe(section);
      });
    },
    observeAnimations() {
      const animationOptions = {
        root: null,
        rootMargin: "0px",
        threshold: 0.2, // Adjust this value based on when you want the animations to trigger
      };

      const animationObserver = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add("animate");
          } else {
            entry.target.classList.remove("animate"); // Reset animation when out of view
          }
        });
      }, animationOptions);

      // Observe each animatable section
      document.querySelectorAll(".fade-in").forEach((section) => {
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
}

.container {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  width: 100%;
  max-width: 1200px;
  padding: 0 2%;
  /* Reduced padding */
  box-sizing: border-box;
}

.content {
  flex-grow: 1;
  max-width: 800px;
  background-color: transparent;
  color: white;
  padding: 40px;
  margin-left: 300px;
  /* Offset for the sidebar on larger screens */
}

/* Ensure cards are fully visible by default */
.experience-card,
.project-card {
  opacity: 1;
  transition: opacity 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
}

/* Dim inactive cards when one card is hovered */
.experience-card.inactive,
.project-card.inactive {
  opacity: 0.5;
}

/* Keep the active card fully visible */
.experience-card.active,
.project-card.active {
  opacity: 1;
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

.youtube-link {
  color: #64ffda;
  font-weight: bold;
  text-decoration: none;
}

.youtube-link:hover {
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
    display: block;
    margin-bottom: 20px;
    margin-right: 0px;
  }

  .about-text h3 {
    font-size: 1.5rem;
  }

  .skills-list {
    justify-content: center;
  }

  .content {
    margin-left: 0;
    /* Remove the margin on mobile */
  }
}

@media (max-width: 1200px) {
  .container {
    flex-direction: column;
    align-items: flex-start;
  }

  .content {
    width: 100%;
    /* Allow content to take the full width */
    max-width: 100%;
    /* Remove the maximum width limitation */
    padding: 20px;
    /* Adjust padding for smaller screens */
    margin-left: 0;
    /* Remove the margin on smaller screens */
  }
}
</style>
