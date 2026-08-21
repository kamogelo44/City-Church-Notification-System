/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.citychurch.citychurchnotificationsystem;

import jakarta.websocket.Session;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
/**
 *
 * @author Obakeng Phale
 */
public class WebSocketSessionHandler {
    private static final Set<Session> sessions = new CopyOnWriteArraySet<>();

    public static void addSession(Session session) {
        sessions.add(session);
    }

    public static void removeSession(Session session) {
        sessions.remove(session);
    }

    public static Set<Session> getSessions() {
        return sessions;
    }
}
