/*
// service/csv-service.js
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
const path = require('path');
const pool = require('./db');

async function buildCSV(filePath) {
  const csvWriter = createCsvWriter({
    path: filePath,
    header: [
      { id: 'name', title: 'Name' },
      { id: 'age', title: 'Age' },
      { id: 'address', title: 'Address' }
    ]
  });

  try {
    const [rows] = await pool.query('SELECT name, age, address FROM volunteers');
    await csvWriter.writeRecords(rows);
  } catch (err) {
    console.error('Error fetching data from MySQL:', err);
  }
}

module.exports = { buildCSV };

*/