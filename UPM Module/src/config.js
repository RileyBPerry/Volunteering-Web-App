const mongoose = require('mongoose');

// Create Schema
const UserSchema = new mongoose.Schema({
    fullname: {
        type: String,
        required: true
    },
    address1: {
        type: String,
        required: true
    },
    address2: {
        type: String,
        default: '' // Optional field with default value
    },
    city: {
        type: String,
        required: true
    },
    state: {
        type: String,
        required: true
    },
    zipcode: {
        type: String,
        required: true
    },
    skills: {
        type: [String], // Array of strings for skills
        required: true
    },
    preferences: {
        type: String,
        default: '' // Optional field with default value
    },
    availability: {
        monday: {
            type: [String], // Array of strings for availability times
            default: []
        },
        tuesday: {
            type: [String],
            default: []
        },
        wednesday: {
            type: [String],
            default: []
        },
        thursday: {
            type: [String],
            default: []
        },
        friday: {
            type: [String],
            default: []
        },
        saturday: {
            type: [String],
            default: []
        },
        sunday: {
            type: [String],
            default: []
        }
    }
});

// Create the model without connecting to a database
const User = mongoose.model("User", UserSchema);

module.exports = User;
