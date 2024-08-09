const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const db = require('../db/register_db'); // Ensure the path is correct

// Serve the registration page
router.get('/', (req, res) => {
    res.render('register'); // Ensure 'register' is the name of your EJS file
});

// Register User
router.post('/', async (req, res) => {
    const { username, password } = req.body;

    if (!username || !password) {
        res.status(400).send('Email and password are required.');
        return;
    }

    db.query('SELECT * FROM usercredentials WHERE username = ?', [username], async (error, results) => {
        if (error) {
            res.status(500).send('Internal Server Error');
            return;
        }
        if (results.length > 0) {
            res.status(400).send('Email already exists. Please use a different email.');
        } else {
            try {
                const saltRounds = 10;
                const hashedPassword = await bcrypt.hash(password, saltRounds);

                db.query('INSERT INTO usercredentials (username, password) VALUES (?, ?)', [username, hashedPassword], (error) => {
                    if (error) {
                        res.status(500).send('Internal Server Error');
                    } else {
                        res.send('User registered successfully');
                    }
                });
            } catch (err) {
                res.status(500).send('Internal Server Error');
            }
        }
    });
});

module.exports = router;
