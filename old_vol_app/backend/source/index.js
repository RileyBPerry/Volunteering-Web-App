// backend/source/index.js
const express = require('express'); // Import express
const app = express(); // Initialize express
const port = 3000; // Port, can be any port number
const path = require('path'); //import path module


// Middleware to parse JSON
app.use(express.json()); // Parse incoming bodies

//Serve static files from 'html' dir
app.use(express.static(path.join(__dirname, '../../html')));

// Import routes
// Contain definitions for handling different HTTP routes
const adminRoutes = require('./routes/adminRoutes'); // admin notifs
const volunteerRoutes = require('./routes/volunteerRoutes'); // volunteer notifs
const volunteerHistoryRoutes = require('./routes/volunteerHistoryRoutes'); //Volunteer history 

// Use routes
// Connect imported route handlers to specific URL paths
app.use('/api/admin', adminRoutes); // admin notification Route
app.use('/api/volunteer', volunteerRoutes); // volunteer notification route
app.use('/api/history', volunteerHistoryRoutes); //volunteer history routes

// Start server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

