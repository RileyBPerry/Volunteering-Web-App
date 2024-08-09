const mongoose = require('mongoose');

// Create Schema
const Loginschema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true
    }
});

// Create the model without connecting to a database
const collection = mongoose.model("users", Loginschema);

module.exports = collection;
