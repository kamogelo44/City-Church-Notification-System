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
                
                // Call the public static method to broadcast via WebSocket
                NotificationWebSocket.broadcastMessage(text);

            } catch (JMSException e) {
                e.printStackTrace();
            }
        }
    }
}
