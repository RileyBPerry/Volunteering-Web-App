const request = require('supertest');
const express = require('express');
const path = require('path');
const sinon = require('sinon');
const fs = require('fs');
const db = require('../db/vol_history_db');
const volHistoryRoutes = require('../routes/vol_history'); // Adjust path as needed

const app = express();
app.use(express.json()); // To parse JSON bodies
app.use('/', volHistoryRoutes); // Use the routes

describe('Vol History Routes', () => {
    let dbQueryStub;

    beforeEach(() => {
        dbQueryStub = sinon.stub(db, 'query');
    });

    afterEach(() => {
        dbQueryStub.restore();
    });

    describe('GET /api/history', () => {
        it('should return volunteer history data', async () => {
            // Arrange
            const mockResults = [
                { eventName: 'Event 1', hoursWorked: 10, feedback: 'Great', performanceScore: 5 },
                { eventName: 'Event 2', hoursWorked: 8, feedback: 'Good', performanceScore: 4 }
            ];
            dbQueryStub.callsFake((query, callback) => {
                callback(null, mockResults);
            });

            // Act
            const response = await request(app).get('/api/history');

            // Assert
            expect(response.status).toBe(200);
            expect(response.headers['content-type']).toMatch(/json/);
            expect(response.body).toEqual(mockResults);
        });

        it('should handle database errors', async () => {
            // Arrange
            dbQueryStub.callsFake((query, callback) => {
                callback(new Error('Database error'), null);
            });

            // Act
            const response = await request(app).get('/api/history');

            // Assert
            expect(response.status).toBe(500);
            expect(response.text).toBe('Internal Server Error');
        });
    });

    describe('GET /volunteer-history', () => {
        it('should serve the volunteer history HTML page', async () => {
            // Act
            const response = await request(app).get('/volunteer-history');

            // Assert
            expect(response.status).toBe(200);
            expect(response.headers['content-type']).toMatch(/html/);
            // Optionally, you can check if specific content exists in the HTML
            expect(response.text).toContain('<!DOCTYPE html>');
        });
    });
});
