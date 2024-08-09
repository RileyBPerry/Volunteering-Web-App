const express = require('express');
const router = express.Router();
const db = require('../db/UPM_db');

router.post('/upm', (req, res) => {
    const query = 'INSERT INTO userprofile (fullname, address1, address2, city, state, zipcode, skills, preferences, availability) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)';
    const values = [req.body.fullname, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.zipcode, JSON.stringify(req.body.skills), req.body.preferences, JSON.stringify(req.body.availability)];

    db.query(query, values, (err, results) => {
        if (err) {
            console.error('Database insert error:', err);
            res.status(500).send('Database error');
            return;
        }
        res.send('User profile updated successfully.');
    });
});

module.exports = router;
