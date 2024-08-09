// tests/volunteerRoutes.test.js
const request = require('supertest');
const express = require('express');
const router = require('../routes/volunteer_matching');
const app = express();
const mysql = require('mysql2');

app.use(express.json());
app.use('/', router);

// Mock the database connection
jest.mock('mysql2', () => {
  const mQuery = jest.fn();
  const mPool = { query: mQuery };
  return { createPool: jest.fn(() => mPool) };
});

const pool = mysql.createPool();

describe('Volunteer Routes', () => {
  beforeEach(() => {
    jest.resetAllMocks();
  });

  // Test for GET /api/current-volunteer
  test('GET /api/current-volunteer - success', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, [{
        fullName: 'John Doe',
        skills: 'Programming',
        address1: '123 Main St',
        address2: 'Apt 4B',
        city: 'Hometown',
        state: 'CA',
        zipcode: '90001',
        Availability: 'Weekdays'
      }]);
    });

    const response = await request(app).get('/api/current-volunteer');
    expect(response.status).toBe(200);
    expect(response.body).toEqual({
      volunteerName: 'John Doe',
      volunteerSkills: 'Programming',
      volunteerAddress: '123 Main St Apt 4B, Hometown, CA 90001',
      volunteerAvailability: 'Weekdays'
    });
  });

  test('GET /api/current-volunteer - not found', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, []);
    });

    const response = await request(app).get('/api/current-volunteer');
    expect(response.status).toBe(404);
    expect(response.body).toEqual({ error: 'Volunteer not found' });
  });

  // Test for POST /api/current-volunteer
  test('POST /api/current-volunteer - success', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, []);
    });

    const response = await request(app)
      .post('/api/current-volunteer')
      .send({
        volunteerName: 'Jane Doe',
        volunteerSkills: 'Teaching',
        volunteerAddress: '456 Elm St, Apt 7C, Newtown, TX 75001',
        volunteerAvailability: 'Weekends'
      });
    expect(response.status).toBe(200);
    expect(response.body).toEqual({ status: 'success' });
  });

  test('POST /api/current-volunteer - failure', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(new Error('Database update failed'));
    });

    const response = await request(app)
      .post('/api/current-volunteer')
      .send({
        volunteerName: 'Jane Doe',
        volunteerSkills: 'Teaching',
        volunteerAddress: '456 Elm St, Apt 7C, Newtown, TX 75001',
        volunteerAvailability: 'Weekends'
      });
    expect(response.status).toBe(500);
    expect(response.body).toEqual({ error: 'Database update failed' });
  });

  // Test for GET /api/next-volunteer
  test('GET /api/next-volunteer - success', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, [{ count: 2 }]); // Mock count
    });
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, [{
        fullName: 'Alice Smith',
        skills: 'Design',
        address1: '789 Oak St',
        address2: '',
        city: 'Newcity',
        state: 'TX',
        zipcode: '75002',
        Availability: 'Weekends'
      }]);
    });

    const response = await request(app).get('/api/next-volunteer');
    expect(response.status).toBe(200);
    expect(response.body).toEqual({
      volunteerName: 'Alice Smith',
      volunteerSkills: 'Design',
      volunteerAddress: '789 Oak St , Newcity, TX 75002',
      volunteerAvailability: 'Weekends'
    });
  });

  test('GET /api/next-volunteer - error', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(new Error('Database query failed'));
    });

    const response = await request(app).get('/api/next-volunteer');
    expect(response.status).toBe(500);
    expect(response.body).toEqual({ error: 'Database query failed' });
  });

  // Test for GET /api/previous-volunteer
  test('GET /api/previous-volunteer - success', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, [{ count: 2 }]); // Mock count
    });
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, [{
        fullName: 'John Doe',
        skills: 'Programming',
        address1: '123 Main St',
        address2: 'Apt 4B',
        city: 'Hometown',
        state: 'CA',
        zipcode: '90001',
        Availability: 'Weekdays'
      }]);
    });

    const response = await request(app).get('/api/previous-volunteer');
    expect(response.status).toBe(200);
    expect(response.body).toEqual({
      volunteerName: 'John Doe',
      volunteerSkills: 'Programming',
      volunteerAddress: '123 Main St Apt 4B, Hometown, CA 90001',
      volunteerAvailability: 'Weekdays'
    });
  });

  test('GET /api/previous-volunteer - error', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(new Error('Database query failed'));
    });

    const response = await request(app).get('/api/previous-volunteer');
    expect(response.status).toBe(500);
    expect(response.body).toEqual({ error: 'Database query failed' });
  });

  // Test for GET /api/current-event
  test('GET /api/current-event - success', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, [{
        eventName: 'Community Cleanup',
        reqSkills: 'Organizing',
        location: 'Park Area',
        eventStartDate: '2024-08-01',
        eventStartTime: '08:00',
        eventEndDate: '2024-08-01',
        eventEndTime: '12:00'
      }]);
    });

    const response = await request(app).get('/api/current-event');
    expect(response.status).toBe(200);
    expect(response.body).toEqual({
      eventName: 'Community Cleanup',
      eventSkills: 'Organizing',
      eventLocation: 'Park Area',
      eventDateAndTime: '2024-08-01 08:00 to 2024-08-01 12:00'
    });
  });

  test('GET /api/current-event - not found', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, []);
    });

    const response = await request(app).get('/api/current-event');
    expect(response.status).toBe(404);
    expect(response.body).toEqual({ error: 'Event not found' });
  });

  // Test for GET /api/next-event
  test('GET /api/next-event - success', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, [{ count: 2 }]); // Mock count
    });
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, [{
        eventName: 'Fundraising Gala',
        reqSkills: 'Networking',
        location: 'City Hall',
        eventStartDate: '2024-09-01',
        eventStartTime: '18:00',
        eventEndDate: '2024-09-01',
        eventEndTime: '22:00'
      }]);
    });

    const response = await request(app).get('/api/next-event');
    expect(response.status).toBe(200);
    expect(response.body).toEqual({
      eventName: 'Fundraising Gala',
      eventSkills: 'Networking',
      eventLocation: 'City Hall',
      eventDateAndTime: '2024-09-01 18:00 to 2024-09-01 22:00'
    });
  });

  test('GET /api/next-event - error', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(new Error('Database query failed'));
    });

    const response = await request(app).get('/api/next-event');
    expect(response.status).toBe(500);
    expect(response.body).toEqual({ error: 'Database query failed' });
  });

  // Test for GET /api/previous-event
  test('GET /api/previous-event - success', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, [{ count: 2 }]); // Mock count
    });
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(null, [{
        eventName: 'Community Cleanup',
        reqSkills: 'Organizing',
        location: 'Park Area',
        eventStartDate: '2024-08-01',
        eventStartTime: '08:00',
        eventEndDate: '2024-08-01',
        eventEndTime: '12:00'
      }]);
    });

    const response = await request(app).get('/api/previous-event');
    expect(response.status).toBe(200);
    expect(response.body).toEqual({
      eventName: 'Community Cleanup',
      eventSkills: 'Organizing',
      eventLocation: 'Park Area',
      eventDateAndTime: '2024-08-01 08:00 to 2024-08-01 12:00'
    });
  });

  test('GET /api/previous-event - error', async () => {
    pool.query.mockImplementationOnce((query, params, callback) => {
      callback(new Error('Database query failed'));
    });

    const response = await request(app).get('/api/previous-event');
    expect(response.status).toBe(500);
    expect(response.body).toEqual({ error: 'Database query failed' });
  });
});
