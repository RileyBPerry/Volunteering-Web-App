// routes/volunteerRoutes.js
const express = require('express');
const router = express.Router();
const mysql = require('mysql2');

// Create a connection pool to MySQL
const pool = mysql.createPool({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || '', // Replace with your MySQL username
    password: process.env.DB_PASSWORD || '', // Replace with your MySQL password
    database: process.env.DB_NAME || 'vol_app',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Function to execute SQL queries
const queryDatabase = (query, params = []) => {
    return new Promise((resolve, reject) => {
        pool.query(query, params, (error, results) => {
            if (error) {
                console.error('SQL Error:', error); // Log SQL errors
                reject(error);
            } else {
                resolve(results);
            }
        });
    });
};

// Format address for volunteer
const formatAddress = (address1, address2, city, state, zipcode) => {
    return `${address1} ${address2}, ${city}, ${state} ${zipcode}`;
};

// Format date and time for event
const formatDateTime = (startDate, startTime, endDate, endTime) => {
    return `${startDate} ${startTime} to ${endDate} ${endTime}`;
};

let currentVolunteerIndex = 0; // Initialize with a starting value
let currentEventIndex = 0; // Initialize with a starting value

// Endpoint to get current volunteer data
router.get('/api/current-volunteer', async (req, res) => {
    try {
        const volunteers = await queryDatabase('SELECT * FROM UserProfile LIMIT 1 OFFSET ?', [currentVolunteerIndex]);
        const volunteer = volunteers[0];
        if (volunteer) {
            res.json({
                volunteerName: volunteer.fullName,
                volunteerSkills: volunteer.skills,
                volunteerAddress: formatAddress(volunteer.address1, volunteer.address2, volunteer.city, volunteer.state, volunteer.zipcode),
                volunteerAvailability: volunteer.Availability
            });
        } else {
            res.status(404).json({ error: 'Volunteer not found' });
        }
    } catch (error) {
        res.status(500).json({ error: 'Database query failed' });
    }
});

// Endpoint to update current volunteer data
router.post('/api/current-volunteer', async (req, res) => {
    try {
        const { volunteerName, volunteerSkills, volunteerAddress, volunteerAvailability } = req.body;
        const [address1, address2, city, state, zipcode] = volunteerAddress.split(', ');
        await queryDatabase(
            'UPDATE UserProfile SET fullName = ?, skills = ?, address1 = ?, address2 = ?, city = ?, state = ?, zipcode = ?, Availability = ? WHERE userId = ?',
            [volunteerName, volunteerSkills, address1, address2, city, state, zipcode, volunteerAvailability, currentVolunteerIndex]
        );
        res.json({ status: 'success' });
    } catch (error) {
        res.status(500).json({ error: 'Database update failed' });
    }
});

// Endpoint to navigate to next volunteer
router.get('/api/next-volunteer', async (req, res) => {
    try {
        const countResult = await queryDatabase('SELECT COUNT(*) AS count FROM userprofile');
        const count = countResult[0].count;
        currentVolunteerIndex = (currentVolunteerIndex + 1) % count;

        const volunteers = await queryDatabase('SELECT * FROM UserProfile LIMIT 1 OFFSET ?', [currentVolunteerIndex]);
        const volunteer = volunteers[0];
        if (volunteer) {
            res.json({
                volunteerName: volunteer.fullName,
                volunteerSkills: volunteer.skills,
                volunteerAddress: formatAddress(volunteer.address1, volunteer.address2, volunteer.city, volunteer.state, volunteer.zipcode),
                volunteerAvailability: volunteer.Availability
            });
        } else {
            res.status(404).json({ error: 'Volunteer not found' });
        }
    } catch (error) {
        console.error('Error in /api/next-volunteer:', error);
        res.status(500).json({ error: 'Database query failed' });
    }
});

// Endpoint to navigate to previous volunteer
router.get('/api/previous-volunteer', async (req, res) => {
    try {
        const countResult = await queryDatabase('SELECT COUNT(*) AS count FROM UserProfile');
        const count = countResult[0].count;
        currentVolunteerIndex = (currentVolunteerIndex - 1 + count) % count;

        const volunteers = await queryDatabase('SELECT * FROM UserProfile LIMIT 1 OFFSET ?', [currentVolunteerIndex]);
        const volunteer = volunteers[0];
        if (volunteer) {
            res.json({
                volunteerName: volunteer.fullName,
                volunteerSkills: volunteer.skills,
                volunteerAddress: formatAddress(volunteer.address1, volunteer.address2, volunteer.city, volunteer.state, volunteer.zipcode),
                volunteerAvailability: volunteer.Availability
            });
        } else {
            res.status(404).json({ error: 'Volunteer not found' });
        }
    } catch (error) {
        res.status(500).json({ error: 'Database query failed' });
    }
});

// Endpoint to get current event data
router.get('/api/current-event', async (req, res) => {
    try {
        const events = await queryDatabase('SELECT * FROM EventDetails LIMIT 1 OFFSET ?', [currentEventIndex]);
        const event = events[0];
        if (event) {
            res.json({
                eventName: event.eventName,
                eventSkills: event.reqSkills, //NOT CORRECT
                eventLocation: event.location,
                eventDateAndTime: formatDateTime(event.eventStartDate, event.eventStartTime, event.eventEndDate, event.eventEndTime)
            });
        } else {
            res.status(404).json({ error: 'Event not found' });
        }
    } catch (error) {
        res.status(500).json({ error: 'Database query failed' });
    }
});

// Endpoint to navigate to next event
router.get('/api/next-event', async (req, res) => {
    try {
        const countResult = await queryDatabase('SELECT COUNT(*) AS count FROM EventDetails');
        const count = countResult[0].count;
        currentEventIndex = (currentEventIndex + 1) % count;

        const events = await queryDatabase('SELECT * FROM EventDetails LIMIT 1 OFFSET ?', [currentEventIndex]);
        const event = events[0];
        if (event) {
            res.json({
                eventName: event.eventName,
                eventSkills: event.reqSkills,
                eventLocation: event.location,
                eventDateAndTime: formatDateTime(event.eventStartDate, event.eventStartTime, event.eventEndDate, event.eventEndTime)
            });
        } else {
            res.status(404).json({ error: 'Event not found' });
        }
    } catch (error) {
        res.status(500).json({ error: 'Database query failed' });
    }
});

// Endpoint to navigate to previous event
router.get('/api/previous-event', async (req, res) => {
    try {
        const countResult = await queryDatabase('SELECT COUNT(*) AS count FROM EventDetails');
        const count = countResult[0].count;
        currentEventIndex = (currentEventIndex - 1 + count) % count;

        const events = await queryDatabase('SELECT * FROM EventDetails LIMIT 1 OFFSET ?', [currentEventIndex]);
        const event = events[0];
        if (event) {
            res.json({
                eventName: event.eventName,
                eventSkills: event.reqSkills,
                eventLocation: event.location,
                eventDateAndTime: formatDateTime(event.eventStartDate, event.eventStartTime, event.eventEndDate, event.eventEndTime)
            });
        } else {
            res.status(404).json({ error: 'Event not found' });
        }
    } catch (error) {
        res.status(500).json({ error: 'Database query failed' });
    }
});

module.exports = router;
