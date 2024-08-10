const createCsvWriter = require('csv-writer').createObjectCsvWriter;
const path = require('path');

function buildCSV(filePath) {
  const csvWriter = createCsvWriter({
    path: filePath,
    header: [
      {id: 'name', title: 'Name'},
      {id: 'age', title: 'Age'},
      {id: 'address', title: 'Address'}
    ]
  });

  const data = [
    {name: 'John Doe', age: 30, address: '123 Main St'},
    {name: 'Jane Doe', age: 28, address: '456 Elm St'},
    {name: 'Jim Smith', age: 35, address: '789 Oak St'}
  ];

  return csvWriter.writeRecords(data);
}

module.exports = { buildCSV };
