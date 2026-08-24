<%-- 
    Document   : home
    Created on : 23 Aug 2026, 11:35:43
    Author     : Obakeng Phale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.citychurch.citychurchnotificationsystem.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>City Church Home</title>
        <!-- External CSS -->
        <link rel="stylesheet" href="resources/css/styles.css">
        <!-- External JavaScript for live notifications -->
        <script src="resources/js/websocket-client.js"></script>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <div class="container dashboard">
            <h2>Welcome, <%= user.getUsername() %></h2>
            <p>You are logged in.</p>
            <hr>
            <h3>Live Notifications</h3>
            <div id="notifications">
                <p>Waiting for notifications...</p>
            </div>
            <hr>
            <h3>Recent Announcements</h3>
            <p>No announcements at the moment.</p>
            <br>
            <a href="notification.jsp">View Church Leader Notifications</a>
        </div>
    </body>
</html>