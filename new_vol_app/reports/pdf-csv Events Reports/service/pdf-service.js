const PDFDocument = require('pdfkit');

function buildPDF(dataCallback, endCallback) {
  const doc = new PDFDocument({ bufferPages: true, font: 'Courier' });

  doc.on('data', dataCallback);
  doc.on('end', endCallback);

  const data = [
    {
      eventId: 1,
      eventName: 'Charity Run',
      eventDescription: 'A charity run event to raise funds.',
      orgName: 'Charity Org',
      location: 'Central Park',
      eventDate: '2024-08-10',
      eventStart: '08:00 AM',
      eventEnd: '12:00 PM',
      volunteers: 'John Doe, Jane Smith',
      numberOfVolunteers: 2
    },
    // Add more dummy data as needed
  ];

  data.forEach(event => {
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
