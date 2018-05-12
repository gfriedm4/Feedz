<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Feed</title>
<link rel="stylesheet" type="text/css" href="../styles/main.css">
</head>
<body>
	<!-- Get user-role navbar -->
	<c:choose>
		<c:when test="${user.role == 1}">
			<%@ include file="/includes/admin/topnav.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="/includes/user/topnav.jsp"%>
		</c:otherwise>
	</c:choose>
	
	<!-- Page content -->
	<div class="content">
		<h1>Edit My Feed</h1>
		<table class="standard">
				<tr>
					<th>Image</th>
					<th>Title</th>
					<th>URL</th>
					<th>Description</th>
					<th>Remove?</th>
				</tr>
				
				<c:forEach var="feedItem" items="${feedItems}">
				<tr>
					<td>${feedItem.image}</td>
					<td>${feedItem.title}</td>
					<td>${feedItem.url}</td>
					<td>${feedItem.description}</td>
					<td>
						<form action="" method="POST">
							<input type="hidden" name="removeFeed" value="${feedItem.id}">
							<input type="submit" value="Remove">
						</form>
				</tr>
				</c:forEach>
		</table>

		<br>
		<div class="center">
			<a href="subscribe.jsp"><input class="green-flat-button" type="submit" value="Add New Feed"></a>   		
			<a href="feed.jsp"><input class="gray-flat-button" type="submit" value="Cancel"></a>   		
		</div>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>