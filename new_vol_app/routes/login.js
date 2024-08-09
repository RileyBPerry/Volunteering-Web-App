// routes/loginRoutes.js
const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const db = require('../db/login_db'); // Import the database connection

// Serve the login page
router.get('/', (req, res) => {
    res.render('login');
});

// Login user
router.post('/', async (req, res) => {
    try {
        const check = await new Promise((resolve, reject) => {
            db.query('SELECT * FROM usercredentials WHERE username = ?', [req.body.username], (error, results) => {
                if (error) {
                    reject(error);
                } else {
                    resolve(results[0]);
                }
            });
        });

        if (!check) {
            res.send("Email not found");
        } else {
            const isPasswordMatch = await bcrypt.compare(req.body.password, check.password);
            if (!isPasswordMatch) {
                res.send("Wrong Password");
            } else {
                res.send("login successful!");
            }
        }
    } catch (error) {
        res.send("Error during login");
    }
});

module.exports = router;
