/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.citychurch.citychurchnotificationsystem;

import jakarta.annotation.Resource;
import jakarta.inject.Inject;
import jakarta.jms.ConnectionFactory;
import jakarta.jms.JMSContext;
import jakarta.jms.Queue;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Obakeng Phale
 */
@WebServlet(name = "NotificationServlet", urlPatterns = {"/sendNotification"})
public class NotificationServlet extends HttpServlet {

    @Resource(mappedName = "jms/__defaultConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(mappedName = "jms/ChurchNotificationQueue")
    private Queue queue;

    @Inject
    private JMSContext jmsContext;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // 10.1 Role-Based Access Control
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"LEADER".equalsIgnoreCase(user.getRole())) {
            out.println("<h3>Error: Access denied. Only Church Leaders can send notifications.</h3>");
            return;
        }

        String message = request.getParameter("notificationMessage");
        if (message == null || message.trim().isEmpty()) {
            out.println("<h3>Error: Message cannot be empty.</h3>");
            return;
        }

        // Send message to JMS Queue
        jmsContext.createProducer().send(queue, message);
        
        out.println("<h3>Notification sent successfully!</h3>");
        out.println("<a href='home.jsp'>Back to Home</a>");
    }
}