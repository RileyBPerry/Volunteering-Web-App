document.addEventListener('DOMContentLoaded', () => {
    const fetchCurrentVolunteer = () => {
        fetch('/api/current-volunteer')
            .then(response => response.json())
            .then(data => {
                document.getElementById('volunteer-name').value = data.volunteerName;
                document.getElementById('volunteer-skills').value = data.volunteerSkills;
                document.getElementById('volunteer-address').value = data.volunteerAddress;
                document.getElementById('volunteer-availability').value = data.volunteerAvailability;
            });
    };

    const fetchCurrentEvent = () => {
        fetch('/api/current-event')
            .then(response => response.json())
            .then(data => {
                document.getElementById('event-name').value = data.eventName;
                document.getElementById('event-skills').value = data.eventSkills;
                document.getElementById('event-location').value = data.eventLocation;
                document.getElementById('event-date-and-time').value = data.eventDateAndTime;
            });
    };

    fetchCurrentVolunteer();
    fetchCurrentEvent();

    document.getElementById('next-volunteer').addEventListener('click', () => {
        fetch('/api/next-volunteer')
            .then(response => response.json())
            .then(data => {
                document.getElementById('volunteer-name').value = data.volunteerName;
                document.getElementById('volunteer-skills').value = data.volunteerSkills;
                document.getElementById('volunteer-address').value = data.volunteerAddress;
                document.getElementById('volunteer-availability').value = data.volunteerAvailability;
            });
    });

    document.getElementById('prev-volunteer').addEventListener('click', () => {
        fetch('/api/previous-volunteer')
            .then(response => response.json())
            .then(data => {
                document.getElementById('volunteer-name').value = data.volunteerName;
                document.getElementById('volunteer-skills').value = data.volunteerSkills;
                document.getElementById('volunteer-address').value = data.volunteerAddress;
                document.getElementById('volunteer-availability').value = data.volunteerAvailability;
            });
    });

    document.getElementById('next-event').addEventListener('click', () => {
        fetch('/api/next-event')
            .then(response => response.json())
            .then(data => {
                document.getElementById('event-name').value = data.eventName;
                document.getElementById('event-skills').value = data.eventSkills;
                document.getElementById('event-location').value = data.eventLocation;
                document.getElementById('event-date-and-time').value = data.eventDateAndTime;
            });
    });

    document.getElementById('prev-event').addEventListener('click', () => {
        fetch('/api/previous-event')
            .then(response => response.json())
            .then(data => {
                document.getElementById('event-name').value = data.eventName;
                document.getElementById('event-skills').value = data.eventSkills;
                document.getElementById('event-location').value = data.eventLocation;
                document.getElementById('event-date-and-time').value = data.eventDateAndTime;
            });
    });
});
