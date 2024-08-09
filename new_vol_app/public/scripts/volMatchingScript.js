document.addEventListener('DOMContentLoaded', () => {
    const fetchVolunteer = async () => {
        try {
            const response = await fetch('/api/current-volunteer');
            const volunteer = await response.json();
            document.getElementById('volunteer-name').value = volunteer.volunteerName;
            document.getElementById('volunteer-skills').value = volunteer.volunteerSkills;
            document.getElementById('volunteer-address').value = volunteer.volunteerAddress;
            document.getElementById('volunteer-availability').value = volunteer.volunteerAvailability;
        } catch (error) {
            console.error('Error fetching volunteer:', error);
        }
    };

    const fetchEvent = async () => {
        try {
            const response = await fetch('/api/current-event');
            const event = await response.json();
            document.getElementById('event-name').value = event.eventName;
            document.getElementById('event-skills').value = event.eventSkills;
            document.getElementById('event-location').value = event.eventLocation;
            document.getElementById('event-date-and-time').value = event.eventDateAndTime;
        } catch (error) {
            console.error('Error fetching event:', error);
        }
    };

    document.getElementById('next-volunteer').addEventListener('click', async () => {
        try {
            await fetch('/api/next-volunteer');
            await fetchVolunteer();
        } catch (error) {
            console.error('Error navigating to next volunteer:', error);
        }
    });

    document.getElementById('prev-volunteer').addEventListener('click', async () => {
        try {
            await fetch('/api/previous-volunteer');
            await fetchVolunteer();
        } catch (error) {
            console.error('Error navigating to previous volunteer:', error);
        }
    });

    document.getElementById('next-event').addEventListener('click', async () => {
        try {
            await fetch('/api/next-event');
            await fetchEvent();
        } catch (error) {
            console.error('Error navigating to next event:', error);
        }
    });

    document.getElementById('prev-event').addEventListener('click', async () => {
        try {
            await fetch('/api/previous-event');
            await fetchEvent();
        } catch (error) {
            console.error('Error navigating to previous event:', error);
        }
    });

    fetchVolunteer();
    fetchEvent();
});
