/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.citychurch.citychurchnotificationsystem;

import java.util.HashMap;
import java.util.Map;
/**
 *
 * @author Obakeng Phale
 */
public class UserStorage {
    private static final Map<String, User> userMap = new HashMap<>();

    public static void addUser(String username, User user) {
        userMap.put(username, user);
    }

    public static User getUser(String username) {
        return userMap.get(username);
    }

    public static boolean userExists(String username) {
        return userMap.containsKey(username);
    }
}
