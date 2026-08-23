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
        <!-- External CSS -->
        <link rel="stylesheet" href="resources/css/styles.css">
    </head>
    <body>
        <div class="container">
            <h2>City Church Notification System</h2>
            <form action="register" method="POST">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
                
                <select name="role">
                    <option value="MEMBER">Member</option>
                    <option value="LEADER">Church Leader</option>
                </select>
                
                <button type="submit">Register</button>
            </form>
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </body>
</html>
