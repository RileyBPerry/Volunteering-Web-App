const express = require('express');
const path = require('path');
const mysql = require('mysql2');

const app = express();
const port = 5003;

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
        console.error('Error connecting to MySQL: ' + err.stack);
        return;
    }
    console.log('Connected to MySQL as id ' + connection.threadId);
});

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Define route to get volunteer history
app.get('/api/history', (req, res) => {
    connection.query(
        'SELECT e.eventName, v.hoursWorked, v.feedback, v.perfomScore AS performanceScore ' +
        'FROM Vol_History v ' +
        'JOIN Event_Details e ON v.eventId = e.eventId',
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

// Serve the volunteer history page
app.get('/volunteer-history', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'volHistory.html'));
});

// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
