const express = require('express');
const pdfService = require('../service/pdf-service');
const csvService = require('../service/csv-service');
const path = require('path');
const fs = require('fs');

const router = express.Router();

// Route to generate and download PDF
router.get('/invoice', (req, res) => {
  const stream = res.writeHead(200, {
    'Content-Type': 'application/pdf',
    'Content-Disposition': 'attachment;filename=event_report.pdf', // Updated filename
  });
  pdfService.buildPDF(
    (chunk) => stream.write(chunk),
    () => stream.end()
  );
});

// Route to generate and download CSV
router.get('/report', async (req, res) => {
  const filePath = path.join(__dirname, '../reports/event_report.csv'); // Updated filename
  await csvService.buildCSV(filePath);

  res.download(filePath, 'event_report.csv', (err) => {
    if (err) {
      console.error('Error downloading the file:', err);
      res.status(500).send('Error downloading the file');
    }

    // Optional: Delete the file after download
    fs.unlink(filePath, (err) => {
      if (err) console.error('Error deleting the file:', err);
    });
  });
});

module.exports = router;
