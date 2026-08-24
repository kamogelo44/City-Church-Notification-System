package com.citychurch.citychurchnotificationsystem;

import jakarta.annotation.Resource;
import jakarta.inject.Inject;
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

    @Resource(mappedName = "jms/ChurchNotificationQueue")
    private Queue queue;

    @Inject
    private JMSContext jmsContext;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Session authorization check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"LEADER".equalsIgnoreCase(user.getRole())) {
            request.setAttribute("message", "Access denied. Only Church Leaders can send notifications.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        String message = request.getParameter("notificationMessage");
        if (message == null || message.trim().isEmpty()) {
            out.println("<h3>Error: Message cannot be empty.</h3>");
            return;
        }

        try {
            jmsContext.createProducer().send(queue, message);
            
            request.setAttribute("message", "Notification broadcasted successfully!");
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
