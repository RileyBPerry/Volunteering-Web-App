const mysql = require('mysql2');
require('dotenv').config(); // Ensure environment variables are loaded

// Create a connection to the database
const connection = mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || '', // Replace with your MySQL username
    password: process.env.DB_PASSWORD || '', // Replace with your MySQL password
    database: process.env.DB_NAME || 'vol_app',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Connect to the database
connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL: ' + err.stack);
        return;
    }
    console.log('Connected to MySQL as id ' + connection.threadId);
});

// Function to execute SQL queries
const queryDatabase = (query, params = []) => {
    return new Promise((resolve, reject) => {
        connection.query(query, params, (error, results) => {
            if (error) {
                console.error('SQL Error:', error); // Log SQL errors
                reject(error);
            } else {
                resolve(results);
            }
        });
    });
};

module.exports = { queryDatabase };
