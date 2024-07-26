const express = require('express');
const fs = require('fs');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
const PORT = 3002;

app.use(bodyParser.json());
app.use(express.static(path.join(__dirname)));

// Serve the HTML file when accessing the root URL
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'eventManagement.html'));
});

app.post('/submit', (req, res) => {
    const data = req.body;
    const filePath = path.join(__dirname, 'event-management-form-data.txt');

    fs.appendFile(filePath, JSON.stringify(data) + '\n', (err) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Failed to save data.');
        }
        res.send('Data saved successfully.');
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
