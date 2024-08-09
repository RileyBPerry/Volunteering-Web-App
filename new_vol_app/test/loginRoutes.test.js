const request = require('supertest');
const express = require('express');
const bcrypt = require('bcrypt');
const router = require('../routes/login');
const db = require('../db/login_db');

// Mock the database connection
jest.mock('../db/login_db');

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.set('view engine', 'ejs'); // Assuming EJS is used for rendering templates
app.use('/', router);

describe('Login Routes', () => {
    beforeEach(() => {
        // Reset mocks before each test to avoid side effects
        jest.clearAllMocks();
    });

    // Test the GET / route (Serve the login page)
    it('should render the login page', async () => {
        const response = await request(app).get('/');
        expect(response.statusCode).toBe(200);
        expect(response.text).toContain('<form'); // Basic check to see if the login form is present
    });

    // Test the POST / route (Login user)
    it('should return "Email not found" if the user does not exist', async () => {
        db.query.mockImplementation((query, values, callback) => {
            callback(null, []); // Simulate no user found
        });

        const response = await request(app)
            .post('/')
            .send({ username: 'nonexistentuser', password: 'password123' });
        
        expect(response.statusCode).toBe(200);
        expect(response.text).toBe('Email not found');
    });

    it('should return "Wrong Password" if the password is incorrect', async () => {
        const mockUser = { username: 'testuser', password: await bcrypt.hash('correctpassword', 10) };

        db.query.mockImplementation((query, values, callback) => {
            callback(null, [mockUser]); // Simulate user found
        });

        const response = await request(app)
            .post('/')
            .send({ username: 'testuser', password: 'wrongpassword' });

        expect(response.statusCode).toBe(200);
        expect(response.text).toBe('Wrong Password');
    });

    it('should return "login successful!" if the username and password are correct', async () => {
        const mockUser = { username: 'testuser', password: await bcrypt.hash('correctpassword', 10) };

        db.query.mockImplementation((query, values, callback) => {
            callback(null, [mockUser]); // Simulate user found
        });

        const response = await request(app)
            .post('/')
            .send({ username: 'testuser', password: 'correctpassword' });

        expect(response.statusCode).toBe(200);
        expect(response.text).toBe('login successful!');
    });

    it('should return "Error during login" if there is a database error', async () => {
        db.query.mockImplementation((query, values, callback) => {
            callback(new Error('Database error'), null); // Simulate a database error
        });

        const response = await request(app)
            .post('/')
            .send({ username: 'testuser', password: 'password123' });

        expect(response.statusCode).toBe(200);
        expect(response.text).toBe('Error during login');
    });
});
