<%-- 
    Document   : registration
    Created on : 22 Aug 2026, 11:40:22
    Author     : Obakeng Phale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>City Church Registration</title>
        <style>
            body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; }
            form { display: inline-block; text-align: left; }
        </style>
    </head>
    <body>
        <h2>City Church Notification System</h2>
        <h3>Registration</h3>
        <form action="register" method="POST">
            <label>Username:</label><br>
            <input type="text" name="username" required><br><br>
            <label>Password:</label><br>
            <input type="password" name="password" required><br><br>
            <label>Confirm Password:</label><br>
            <input type="password" name="confirmPassword" required><br><br>
            <button type="submit">Register</button>
        </form>
        <br>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </body>
</html>
