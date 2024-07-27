const express = require("express");
const mysql = require("mysql2");
const path = require("path");
const bcrypt = require("bcrypt");

const app = express();
app.use(express.json());
app.use(express.static("public"));
app.use(express.urlencoded({ extended: false }));
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

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
    console.log('Connected to MySQL as id ' + connection.threadId);
});

// Serve the login page
app.get("/", (req, res) => {
    res.render("login");
});

// Serve the registration page
app.get("/register", (req, res) => {
    res.render("register");
});

// Register User
app.post("/register", async (req, res) => {
    console.log('Request body:', req.body);  // Ensure email and password are received

    const { username, password } = req.body;
    console.log('Email:', username);
    console.log('Password:', password);

    // Check email and password
    if (!username || !password) {
        console.log('Email or password missing');
        res.status(400).send('Email and password are required.');
        return;
    }

    connection.query('SELECT * FROM usercredentials WHERE username = ?', [username], async (error, results) => {
        if (error) {
            console.error('Error checking user:', error);
            res.status(500).send('Internal Server Error');
            return;
        }
        console.log('Query results:', results);
        if (results.length > 0) {
            res.send('Email already exists. Please use a different email.');
        } else {
            try {
                const saltRounds = 10;
                const hashedPassword = await bcrypt.hash(password, saltRounds);

                connection.query('INSERT INTO usercredentials (username, password) VALUES (?, ?)', [username, hashedPassword], (error) => {
                    if (error) {
                        console.error('Error inserting user:', error);
                        res.status(500).send('Internal Server Error');
                    } else {
                        res.send('User registered successfully');
                    }
                });
            } catch (err) {
                console.error('Error hashing password:', err);
                res.status(500).send('Internal Server Error');
            }
        }
    });
});

// Login user
app.post("/login", async (req, res) => {
    try {
        const check = await new Promise((resolve, reject) => {
            connection.query('SELECT * FROM usercredentials WHERE username = ?', [req.body.username], (error, results) => {
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
        console.error('Error during login:', error);
        res.send("Error during login");
    }
});

// Define Port for Application
const port = 5001;
app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});
