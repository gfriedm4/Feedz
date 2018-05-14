<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Java Error - Feedz</title>
	<link rel="stylesheet" type="text/css" href="../styles/main.css">
	<%@ include file="/includes/header.html"%>
</head>
<body>
	<div class="content">
		<h2>Java Error</h2>
		<p>Sorry, Java has thrown an exception.</p>
		<p>To continue, click the Back button.</p>
		
		<h2>Details</h2>
		<p>Type: ${pageContext.exception["class"]}</p>
		<p>Message: ${pageContext.exception.message}</p>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>