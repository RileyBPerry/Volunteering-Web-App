const express = require('express');
const mysql = require('mysql2');
const path = require('path');

const app = express();
const PORT = 3002;

// Create a connection to the database
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root', // Replace with your MySQL username
    password: '#Shahodi2002', // Replace with your MySQL password
    database: 'vol_app' // Replace with your MySQL database name
  });

  // Connect to the database
connection.connect((err) => {
    if (err) {
      console.error('Error connecting: ' + err.stack);
      return;
    }
    console.log('Connected as id ' + connection.threadId);
  });

  // Middleware to parse JSON bodies
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Serve the HTML file when accessing the root URL
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'eventManagement.html'));
});

// Example route to display data from the database
app.get('/Event_Details', (req, res) => {
    connection.query('SELECT * FROM Event_Details', (error, results) => {
      if (error) {
        res.status(500).send(error);
      } else {
        res.json(results);
      }
    });
  });

  app.post('/submit', (req, res) => {
    const { eventName, eventDescription, location, reqSkills, urgency, spots, eventStartDate, eventStartTime, eventEndDate, eventEndTime } = req.body;
    console.log('Received data:', req.body);  // Log the received data
    connection.query('INSERT INTO Event_Details (eventName, eventDescription, location, reqSkills, urgency, spots, eventStartDate, eventStartTime, eventEndDate, eventEndTime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [eventName, eventDescription, location, JSON.stringify(reqSkills), urgency, spots, eventStartDate, eventStartTime, eventEndDate, eventEndTime], (error, results) => {
        if (error) {
            console.error('Error inserting event:', error);
            res.status(500).send(error);
        } else {
            console.log('Event added with ID:', results.insertId);
            res.status(201).send(`Event added with ID: ${results.insertId}`);
        }
    });
});


app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
