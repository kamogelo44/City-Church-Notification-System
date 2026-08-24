<%-- 
    Document   : success
    Created on : 24 Aug 2026, 15:22:05
    Author     : Obakeng Phale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
        <link rel="stylesheet" href="resources/css/styles.css">
    </head>
    <body>
        <div class="container">
            <h2>Success!</h2>
            <p><%= request.getAttribute("message") != null ? request.getAttribute("message") : "Operation completed successfully." %></p>
            <%
                // Determine the correct link based on where the user came from
                String redirectLink = "login.jsp";
                String linkText = "Go to Login";

                Object msg = request.getAttribute("message");
                if (msg != null) {
                    if (msg.toString().contains("Login")) {
                        redirectLink = "home.jsp";
                        linkText = "Go to Home";
                    } else if (msg.toString().contains("Registration")) {
                        redirectLink = "login.jsp";
                        linkText = "Go to Login";
                    } else if (msg.toString().contains("broadcasted")) {
                        redirectLink = "home.jsp";
                        linkText = "Back to Home";
                    }
                }
            %>
            <p><a href="<%= redirectLink %>"><%= linkText %></a></p>
        </div>
    </body>
</html>