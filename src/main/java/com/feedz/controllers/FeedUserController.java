package com.feedz.controllers;

import com.feedz.utils.HibernateConnector;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.feedz.models.FeedUser;
import org.hibernate.HibernateException;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Gregory
 */
public class FeedUserController {
    public static FeedUser createFeedUser(FeedUser feedUser) {
        Session session = HibernateConnector.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            
            session.persist(feedUser);
            
            transaction.commit();
            session.close();
            return feedUser;
        }
        catch (HibernateException e) {
            if (transaction != null) {
                transaction.rollback();
            }           
        }
        finally {
            session.close();
        }
        return null;
    }
    
    public static boolean deleteFeedUser(Integer id) {
        Session session = HibernateConnector.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            
            FeedUser feedUser = session.get(FeedUser.class, id);
            
            if (feedUser != null) {
                session.delete(feedUser);
            }
            else {
                return false;
            }
            
            transaction.commit();
            session.close();
            return true;
        }
        catch (HibernateException e) {
            if (transaction != null) {
                transaction.rollback();
            }           
        }
        finally {
            session.close();
        }
        return false;
    }
}
