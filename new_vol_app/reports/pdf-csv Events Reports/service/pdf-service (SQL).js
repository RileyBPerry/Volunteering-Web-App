/*
const PDFDocument = require('pdfkit');
const pool = require('../db');

async function buildPDF(dataCallback, endCallback) {
  const doc = new PDFDocument({ bufferPages: true, font: 'Courier' });

  doc.on('data', dataCallback);
  doc.on('end', endCallback);

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

  rows.forEach(event => {
    doc.fontSize(20).text(`Event Name: ${event.eventName}`);
    doc.fontSize(12).text(`Description: ${event.eventDescription}`);
    doc.text(`Organization: ${event.orgName}`);
    doc.text(`Location: ${event.location}`);
    doc.text(`Date: ${event.eventDate}`);
    doc.text(`Start Time: ${event.eventStart}`);
    doc.text(`End Time: ${event.eventEnd}`);
    doc.text(`Volunteers: ${event.volunteers}`);
    doc.text(`Number of Volunteers: ${event.numberOfVolunteers}`);
    doc.moveDown();
  });

  doc.end();
}

module.exports = { buildPDF };
*/