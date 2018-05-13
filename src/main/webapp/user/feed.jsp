<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="com.feedz.models.Feed"%>
<%@page import="com.feedz.models.FeedItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedz</title>
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
		<div class="main">
		<%@ include file="/includes/user/feednav.jsp" %>	
			<h1>Your Feedz</h1>
			
			
		<c:choose>
			<c:when test="${feedItems != null}">
			<table class="standard">
				<c:forEach var="feedItem" items="${feedItems}">
				<tr>
					<td>${feedItem.image}</td>
					<td><h2>${feedItem.title}</h2></td>
					<td>${feedItem.url}</td>
					<td>${feedItem.description}</td>
				</tr>
				</c:forEach>
			</table>
			</c:when>
			<c:otherwise>
				<div>Hm... looks like you don't have any feeds yet. Click  
				<a href="editfeed.jsp">Edit Feed</a>
				to get started!</div>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
		<%@ include file="/includes/footer.jsp" %>
</body>
</html>