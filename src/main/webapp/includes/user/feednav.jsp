<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.ArrayList"%>
<%@page import="com.feedz.models.Feed"%>
<%@page import="com.feedz.models.FeedItem"%>
<%@page import="com.feedz.models.FeedUser"%>
<%@page import="com.feedz.models.User"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>

<link rel="stylesheet" type="text/css" href="styles/main.css">
<div class="feednav">
			<table>	
				<% User u = (User) request.getAttribute("user"); 
				if(u != null && u.getFeedUsers() != null){
				Set<FeedUser> feedUsers = (Set<FeedUser>) u.getFeedUsers();
				for(FeedUser feedUser : feedUsers) {
					Feed f = feedUser.getFeed();%>
				<tr>
					<td><%if (f.getImage() != null) {%>
						<IMG src="<%out.print(f.getImage());%>" height="42" width="42"> 
						<% } %>
					</td>
					<td>
						<form action="FeedServlet" method="POST">
							<input type="hidden" name="feedId" value="<%f.getId();%>">
							<input type="hidden" name="action" value="showFeed">
							<input class="feednav-btn" type="submit" value="<%out.print(f.getTitle());%>">
						</form>
					</td>
				</tr>
				<% } }%>
			</table> 	

 	
 	<c:if test="$(not empty feedItems">		<!-- check if not null --> 
	 	<c:forEach var="feedItem" items="${feedItems}">
	 	<form action="FeedServlet" method="POST">
			<input type="hidden" name="showFeed" value="${feedItem.id}">
			<input class="gray-flat-button" type="submit" value="${feedItem.title}">
		</form>
		
	 	</c:forEach>
 	</c:if>
 	
	<a href="editfeed.jsp"><input class="full-green-flat-button" type="submit" value="Edit Feed" class="center"></a>  
 	
</div>
