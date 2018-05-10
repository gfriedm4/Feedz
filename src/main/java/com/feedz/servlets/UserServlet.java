package com.feedz.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feedz.controllers.UserController;
import com.feedz.models.User;

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
			User user = UserController.getUserByEmail(email);
			if(user != null) {
				if(user.getPassword().equals(password)) {
					// Successfully logged in
					request.getSession().setAttribute("user", user);
					return "/feed.jsp";
				}
				else {
					// incorrect password
					return "/login.jsp";
				}
			}
			else {
				// No registered user with that email
				return "/register.jsp";
			}
		}
		else {
			// error, no email
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
		
		if(email != null) {
			User user = UserController.getUserByEmail(email);
			if(user != null) {
				User newUser = new User();
				newUser.setEmail(email);
				newUser.setPassword(password);
				newUser.setFirstName(firstName);
				newUser.setLastName(lastName);
				newUser.setHasNotifications(notificationsVal);

				UserController.createUser(user);
				
				request.getSession().setAttribute("user", newUser);
				return "/feed.jsp";
			}
			else {
				request.getSession().setAttribute("user", user);
				return "/feed.jsp";
			}
		}
		else {
			// Invalid input
			return "/register.jsp";
		}
	}
}
