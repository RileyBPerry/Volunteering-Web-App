document.addEventListener('DOMContentLoaded', () => {
    // Fetch notifications data from the backend
    fetch('/api/volunteer/notifications')
        .then(response => response.json())
        .then(data => {
            const notifications = data.notifications; // Access the notifications array
            const tbody = document.querySelector('tbody');
            notifications.forEach(notification => { // Iterate over the notifications array
                const tr = document.createElement('tr');

                const updateTd = document.createElement('td');
                updateTd.textContent = notification.update || 'No update available';
                tr.appendChild(updateTd);

                const reminderTd = document.createElement('td');
                reminderTd.textContent = notification.reminder || 'No reminder available';
                tr.appendChild(reminderTd);

                tbody.appendChild(tr);
            });
        })
        .catch(error => console.error('Error fetching notifications:', error));
});
