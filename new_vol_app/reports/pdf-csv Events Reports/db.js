// db.js
const mysql = require('mysql2');
require('dotenv').config(); // Load environment variables if needed

// Create a connection to the database
const connection = mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root', // Replace with your MySQL username
    password: process.env.DB_PASSWORD || '', // Replace with your MySQL password
    database: process.env.DB_NAME || 'volapp'
});

// Connect to the database
connection.connect((err) => {
    if (err) {
        console.error('Error connecting: ' + err.stack);
        return;
    }
    console.log('Connected to MySQL as id ' + connection.threadId);
});

module.exports = connection;
