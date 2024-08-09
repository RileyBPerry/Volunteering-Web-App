const express = require('express');
const router = express.Router();

// Hardcoded notifications data
const notifications = [
    { update: 'Your history has been updated.', reminder: 'Event XYZ is tomorrow.' },
    { update: 'There has been an update to an event.', reminder: 'Event ABC is in one week.' }
];

// Define the route to handle GET requests for notifications
router.get('/notifications', (req, res) => {
    res.json({ notifications }); // Ensure you're sending JSON
});

module.exports = router;
