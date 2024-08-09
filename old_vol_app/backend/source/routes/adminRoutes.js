//adminRoutes.js
const express = require('express');
const router = express.Router();

// Hardcoded notifications data
const notifications = [
    { update: 'New volunteer signed up for Event ABC.', reminder: 'Event ABC is tomorrow.' },
    { update: 'New volunteer signed up for Event XYZ.', reminder: 'Check volunteer applications.' }
];

// Define the route to handle GET requests for notifications
router.get('/notifications', (req, res) => {
    res.json({ notifications }); // Ensure you're sending JSON
});

module.exports = router;
