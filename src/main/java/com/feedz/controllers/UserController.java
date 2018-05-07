package com.feedz.controllers;

import com.feedz.models.User;
import com.feedz.utils.HibernateConnector;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 * Wrapper controller around the CRUD operations of a User
 * @author gfriedman
 */
public class UserController {
    
    /**
     * Create a User
     * @param user
     * @return the User that was created
     */
    public User createUser(User user) {
        Session session = HibernateConnector.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            
            session.persist(user);
            
            transaction.commit();
            session.close();
            return user;
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
     * Get a User
     * @param id
     * @return the User with the given id
     */
    public User getUserById(Integer id) {
        Session session = HibernateConnector.getSessionFactory().openSession();

        try {
            User user = session.get(User.class, id);
            session.close();
            
            if (user != null) {
                return user;
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
     * Get a User
     * @param id
     * @return the User with the given id
     */
    public User getUserByEmail(String email) {
        Session session = HibernateConnector.getSessionFactory().openSession();

        try {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<User> cq = builder.createQuery(User.class);
            Root<User> root = cq.from(User.class);
            cq.select(root);
            Predicate predicate = builder.equal(root.get("email"), email);
            cq.where(predicate);
            Query<User> q = session.createQuery(cq);
            List<User> users = q.getResultList();
            session.close();
            
            if (!users.isEmpty()) {
                return users.get(0);
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
     * Update a User
     * @param user
     * @return the updated User
     */
    public User updateUser(User user) {
        Session session = HibernateConnector.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            
            session.merge(user);
            
            transaction.commit();
            session.close();
            return user;
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
     * Delete a User
     * @param id
     * @return if User deletion was successful
     */
    public boolean deleteUser(Integer id) {
        Session session = HibernateConnector.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            
            User user = session.get(User.class, id);
            
            if (user != null) {
                session.delete(user);
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
     * List all Users
     * @return list of all Users
     */
    public List<User> listUsers() {
        Session session = HibernateConnector.getSessionFactory().openSession();
        
        try {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<User> query = builder.createQuery(User.class);
            
            List<User> users = session.createQuery(query).getResultList();
            
            session.close();
            return users;
        }
        catch (HibernateException e) {
                    
        }
        finally {
            session.close();
        }
        return null;
    }

}
