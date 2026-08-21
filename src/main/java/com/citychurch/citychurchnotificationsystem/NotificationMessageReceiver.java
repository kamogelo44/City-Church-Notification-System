/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.citychurch.citychurchnotificationsystem;

import jakarta.ejb.MessageDriven;
import jakarta.jms.JMSException;
import jakarta.jms.Message;
import jakarta.jms.MessageListener;
import jakarta.jms.TextMessage;
import jakarta.websocket.Session;
import java.util.Set;
/**
 *
 * @author Obakeng Phale
 */
@MessageDriven(mappedName = "jms/ChurchNotificationQueue")
public class NotificationMessageReceiver implements MessageListener {

    @Override
    public void onMessage(Message message) {
        if (message instanceof TextMessage) {
            try {
                TextMessage textMessage = (TextMessage) message;
                String text = textMessage.getText();
                System.out.println("Received notification from JMS: " + text);

                // Broadcast to all connected WebSocket clients.
                // We use any currently open session to access the set of open sessions.
                Set<Session> openSessions = Session.class.getDeclaredMethods().length > 0 
                        ? null : null; // Placeholder, will fix after design check
                
                // Since NotificationWebSocket has no current session, we need a workaround.
                // For now, we just log it and the WebSocket will handle pushing later.
                // The actual broadcast logic needs to be integrated with a session holder.

            } catch (JMSException e) {
                e.printStackTrace();
            }
        }
    }
}
