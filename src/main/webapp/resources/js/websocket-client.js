/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* 
 * Connects to the WebSocket endpoint so we can receive live notifications.
 * When a leader sends a message, this script catches it and shows it on the page.
 */

var socket = new WebSocket("ws://asusvivibook:8080/CityChurchNotificationSystem/notifications");

// When we get a message from the server, add it to the notifications list
socket.onmessage = function(event) {
    var messageDiv = document.getElementById("notifications");
    var newMessage = document.createElement("p");
    newMessage.textContent = event.data;
    messageDiv.appendChild(newMessage);
};

// Just checking if the connection is working
socket.onopen = function(event) {
    console.log("WebSocket connected");
};

socket.onclose = function(event) {
    console.log("WebSocket disconnected");
};
