const mysql = require('mysql2');
require('dotenv').config(); // Load environment variables

// Create a connection to the database
const connection = mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || '', // Replace with your MySQL username
    password: process.env.DB_PASSWORD || '', // Replace with your MySQL password
    database: process.env.DB_NAME || 'vol_app'
});

// Connect to the database
connection.connect((err) => {
    if (err) {
        console.error('Error connecting: ' + err.stack);
        return;
    }
    console.log('Connected as id ' + connection.threadId);
});

module.exports = connection;
