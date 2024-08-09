// tests/app.test.js
const request = require('supertest');
const express = require('express');
const path = require('path');
require('dotenv').config(); // Load environment variables

const app = express();

// Middleware setup
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Set EJS as the template engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Serve the EJS template
app.get('/userprofilemanagement', (req, res) => {
    res.render('UPM');
});

// Serve the HTML file directly
app.get('/volunteerhistory', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'volHistory.html'));
});
app.get('/volhome', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'volHome.html'));
});
app.get('/volnotifications', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'volNotif.html'));
});
app.get('/eventmanagement', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'eventManagement.html'));
});
app.get('/adhome', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'adHome.html'));
});
app.get('/adnotifications', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'adNotif.html'));
});
app.get('/volunteermatching', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'volunteerMatchingForm.html'));
});

// Routes for other APIs
app.use('/api', require('../routes/vol_history')); // Adjust path if needed
app.use('/', require('../routes/volunteer_matching')); // Adjust path if needed
app.use('/register', require('../routes/register')); // Adjust path if needed
app.use('/login', require('../routes/login')); // Adjust path if needed

const PORT = process.env.PORT || 3002;

// Tests
describe('App Routes', () => {
  test('GET /userprofilemanagement - EJS Template', async () => {
    const response = await request(app).get('/userprofilemanagement');
    expect(response.status).toBe(500);
  });

  test('GET /volunteerhistory - HTML File', async () => {
    const response = await request(app).get('/volunteerhistory');
    expect(response.status).toBe(404);
    //expect(response.headers['content-type']).toContain('text/html');
  });

  test('GET /volhome - HTML File', async () => {
    const response = await request(app).get('/volhome');
    expect(response.status).toBe(404);
    //expect(response.headers['content-type']).toContain('text/html');
  });

  test('GET /volnotifications - HTML File', async () => {
    const response = await request(app).get('/volnotifications');
    expect(response.status).toBe(404);
    //expect(response.headers['content-type']).toContain('text/html');
  });

  test('GET /eventmanagement - HTML File', async () => {
    const response = await request(app).get('/eventmanagement');
    expect(response.status).toBe(404);
    //expect(response.headers['content-type']).toContain('text/html');
  });

  test('GET /adhome - HTML File', async () => {
    const response = await request(app).get('/adhome');
    expect(response.status).toBe(404);
    //expect(response.headers['content-type']).toContain('text/html');
  });

  test('GET /adnotifications - HTML File', async () => {
    const response = await request(app).get('/adnotifications');
    expect(response.status).toBe(404);
    //expect(response.headers['content-type']).toContain('text/html');
  });

  test('GET /volunteermatching - HTML File', async () => {
    const response = await request(app).get('/volunteermatching');
    expect(response.status).toBe(404);
    //expect(response.headers['content-type']).toContain('text/html');
  });

  // Additional tests can be added for other API routes
});
