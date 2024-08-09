const express = require('express');
const connection = require('../db/UPM_db'); // Import the database connection
const router = express.Router();

// Route for the homepage
router.get("/", (req, res) => {
    res.render("UPM"); // Render UPM.ejs
});

// Route for the profile page
router.get("/userprofilemanagment", (req, res) => {
    res.render("UPM");
});

// Handle profile submission
router.post('/submit-profile', (req, res) => {
    console.log('Request body:', req.body);
    const { fullname, address1, address2, city, state, zipcode, skills, preferences, availability } = req.body;

    const query = 'INSERT INTO UserProfile (fullname, address1, address2, city, state, zipcode, skills, preferences, availability) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)';
    const values = [fullname, address1, address2, city, state, zipcode, JSON.stringify(skills), preferences, JSON.stringify(availability)];

    connection.query(query, values, (err, results) => {
        if (err) {
            console.error('Database insert error:', err);
            res.status(500).send('Database error');
            return;
        }
        res.send('Profile submitted successfully');
    });
});

module.exports = router;
