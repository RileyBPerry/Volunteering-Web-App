document.addEventListener('DOMContentLoaded', () => {
    // Fetch history data from the backend
    fetch('/api/history/history')
        .then(response => response.json())
        .then(data => {
            const history = data.history; // Access the history array
            const tbody = document.querySelector('tbody');
            history.forEach(entry => { // Iterate over the history array
                const tr = document.createElement('tr');

                const eventNameTd = document.createElement('td');
                eventNameTd.textContent = entry.eventName || 'No event name available';
                tr.appendChild(eventNameTd);

                const dateTd = document.createElement('td');
                dateTd.textContent = entry.date || 'No date available';
                tr.appendChild(dateTd);

                const timesTd = document.createElement('td');
                timesTd.textContent = entry.times || 'No times available';
                tr.appendChild(timesTd);

                const locationTd = document.createElement('td');
                locationTd.textContent = entry.location || 'No location available';
                tr.appendChild(locationTd);

                const performanceScoreTd = document.createElement('td');
                performanceScoreTd.textContent = entry.performanceScore || 'No score available';
                tr.appendChild(performanceScoreTd);

                tbody.appendChild(tr);
            });
        })
        .catch(error => console.error('Error fetching volunteer history:', error));
});
