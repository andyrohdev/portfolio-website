<template>
  <div class="sidebar">
    <div class="header-content">
      <h1>Andy Roh</h1>
      <h2>Full Stack Developer</h2>
      <p class="phrase">
        Passionate Full Stack Developer, Bringing Ideas to Life
      </p>

      <nav>
        <ul>
          <li>
            <a
              href="#about"
              @click.prevent="scrollToSection('about')"
              :class="{ active: activeSection === 'about' }"
            >About</a>
          </li>
          <li>
            <a
              href="#experience"
              @click.prevent="scrollToSection('experience')"
              :class="{ active: activeSection === 'experience' }"
            >Experience</a>
          </li>
          <li>
            <a
              href="#projects"
              @click.prevent="scrollToSection('projects')"
              :class="{ active: activeSection === 'projects' }"
            >Projects</a>
          </li>
        </ul>
      </nav>

      <div class="social-links">
        <a
          href="https://github.com/andyrohdev"
          aria-label="GitHub"
          class="icon"
          target="_blank"
        >
          <i class="fab fa-github"></i>
        </a>
        <a
          href="https://www.linkedin.com/in/andyrohdev/"
          aria-label="LinkedIn"
          class="icon"
          target="_blank"
        >
          <i class="fab fa-linkedin"></i>
        </a>
        <a
          href="https://www.instagram.com/r.ohandy/"
          aria-label="Instagram"
          class="icon"
          target="_blank"
        >
          <i class="fab fa-instagram"></i>
        </a>
        <a
          href="https://twitter.com/andyrohdev"
          aria-label="Twitter"
          class="icon"
          target="_blank"
        >
          <i class="fab fa-twitter"></i>
        </a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    activeSection: String, // Receive the active section from the parent
  },
  methods: {
    scrollToSection(sectionId) {
      const section = document.getElementById(sectionId);
      if (section) {
        section.scrollIntoView({ behavior: 'smooth' });
      }
    }
  }
};
</script>

<style scoped>
.sidebar {
  position: fixed; /* Fix it to the viewport */
  top: 0;
  z-index: 1000;
  width: 300px;
  height: 100vh;
  padding: 20px;
  background-color: transparent;
  color: white;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

.header-content {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  padding-top: 100px;
}

h1 {
  font-size: 3rem; /* Increased size to make it stand out */
  margin-bottom: 0.5rem;
}

h2 {
  font-size: 1.5rem;
  margin-bottom: 1rem;
  color: #64ffda;
}

.phrase {
  font-size: 1rem;
  margin-bottom: 2rem;
  color: #8892b0;
}

nav ul {
  list-style: none;
  padding: 0;
  margin-top: 20px;
}

nav li {
  margin-bottom: 10px;
}

nav a {
  color: #8892b0;
  text-decoration: none;
  font-weight: 500;
  position: relative;
  transition: color 0.3s ease;
}

nav a.active {
  color: #64ffda;
}

nav a::before {
  content: "";
  position: absolute;
  width: 100%;
  height: 2px;
  bottom: 0;
  left: 0;
  background-color: #64ffda;
  visibility: hidden;
  transform: scaleX(0);
  transition: all 0.3s ease-in-out;
}

nav a:hover::before,
nav a.active::before {
  visibility: visible;
  transform: scaleX(1);
}

nav a:hover {
  color: #64ffda;
}

.social-links {
  margin-top: auto;
  display: flex;
  gap: 15px;
}

.icon {
  font-size: 24px;
  color: #8892b0;
}

.icon:hover {
  color: #64ffda;
}

@media (max-width: 1200px) {
  .sidebar {
    position: relative;
    height: auto;
    width: 100%;
    padding: 20px;
  }

  .header-content {
    align-items: flex-start;
  }

  nav {
    display: none;
  }
}
</style>
