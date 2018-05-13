<%@ page import="java.util.GregorianCalendar, java.util.Calendar"%>
<%
		GregorianCalendar currentDate = new GregorianCalendar();
		int currentYear = currentDate.get(Calendar.YEAR);
	%>
<div class="footer">
<nav>
	<!-- Get footer path based whether user logged in -->
	<a href="${pageContext.request.contextPath}/about.jsp">About</a> |
	<a href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a> |
	<a href="${pageContext.request.contextPath}/faq.jsp">FAQ</a>
</nav>
<p>
	&copy; Copyright <%=currentYear%>
	Feedz, Inc.
</p>
</div>