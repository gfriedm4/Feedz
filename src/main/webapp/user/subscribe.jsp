<%@page import="java.util.HashSet"%>
<%@page import="com.feedz.models.FeedUser"%>
<%@page import="java.util.Set"%>
<%@page import="com.feedz.models.User"%>
<%@page import="com.feedz.controllers.FeedController"%>
<%@page import="com.feedz.models.Feed"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subscribe to a Feed</title>
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
		<h1>Subscribe to a Feed</h1>
		<a href="editfeed.jsp"><input class="gray-flat-button" type="submit" value="Back to Edit Feed"></a> 
		<br> <br>
		<table class="standard">
				<tr>
					<th></th>
					<th>Title</th>
					<th>URL</th>
					<th>Description</th>
					<th></th>
				</tr>
				
				<% List<Feed> feedList = FeedController.listFeeds(); %>
				<% User user = (User) request.getSession().getAttribute("user"); %>
                                <% Set<FeedUser> feedUsers = user.getFeedUsers(); %>
                                <% 
                                    Set<Integer> userFeeds = new HashSet();
                                    for (FeedUser feedUser : feedUsers) {
                                        userFeeds.add(feedUser.getFeed().getId());
                                    }
                                %>
                                        
				<% for(Feed f : feedList) {%>
				<tr>
				<td><%if (f.getImage() != null) {%>
						<IMG SRC="<%out.print(f.getImage());%>"> 
						<% } %>
					</td>
					<td><%out.print(f.getTitle());%></td>
					<td><%out.print(f.getUrl());%></td>
					<td><%out.print(f.getDescription());%></td>
					<td>
						<form action="FeedServlet" method="POST">
							<input type="hidden" name="feedId" value="<%out.print(f.getId());%>">
							<input type="hidden" name="action" value="subscribeToFeed">
                                                        <% if (userFeeds.contains(f.getId())) { %>
                                                            <input type="submit" name="subscribe" disabled="disabled" value="Subscribe">
                                                        <% } else { %>
                                                            <input type="submit" name="subscribe" value="Subscribe">
                                                        <% } %>
						</form>
					</td>
				</tr>
				<% } %>
				
				</table>
		<br>
		<div class="center">
			<a href="editfeed.jsp"><input class="gray-flat-button" type="submit" value="Cancel"></a>   		
		</div>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>