<%-- 
    Document   : home
    Created on : 23 Aug 2026, 11:35:43
    Author     : Obakeng Phale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.citychurch.citychurchnotificationsystem.User" %>
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
        <title>Church Dashboard</title>
        <link rel="stylesheet" href="resources/css/styles.css">
        <script src="resources/js/websocket-client.js"></script>
    </head>
    <body>
        <div class="container dashboard">
            <h2>Welcome, <%= user.getUsername() %></h2>
            <p>You are successfully logged into the City Church system.</p>
            <hr>
            <p><a href="notification.jsp">Open Notification Center</a></p>
        </div>
    </body>
</html>