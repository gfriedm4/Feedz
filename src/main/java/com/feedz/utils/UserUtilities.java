package com.feedz.utils;

import com.feedz.controllers.FeedController;
import com.feedz.controllers.FeedUserController;
import com.feedz.controllers.UserController;
import com.feedz.models.User;
import com.feedz.models.Feed;
import com.feedz.models.FeedUser;

import java.util.List;
import java.util.Set;
import org.mindrot.jbcrypt.BCrypt;

/**
 * Various utilities for registration and login
 * @author gfriedman
 */
public class UserUtilities {
    
    public static boolean checkPassword(String email, String password) {
        User user = UserController.getUserByEmail(email);
        
        if (user == null) {
            return false;
        }

        return BCrypt.checkpw(password, user.getPassword());
    }
    
    public static User registerUser(String email, String password, String firstName, String lastName,
    		boolean hasNotifications, Integer role) {
        User newUser = new User();
        
        newUser.setEmail(email);
        newUser.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setHasNotifications(hasNotifications);
        newUser.setRole(role);
        
        return UserController.createUser(newUser);
    }
    
    public static void addFeedToUser(Integer userId, Integer feedId) {
        User user = UserController.getUserById(userId);
        Feed feed = FeedController.getFeed(feedId);
        
        Set<FeedUser> feedUsers = user.getFeedUsers();
        
        for (FeedUser feedUser : feedUsers) {
            if (feedUser.getFeed().getId().equals(feedId)) {
                return;
            }
        }
        
        FeedUser feedUser = new FeedUser();
        feedUser.setFeed(feed);
        feedUser.setUser(user);
        
        FeedUserController.createFeedUser(feedUser);
    }
    
    public static void removeFeedFromUser(Integer userId, Integer feedId) {
        User user = UserController.getUserById(userId);
        Feed feed = FeedController.getFeed(feedId);
        
        Set<FeedUser> feedUsers = user.getFeedUsers();
        
        for (FeedUser feedUser : feedUsers) {
            if (feedUser.getFeed().getId().equals(feedId)) {
                FeedUserController.deleteFeedUser(feedUser.getId());
                return;
            }
        }
    }
    
    public static User updateUser(User user) {
    		String unhashed = user.getPassword();
    		user.setPassword(BCrypt.hashpw(unhashed, BCrypt.gensalt()));
    		
    		return UserController.updateUser(user);
    }
    
    public static List<User> getAllUsers() {
    		return UserController.listUsers();
    }
    
}
