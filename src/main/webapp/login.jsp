<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="styles/main.css">
	<%@ include file="/includes/header.html" %>
</head>
	<body>
	<div class="content">
        <form method="POST" action="UserServlet">
            <table width="280em">
                <tbody>
                	<tr>
                		<td><b>Login</b></td>
                        <td align='right'><small> New to Feedz? <a href="register.jsp">Register Here</a></small></td>
                    </tr>
                    <tr>
                        <td colspan="2">Email</td>
                    </tr>
                    <tr>
                        <td colspan="2" align='center'><input type="text" name="email" value=""  style="width:98%"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">Password</td>
                    </tr>
                    <tr>
                        <td colspan="2" align='center'><input type="password" name="password" value="" style="width:98%" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align='center'> <input class="green-flat-button" type="submit" value="Login" style="width:100%"/></td>
                    </tr>
                    
                </tbody>
            </table>
            <input type="hidden" name="action" value="Login"/>
        </form>
    </div>
	<%@ include file="/includes/footer.jsp" %>
    </body>
</html>