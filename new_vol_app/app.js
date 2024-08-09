const express = require('express');
const path = require('path');
require('dotenv').config(); // Load environment variables

const app = express();

// Middleware to parse JSON bodies and serve static files
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
app.get('/findevents', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'findEvents.html'));
});
app.get('/yourevents', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'yourEvents.html'));
});

// Routes for other APIs
app.use('/api', require('./routes/vol_history'));
app.use('/', require('./routes/volunteer_matching'));
app.use('/register', require('./routes/register'));
app.use('/login', require('./routes/login'));


// Start the server
const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
