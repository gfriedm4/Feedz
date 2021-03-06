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
<title>Manage Available Feeds</title>
<link rel="stylesheet" type="text/css" href="../styles/main.css">
</head>
<body>
	<%@ include file="/includes/admin/topnav.jsp" %>
	<div class="content">
		<h1>Manage Feeds</h1>
		<h3>Manage what feeds are available to users</h3>
		<div class="content-white">
			<table class="long">
				<tr>
					<th>Feed ID</th>
					<th>Title</th>
					<th>URL</th>
					<th>Description</th>
					<th>Image</th>
					<th>Date Created</th>
					<th>Date Modified</th>
					<th>Total Feed-Users</th>
					<th></th>
				</tr>
				
				<% List<Feed> feedList = FeedController.listFeeds(); %>
				
				<% for(Feed f : feedList) {%>
				<tr>
					<td><%out.print(f.getId());%></td>
					<td><%out.print(f.getTitle());%></td>
					<td><%out.print(f.getUrl());%></td>
					<td class="wrap">
					<% String descr = f.getDescription();
					if (descr!= null)
					{
						if (descr.length() < 103)
							out.print(descr);
						else
							out.print(descr.substring(0, 100)+"...");
					}
					%>
					</td>
					<td><%if (f.getImage() != null) {%>
						<IMG SRC="<%out.print(f.getImage());%>"> 
						<% } else { %>
						none
						<% }%>
					</td>
					<td><%if (f.getCreated() != null) {
						out.print(f.getCreated());
						} else { %>
						none
						<% }%></td>
					<td><%if (f.getUpdated() != null) {
						out.print(f.getUpdated());
						} else { %>
						none
						<% }%></td>
					<td><%out.print(f.getFeedUsers().size());%></td>
					<td>
						<form action="FeedServlet" method="POST">
							<input type="hidden" name="feedId" value="<%= f.getId() %>">
							<input type="hidden" name="action" value="adminRemoveFeed">
							<input type="submit" value="Remove">
						</form>
					</td>
				</tr>
				<% }%>
				
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