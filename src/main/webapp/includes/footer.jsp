<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.GregorianCalendar, java.util.Calendar"%>
<%
		GregorianCalendar currentDate = new GregorianCalendar();
		int currentYear = currentDate.get(Calendar.YEAR);
	%>
<div class="footer">
<nav>
	<!-- Get footer path based whether user logged in -->
	<c:choose>
		<c:when test="${user == null}">
			  <a href="about.jsp">About</a> |
			  <a href="contact.jsp">Contact Us</a> |
			  <a href="faq.jsp">FAQ</a>
		</c:when>
		<c:otherwise>
			  <a href="../about.jsp">About</a> |
			  <a href="../contact.jsp">Contact Us</a> |
			  <a href="../faq.jsp">FAQ</a>
		</c:otherwise>
	</c:choose>


</nav>
<p>
	&copy; Copyright <%=currentYear%>
	Feedz, Inc.
</p>
</div>