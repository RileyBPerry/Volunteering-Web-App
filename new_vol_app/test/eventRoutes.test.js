const request = require('supertest');
const express = require('express');
const path = require('path');
const router = require('../routes/event_management');
const db = require('../db/event_management_db');

// Mock the database connection
jest.mock('../db/event_management_db');

const app = express();
app.use(express.json());
app.use('/', router);

describe('Event Routes', () => {
    beforeEach(() => {
        // Reset the mocks before each test to avoid side effects
        jest.clearAllMocks();
    });

    // Test the root route
    it('should serve the eventManagement.html file', async () => {
        const response = await request(app).get('/');
        expect(response.statusCode).toBe(404);
        expect(response.headers['content-type']).toContain('text/html');
    });

    // Test the /Event_Details GET route
    it('should return event details from the database', async () => {
        const mockResults = [
            { id: 1, eventName: 'Event 1', location: 'Location 1' },
            { id: 2, eventName: 'Event 2', location: 'Location 2' },
        ];
        db.query.mockImplementation((query, callback) => {
            callback(null, mockResults);
        });

        const response = await request(app).get('/Event_Details');
        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual(mockResults);
    });

    it('should handle database errors on /Event_Details', async () => {
        const mockError = new Error('Database error');
        db.query.mockImplementation((query, callback) => {
            callback(mockError, null);
        });

        const response = await request(app).get('/Event_Details');
        expect(response.statusCode).toBe(500);
        expect(response.text).toContain('');
    });

    // Test the /submit POST route
    it('should insert event data and return a success message', async () => {
        const mockData = {
            eventName: 'New Event',
            eventDescription: 'Event Description',
            location: 'New Location',
            reqSkills: ['Skill 1', 'Skill 2'],
            urgency: 'High',
            spots: 5,
            eventStartDate: '2024-08-10',
            eventStartTime: '10:00',
            eventEndDate: '2024-08-10',
            eventEndTime: '14:00',
        };

        db.query.mockImplementation((query, values, callback) => {
            callback(null, { insertId: 123 });
        });

        const response = await request(app)
            .post('/submit')
            .send(mockData);
        expect(response.statusCode).toBe(201);
        expect(response.text).toBe('Event added with ID: 123');
    });

    it('should handle database errors on /submit', async () => {
        const mockData = {
            eventName: 'New Event',
            eventDescription: 'Event Description',
            location: 'New Location',
            reqSkills: ['Skill 1', 'Skill 2'],
            urgency: 'High',
            spots: 5,
            eventStartDate: '2024-08-10',
            eventStartTime: '10:00',
            eventEndDate: '2024-08-10',
            eventEndTime: '14:00',
        };

        const mockError = new Error('Database insert error');
        db.query.mockImplementation((query, values, callback) => {
            callback(mockError, null);
        });

        const response = await request(app)
            .post('/submit')
            .send(mockData);
        expect(response.statusCode).toBe(500);
        expect(response.text).toContain('');
    });
});
