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
			<% if(request.getAttribute("message") != null) { %>
                	<p style="text-align: center; color: red; margin: auto;">${message}</p>
            <% } %>

			<input class="form-input" type="hidden" name="action" value="register">
	        <label class="form-label">Email</label>
	        <input class="form-input" type="email" name="email" value=""><br>
	        <label class="form-label">Password</label>
	        <input class="form-input" id="password" type="password" name="password" value=""><br>
	        <label class="form-label">Confirm Password</label>
	        <input class="form-input" type="password" name="confirmPassword"><br>
	       	<label class="form-label">First Name</label>
	        <input class="form-input" type="text" name="firstName" value=""><br>
	        <label class="form-label">Last Name</label>
	        <input class="form-input" type="text" name="lastName" value=""><br>        
	        <label class="form-label">Notifications Opt-in</label>
	        <input class="checkbox" type="checkbox" name="hasNotifications" value=""><br>        
	        <label>&nbsp;</label>
	        <div class="center">
	        	<input class="green-flat-button" type="submit" value="Register" class="margin_left">
	        </div>
		</form>
		</div>
	</div>
</body>
</html>