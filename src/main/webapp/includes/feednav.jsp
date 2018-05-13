<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="com.feedz.controllers.FeedController"%>
<%@page import="com.feedz.models.Feed"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<link rel="stylesheet" type="text/css" href="styles/main.css">
<div class="feednav">	
	<% List<Feed> feedList = FeedController.listFeeds(); %>
			<table>	
				<% for(Feed f : feedList) {%>
				<tr>
					<td><%if (f.getImage() != null) {%>
						<IMG src="<%out.print(f.getImage());%>" height="42" width="42"> 
						<% } %>
					</td>
					<td>
						<form action="FeedServlet" method="POST">
							<input type="hidden" name="feedId" value="<%= f.getId() %>">
							<input type="hidden" name="action" value="showFeed">
							<input class="feednav-btn" type="submit" value="<%= f.getTitle()%>">
						</form>
					</td>
				</tr>
				<% }%>
			</table> 	
</div>


