/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.citychurch.citychurchnotificationsystem;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Obakeng Phale
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/register"})
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 1.2 Validate input data
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            out.println("<h3>Error: All fields are required.</h3>");
            return;
        }

        // 1.4 Prevent registration if username already exists
        if (UserStorage.userExists(username)) {
            out.println("<h3>Error: Username already exists.</h3>");
            return;
        }

        // 1.3 Store credentials in HashMap
        User newUser = new User(username, password, "MEMBER");
        UserStorage.addUser(username, newUser);

        // 1.5 Return success response
        out.println("<h3>Registration Successful!</h3>");
        out.println("<a href='login.jsp'>Go to Login</a>");
    }
}