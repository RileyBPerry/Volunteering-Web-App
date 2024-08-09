const express = require('express');
const volunteerRoutes = require('../routes/volunteer_matching'); // Importing the router

const setupApp = () => {
    const app = express();
    app.use(express.json());
    app.use('/api', volunteerRoutes); // Use the router with '/api' prefix
    return app;
};

module.exports = setupApp;
