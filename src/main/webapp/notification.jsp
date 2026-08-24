<%-- 
    Document   : notification
    Created on : 23 Aug 2026, 12:48:40
    Author     : Obakeng Phale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.citychurch.citychurchnotificationsystem.User" %>
<%
    // Role-based access control check
    User user = (User) session.getAttribute("user");
    if (user == null || !"LEADER".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Church Leader Notifications</title>
        <link rel="stylesheet" href="resources/css/styles.css">
        <script src="resources/js/websocket-client.js"></script>
    </head>
    <body>
        <div class="container dashboard">
            <h2>Church Leader Dashboard</h2>
            <p>Welcome, Leader <strong><%= user.getUsername() %></strong>.</p>
            <hr>
            
            <h3>Create a Notification</h3>
            <form id="notificationForm" method="POST">
                <textarea id="notificationMessage" name="notificationMessage" rows="4" required placeholder="Write your message here..."></textarea>
                <button type="submit">Send Notification</button>
            </form>
            
            <hr>
            
            <h3>Notifications</h3>
            <div id="notifications"></div>
            
            <hr>
            <a href="home.jsp">Back to Home</a>
        </div>
    </body>
</html>
