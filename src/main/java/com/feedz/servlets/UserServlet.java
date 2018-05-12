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
		else if(action.equals("updateProfile")) {
			url = handleProfileUpdate(request, response);
		}
		else if(action.equals("updatePassword")) {
			url = handlePasswordUpdate(request, response);
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
			User user = UserUtilities.registerUser(email, password, firstName, lastName, notificationsVal, 0);
			if(user != null) {
				request.getSession().setAttribute("user", user);
				return "/feed.jsp";
			}
			else {
				// something went wrong, user couldnt be created
				return "/login_error.jsp";
			}
		}
		else {
			// Invalid input
			return "/login_error.jsp";
		}
	}

	protected String handleProfileUpdate(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String notifications = request.getParameter("hasNotifications");
		boolean notificationsVal = false;
		if(notifications != null) {
			notificationsVal = true;
		}
		
		if(email != null && firstName != null && lastName != null) {
			User newUser = new User();
			newUser.setEmail(email);
			newUser.setFirstName(firstName);
			newUser.setLastName(lastName);
			newUser.setHasNotifications(notificationsVal);
			
			newUser = UserUtilities.updateUser(newUser);
			
			if(newUser != null) {
				request.getSession().setAttribute("user", newUser);
				return "/profile.jsp";
			}
			else {
				// Couldnt be updated
				return "/editprofile.jsp";
			}
		}
		else {
			// invalid parameters
			return "/editprofile.jsp";
		}
	}

	protected String handlePasswordUpdate(HttpServletRequest request, HttpServletResponse response) {
		User user = (User)request.getSession().getAttribute("user");
		if(user != null) {
			String password = request.getParameter("confirmNewPassword");
			if(password != null) {
				user.setPassword(password);
				User newUser = UserUtilities.updateUser(user);
				
				if(newUser != null) {
					request.getSession().setAttribute("user", newUser);
					return "/profile.jsp";
				}
				else {
					// Something went wrong
					return "/login.jsp";
				}
			}
			else {
				// invalid parameters
				return "/editprofile.jsp";
			}
		}
		else {
			// No user, can't update without a user
			return "/login.jsp";
		}
	}
}

