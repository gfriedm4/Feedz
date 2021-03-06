<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.feedz.utils.FeedUtilities"%>
<%@page import="com.feedz.models.User"%>
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
<link rel="stylesheet" type="text/css" href="/styles/main.css">
</head>
<body>
		<div class="content">
		<%@ include file="/includes/topnav.jsp" %>
		<div class="main">
		<%@ include file="/includes/feednav.jsp" %>	
		<h1>${feedTitle} Feedz</h1>
		<div class="feed-content">
			<% 
				List<FeedItem> feeds = null;
				if (request.getAttribute("feedItems") != null) {
                                    feeds = (List<FeedItem>) request.getAttribute("feedItems");
				}
				else if (request.getSession().getAttribute("user") != null){
                                    User user = (User) request.getSession().getAttribute("user");
                                    feeds = FeedUtilities.getUserFeed(user.getId());
				}
				else {
                                    feeds = new ArrayList();
				}
		 	 	if(!feeds.isEmpty()){
			    	for(FeedItem feedItem : feeds)
			    	{
			%>
			<div class="feed-item">
			<% out.print("<h2>" + feedItem.getTitle() + "</h2>");
                         if (feedItem.getCreated() != null) {
                                DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
                                DateFormat timeFormat = new SimpleDateFormat("hh:mm a");
                                out.print("<h4>" + dateFormat.format(feedItem.getCreated()) + " at " + timeFormat.format(feedItem.getCreated()) + "</h4>");
                            }
				if (feedItem.getDescription() != null && !feedItem.getDescription().isEmpty()) { %>
			<div class="feed-description">
				<% out.print(feedItem.getDescription());%>
			</div>
			<% }
			     if (feedItem.getLink() != null && !feedItem.getLink().isEmpty()) {
				%>
			<a class="feed-link" href="<%= feedItem.getLink() %>">
			<% out.print(feedItem.getLink()); %>    
			</a>
			<% } %>
			</div>
			<%} } else{ %>
				<div>Register for an account to create a custom feed!</div>
			<%	} %>
			</div>
		</div>
	</div>
		<%@ include file="/includes/footer.jsp" %>
</body>
</html>