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
<link rel="stylesheet" type="text/css" href="./styles/main.css">
		<%@ include file="/includes/header.html" %>
</head>
<body>

	<%@ include file="/includes/topnav.jsp" %>
	
	<div id="main">
		<div class="content">
			<h1>Your Feedz</h1>
			<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>
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
                        	    		<div>No feeds yet...</div>
                        	    	<%
                        	    }

                        %>
		</div>
	</div>
		<%@ include file="/includes/footer.jsp" %>
</body>
</html>