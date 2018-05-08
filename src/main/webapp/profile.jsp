<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="styles/main.css">
<%@ include file="/includes/header.html" %>
</head>
<body>
	<%@ include file="/includes/topnav.jsp" %>
	<div class="content">
		<h1>My Profile</h1>
		<div class="center-content">
			<label>Email:</label> <br />
			<span>${user.email}</span> <br />
			<label>First Name:</label> <br />
			<span>${user.firstName}</span> <br />
			<label>Last Name:</label> <br />
			<span>${user.lastName}</span><br />
			<label>Notifications:</label> <br />
			<span>${user.hasNotifications}</span><br />
        	<input type="hidden" name="action" value="editProfile">
	        <a href="editprofile.jsp"><input class="gray-flat-button" type="submit" value="Edit Profile" class="margin_left"></a>
		</div>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>