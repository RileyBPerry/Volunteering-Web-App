const PDFDocument = require('pdfkit');

function buildPDF(dataCallback, endCallback) {
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

  // Table Rows
  const rowHeight = 20;
  const rows = [
    {
      volunteerId: 1,
      fullName: 'John Doe',
      eventNames: 'Charity Run, Food Drive, Blood Donation',
      totalHoursWorked: 24,
      averagePerformanceScore: 4.5,
    },
    {
      volunteerId: 2,
      fullName: 'Jane Smith',
      eventNames: 'Community Clean-Up, Food Drive',
      totalHoursWorked: 18,
      averagePerformanceScore: 4.8,
    },
    {
      volunteerId: 3,
      fullName: 'Emily Johnson',
      eventNames: 'Blood Donation, Charity Run',
      totalHoursWorked: 15,
      averagePerformanceScore: 4.7,
    },
  ];

  rows.forEach(row => {
    doc.fontSize(10);

    // Full Name and ID on the first line
    doc.text(`${row.fullName}, ${row.volunteerId}`, { 
        width: columnWidths[0] + columnWidths[1] + columnWidths[2], 
        continued: false 
    });

    // Event Name, Total Hours, and Performance Score on the second line
    doc.text(`${row.eventNames}, Total Hours: ${row.totalHoursWorked.toString()}, ${row.averagePerformanceScore.toFixed(2)}`, { 
        width: columnWidths[3] + columnWidths[4], 
        align: 'left'
    });

    // Move down to the next row
    doc.moveDown();
});



  doc.end();
}

module.exports = { buildPDF };
