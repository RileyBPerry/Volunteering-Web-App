const express = require("express");
const path = require("path");
const mysql = require('mysql2');
const bcrypt = require('bcrypt');

const app = express();
app.use(express.json());
app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));
app.set("view engine", "ejs");

// Create a connection to the database
const connection = mysql.createConnection({
    host: 'localhost',
    user: '', // Replace with your MySQL username
    password: '', // Replace with your MySQL password
    database: 'vol_app'
  });

// Connect to the database
connection.connect((err) => {
    if (err) {
        console.error('Error connecting: ' + err.stack);
        return;
    }
    console.log('Connected as id ' + connection.threadId);
  });

// Route for the homepage
app.get("/", (req, res) => {
    res.render("UPM"); // Render UPM.ejs
});

// Route for the profile page
app.get("/profile", (req, res) => {
    res.render("profile");
});

// Handle profile submission
app.post('/submit-profile', (req, res) => {
    console.log('Request body:', req.body);
    const { fullname, address1, address2, city, state, zipcode, skills, preferences, availability } = req.body;

    // Example: Insert data into the database (you should adjust the query and parameters as needed)
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


// Define Port for Application
const port = 5002;
app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});
