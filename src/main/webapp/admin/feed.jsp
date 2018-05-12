<%@page import="java.util.ArrayList"%>
<%@page import="com.feedz.models.FeedItem"%>
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
		<div class="content">
		<%@ include file="/includes/admin/topnav.jsp" %>
		<div class="main">
		<%@ include file="/includes/user/feednav.jsp" %>	
			<h1>Your Feedz</h1>
			<% 
				List<FeedItem> feeds = (ArrayList<FeedItem>)request.getAttribute("feedItems");
		 	 	if(feeds != null){
			    for(FeedItem feedItem : feeds)
			    {
			%>
			  <div class="feed-item">
			<%
					out.print("<h2>" + feedItem.getTitle() + "</h2>");
				if (!feedItem.getDescription().isEmpty()) {
				%>
			<div class="feed-description">
			<%    
					out.print(feedItem.getDescription());
				%>
			</div>
			<% 
			     }
			     if (!feedItem.getLink().isEmpty()) {
				%>
			<a class="feed-link" href="<%= feedItem.getLink() %>">
			<%    
					out.print(feedItem.getLink());
				%>    
			</a>
			<%
					}
				%>
			</div>
			<%
					}
				}
				else{
				%>
			<div>Hm... looks like you don't have any feeds yet. Click  
			<a href="editfeed.jsp">Edit Feed</a>
			to get started!</div>
			<%
				}
				%>
		</div>
	</div>
		<%@ include file="/includes/admin/footer.jsp" %>
</body>
</html>