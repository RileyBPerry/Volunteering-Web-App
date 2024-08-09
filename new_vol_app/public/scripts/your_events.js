const express = require('express');
const router = express.Router();
const db = require('../db/your_events_db');
const path = require('path');

router.get('/api/admin/events', (req, res) => {
    db.query(
       `SELECT 
            eventName, 
            DATE_FORMAT(e.eventDate, '%m/%d/%Y') AS formattedEventDate,
            CONCAT(eventStart, ' - ', eventEnd) AS eventTime, 
            location, 
            spots 
         FROM 
            EventDetails
         WHERE 
            adminId = $1`, // Use a parameterized query to prevent SQL injection
        [adminId],
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

router.get('/admin/events', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'views', 'yourEvents.html')); // Serve the HTML file from the views folder
});

module.exports = router;