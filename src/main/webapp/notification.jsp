<%-- 
    Document   : notification
    Created on : 23 Aug 2026, 12:48:40
    Author     : Obakeng Phale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.citychurch.citychurchnotificationsystem.User" %>
<%@page import="com.citychurch.citychurchnotificationsystem.NotificationStorage" %>
<%
    // Role-based access control
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
        <title>Church Notification Center</title>
        <link rel="stylesheet" href="resources/css/styles.css">
        <script src="resources/js/websocket-client.js"></script>
    </head>
    <body>
        <div class="container dashboard">
            <h2>Church Notification Center</h2>
            <p>Only authorized church leaders can access this section.</p>
            <hr>
            
            <h3>Post a New Announcement</h3>
            <form id="notificationForm" method="POST">
                <textarea id="notificationMessage" name="notificationMessage" rows="4" required placeholder="Type your announcement here..."></textarea>
                <button type="submit">Publish Announcement</button>
            </form>
            
            <!-- Feedback loop -->
            <p id="formStatus"></p>
            
            <hr>
            
            <h3>Message History</h3>
            <div id="notifications">
                <%-- Render message history on page load --%>
                <% for (String msg : NotificationStorage.getHistory()) { %>
                    <p><%= msg %></p>
                <% } %>
            </div>
            
            <hr>
            <a href="home.jsp">Back to Dashboard</a>
        </div>
    </body>
</html>