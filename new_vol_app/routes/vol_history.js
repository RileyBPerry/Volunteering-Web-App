const express = require('express');
const router = express.Router();
const db = require('../db/vol_history_db');
const path = require('path');

// Route to get volunteer history data
router.get('/api/history', (req, res) => {
    db.query(
        'SELECT e.eventName, v.hoursWorked, v.feedback, v.performanceScore ' +
        'FROM VolunteerEvents v ' +
        'JOIN EventDetails e ON v.eventId = e.eventId',
        (error, results) => {
            if (error) {
                console.error('Error fetching data:', error);
                res.status(500).send('Internal Server Error');
                return;
            }
            res.json(results); // Send results as JSON
        }
    );
});

// Route to serve the volunteer history page
router.get('/volunteer-history', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'views', 'volHistory.html')); // Serve HTML from the views folder

});

module.exports = router;
