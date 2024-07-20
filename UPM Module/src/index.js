const express = require("express");
const path = require("path");
const collection = require("./config");
const bcrypt = require('bcrypt');

const app = express();
app.use(express.json());
app.use(express.static("public"));
app.use(express.urlencoded({ extended: false }));
app.set("view engine", "ejs");

// Route for the homepage
app.get("/", (req, res) => {
    res.render("UPM"); // Render UMP.ejs
});

// Route for the profile page
app.get("/profile", (req, res) => {
    res.render("profile");
});

// Handle profile submission
app.post("/submit-profile", async (req, res) => {
    const data = {
        fullname: req.body.fullname,
        address1: req.body.address1,
        address2: req.body.address2 || '', // Default to empty string if not provided
        city: req.body.city,
        state: req.body.state,
        zipcode: req.body.zipcode,
        skills: req.body.skills || [], // Default to empty array if not provided
        preferences: req.body.preferences || '', // Default to empty string if not provided
        availability: req.body.availability || {}
    };

    try {
        // Assuming you have a profile collection
        const profileCollection = collection.db.collection('profiles');
        const result = await profileCollection.insertOne(data);
        console.log(result);
        res.send('Profile submitted successfully!');
    } catch (error) {
        console.error(error);
        res.status(500).send('An error occurred while submitting the profile.');
    }
});

// Define Port for Application
const port = 5001;
app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});
