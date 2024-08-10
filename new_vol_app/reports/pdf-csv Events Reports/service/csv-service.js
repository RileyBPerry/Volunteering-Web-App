const createCsvWriter = require('csv-writer').createObjectCsvWriter;
const path = require('path');

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

  await csvWriter.writeRecords(data);
}

module.exports = { buildCSV };
