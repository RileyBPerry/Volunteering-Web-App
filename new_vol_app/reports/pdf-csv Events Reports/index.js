const express = require('express');
const router = require('./routes');
const path = require('path');

const app = express();

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Serve the event report page
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'eventReport.html'));
});

// Middleware for parsing JSON (not necessary in this case, but useful for future POST requests)
app.use(express.json());

// Use the router for handling routes
app.use('/', router);

app.listen(8080, () => console.log('Server running on port 8080'));
