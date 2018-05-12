<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.ArrayList"%>
<%@page import="com.feedz.models.FeedItem"%>
<%@page import="java.util.List"%>

<link rel="stylesheet" type="text/css" href="styles/main.css">
<div class="feednav">
	<a href="#about">About</a>
 	
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


