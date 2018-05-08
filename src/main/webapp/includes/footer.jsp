<%@ page import="java.util.GregorianCalendar, java.util.Calendar"%>
<%
		GregorianCalendar currentDate = new GregorianCalendar();
		int currentYear = currentDate.get(Calendar.YEAR);
	%>
<div class="footer">
<nav>
  <a href="about.jsp">About</a> |
  <a href="contact.jsp">Contact Us</a> |
  <a href="faq.jsp">FAQ</a>
</nav>
<p>
	&copy; Copyright <%=currentYear%>
	Feedz, Inc.
</p>
</div>