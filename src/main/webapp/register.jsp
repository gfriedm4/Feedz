<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="styles/main.css">
<%@ include file="/includes/header.html" %>
</head>
<body>
	<div class="content">
		<h1>Register</h1>
		<div class="content-white">
		<form action="UserServlet" method="post">
			<input class="form-input" type="hidden" name="action" value="register">
	        <label class="form-label">Email</label>
	        <input class="form-input" type="email" name="email" value="" required><br>
	        <label class="form-label">Password</label>
	        <input class="form-input" type="password" name="password" value="" required><br>
	        <label class="form-label">Confirm Password</label>
	        <input class="form-input" type="password" name="confirmPassword" required><br>
	       	<label class="form-label">First Name</label>
	        <input class="form-input" type="text" name="firstName" value="" required><br>
	        <label class="form-label">Last Name</label>
	        <input class="form-input" type="text" name="lastName" value="" required><br>        
	        <label class="form-label">Notifications Opt-in</label>
	        <input class="checkbox" type="checkbox" name="hasNotifications" value=""><br>        
	        <label>&nbsp;</label>
	        <div class="center">
	        	<input class="green-flat-button" type="submit" value="Register" class="margin_left">
	        </div>
		</form>
		</div>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>