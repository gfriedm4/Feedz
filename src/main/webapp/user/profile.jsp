<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Profile</title>
<link rel="stylesheet" type="text/css" href="../styles/main.css">
</head>
<body>
	<!-- Get user-role navbar -->
	<c:choose>
		<c:when test="${sessionScope.user.role == 1}">
			<%@ include file="/includes/admin/topnav.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="/includes/user/topnav.jsp"%>
		</c:otherwise>
	</c:choose>
	
	<!-- Page content -->
	<div class="content">
		<h1>My Profile</h1>
		<div class="content-white">
			<table class="invisible">
				<tr>
					<td><label>First Name:</label></td>
					<td>${user.firstName}</td>
				</tr>
				<tr>
					<td><label>Last Name:</label></td>
					<td>${user.lastName}</td>
				</tr>
								<tr>
					<td><label>Email:</label></td>
					<td>${user.email}</td>
				</tr>
				<tr>
					<td><label>Notifications Opt-in:</label></td>
					<td><input class="checkbox" type="checkbox" name="hasNotifications" disabled="disabled" checked="${user.hasNotifications}"></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				</table>
			<div class="center">
			<input type="hidden" name="action" value="editProfile">
		    <a href="editprofile.jsp"><input class="gray-flat-button" type="submit" value="Edit Profile" class="margin_left"></a>
		    </div>
		</div>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>