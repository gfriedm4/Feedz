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
					<th>Number of Feeds</th>
					<th>Remove?</th>
				</tr>
				
				<c:forEach var="userItem" items="${users}">
				<tr>
					<td>${user.id}</td>
					<td>${user.lastName}</td>
					<td>${user.firstName}</td>
					<td>${user.email}</td>
					<td>${user.hasNotifications}</td>
					<td>${user.created}</td>
					<td>${user.updated}</td>
					<td><c:out value ="fn:length(feedItem.getFeedUsers)"/></td>
					<td>
						<form action="UserServlet" method="POST">
							<input type="hidden" name="userId" value="${user.id}">
							<input type="hidden" name="action" value="adminRemoveUser">
							<input type="submit" value="Remove">
						</form>
					</td>
				</tr>
				</c:forEach>
				</table>
				<br>
		</div>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>