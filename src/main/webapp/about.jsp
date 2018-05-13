<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About</title>
<link rel="stylesheet" type="text/css" href="styles/main.css">
</head>
<body>
	<c:choose>
		<c:when test="${empty sessionScope.user}">
			<%@ include file="/includes/topnav.jsp"%>
		</c:when>
		<c:when test="${sessionScope.user.role == 1}">
			<%@ include file="/includes/admin/topnav.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="/includes/user/topnav.jsp"%>
		</c:otherwise>
	</c:choose>
	
	<div class="content">
		<h1>About Feedz</h1>
		Feedz is a personalized RSS Reader consolidator that enables users to log onto its site and browse RSS feeds that they have subscribed to.
	
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>