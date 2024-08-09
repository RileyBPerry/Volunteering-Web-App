const mysql = require('mysql2');
const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

// Create a connection to the database
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'your_password',
  database: 'volunteer_app'
});

// Connect to the database
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err.stack);
    return;
  }
  console.log('Connected to the database.');
});

// Function to populate EventVolunteers and VolunteerEvents
const populateTables = () => {
  // Query to populate EventVolunteers
  const insertEventVolunteers = `
    INSERT INTO EventVolunteers (eventId, volunteerId, signupDate)
    SELECT DISTINCT
        e.eventId,
        vs.volunteerId,
        CURDATE() AS signupDate
    FROM
        EventDetails e
    JOIN
        EventSkills es ON e.eventId = es.eventId
    JOIN
        VolunteerSkills vs ON es.skillId = vs.skillId
    JOIN
        AvailabilityRange ar ON vs.volunteerId = ar.volunteerId
    JOIN
        UserProfile up ON vs.volunteerId = up.userId
    WHERE
        ar.day = DAYNAME(e.eventDate)
        AND (
            ar.availStart < HOUR(e.eventEnd)
            AND ar.availEnd > HOUR(e.eventStart)
        )
    ORDER BY e.eventDate;
  `;

  // Query to populate VolunteerEvents
  const insertVolunteerEvents = `
    INSERT INTO VolunteerEvents (eventId, volunteerId, eventStatus, hoursWorked, feedback, performanceScore)
    SELECT
        ev.eventId,
        ev.volunteerId,
        'Recommended' AS eventStatus,
        NULL AS hoursWorked,
        NULL AS feedback,
        NULL AS performanceScore
    FROM
        EventVolunteers ev
    LEFT JOIN
        VolunteerEvents ve ON ev.eventId = ve.eventId AND ev.volunteerId = ve.volunteerId
    WHERE
        ve.eventId IS NULL;
  `;

  // Execute the queries
  connection.query(insertEventVolunteers, (err, results) => {
    if (err) {
      console.error('Error executing insertEventVolunteers query:', err);
      return;
    }
    console.log('EventVolunteers table populated:', results.affectedRows, 'rows inserted.');
    
    // Now populate VolunteerEvents
    connection.query(insertVolunteerEvents, (err, results) => {
      if (err) {
        console.error('Error executing insertVolunteerEvents query:', err);
        return;
      }
      console.log('VolunteerEvents table populated:', results.affectedRows, 'rows inserted.');
      
      // Close the connection
      connection.end((err) => {
        if (err) {
          console.error('Error closing the connection:', err);
          return;
        }
        console.log('Connection closed.');
      });
    });
  });
};

// Run the function to populate tables
populateTables();

// Route to handle "Apply" button click
app.post('/apply-event', (req, res) => {
  const { eventId, volunteerId } = req.body;

  if (!eventId || !volunteerId) {
    return res.status(400).json({ error: 'Event ID and Volunteer ID are required' });
  }

  const updateVolunteerEvents = `
    UPDATE VolunteerEvents
    SET eventStatus = 'Signed Up'
    WHERE eventId = ? AND volunteerId = ?;
  `;

  connection.query(updateVolunteerEvents, [eventId, volunteerId], (err, results) => {
    if (err) {
      console.error('Error executing updateVolunteerEvents query:', err);
      return res.status(500).json({ error: 'Database error' });
    }

    if (results.affectedRows > 0) {
      // Notify admin about the sign-up
      const insertNotification = `
        INSERT INTO Notifications (userId, eventId, message)
        VALUES (
          (SELECT creatorId FROM EventDetails WHERE eventId = ?),
          ?,
          CONCAT('A volunteer has signed up for ', (SELECT eventName FROM EventDetails WHERE eventId = ?))
        );
      `;

      connection.query(insertNotification, [eventId, eventId, eventId], (err) => {
        if (err) {
          console.error('Error executing insertNotification query:', err);
          return res.status(500).json({ error: 'Notification error' });
        }
        
        res.status(200).json({ message: 'Applied successfully' });
      });
    } else {
      res.status(404).json({ error: 'Event or volunteer not found' });
    }
  });
});
