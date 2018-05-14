package com.feedz.utils;

import com.feedz.controllers.UserController;
import com.feedz.models.FeedItem;
import com.feedz.models.User;
import com.sendgrid.*;
import java.io.IOException;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gfriedman
 */
public class EmailUtilities {
    private static SendGrid client;
    private static final String FROM = "admin@feedz.com";

    static {
        // Put API Key in constructor
        client = new SendGrid("");
    }
    
    
    public static void sendFeedUpdates() {
        List<User> usersToNotify = UserController.getNotificationUsers();
        
        for (User user : usersToNotify) {
            StringBuilder message = new StringBuilder();
            
            message.append("<p>Dear ").append(user.getFirstName()).append(" ").append(user.getLastName()).append(",</p><p></p>");
            
            message.append("<p>Here are some of the latest updates to your feed!<p>");
            
            List<FeedItem> feedItems = FeedUtilities.getUserFeed(user.getId());
            
            if (feedItems.isEmpty()) {
                continue;
            }
            
            if (feedItems.size() > 5) {
                feedItems = feedItems.subList(0, 5);
            }
            
            for (FeedItem item : feedItems) {
                message.append("<a href='").append(item.getLink()).append("'><p>").append(item.getTitle()).append("</p></a>");
            }
            
            message.append("<p>Please log in if you would like to read more!</p>");
            message.append("<h4>Sincerely,</h4>");
            message.append("<h4>Feedz Team</h4>");
            
            sendEmail(user.getEmail(), "Feedz Update!", message.toString());
        }
    }
    
    public static void sendEmail(String destination, String subject, String message) {
        Request request = new Request();
        Email to = new Email(destination);
        Email from = new Email(FROM);
        Content content = new Content("text/html", message);
        Mail mail = new Mail(from, subject, to, content);
        
        try {
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.setBody(mail.build());
            Response response = client.api(request);
        } catch (IOException e) {
           
        }
    }
    
}
