<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="../styles/main.css">
<script src="../thirdparty/jquery-3.3.1.min.js"></script>
<script src="../thirdparty/jquery.validate.min.js"></script>
<script src="../javascript/main.js"></script>
<%@ include file="/includes/header.html" %>
</head>
<body>
	<div class="content">
		<h1>Register</h1>
		<div class="content-white">
		<form name="register" action="UserServlet" method="post">
	        <div class="center">
				<% if(request.getAttribute("message") != null) { %>
	                	<p style="text-align: center; color: red; margin: auto;">${message}</p>
	            <% } %>
            </div>
            
            <table class="invisible">
            	<tr>
            	</tr>
				<tr>
					<td><label>Email</label></td>
					<td><input class="form-input" type="email" name="email" value=""> </td>
				</tr>
				<tr>
					<td><label>Password</label></td>
					<td><input class="form-input" id="password" type="password" name="password" value=""> </td>
				</tr>
				<tr>
					<td><label>Confirm Password</label></td>
					<td><input class="form-input" type="password" name="confirmPassword"> </td>
				</tr>
				<tr>
					<td><label>First Name</label></td>
					<td><input class="form-input" type="text" name="firstName" value=""> </td>
				</tr>
				<tr>
					<td><label>Last Name</label></td>
					<td><input class="form-input" type="text" name="lastName" value=""> </td>
				</tr>
				<tr>
					<td><label>Notifications Opt-in</label></td>
					<td><input class="checkbox" type="checkbox" name="hasNotifications" value=""> </td>
				</tr>
				<tr><td>&nbsp;</td></tr>
			</table>

	       	
	        <br>        
	        <label>&nbsp;</label>
	        <div class="center">
				<input class="form-input" type="hidden" name="action" value="register">
	        	<input class="green-flat-button" type="submit" value="Register" class="margin_left">
	        </div>
		</form>
		</div>
	</div>
</body>
</html>