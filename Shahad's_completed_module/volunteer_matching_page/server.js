const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
const port = 3001;

app.use(bodyParser.json());
app.use(express.static(path.join(__dirname)));

// In-memory data storage for multiple volunteers and events
let volunteers = [
    { id: 1, volunteerName: "John Doe", volunteerSkills: "Art, Hobbies & Crafts", volunteerAddress: "Apt. 282 84997 Walker Drive, Port Jacquelynnhaven, HI 83714", volunteerAvailability: "Mondays 9:00 to 14:30, Wednesdays 9:00 to 14:30" },
    { id: 2, volunteerName: "Jane Smith", volunteerSkills: "Interactive & Web Development, Music", volunteerAddress: "4817 Donna Track, South Coretta, OR 66765", volunteerAvailability: "Saturdays 11:30 to 17:00, Sundays 12:00 to 14:30" },
    { id: 3, volunteerName: "Alice Johnson", volunteerSkills: "Administrative & Clerical, Disaster Relief", volunteerAddress: "Apt. 204 52223 Thanh Knoll, Buckridgeborough, CT 65864-1772", volunteerAvailability: "Thursdays 7:00 to 15:30" }
];

let events = [
    { id: 1, eventName: "Event 1", eventSkills: "Administrative & Clerical", eventLocation: "Suite 578 8956 Botsford Fork, Turcotteville, VA 87678-7358", eventDateAndTime: "7-4-2024, 14:00" },
    { id: 2, eventName: "Event 2", eventSkills: "Finance, HR", eventLocation: "Suite 546 89736 Douglas Stream, South Norris, MO 25356-1577", eventDateAndTime: "3-4-2025, 9:30" },
    { id: 3, eventName: "Event 3", eventSkills: "Art, Interpersonal", eventLocation: "87162 Dietrich Rapids, North Cherelle, MI 53975-3006", eventDateAndTime: "4-9-2024" }
];

let currentVolunteerIndex = 0;
let currentEventIndex = 0;

// Serve the volunteerMatchingForm.html file at the root URL
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'volunteerMatchingForm.html'));
});

// Endpoint to get current volunteer data
app.get('/api/current-volunteer', (req, res) => {
    res.json(volunteers[currentVolunteerIndex]);
});

// Endpoint to update current volunteer data
app.post('/api/current-volunteer', (req, res) => {
    volunteers[currentVolunteerIndex] = req.body;
    res.json({ status: 'success', data: volunteers[currentVolunteerIndex] });
});

// Endpoint to navigate to next volunteer
app.get('/api/next-volunteer', (req, res) => {
    currentVolunteerIndex = (currentVolunteerIndex + 1) % volunteers.length;
    res.json(volunteers[currentVolunteerIndex]);
});

// Endpoint to navigate to previous volunteer
app.get('/api/previous-volunteer', (req, res) => {
    currentVolunteerIndex = (currentVolunteerIndex - 1 + volunteers.length) % volunteers.length;
    res.json(volunteers[currentVolunteerIndex]);
});

// Endpoint to get current event data
app.get('/api/current-event', (req, res) => {
    res.json(events[currentEventIndex]);
});

// Endpoint to navigate to next event
app.get('/api/next-event', (req, res) => {
    currentEventIndex = (currentEventIndex + 1) % events.length;
    res.json(events[currentEventIndex]);
});

// Endpoint to navigate to previous event
app.get('/api/previous-event', (req, res) => {
    currentEventIndex = (currentEventIndex - 1 + events.length) % events.length;
    res.json(events[currentEventIndex]);
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
