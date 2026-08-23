<%-- 
    Document   : notification
    Created on : 23 Aug 2026, 12:48:40
    Author     : Obakeng Phale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.citychurch.citychurchnotificationsystem.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Church Leader Notifications</title>
        <!-- External CSS -->
        <link rel="stylesheet" href="resources/css/styles.css">
    </head>
    <body>
        <%
            // Role-Based Access Control (Referenced from OWASP)
            User user = (User) session.getAttribute("user");
            if (user == null || !"LEADER".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <div class="container dashboard">
            <h2>Church Leader Dashboard</h2>
            <p>Welcome, Leader <strong><%= user.getUsername() %></strong>.</p>
            <hr>
            <h3>Create a Notification</h3>
            <form action="sendNotification" method="POST">
                <textarea name="notificationMessage" rows="4" required placeholder="Write your message here..."></textarea>
                <button type="submit">Send Notification</button>
            </form>
            <br>
            <a href="home.jsp">Back to Home</a>
        </div>
    </body>
</html>
