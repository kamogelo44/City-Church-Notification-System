<%-- 
    Document   : login
    Created on : 22 Aug 2026, 11:31:09
    Author     : Obakeng Phale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>City Church Login</title>
        <!-- External CSS -->
        <link rel="stylesheet" href="resources/css/styles.css">
    </head>
    <body>
        <div class="container">
            <h2>City Church Notification System</h2>
            <form action="login" method="POST">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">Login</button>
            </form>
            <p>Don't have an account? <a href="registration.jsp">Register here</a></p>
        </div>
    </body>
</html>
