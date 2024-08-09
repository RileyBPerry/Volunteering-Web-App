const request = require('supertest');
const express = require('express');
const bodyParser = require('body-parser');
const sinon = require('sinon');
const db = require('../db/UPM_db'); // Make sure this is the correct path
const UPMRoutes = require('../routes/UPM'); // Adjust path if needed

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use('/api', UPMRoutes); // Adjust the route if needed

describe('POST /api/upm', () => {
    let dbQueryStub;

    beforeEach(() => {
        dbQueryStub = sinon.stub(db, 'query');
    });

    afterEach(() => {
        dbQueryStub.restore();
    });

    it('should handle successful insert', async () => {
        // Arrange
        const requestBody = {
            fullname: 'John Doe',
            address1: '123 Main St',
            address2: 'Apt 4',
            city: 'Anytown',
            state: 'CA',
            zipcode: '90210',
            skills: ['JavaScript', 'Node.js'],
            preferences: 'Remote',
            availability: ['Weekends']
        };

        dbQueryStub.callsFake((query, values, callback) => {
            callback(null, { insertId: 1 });
        });

        // Act
        const response = await request(app)
            .post('/api/upm') // Adjust the endpoint if needed
            .send(requestBody);

        // Assert
        expect(response.status).toBe(200);
        expect(response.text).toBe('User profile updated successfully.');
    });

    it('should handle database error', async () => {
        // Arrange
        const requestBody = {
            fullname: 'Jane Doe',
            address1: '456 Maple St',
            address2: '',
            city: 'Sometown',
            state: 'NY',
            zipcode: '12345',
            skills: ['Python', 'Django'],
            preferences: 'On-site',
            availability: ['Weekdays']
        };

        dbQueryStub.callsFake((query, values, callback) => {
            callback(new Error('Database insert error'), null);
        });

        // Act
        const response = await request(app)
            .post('/api/upm') // Adjust the endpoint if needed
            .send(requestBody);

        // Assert
        expect(response.status).toBe(500);
        expect(response.text).toBe('Database error');
    });
});
