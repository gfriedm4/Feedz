package com.feedz.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feedz.controllers.UserController;
import com.feedz.models.User;
import com.feedz.utils.UserUtilities;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

	/**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String url = "";
		
		if(action == null) {
			// send to error page
		}
		else if(action.equals("Login")) {
			url = handleLoginAttempt(request, response);
		}
		else if(action.equals("register")) {
			url = handleUserRegistration(request, response);
		}

		request.getRequestDispatcher(url).forward(request, response);
	}
	
	protected String handleLoginAttempt(HttpServletRequest request, HttpServletResponse response){
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if(email != null && password != null) {
			boolean authenticated = UserUtilities.checkPassword(email, password);
			if(authenticated == true) {
				User user = UserController.getUserByEmail(email);
				request.getSession().setAttribute("user", user);
				return "/feed.jsp";
			}
			else {
				// incorrect password
				return "/login.jsp";
			}
		}
		else {
			// error, no email or password
			return "/login.jsp";
		}
	}

	protected String handleUserRegistration(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String notifications = request.getParameter("hasNotifications");
		boolean notificationsVal = false;
		if(notifications != null) {
			notificationsVal = true;
		}
		
		if(email != null && password != null && firstName != null && lastName != null) {
			User user = UserUtilities.registerUser(email, password, firstName, lastName, notificationsVal);
			if(user != null) {
				request.getSession().setAttribute("user", user);
				return "/feed.jsp";
			}
			else {
				// something went wrong, user couldnt be created
				return "/register.jsp";
			}
		}
		else {
			// Invalid input
			return "/register.jsp";
		}
	}
}
