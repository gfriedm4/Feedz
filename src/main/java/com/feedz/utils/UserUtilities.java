package com.feedz.utils;

import com.feedz.controllers.UserController;
import com.feedz.models.User;
import org.mindrot.jbcrypt.BCrypt;

/**
 * Various utilities for registration and login
 * @author gfriedman
 */
public class UserUtilities {
    
    public boolean checkPassword(String email, String password) {
        
        UserController controller = new UserController();
        User user = controller.getUserByEmail(email);
        
        if (user == null) {
            return false;
        }
        
        return BCrypt.checkpw(password, user.getPassword());
    }
    
    public User registerUser(String email, String password, String firstName, String lastName) {
        User newUser = new User();
        
        newUser.setEmail(email);
        newUser.setPassword(BCrypt.hashpw(password, email));
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);

        UserController controller = new UserController();
        
        return controller.createUser(newUser);
    }
    
    
}
