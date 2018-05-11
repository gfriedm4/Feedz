<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
<link rel="stylesheet" type="text/css" href="styles/main.css">
<%@ include file="/includes/header.html" %>
</head>
<body>
	<%@ include file="/includes/topnav.jsp" %>
	<div class="content">
		<h1>Edit Profile</h1>
		<div class="content-white">
		<form action="UserServlet" method="post">
			<h3>Update Profile</h3>
			<table class="invisible">
				<tr>
					<td><label class="form-label">First Name</label></td>
					<td><input class="form-input" type="text" name="firstName" value="${user.firstName}" required></td>
				</tr>
				<tr>
					<td><label class="form-label">Last Name</label></td>
					<td><input class="form-input" type="text" name="lastName" value="${user.lastName}" required></td>
				</tr>
				<tr>
					<td><label class="form-label">Email</label></td>
					<td><input class="form-input" type="email" name="email" value="${user.email}" required></td>
				</tr>
				<tr>
					<td><label class="form-label">Notifications Opt-in</label></label></td>
					<td><input class="checkbox" type="checkbox" name="hasNotifications" checked="${user.hasNotifications}"></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
			</table>
	   	    <div class="center">
	   	     	<input type="hidden" name="action" value="updateProfile"/>
	       	 	<input class="green-flat-button" type="submit" value="Update Profile" class="margin_left">
	   	    </div>
   	     </form>
   	     <br>
   	     <hr>
   	     <br>
	     <form action="UserServlet" method="post">
	     	<h3>Change Password</h3>
			<table class="invisible">
				<tr>
					<td><label class="formLabel">Old Password</label></td>
					<td><input class="form-input" type="password" name="oldPassword" required"></td>
				</tr>
				<tr>
					<td><label class="formLabel">New Password</label></td>
					<td><input class="form-input" type="password" name="newPassword" required"></td>
				</tr>
				<tr>
					<td><label class="formLabel">Confirm New Password</label></td>
					<td><input class="form-input" type="password" name="confirmNewPassword" required><br></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
			</table>
	   	    <div class="center">
	   	     	<input type="hidden" name="action" value="updatePassword"/>
	        	<input class="green-flat-button" type="submit" value="Change Password" class="margin_left">
	   	    </div>	
	     </form>
	     <br>
   	     <hr>
   	     <br>
   	     <div class="center">
	     	<a href="profile.jsp"><input class="gray-flat-button" type="submit" value="Cancel" class="margin_left"></a>
	     </div>  		
		</div>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>