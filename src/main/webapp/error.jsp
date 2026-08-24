<%-- 
    Document   : error
    Created on : 24 Aug 2026, 15:23:36
    Author     : Obakeng Phale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <link rel="stylesheet" href="resources/css/styles.css">
    </head>
    <body>
        <div class="container">
            <h2 style="color: #d9534f;">Error</h2>
            <p><%= request.getAttribute("message") != null ? request.getAttribute("message") : "Something went wrong." %></p>
            <p><a href="login.jsp">Back to Login</a></p>
        </div>
    </body>
</html>
