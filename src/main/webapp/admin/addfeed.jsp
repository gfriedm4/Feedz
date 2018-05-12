<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a Feed</title>
<link rel="stylesheet" type="text/css" href="../styles/main.css">
<script src="thirdparty/jquery-3.3.1.min.js"></script>
<script src="thirdparty/jquery.validate.min.js"></script>
<script src="javascript/main.js"></script>
</head>
<body>
	<%@ include file="/includes/admin/topnav.jsp" %>
	<div class="content">
		<h1>Add New Feed</h1>
		<div class="content-white center">
		<form name="newFeed" action="FeedServlet" method="POST">
			<label class="formLabel">Feed URL: </label>
			<input type="text" name="feedURL" size="50" >
			&nbsp;
			<br>
			<br>
			<input type="hidden" name="action" value="adminAddFeed"/>
	        <input class="green-flat-button" type="submit" value="Add Feed">
	     </form>
	     <br>
		</div>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>