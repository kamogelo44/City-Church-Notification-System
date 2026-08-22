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
        <style>
            body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; }
            form { display: inline-block; text-align: left; }
        </style>
    </head>
    <body>
        <h2>City Church Notification System</h2>
        <h3>Login</h3>
        <form action="login" method="POST">
            <label>Username:</label><br>
            <input type="text" name="username" required><br><br>
            <label>Password:</label><br>
            <input type="password" name="password" required><br><br>
            <button type="submit">Login</button>
        </form>
        <br>
        <p>Don't have an account? <a href="registration.jsp">Register here</a></p>
    </body>
</html>
