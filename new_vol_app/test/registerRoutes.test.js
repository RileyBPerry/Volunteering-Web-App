// test/registerRoutes.test.js
const request = require('supertest');
const express = require('express');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');
const sinon = require('sinon');
const db = require('../db/register_db');
const registerRoutes = require('../routes/register');

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use('/register', registerRoutes);

describe('POST /register', () => {
    let dbQueryStub;

    beforeEach(() => {
        dbQueryStub = sinon.stub(db, 'query');
    });

    afterEach(() => {
        dbQueryStub.restore();
    });

    it('should return 400 if username is missing', async () => {
        const response = await request(app)
            .post('/register')
            .send({ username: '', password: 'password123' });

        expect(response.status).toBe(400);
        expect(response.text).toBe('Email and password are required.');
    });

    it('should return 400 if password is missing', async () => {
        const response = await request(app)
            .post('/register')
            .send({ username: 'test@example.com', password: '' });

        expect(response.status).toBe(400);
        expect(response.text).toBe('Email and password are required.');
    });

    it('should return 500 if there is a database error during SELECT query', async () => {
        dbQueryStub.callsFake((sql, values, callback) => {
            if (sql.includes('SELECT * FROM usercredentials')) {
                callback(new Error('Database error'), null);
            } else {
                callback(null);
            }
        });

        const response = await request(app)
            .post('/register')
            .send({ username: 'test@example.com', password: 'password123' });

        expect(response.status).toBe(500);
        expect(response.text).toBe('Internal Server Error');
    });

    it('should return 500 if there is a database error during INSERT query', async () => {
        dbQueryStub.callsFake((sql, values, callback) => {
            if (sql.includes('SELECT * FROM usercredentials')) {
                callback(null, []);
            } else if (sql.includes('INSERT INTO usercredentials')) {
                callback(new Error('Database error'), null);
            }
        });

        const response = await request(app)
            .post('/register')
            .send({ username: 'test@example.com', password: 'password123' });

        expect(response.status).toBe(500);
        expect(response.text).toBe('Internal Server Error');
    });

    it('should return 400 if email already exists', async () => {
        dbQueryStub.callsFake((sql, values, callback) => {
            if (sql.includes('SELECT * FROM usercredentials')) {
                callback(null, [{ username: 'test@example.com' }]);
            } else {
                callback(null);
            }
        });

        const response = await request(app)
            .post('/register')
            .send({ username: 'test@example.com', password: 'password123' });

        expect(response.status).toBe(400);
        expect(response.text).toBe('Email already exists. Please use a different email.');
    });

    it('should return 200 and success message if registration is successful', async () => {
        dbQueryStub.callsFake((sql, values, callback) => {
            if (sql.includes('SELECT * FROM usercredentials')) {
                callback(null, []);
            } else if (sql.includes('INSERT INTO usercredentials')) {
                callback(null);
            }
        });

        const response = await request(app)
            .post('/register')
            .send({ username: 'test@example.com', password: 'password123' });

        expect(response.status).toBe(200);
        expect(response.text).toBe('User registered successfully');
    });

    it('should return 500 if bcrypt hashing fails', async () => {
        sinon.stub(bcrypt, 'hash').callsFake((password, saltRounds, callback) => {
            callback(new Error('Bcrypt error'));
        });

        dbQueryStub.callsFake((sql, values, callback) => {
            if (sql.includes('SELECT * FROM usercredentials')) {
                callback(null, []);
            } else if (sql.includes('INSERT INTO usercredentials')) {
                callback(null);
            }
        });

        const response = await request(app)
            .post('/register')
            .send({ username: 'test@example.com', password: 'password123' });

        expect(response.status).toBe(500);
        expect(response.text).toBe('Internal Server Error');
        bcrypt.hash.restore();
    });
});
