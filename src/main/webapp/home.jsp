<%-- 
    Document   : home
    Created on : 23 Aug 2026, 11:35:43
    Author     : Obakeng Phale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.citychurch.citychurchnotificationsystem.User" %>
<%@page import="com.citychurch.citychurchnotificationsystem.NotificationStorage" %>
<%
    // Authentication security check
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
        <link rel="stylesheet" href="resources/css/styles.css">
        <script src="resources/js/websocket-client.js"></script>
    </head>
    <body>
        <div class="container dashboard">
            <h2>Welcome, <%= user.getUsername() %></h2>
            <p>You are logged in.</p>
            <hr>
            
            <h3>Notifications</h3>
            <div id="notifications">
                <%-- Render message history on page load --%>
                <% for (String msg : NotificationStorage.getHistory()) { %>
                    <p><%= msg %></p>
                <% } %>
            </div>
            
            <hr>
            <a href="notification.jsp">View Church Leader Notifications</a>
        </div>
    </body>
</html>

