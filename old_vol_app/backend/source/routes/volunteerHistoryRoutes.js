//volunteerHistoryRoutes.js
const express = require('express');
const router = express.Router();

// Hardcoded history data
const history = [
    { eventName: 'Park Cleanup', date: '2024-06-15', times: '3 hours', location: 'Discovery Green', performanceScore: 'A' },
    { eventName: 'Hosuton Food Drive', date: '2024-07-01', times: '5 hours', location: 'Houston Food Bank', performanceScore: 'B' }
];

// Define the route to handle GET requests for volunteer history
router.get('/history', (req, res) => {
    res.json({ history }); // Ensure you're sending JSON
});

module.exports = router;
