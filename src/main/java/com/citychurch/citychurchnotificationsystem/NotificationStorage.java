/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.citychurch.citychurchnotificationsystem;

import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Obakeng Phale
 */

public class NotificationStorage {
    private static final List<String> history = new ArrayList<>();

    public static synchronized void addMessage(String message) {
        history.add(message);
    }

    public static synchronized List<String> getHistory() {
        return new ArrayList<>(history);
    }
}

