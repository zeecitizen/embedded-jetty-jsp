package org.eclipse.jetty.demo;

import java.util.Hashtable;

/**
 * Created by zeesh on 8/27/2016.
 * A singleton class to store Hashed Passwords in a Hashtable
 */
public class LoginUtil {
    private static Hashtable users;
    private static HashingUtil authEngine;
    private static SerializeUtil serializeEngine;

    private static LoginUtil instance = null;

    protected LoginUtil() {
        serializeEngine = new SerializeUtil();
        users = serializeEngine.readFromFile();
        if (users == null) {
            users = new Hashtable();
        }
        authEngine = new HashingUtil();
    }

    public static LoginUtil getInstance() {
        if (instance == null) {
            instance = new LoginUtil();
        }
        return instance;
    }

    public static void addUser(String userName, String password) {
        String hash = authEngine.hash(password);
        System.out.println("Storing Password:" + hash);
        users.put(userName, hash);
        serializeEngine.writeToFile(users);
    }

    public static boolean validateUser(String userName, String password) {
        try {
            if (users.containsKey(userName)) {
                String storedPassword = (String) users.get(userName);

                if (authEngine.authenticate(password, storedPassword)) {
                    return true;
                } else {
                    return false;
                }
            } else {
                System.out.println("User does not exist!");
                return false;
            }

        } catch (NullPointerException ex) {
            System.out.println("So sorry! Exception.");
            ex.printStackTrace();
            return false;
        }
    }

    public boolean userExists(String userName)
    {
        return users.containsKey(userName);
    }

}
