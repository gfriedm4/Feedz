/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.feedz.servlets;

import com.feedz.models.FeedItem;
import com.feedz.models.FeedUser;
import com.feedz.models.User;
import com.feedz.utils.FeedUtilities;
import com.feedz.utils.UserUtilities;
import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gfriedman
 */
@WebServlet(name = "FeedServlet", urlPatterns = {"/admin/FeedServlet", "/user/FeedServlet", "/FeedServlet", "/Feed", "/Feed/*"})
public class FeedServlet extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String subscribe = request.getParameter("subscribe");
        
        if (subscribe != null) {
            int feedId = Integer.parseInt(request.getParameter("feedId"));
            int userId = ((User)request.getSession().getAttribute("user")).getId();
            UserUtilities.addFeedToUser(userId, feedId);
            request.getRequestDispatcher("/user/editfeed.jsp").forward(request, response);
            return;
        }
        
        String action = request.getParameter("action");
        // If we have an id in the URL, only get that feed
        if (action != null && action.equals("showFeed")) {
            try {
                String feedId = request.getParameter("feedId");
                SyndFeed feed = FeedUtilities.getSyndFeed(Integer.parseInt(feedId));
        
                List<FeedItem> items = new ArrayList<>();
                response.setContentType("text/html;charset=UTF-8");

                // Loop throug feed and create FeedItems, add to request attribute
                for (Iterator<SyndEntry> entryIter = feed.getEntries().iterator(); entryIter.hasNext();) {
                    SyndEntry syndEntry = (SyndEntry) entryIter.next();

                    FeedItem item = new FeedItem();
                    item.setAuthor(syndEntry.getAuthor());
                    item.setCategory(syndEntry.getCategories().toString());
                    item.setComments(syndEntry.getComments());
                    item.setDescription(syndEntry.getDescription().getValue());
                    item.setLink(syndEntry.getLink());
                    item.setTitle(syndEntry.getTitle());

                    items.add(item);
                }

                request.setAttribute("feedItems", items);
                if (request.getRequestURI().contains("user")) {
                    request.getRequestDispatcher("/user/feed.jsp").forward(request, response);
                }
                else {
                    request.getRequestDispatcher("/feed.jsp").forward(request, response);
                }
                return;
            } catch (NumberFormatException e) {
            
                String test = "";
            }
        }
        
        // If there is no valid parameter, get all of the logged in user's feeds
        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("feedItems", FeedUtilities.getUserFeed(user.getId()));
        request.getRequestDispatcher("/feed.jsp").forward(request, response);        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
