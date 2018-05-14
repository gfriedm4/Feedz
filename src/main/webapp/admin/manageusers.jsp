<%@page import="com.feedz.utils.UserUtilities"%>
<%@page import="com.feedz.models.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Users</title>
<link rel="stylesheet" type="text/css" href="../styles/main.css">
</head>
<body>
	<%@ include file="/includes/admin/topnav.jsp" %>
	<div class="content">
		<h1>Manage Users</h1>
		<div class="content-white">
			<table class="standard">
				<tr>
					<th>User ID</th>
					<th>Last Name</th>
					<th>First Name</th>
					<th>Email</th>
					<th>Notifications</th>
					<th>Date Created</th>
					<th>Date Modified</th>
					<th>Role</th>
					<th>Number of Feeds</th>
					<th></th>
				</tr>
				
				<% List<User> userList = UserUtilities.getAllUsers(); %>
				<% for(User u : userList) {%>
				<tr>
					<td><%out.print(u.getId());%></td>
					<td><%out.print(u.getLastName());%></td>
					<td><%out.print(u.getFirstName());%></td>
					<td><%out.print(u.getEmail());%></td>
					<td><%out.print(u.isHasNotifications());%></td>
					<td><%out.print(u.getCreated());%></td>
					<td><%out.print(u.getUpdated());%></td>
					<td><%out.print(u.getRole());%></td>
					<td><%out.print(u.getFeedUsers().size());%></td>
					<td>
						<form action="UserServlet" method="POST">
							<input type="hidden" name="userId" value="<%out.print(u.getId());%>">
							<input type="hidden" name="action" value="adminRemoveUser">
							<input type="submit" value="Remove">
						</form>
					</td>
				</tr>
				<% }%>
				</table>
				<br>
		</div>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>