<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Available Feeds</title>
<link rel="stylesheet" type="text/css" href="../styles/main.css">
</head>
<body>
	<%@ include file="/includes/admin/topnav.jsp" %>
	<div class="content">
		<h1>Manage Available Feeds</h1>
		<div class="content-white">
			<table class="standard">
				<tr>
					<th>Feed ID</th>
					<th>Title</th>
					<th>URL</th>
					<th>Description</th>
					<th>Image</th>
					<th>Date Created</th>
					<th>Date Modified</th>
					<th>Total Feed-Users</th>
					<th>Remove?</th>
				</tr>
				
				<c:forEach var="feedItem" items="${feedItems}">
				<tr>
					<td>${feedItem.id}</td>
					<td>${feedItem.title}</td>
					<td>${feedItem.url}</td>
					<td>${feedItem.description}</td>
					<td>${feedItem.image}</td>
					<td>${feedItem.created}</td>
					<td>${feedItem.updated}</td>
					<td><c:out value ="fn:length(feedItem.getFeedUsers)"/></td>
					<td>
						<form action="" method="POST">
							<input type="hidden" name="adminRemoveFeed" value="${feedItem.id}">
							<input type="submit" value="Remove">
						</form>
				</tr>
				</c:forEach>
				</table>
				<br>
			<div class="center">
		    <a href="addfeed.jsp"><input class="gray-flat-button" type="submit" value="Add a Feed"></a>
		    </div>
		</div>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>