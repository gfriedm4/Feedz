<%@page import="java.util.ArrayList"%>
<%@page import="com.feedz.models.FeedItem"%>
<%@page import="java.util.List"%>

<link rel="stylesheet" type="text/css" href="styles/main.css">
<div class="feednav">
	<a href="#about">About</a>
 	<a href="#services">Services</a>
 	<a href="#clients">Clients</a>
 	<a href="#contact">Contact</a>
 	
 	
	<% 
		List<FeedItem> feeds2 = (ArrayList<FeedItem>)request.getAttribute("feedItems");
 	 	if(feeds2 != null){
	    for(FeedItem feedItem : feeds2)
	    {
	%>
	<div class="feed-item">
	  ${feedItem.title}
	</div>
	<%
			}
		}
	%>
 	
	<a href="editfeed.jsp"><input class="full-green-flat-button" type="submit" value="Edit Feed" class="center"></a>  
 	
</div>


