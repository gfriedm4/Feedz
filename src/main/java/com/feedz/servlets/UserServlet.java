package com.feedz.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feedz.controllers.FeedUserController;
import com.feedz.controllers.UserController;
import com.feedz.models.User;
import com.feedz.utils.UserUtilities;
import java.util.Date;

@WebServlet({"/user/UserServlet", "/admin/UserServlet"})
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
		else if(action.equals("adminLogin")) {
			url = handleAdminLogin(request, response);
		}
		else if(action.equals("adminRemoveUser")) {
			url = handleAdminRemoveUser(request, response);
		}
		else if(action.equals("subscribeToFeed")) {
			url = handleSubscribeToFeed(request, response);
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
				return "/user/feed.jsp";
			}
			else {
				// incorrect password
				request.setAttribute("message", "Incorrect email/password combo...");
				return "/user/login.jsp";
			}
		}
		else {
			// error, no email or password
			request.setAttribute("message", "Invalid input parameters, try again...");
			return "/user/login.jsp";
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
				return "/user/feed.jsp";
			}
			else {
				// something went wrong, user couldnt be created
				return "/user/login_error.jsp";
			}
		}
		else {
			// Invalid input
			return "/user/login_error.jsp";
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
                    User user = (User) request.getSession().getAttribute("user");
                    user.setEmail(email);
                    user.setFirstName(firstName);
                    user.setLastName(lastName);
                    user.setHasNotifications(notificationsVal);
                    String path = request.getRequestURL().toString();
                    if(path.contains("admin")){
                        user.setRole(1);
                    }
                    else {
                        user.setRole(0);
                    }
                       
                    user.setUpdated(new Date());
                    user = UserController.updateUser(user);

                    if(user != null) {
                        request.getSession().setAttribute("user", user);
                        return "/user/profile.jsp";
                    }
                    else {
                        // Couldnt be updated
                        request.setAttribute("message", "User profile could not be updated.  If problem persists, contact your admin.");
                        return "/user/editprofile.jsp";
                    }
		}
		else {
                    // invalid parameters
                    request.setAttribute("message", "Invalid parameters, try again...");
                    return "/user/editprofile.jsp";
		}
	}

	protected String handlePasswordUpdate(HttpServletRequest request, HttpServletResponse response) {
		User user = (User)request.getSession().getAttribute("user");
		if(user != null) {
			String password = request.getParameter("confirmNewPassword");
			if(password != null) {
				user.setPassword(password);
                                user.setUpdated(new Date());
				User updatedUser = UserUtilities.updateUser(user);
				
				if(updatedUser != null) {
					request.getSession().setAttribute("user", updatedUser);
					return "/user/profile.jsp";
				}
				else {
					// Something went wrong
					request.setAttribute("message", "Couldn't update password.  Re-log in and try again.");
					return "/user/login.jsp";
				}
			}
			else {
				// invalid parameters
				request.setAttribute("message", "Invalid parameters, try updating your password again.");
				return "/user/editprofile.jsp";
			}
		}
		else {
			// No user, can't update without a user
			request.setAttribute("message", "Could not verify the user. Re-log in and try again.");
			return "/user/login.jsp";
		}
	}

	protected String handleAdminLogin(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if(email != null && password != null) {
			boolean authenticated = UserUtilities.checkPassword(email, password);
			if(authenticated == true) {
				User user = UserController.getUserByEmail(email);
				if(User.ROLES.get(user.getRole()).equals("admin")) {
					request.getSession().setAttribute("user", user);
					
					List<User> users = UserUtilities.getAllUsers();
					request.getSession().setAttribute("users", users);
					return "/admin/manageusers.jsp";
				}
				else {
					// Not an admin
					request.setAttribute("message", "Your account is not an admin.  Try loggin in the using the normal user login");
					return "/user/login.jsp";			
				}
			}
			else {
				// incorrect password
				return "/admin/login_error.jsp";
			}
		}
		else {
			// error, no email or password
			request.setAttribute("message", "Invalid parameters, try again...");
			return "/admin/login.jsp";
		}
	}
	
	protected String handleAdminRemoveUser(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		
		if(userId != null) {
			Integer userIdInt = Integer.parseInt(userId);
			UserController.deleteUser(userIdInt);
			List<User> users = UserUtilities.getAllUsers();
			request.getSession().setAttribute("users", users);
			return "/admin/manageusers.jsp";
		}
		else {
			// Can't delete without an id
			return "/admin/manageusers.jsp";
		}
	}
	
	 protected String handleSubscribeToFeed(HttpServletRequest request, HttpServletResponse response) {
	    	User user = (User)request.getSession().getAttribute("user");
			String feedId = request.getParameter("feedId");
	    	
			if(user != null && feedId != null) {
				Integer userIdInt = user.getId();
				Integer feedIdInt = Integer.parseInt(feedId);
				
				UserUtilities.addFeedToUser(userIdInt, feedIdInt);
				
				User updatedUser = UserController.getUserById(userIdInt);
				request.getSession().setAttribute("user", updatedUser);
			
				return "/user/subscribe.jsp";
			}
			else {
				// invalid parameters
				return "/user/subscribe.jsp";
			}
		}
}

