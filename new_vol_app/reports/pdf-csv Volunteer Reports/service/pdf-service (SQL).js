/*

// service/pdf-service.js
const PDFDocument = require('pdfkit');
const pool = require('./db');

async function buildPDF(dataCallback, endCallback) {
  const doc = new PDFDocument({ bufferPages: true, font: 'Courier' });

  doc.on('data', dataCallback);
  doc.on('end', endCallback);

  // Report title
  doc.fontSize(20).text(`Volunteer Report`, { align: 'center' }).moveDown(2);

  // Table Header
  const header = ['Volunteer ID', 'Full Name', 'Event Names', 'Total Hours Worked', 'Average Performance Score'];
  const columnWidths = [80, 120, 200, 150, 150];

  // Draw table headers
  header.forEach((text, index) => {
    doc.fontSize(12).text(text, {
      continued: index < header.length - 1,
      width: columnWidths[index],
      align: index === header.length - 1 ? 'right' : 'center'
    });
  });

  doc.moveDown();

  // Fetch data from MySQL
  try {
    const [rows] = await pool.query(`
      SELECT volunteerId, fullName, eventNames, totalHoursWorked, averagePerformanceScore
      FROM volunteer_report
    `);

    rows.forEach(row => {
      doc.fontSize(10);

      // Full Name and ID on the first line
      doc.text(`${row.fullName}, ${row.volunteerId}`, {
        width: columnWidths[0] + columnWidths[1] + columnWidths[2],
        continued: false
      });

      // Event Name, Total Hours, and Performance Score on the second line
      doc.text(`${row.eventNames}, Total Hours: ${row.totalHoursWorked}, ${row.averagePerformanceScore.toFixed(2)}`, {
        width: columnWidths[3] + columnWidths[4],
        align: 'left'
      });

      // Move down to the next row
      doc.moveDown();
    });
  } catch (err) {
    console.error('Error fetching data from MySQL:', err);
  }

  doc.end();
}

module.exports = { buildPDF };
*/