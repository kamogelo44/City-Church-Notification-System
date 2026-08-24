<%-- 
    Document   : home
    Created on : 23 Aug 2026, 11:35:43
    Author     : Obakeng Phale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.citychurch.citychurchnotificationsystem.User" %>
<%
    // Check if user is logged in before anything else
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>City Church Home</title>
        <!-- External CSS -->
        <link rel="stylesheet" href="resources/css/styles.css">
        <!-- External JS -->
        <script src="resources/js/websocket-client.js"></script>
    </head>
    <body>
        <div class="container dashboard">
            <h2>Welcome, <%= user.getUsername() %></h2>
            <p>You are logged in.</p>
            <hr>
            
            <!-- Unified Notifications Section -->
            <h3>Notifications</h3>
            <div id="notification-area">
                <!-- New notifications will appear here instantly -->
            </div>
            
            <hr>
            <a href="notification.jsp">View Church Leader Notifications</a>
        </div>
    </body>
</html>