// routes/eventRoutes.js
const express = require('express');
const router = express.Router();
const db = require('../db/event_management_db'); // Import the database connection
const path = require('path');

// Serve the HTML file when accessing the root URL
router.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'eventManagement.html'));
});

// Example route to display data from the database
router.get('/Event_Details', (req, res) => {
    db.query('SELECT * FROM Event_Details', (error, results) => {
        if (error) {
            res.status(500).send(error);
        } else {
            res.json(results);
        }
    });
});

// Route to handle form submission
router.post('/submit', (req, res) => {
    const { eventName, eventDescription, location, reqSkills, urgency, spots, eventStartDate, eventStartTime, eventEndDate, eventEndTime } = req.body;
    console.log('Received data:', req.body);  // Log the received data
    db.query('INSERT INTO Event_Details (eventName, eventDescription, location, reqSkills, urgency, spots, eventStartDate, eventStartTime, eventEndDate, eventEndTime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [eventName, eventDescription, location, JSON.stringify(reqSkills), urgency, spots, eventStartDate, eventStartTime, eventEndDate, eventEndTime], (error, results) => {
        if (error) {
            console.error('Error inserting event:', error);
            res.status(500).send(error);
        } else {
            console.log('Event added with ID:', results.insertId);
            res.status(201).send(`Event added with ID: ${results.insertId}`);
        }
    });
});

module.exports = router;
