/*
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
const path = require('path');
const pool = require('../db');

async function buildCSV(filePath) {
  const csvWriter = createCsvWriter({
    path: filePath,
    header: [
      {id: 'eventId', title: 'Event ID'},
      {id: 'eventName', title: 'Event Name'},
      {id: 'eventDescription', title: 'Description'},
      {id: 'orgName', title: 'Organization'},
      {id: 'location', title: 'Location'},
      {id: 'eventDate', title: 'Date'},
      {id: 'eventStart', title: 'Start Time'},
      {id: 'eventEnd', title: 'End Time'},
      {id: 'volunteers', title: 'Volunteers'},
      {id: 'numberOfVolunteers', title: 'Number of Volunteers'}
    ]
  });

  const connection = await pool.getConnection();
  const [rows] = await connection.execute(`
    SELECT
      ED.eventId,
      ED.eventName,
      ED.eventDescription,
      ED.orgName,
      ED.location,
      ED.eventDate,
      ED.eventStart,
      ED.eventEnd,
      GROUP_CONCAT(DISTINCT UP.fullName ORDER BY UP.fullName SEPARATOR ', ') AS volunteers,
      COUNT(DISTINCT VE.volunteerId) AS numberOfVolunteers
    FROM
      EventDetails ED
    LEFT JOIN
      VolunteerEvents VE ON ED.eventId = VE.eventId
    LEFT JOIN
      UserProfile UP ON VE.volunteerId = UP.userId
    GROUP BY
      ED.eventId, ED.eventName, ED.eventDescription, ED.orgName, ED.location, ED.eventDate, ED.eventStart, ED.eventEnd
    ORDER BY
      ED.eventId;
  `);
  connection.release();

  await csvWriter.writeRecords(rows);
}

module.exports = { buildCSV };
*/