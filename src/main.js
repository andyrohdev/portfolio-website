import { createApp } from 'vue';
import App from './App.vue';
import router from './router'; // Make sure this points to your router setup
import '@fortawesome/fontawesome-free/css/all.css';


const app = createApp(App);

app.use(router); // Register the router with your app
app.mount('#app');
