/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* 
 * Connects to the WebSocket endpoint so we can receive live notifications.
 * When a leader sends a message, this script catches it and shows it on the page.
 */

window.addEventListener('DOMContentLoaded', (event) => {
    
    const socket = new WebSocket("ws://asusvivibook:8080/CityChurchNotificationSystem/notifications");

    socket.onmessage = function(event) {
        const messageDiv = document.getElementById("notifications");
        if (messageDiv) {
            const newMessage = document.createElement("p");
            newMessage.textContent = event.data;
            messageDiv.appendChild(newMessage);
        }
    };

    socket.onopen = function(event) {
        console.log("Connected to WebSocket");
    };

    socket.onclose = function(event) {
        console.log("Disconnected from WebSocket");
    };

    // AJAX form submission to prevent page reload and WebSocket disconnection
    const notificationForm = document.getElementById('notificationForm');
    if (notificationForm) {
        notificationForm.addEventListener('submit', function(e) {
            e.preventDefault(); 
            
            const textArea = document.getElementById('notificationMessage');
            const messageValue = textArea.value;

            fetch('sendNotification', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'notificationMessage=' + encodeURIComponent(messageValue)
            })
            .then(response => {
                if (response.ok) {
                    textArea.value = ''; 
                }
            })
            .catch(error => {
                console.error("Error sending message:", error);
            });
        });
    }
});


