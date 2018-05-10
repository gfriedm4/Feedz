package com.feedz.controllers;

import java.util.List;
import com.feedz.models.Feed;
import com.feedz.utils.HibernateConnector;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.MultiIdentifierLoadAccess;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 * Wrapper controller around the CRUD operations of a Feed
 * @author gfriedman
 */
public class FeedController {
    
    /**
     * Create a Feed and store its associated metadata
     * @param feed
     * @return the Feed that was created
     */
    public static Feed createFeed(Feed feed) {
        Session session = HibernateConnector.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            
            session.persist(feed);
            
            transaction.commit();
            session.close();
            return feed;
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
    
    /**
     * Get a Feed and its associated metadata
     * @param id
     * @return the Feed with the given id
     */
    public static Feed getFeed(Integer id) {
        Session session = HibernateConnector.getSessionFactory().openSession();

        try {
            Feed feed = session.get(Feed.class, id);
            session.close();
            
            if (feed != null) {
                return feed;
            }
            else {
                return null;
            }
        }
        catch (HibernateException e) {
                      
        }
        finally {
            session.close();
        }
        return null;
    }
    
    public static List<Feed> getFeeds(List<Integer> ids) {
        Session session = HibernateConnector.getSessionFactory().openSession();

        try {
            MultiIdentifierLoadAccess<Feed> multiLoadAccess = session.byMultipleIds(Feed.class);
            List<Feed> feeds = multiLoadAccess.multiLoad(ids);
            session.close();
            
            if (feeds != null) {
                return feeds;
            }
            else {
                return null;
            }
        }
        catch (HibernateException e) {
                      
        }
        finally {
            session.close();
        }
        return null;
    }
    
    /**
     * Update a Feed and its associated metadata
     * @param feed
     * @return the updated Feed
     */
    public static Feed updateFeed(Feed feed) {
        Session session = HibernateConnector.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            
            session.merge(feed);
            
            transaction.commit();
            session.close();
            return feed;
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
    
    /**
     * Delete a Feed and its associated metadata
     * @param id
     * @return if Feed deletion was successful
     */
    public static boolean deleteFeed(Integer id) {
        Session session = HibernateConnector.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            
            Feed feed = session.get(Feed.class, id);
            
            if (feed != null) {
                session.delete(feed);
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
    
    /**
     * List all Feeds
     * @return list of all Feeds
     */
    public static List<Feed> listFeeds() {
        Session session = HibernateConnector.getSessionFactory().openSession();
        
        try {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Feed> cq = builder.createQuery(Feed.class);
            Root<Feed> root = cq.from(Feed.class);
            cq.select(root);
            
            Query<Feed> q = session.createQuery(cq);
            List<Feed> feeds = q.getResultList();
            session.close();
            
            session.close();
            return feeds;
        }
        catch (HibernateException e) {
            e.printStackTrace();
        }
        finally {
            session.close();
        }
        return null;
    }
    
}
